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
-- Pour l'application Java voir ⟹ TP2/APP/src/OracleCon.java ☆
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
CREATE OR REPLACE PROCEDURE p_presence(date_debut IN DATE, date_fin IN DATE) -- 2 paramètres explicites
AS
-- Déclaration du curseur 
    CURSOR c_presence IS
        SELECT es.date_heure_entree, e.nom_departement, p.nom -- le contenu du curseur en mémoire
        FROM personne p
                 FULL OUTER JOIN entree_sortie es
                                 ON (p.id_personne = es.id_personne)
                 FULL OUTER JOIN employe e
                                 ON (p.id_personne = e.id_personne);
-- déclarations des variables
    v_presence c_presence%ROWTYPE;
BEGIN
    OPEN c_presence;
    LOOP
        EXIT WHEN c_presence%NOTFOUND; -- sort de la boucle si les données ne sont pas trouvés
        FETCH c_presence INTO v_presence; -- parcours et met les résultats dans les variables à chaque tours de boucle
        v_presence.date_heure_entree := TO_CHAR(CAST(v_presence.date_heure_entree AS DATE), 'DD-MM-YYYY');
        -- Imprime le contenue des variables sur une ligne
        IF (
                    v_presence.date_heure_entree > date_debut
                AND -- bornes exclusives
                    v_presence.date_heure_entree < date_fin
            )
        THEN
            dbms_output.put_line('Présence de ⟺' || v_presence.nom || ' ⟺ du département' ||
                                 v_presence.nom_departement || ' ⟺ pour le ' || v_presence.date_heure_entree);
        ELSE
            dbms_output.put_line('Il n''existe aucune présence entre ces deux dates pour cet enregistrement!..');
        END IF;
    END LOOP;
    CLOSE c_presence;
END p_presence;
-- Execution de la procedure (en commentaire pour la remise, mais c'est là au besoin)
-- EXECUTE p_presence('01-05-2021', '31-05-2021'); 
------------------------------------------------------------------------------------------------------------------------
-- Id #8 --> Priorité : Obligatoire 
-- Créer un déclencheur qui insère dans la table « risque » la liste des personnes (employé/visiteur) (leur id, le nom, la date actuelle) qui ont été en contact avec une personne (employé/visiteur) qui est suspectée d’avoir le Covid-19 jusqu’à 48 heures avant sa déclaration.
------------------------------------------------------------------------------------------------------------------------
--Insertion qui va avec pour le tester
INSERT ALL
INTO rencontre
VALUES (12, 7, '08-08-2021 13:04:00')
INTO rencontre
VALUES (12, 17, '08-01-2021 13:16:00')
INTO alerte
VALUES ('08-01-2021', 17)
INTO alerte
VALUES ('08-01-2021', 9)
INTO alerte
VALUES ('08-02-2021', 7)
INTO alerte
VALUES ('08-02-2021', 3)
SELECT *
FROM dual;
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER t_risque_contamination
    AFTER INSERT
    ON rencontre
    REFERENCING OLD AS OLD NEW AS NEW -- OLD est NULL par défault pour un trigger INSERT
-- OLD et NEW sont accessible dans le SQL et le PL/SQL!
    FOR EACH ROW
DECLARE
    valide INTEGER;
BEGIN
    dbms_output.put_line('employé entrée correspond à : ' || :NEW.id_employe);
    FOR rec IN (
        SELECT employe.id_personne
        FROM employe
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
                VALUES (:NEW.Date_rencontre,
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
DELETE
FROM visiteur v
WHERE EXISTS(
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
CREATE OR REPLACE TRIGGER t_temperature_elevee
    BEFORE INSERT
    ON entree_sortie
    REFERENCING OLD AS OLD NEW AS NEW -- OLD est NULL par défault pour un trigger INSERT
-- OLD et NEW sont accessible dans le SQL et le PL/SQL!
    FOR EACH ROW
DECLARE
    v_nombre number;
BEGIN
    SELECT COUNT(id_personne)
    INTO v_nombre
    FROM entree_sortie
    WHERE (id_personne = :NEW.id_personne AND
           (:NEW.date_heure_entree BETWEEN :NEW.date_heure_entree - 5 AND :NEW.date_heure_entree));
    IF (v_nombre >= 3 AND :NEW.temperature >= 33) THEN
        INSERT INTO alerte
        VALUES (:NEW.date_heure_entree, :NEW.id_personne);
        dbms_output.put_line('Un enregistrement a été ajouté à la table alterte!..');
    END IF;
END t_temperature_elevee;
------------------------------------------------------------------------------------------------------------------------
-- Id #14 --> Priorité : Important
-- En tant qu’administrateur de la base de données, je veux avoir accès à un script me permettant de vider l’ensemble des tables de leurs enregistrements.
------------------------------------------------------------------------------------------------------------------------
-- DELETE FROM nom_table ⟹ supprime ∀ les rows d'une table, mais ne supprime pas les tables en soit 
-- S'il ∃ une relation par "foreign key" avec une autre table on ajoute le mot clé CASCADE à la fin de la requête ⟹ ajouter aussi ON DELETE CASCADE dans le CREATE TABLE après la déclaration du "foreign key" pour rendre le CASCADE fonctionnel 
CREATE OR REPLACE PROCEDURE p_vider_tables
AS
BEGIN
    EXECUTE IMMEDIATE 'DELETE FROM vaccin CASCADE'; -- EXECUTE en chaïne les requêtes SQL DELETE ⇩
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
    dbms_output.put_line('Toutes les tables ont été vidées avec succès!..');
END p_vider_tables;
-- Execution de la procedure (en commentaire pour la remise, mais c'est là au besoin)
-- EXECUTE p_vider_tables;
------------------------------------------------------------------------------------------------------------------------
-- Id #16 --> Priorité : Important
-- En tant qu’administrateur de la base de données, je veux que votre base de données soit déjà optimisée à l’aide d’index, un index sur les noms des visiteurs et un index sur les noms des employés.
------------------------------------------------------------------------------------------------------------------------
-- Création de l'index pour les noms des personnes (employés ou visiteurs)
CREATE INDEX index_nom_personne
    ON personne (nom);
-- Le nom est relié à la primary key id_personne pour la table visiteur et employé par foreign key ⟹ l'index sur la colonne nom de la table personne suffit pour optimiser la performance des requêtes en lien avec le nom des visiteurs et des employés ⟹ Les indexes requièrent beaucoup d'espace mémoire alors il vaut mieux en créer le moins poissbile selon les besoins essentiels
------------------------------------------------------------------------------------------------------------------------
-- Id #17 --> Priorité : Important
-- En tant que directeur, je veux être en mesure d’augmenter les salaires de 2% pour les employés qui ont reçu les deux vaccins et qui ont travaillé plus de 20 jours entre le 1er mai et le 30 mai 2021.
------------------------------------------------------------------------------------------------------------------------
-- Insertions d'un Matthew qui a travaillé 22 fois dans le mois de mai
INSERT ALL
INTO entree_sortie
VALUES (TO_DATE('01-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3,
        TO_DATE('01-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 36.70, 'aucun', 'non')
INTO entree_sortie
VALUES (TO_DATE('02-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3,
        TO_DATE('02-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 36.00, 'aucun', 'oui')
INTO entree_sortie
VALUES (TO_DATE('03-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3,
        TO_DATE('03-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 40.20, 'fievre', 'oui')
INTO entree_sortie
VALUES (TO_DATE('04-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3,
        TO_DATE('04-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 41.00, 'fievre', 'non')
INTO entree_sortie
VALUES (TO_DATE('05-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3,
        TO_DATE('05-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 36.10, 'aucun', 'non')
INTO entree_sortie
VALUES (TO_DATE('06-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3,
        TO_DATE('06-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 35.80, 'aucun', 'oui')
INTO entree_sortie
VALUES (TO_DATE('07-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3,
        TO_DATE('07-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 38.00, 'faiblesse', 'oui')
INTO entree_sortie
VALUES (TO_DATE('08-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3,
        TO_DATE('08-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 38.20, 'fatigue', 'oui')
INTO entree_sortie
VALUES (TO_DATE('09-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3,
        TO_DATE('09-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 36.60, 'aucun', 'oui')
INTO entree_sortie
VALUES (TO_DATE('10-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3,
        TO_DATE('10-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 36.90, 'aucun', 'oui')
INTO entree_sortie
VALUES (TO_DATE('11-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3,
        TO_DATE('11-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 37.00, 'aucun', 'non')
INTO entree_sortie
VALUES (TO_DATE('12-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3,
        TO_DATE('12-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 40.00, 'aucun', 'oui')
INTO entree_sortie
VALUES (TO_DATE('13-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3,
        TO_DATE('13-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 40.00, 'aucun', 'oui')
INTO entree_sortie
VALUES (TO_DATE('14-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3,
        TO_DATE('14-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 41.00, 'fievre', 'non')
INTO entree_sortie
VALUES (TO_DATE('15-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3,
        TO_DATE('15-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 36.10, 'aucun', 'non')
INTO entree_sortie
VALUES (TO_DATE('16-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3,
        TO_DATE('16-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 35.80, 'aucun', 'oui')
INTO entree_sortie
VALUES (TO_DATE('17-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3,
        TO_DATE('17-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 38.00, 'faiblesse', 'oui')
INTO entree_sortie
VALUES (TO_DATE('18-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3,
        TO_DATE('18-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 38.20, 'fatigue', 'oui')
INTO entree_sortie
VALUES (TO_DATE('19-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3,
        TO_DATE('19-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 36.60, 'aucun', 'oui')
INTO entree_sortie
VALUES (TO_DATE('20-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3,
        TO_DATE('20-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 36.90, 'aucun', 'oui')
INTO entree_sortie
VALUES (TO_DATE('21-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3,
        TO_DATE('21-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 36.90, 'aucun', 'oui')
INTO entree_sortie
VALUES (TO_DATE('22-05-2021 04:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3,
        TO_DATE('22-05-2021 23:59:00', 'DD-MM-YYYY HH24:MI:SS'), 36.90, 'aucun', 'oui')
SELECT *
FROM dual;
------------------------------------------------------------------------------------------------------------------------
-- Le FOR UPDATE ne veut pas fonctionner à cause de la présence d'un GROUP BY et d'un DISTINCT dans le SELECT, mais en négligant ces aspects, le code devrait fonctionner. On a essayé sans le FOR UPDATE du curseur, mais c'était vraiment complexe car c'est impossible d"utiliser le WHERE CURRENT OF dans le bloc BEGIN/END.
CREATE OR REPLACE PROCEDURE p_augmenter_salaire
AS
    CURSOR c_salaire IS SELECT DISTINCT -- declaration d'un curseur sur la table employe pour UPDATE
                                        p.nom,
                                        p.id_personne,
                                        lv.nom_vaccin,
                                        e.salaire -- le contenu du curseur en mémoire
                        FROM personne p
                                 INNER JOIN employe e
                                            ON (e.id_personne = p.id_personne)
                                 INNER JOIN entree_sortie es
                                            ON (p.id_personne = es.id_personne)
                                 INNER JOIN liste_vaccine lv --Vérifie si un id_personne de employe existe dans la vue liste_vaccine
                                            ON (p.id_personne = lv.id_personne)
                        WHERE (es.date_heure_sortie)
                            BETWEEN TO_DATE('01-05-2021 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
                            AND
                            TO_DATE('31-05-2021 23:59:59', 'DD-MM-YYYY HH24:MI:SS')
                          AND (es.id_personne)
                            IN (SELECT es.id_personne
                                FROM entree_sortie es
                                GROUP BY es.id_personne
                                HAVING count(id_personne) > 20
                              )
                            FOR UPDATE;
    -- déclarations des variables
    v_augmentation_salaire NUMERIC(7, 2) := 1.02;
    v_ancien_salaire       NUMERIC(7, 2);
    v_salaire              c_salaire%ROWTYPE;
BEGIN
    OPEN c_salaire;
    LOOP
        -- Début de la boucle pour parcourir les rangées
        EXIT WHEN c_salaire%NOTFOUND; -- sort de la boucle si les données ne sont pas trouvés
        FETCH c_salaire INTO v_salaire;
        v_ancien_salaire := v_salaire.salaire; -- le salaire actuelle est l'ancien salaire
        v_salaire.salaire := v_salaire.salaire * v_augmentation_salaire; -- le nouveau salaire après l'augmentation
        UPDATE employe
        SET salaire = v_salaire.salaire;
        WHERE
        CURRENT OF c_salaire;
        dbms_output.put_line('Le salaire de ⟺ ' || v_salaire.nom || ' a augmenter de ⟺ ' || v_ancien_salaire ||
                             ' à ⟺ ' || v_salaire.salaire);
    END LOOP; -- fin du parcours sur la table employe
    CLOSE c_salaire;
END p_augmenter_salaire;
-- Execution de la procedure (en commentaire pour la remise, mais c'est là au besoin)
-- EXECUTE p_augmenter_salaire;
------------------------------------------------------------------------------------------------------------------------
-- Id #10 --> Priorité : Très important
--  Développer une application affichant la liste des employés et des visiteurs qui étaient à l’usine entre deux dates
--  et qui ont visité un département spécifique.
------------------------------------------------------------------------------------------------------------------------
-- Procedure pour l'application Java☕️
create or replace FUNCTION f_presence_departement(date_debut IN DATE, date_fin IN DATE, departement IN VARCHAR2)
-- 3 paramètres explicites 
    RETURN VARCHAR2
AS
-- Déclaration du curseur 
    CURSOR c_presence_departement IS
        SELECT es.date_heure_entree, e.nom_departement, p.nom -- le contenu du curseur en mémoire
        FROM personne p
                 INNER JOIN entree_sortie es
                            ON (p.id_personne = es.id_personne)
                 INNER JOIN employe e
                            ON (p.id_personne = e.id_personne);
-- déclarations des variables
    v_presence_departement c_presence_departement%ROWTYPE;
BEGIN
    OPEN c_presence_departement;
    LOOP
        EXIT WHEN c_presence_departement%NOTFOUND; -- sort de la boucle si les données ne sont pas trouvés
        FETCH c_presence_departement INTO v_presence_departement;
        -- parcours et met les résultats dans les variables à chaque tours de boucle
        -- Imprime le contenue des variables sur une ligne
        IF (
                    v_presence_departement.date_heure_entree > date_debut
                AND -- bornes exclusives
                    v_presence_departement.date_heure_entree < date_fin
                AND
                    v_presence_departement.nom_departement = departement
            )
        THEN
            RETURN ('Présence de ⟺ ' || v_presence_departement.nom || ' ⟺ du département' ||
                    v_presence_departement.nom_departement || ' ⟺ pour le ' ||
                    v_presence_departement.date_heure_entree);
        ELSE
            dbms_output.put_line('Il n''existe aucune présence entre ces deux dates pour cet enregistrement!..');
        END IF;
    END LOOP;
    CLOSE c_presence_departement;
END f_presence_departement;
------------------------------------------------------------------------------------------------------------------------
--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx--
------------------------------------------------------------------------------------------------------------------------
-- Fin de la création des déclencheurs et des fonctions --
------------------------------------------------------------------------------------------------------------------------