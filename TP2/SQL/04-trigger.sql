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
-- Les fonctions et les procedures doivent être lancés soit par EXECUTE nom__fonction/procedure; OU par BEGIN nom_fonction/procedure(); END; les triggers sont enclenchés avant ou après un UPDATE, INSERT OU un DELETE
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
-- Pour certain, c'est la structure de base d'une procedure ⟹ voir la procedure #17 en bas pour plus
-- //TODO
-- Je ne suis pas certain, mais le ⟹ dbs_output.put_line("Un string ou une variable à imprimer à l'écran") dans le bloc BEGIN/END avec un FOR ou un WHILE pourrait être utile? 🤔 
CREATE OR REPLACE PROCEDURE p_presence (date_debut IN DATE, date_fin IN DATE) -- 2 paramètres explicites  
AS 
BEGIN
  NULL; -- remplacer le NULL par du code
END p_presence;
------------------------------------------------------------------------------------------------------------------------
-- Id #8 --> Priorité : Obligatoire 
-- Créer un déclencheur qui insère dans la table « risque » la liste des personnes (employé/visiteur) (leur id, le nom, la date actuelle) qui ont été en contact avec une personne (employé/visiteur) qui est suspectée d’avoir le Covid-19 jusqu’à 48 heures avant sa déclaration.
------------------------------------------------------------------------------------------------------------------------
create or replace TRIGGER RISQUE_CONTAMINATION_T1 
AFTER INSERT ON RENCONTRE 
REFERENCING OLD AS OLD NEW AS NEW 
FOR EACH ROW

DECLARE
    valide INTEGER;
BEGIN
dbms_output.Put_line('employé entrée correspond à : ' || :NEW.id_employe);
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
    dbms_output.Put_line('ID employé présent dans la table alerte : ' || rec.id_personne); 
        IF rec.id_personne = :NEW.id_employe THEN
            valide := 1;
        END IF;
        IF valide = 1 THEN
        dbms_output.Put_line('Le ID inséré correspond à un ID employé de la table Alerte');
            INSERT INTO Risque
            VALUES
            (:NEW.Date_rencontre,
            :NEW.ID_visiteur);
            valide := 0;
        ELSE
            dbms_output.Put_line('Le ID inséré ne correspond pas à un ID employé de la table Alerte');
        END IF;
    END LOOP;
END RISQUE_CONTAMINATION_T1;
------------------------------------------------------------------------------------------------------------------------
-- Id #12 --> Priorité : Important
-- Supprimer les visiteurs qui ont visité l’entreprise avant le 1er mars 2021 et qui n’ont pas déclaré des symptômes.
------------------------------------------------------------------------------------------------------------------------
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
BEGIN
  NULL; -- remplacer le NULL par du code
END;

------------------------------------------------------------------------------------------------------------------------
-- Id #14 --> Priorité : Important
-- En tant qu’administrateur de la base de données, je veux avoir accès à un script me permettant de vider l’ensemble des tables de leurs enregistrements.
------------------------------------------------------------------------------------------------------------------------
-- DELETE FROM nom_table ⟹ supprime ∀ les rows d'une table, mais ne supprime pas les tables en soit 
-- S'il ∃ une relation par foreign key avec une autre table on ajoute le mot clé ⟹ CASCADE
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
   DBMS_OUTPUT.put_line ('Toutes les tables ont été vidées avec succès!..');
END p_vider_tables;
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
-- On va utiliser le UPDATE ici pour augmenter les salaires
-- //TODO ⟹ PAS FINIT ⟹ augmente les salaires one shot pour tout les employés
CREATE OR REPLACE PROCEDURE p_augmenter_salaire 
AS 
CURSOR c_employe IS SELECT * FROM employe FOR UPDATE; -- declaration d'un curseur sur la table employe
v_augmentation_salaire NUMERIC(7, 2) := 1.02; -- une variable contenant un nombre
v_ancien_salaire NUMERIC(7, 2); -- une variable contenant un autre nombre
BEGIN
  FOR r_employe IN c_employe LOOP
    v_ancien_salaire := r_employe.salaire;
    r_employe.salaire := r_employe.salaire * v_augmentation_salaire;
    UPDATE employe SET 
    ROW = r_employe 
    WHERE CURRENT OF c_employe;
    dbms_output.put_line('Le salaire de ' || r_employe.id_personne || ' a augmenter de ' || v_ancien_salaire || ' à ' || r_employe.salaire); 
    END LOOP;
END p_augmenter_salaire;
------------------------------------------------------------------------------------------------------------------------
--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx--
------------------------------------------------------------------------------------------------------------------------
-- Fin de la création des déclencheurs et des fonctions --
------------------------------------------------------------------------------------------------------------------------
