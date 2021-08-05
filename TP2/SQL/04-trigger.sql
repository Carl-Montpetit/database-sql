--  Nom : Carl Montpetit 
--  Code permanent : MONC08069000 
--
--  Nom : Matthew Jovani
--  Code permanent : JOVM19108705
--
--  Nom : Mathieu Dumont
--  Code permanent : DUMM21059400 
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
-- Dépôt GIT du TP au besoin --> https://gitlab.info.uqam.ca/montpetit.carl/basededonnees.git
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
------------------------------------------------------------------------------------------------------------------------
-- CE FICHIER INCLUT LES DÉCLENCHEURS ET LES FONCTIONS --
-- Les fonctions et les procedures doivent être lancés soit par EXECUTE nom__fonction/procedure; OU par BEGIN nom_fonction/procedure(param1, param2…(s'il ∃ des paramètres explicites)); END; les triggers sont enclenchés avant ou après un UPDATE, INSERT ou un DELETE
------------------------------------------------------------------------------------------------------------------------
-- Id #3 --> Priorité : Obligatoire
-- Créer une procédure « presence » permettant de fournir la liste des personnes dans l’usine entre deux dates (qui seront passées en paramètre à la procédure). 
-- Cette liste doit explicitement contenir :
-- - La date
-- - Le nom du département
-- - Le nom de l’employé ou le visiteur

-- Attention :
-- ▪ La date doit être saisie en utilisant les paramètres de la procédure.
-- ▪ Le format de saisie de la date se fait selon le format par défaut : jj-mm-aaaa
------------------------------------------------------------------------------------------------------------------------
-- //FIXME Compile, mais : ORA-01830: date format picture ends before converting entire input string
-- Il y a un problème lors de la conversion de TIMESTAMP ⟹ DATE avec le format JJ-MM-YYYY sinon je crois que tout est bon
CREATE OR REPLACE PROCEDURE p_presence (date_debut IN TIMESTAMP, date_fin IN TIMESTAMP) -- 2 paramètres explicites  
AS 
-- Déclaration du curseur 
CURSOR c_presence IS 
SELECT es.date_heure_entree, e.nom_departement, p.nom -- le contenu du curseur en mémoire
    FROM 
        personne p
        FULL OUTER JOIN entree_sortie es 
        ON (p.id_personne = es.id_personne)
        FULL OUTER JOIN employe e 
        ON (p.id_personne = e.id_personne);
-- déclarations des variables
v_presence c_presence%ROWTYPE;
v_date_debut DATE;
v_date_fin DATE;
BEGIN
    OPEN c_presence;
        LOOP
        EXIT WHEN c_presence%NOTFOUND; -- sort de la boucle si les données ne sont pas trouvés
            FETCH c_presence INTO v_presence; -- parcours et met les résultats dans les variables à chaque tours de boucle
            -- Imprime le contenue des variables sur une ligne
            IF (
                v_presence.date_heure_entree > v_date_debut  
                AND -- bornes exclusives
                v_presence.date_heure_entree < v_date_fin
                ) 
                    THEN
                    dbms_output.put_line('Présence de : ' || v_presence.nom || ' ⟺ du département' || 
                    v_presence.nom_departement || ' ⟺ pour le ' || v_presence.date_heure_entree);
            ELSE
                dbms_output.put_line('Il n''existe aucunes présences entre ces deux dates!..');
            END IF;
        END LOOP;
    CLOSE c_presence;
END p_presence;
-- Execution de la procedure (en commentaire pour la remise, mais c'est là au besoin)
-- EXECUTE p_presence('08-06-2021', '08-07-2021');
------------------------------------------------------------------------------------------------------------------------
-- Id #8 --> Priorité : Obligatoire 
-- Créer un déclencheur qui insère dans la table « risque » la liste des personnes (employé/visiteur) (leur id, le nom, la date actuelle) qui ont été en contact avec une personne (employé/visiteur) qui est suspectée d’avoir le Covid-19 jusqu’à 48 heures avant sa déclaration.
------------------------------------------------------------------------------------------------------------------------
--Insertion qui va avec pour le tester
INSERT INTO rencontre VALUES (12, 7, '08-08-2021 13:04:00');
INSERT INTO rencontre VALUES (12, 17, '08-01-2021 13:16:00');
INSERT INTO alerte VALUES ('08-01-2021', 17);
INSERT INTO alerte VALUES ('08-01-2021', 9);
INSERT INTO alerte VALUES ('08-02-2021', 7);
INSERT INTO alerte VALUES ('08-02-2021', 3);

CREATE OR REPLACE TRIGGER t_risque_contamination
AFTER INSERT ON rencontre 
REFERENCING OLD AS OLD NEW AS NEW 
FOR EACH ROW
DECLARE
    valide INTEGER;
BEGIN
dbms_output.put_line('employé entrée correspond à : ' || :NEW.id_employe);
    FOR rec IN(
        SELECT
            employe.id_personne 
        FROM 
            employe
        WHERE EXISTS(
            SELECT NULL
            FROM alerte a
            WHERE (employe.id_personne = a.id_personne)
        )
    )
    LOOP
    dbms_output.put_line('ID employé présent dans la table alerte : ' || rec.id_personne); 
        IF rec.id_personne = :NEW.id_employe THEN
            valide := 1;
        END IF;
        IF valide = 1 THEN
        dbms_output.put_line('Le ID inséré correspond à un ID employé de la table Alerte');
            INSERT INTO Risque
            VALUES
            (:NEW.Date_rencontre,
            :NEW.ID_visiteur);
            valide := 0;
        ELSE
            dbms_output.put_line('Le ID inséré ne correspond pas à un ID employé de la table Alerte');
        END IF;
    END LOOP;
END t_risque_contamination;
------------------------------------------------------------------------------------------------------------------------
-- Id #12 --> Priorité : Important
-- Supprimer les visiteurs qui ont visité l’entreprise avant le 1er mars 2021 et qui n’ont pas déclaré des symptômes. 
------------------------------------------------------------------------------------------------------------------------
-- //FIXME ⟹ Mettre ça dans une une procedure??
DELETE FROM visiteur v
WHERE EXISTS (
SELECT es.date_heure_sortie
    FROM entree_sortie es
    WHERE (v.id_personne = es.id_personne
    AND es.date_heure_sortie < '01-03-2021 00:00:00')
    AND (es.symptomes = 'aucun')
);
------------------------------------------------------------------------------------------------------------------------
-- Id #13 --> Priorité : Obligatoire
-- Créer un déclencheur qui insère dans la table « alerte » la liste des personnes (leur id, le nom, la température, la date actuelle) qui ont une température de 39 degrés ou plus au moins 3 fois pendant les 5 derniers jours lors de l’entrée à l’usine.
------------------------------------------------------------------------------------------------------------------------
-- //TODO
-- On va utiliser le INSERT pour ajouter à la table alerte
CREATE OR REPLACE TRIGGER t_personne_alerte
AFTER INSERT ON entree_sortie 
REFERENCING OLD AS avant NEW AS apres -- des noms de variables aléatoires pour l'instant 
DECLARE

BEGIN
  NULL; -- remplacer le NULL par du code
END;
------------------------------------------------------------------------------------------------------------------------
-- Id #14 --> Priorité : Important
-- En tant qu’administrateur de la base de données, je veux avoir accès à un script me permettant de vider l’ensemble des tables de leurs enregistrements.
------------------------------------------------------------------------------------------------------------------------
-- DELETE FROM nom_table ⟹ supprime ∀ les rows d'une table, mais ne supprime pas les tables en soit 
-- S'il ∃ une relation par "foreign key" avec une autre table on ajoute le mot clé CASCADE à la fin de la requête ⟹ ajouter aussi ON DELETE CASCADE dans le CREATE TABLE après la déclaration du "foreign key" pour rendre le CASCADE fonctionnel 
CREATE OR REPLACE PROCEDURE p_vider_tables 
AS
BEGIN
   EXECUTE IMMEDIATE 'DELETE FROM vaccin CASCADE';
   EXECUTE IMMEDIATE 'DELETE FROM vaccination CASCADE';
   EXECUTE IMMEDIATE 'DELETE FROM risque CASCADE';
   EXECUTE IMMEDIATE 'DELETE FROM entree_sortie CASCADE';
   EXECUTE IMMEDIATE 'DELETE FROM departement CASCADE';
   EXECUTE IMMEDIATE 'DELETE FROM employe CASCADE';
   EXECUTE IMMEDIATE 'DELETE FROM quarantaine CASCADE';
   EXECUTE IMMEDIATE 'DELETE FROM rencontre CASCADE';
   EXECUTE IMMEDIATE 'DELETE FROM visiteur CASCADE';
   EXECUTE IMMEDIATE 'DELETE FROM alerte CASCADE';
   EXECUTE IMMEDIATE 'DELETE FROM personne CASCADE';
   dbms_output.put_line ('Toutes les tables ont été vidées avec succès!..');
END p_vider_tables;
-- Execution de la procedure (en commentaire pour la remise, mais c'est là au besoin)
-- EXECUTE p_vider_tables;
------------------------------------------------------------------------------------------------------------------------
-- Id #15 --> Priorité : Important
-- Le système doit s’assurer que les codes postaux respectent bien le format suivant : A#A #A#
------------------------------------------------------------------------------------------------------------------------
-- code ici
-- //TODO
------------------------------------------------------------------------------------------------------------------------
-- Id #16 --> Priorité : Important
-- En tant qu’administrateur de la base de données, je veux que votre base de données soit déjà optimisée à l’aide d’index, un index sur les noms des visiteurs et un index sur les noms des employés.
------------------------------------------------------------------------------------------------------------------------
-- code ici
-- //TODO
------------------------------------------------------------------------------------------------------------------------
-- Id #17 --> Priorité : Important
-- En tant que directeur, je veux être en mesure d’augmenter les salaires de 2% pour les employés qui ont reçu les deux vaccins et qui ont travaillé plus de 20 jours entre le 1er mai et le 30 mai 2021.
------------------------------------------------------------------------------------------------------------------------
-- //TODO ⟹ PAS FINIT 
------------------------------------------------------------------------------------------------------------------------
-- Insertions d'un Matthew qui a travaillé 22 fois dans le mois de mai
INSERT ALL
INTO entree_sortie VALUES (TO_DATE('01-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3, 
TO_DATE('01-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 36.70, 'aucun', 'non')
INTO entree_sortie VALUES (TO_DATE('02-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3, 
TO_DATE('02-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 36.00, 'aucun', 'oui')
INTO entree_sortie VALUES (TO_DATE('03-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3, 
TO_DATE('03-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 40.20, 'fievre', 'oui')
INTO entree_sortie VALUES (TO_DATE('04-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3, 
TO_DATE('04-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 41.00, 'fievre', 'non')
INTO entree_sortie VALUES (TO_DATE('05-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3, 
TO_DATE('05-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 36.10, 'aucun', 'non')
INTO entree_sortie VALUES (TO_DATE('06-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3, 
TO_DATE('06-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 35.80, 'aucun', 'oui')
INTO entree_sortie VALUES (TO_DATE('07-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3, 
TO_DATE('07-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 38.00, 'faiblesse', 'oui')
INTO entree_sortie VALUES (TO_DATE('08-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3, 
TO_DATE('08-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 38.20, 'fatigue', 'oui')
INTO entree_sortie VALUES (TO_DATE('09-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3, 
TO_DATE('09-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 36.60, 'aucun', 'oui')
INTO entree_sortie VALUES (TO_DATE('10-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3, 
TO_DATE('10-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 36.90, 'aucun', 'oui')
INTO entree_sortie VALUES (TO_DATE('11-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3, 
TO_DATE('11-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 37.00, 'aucun', 'non')
INTO entree_sortie VALUES (TO_DATE('12-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3, 
TO_DATE('12-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 40.00, 'aucun', 'oui')
INTO entree_sortie VALUES (TO_DATE('13-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3, 
TO_DATE('13-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 40.00, 'aucun', 'oui')
INTO entree_sortie VALUES (TO_DATE('14-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3, 
TO_DATE('14-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 41.00, 'fievre', 'non')
INTO entree_sortie VALUES (TO_DATE('15-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3, 
TO_DATE('15-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 36.10, 'aucun', 'non')
INTO entree_sortie VALUES (TO_DATE('16-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3, 
TO_DATE('16-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 35.80, 'aucun', 'oui')
INTO entree_sortie VALUES (TO_DATE('17-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3, 
TO_DATE('17-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 38.00, 'faiblesse', 'oui')
INTO entree_sortie VALUES (TO_DATE('18-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3, 
TO_DATE('18-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 38.20, 'fatigue', 'oui')
INTO entree_sortie VALUES (TO_DATE('19-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3, 
TO_DATE('19-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 36.60, 'aucun', 'oui')
INTO entree_sortie VALUES (TO_DATE('20-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3, 
TO_DATE('20-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 36.90, 'aucun', 'oui')
INTO entree_sortie VALUES (TO_DATE('21-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3, 
TO_DATE('21-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 36.90, 'aucun', 'oui')
INTO entree_sortie VALUES (TO_DATE('22-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3, 
TO_DATE('22-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 36.90, 'aucun', 'oui')
SELECT * FROM dual;
------------------------------------------------------------------------------------------------------------------------
-- //FIXME Encore là je crois que c'est bon ⟹ compile ⟹ mais j'ai un erreur : ORA-06502: PL/SQL: numeric or value error: number precision too large ⟹ probablement qu'on obtient des nombres trop grands après les opérations arithmétiques 🤷🏻
CREATE OR REPLACE PROCEDURE p_augmenter_salaire 
AS 
CURSOR c_salaire IS SELECT DISTINCT -- declaration d'un curseur sur la table employe pour UPDATE
p.nom, p.id_personne, lv.nom_vaccin -- le contenu du curseur en mémoire
FROM 
personne p
FULL OUTER JOIN employe e 
ON (e.id_personne = p.id_personne)
INNER JOIN entree_sortie es
ON (p.id_personne = es.id_personne)
INNER JOIN liste_vaccine lv  --Vérifie si un id_personne de employe existe dans la vue liste_vaccine
ON (p.id_personne = lv.id_personne)
    WHERE(es.date_heure_sortie) 
        BETWEEN TO_DATE('01-05-2021 00:00:00', 'DD-MM-YYYY HH24:MI:SS') 
        AND 
        TO_DATE ('31-05-2021 23:59:59', 'DD-MM-YYYY HH24:MI:SS')
        AND (es.id_personne) 
        IN (SELECT es.id_personne FROM entree_sortie es
        GROUP BY es.id_personne
        HAVING count(id_personne) > 20 
    );  
    -- déclarations des variables
    v_augmentation_salaire NUMERIC(7, 2) := 1.02;
    v_ancien_salaire NUMERIC(7, 2);
    v_salaire c_salaire%ROWTYPE;
BEGIN
    OPEN c_salaire;
    LOOP -- Début de la boucle pour parcourir les rangées
    EXIT WHEN c_presence%NOTFOUND; -- sort de la boucle si les données ne sont pas trouvés
    FETCH c_salaire INTO v_salaire;
        v_ancien_salaire := v_salaire.salaire; -- le salaire actuelle est l'ancien salaire
        v_salaire_courant := v_salaire.salaire * v_augmentation_salaire; -- le nouveau salaire après l'augmentation
        v_salaire.salaire = v_salaire_courant;
        dbms_output.put_line('Le salaire de ⟺ ' || v_salaire.nom || ' a augmenter de ⟺ ' || v_ancien_salaire || ' à ⟺ ' || v_salaire.salaire); 
    END LOOP; -- fin du parcours sur la table employe
    CLOSE c_salaire;
END p_augmenter_salaire;
-- Execution de la procedure (en commentaire pour la remise, mais c'est là au besoin)
-- EXECUTE p_augmenter_salaire;
------------------------------------------------------------------------------------------------------------------------
--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx--
------------------------------------------------------------------------------------------------------------------------
-- Fin de la création des déclencheurs et des fonctions --
------------------------------------------------------------------------------------------------------------------------
