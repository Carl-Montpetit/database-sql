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
CREATE OR REPLACE PROCEDURE presence(date_debut IN TIMESTAMP, date_fin IN TIMESTAMP)
AS
BEGIN
    SELECT es.date_heure_entree, es.date_heure_sortie,e.nom_departement, p.nom 
    FROM personne p
    INNER JOIN entree_sortie es
    ON p.id_personne = es.id_personne
    INNER JOIN employe
    ON p.id_personne = e.id_personne
    WHERE (es.date_heure_entree) BETWEEN TO_DATE(date_debut, 'DD-MM-YYYY HH24:MI:SS') 
    AND TO_DATE (date_fin , 'DD-MM-YYYY HH24:MI:SS')
    AND
    (es.date_heure_sortie) BETWEEN TO_DATE(date_debut, 'DD-MM-YYYY HH24:MI:SS') 
    AND TO_DATE (date_fin , 'DD-MM-YYYY HH24:MI:SS')
END;
------------------------------------------------------------------------------------------------------------------------
-- Id #8 --> Priorité : Obligatoire 
-- Créer un déclencheur qui insère dans la table « risque » la liste des personnes (employé/visiteur) (leur id, le nom, la date actuelle) qui ont été en contact avec une personne (employé/visiteur) qui est suspectée d’avoir le Covid-19 jusqu’à 48 heures avant sa déclaration.
------------------------------------------------------------------------------------------------------------------------
-- code ici

------------------------------------------------------------------------------------------------------------------------
-- Id #12 --> Priorité : Important
-- Supprimer les visiteurs qui ont visité l’entreprise avant le 1er mars 2021 et qui n’ont pas déclaré des symptômes.
------------------------------------------------------------------------------------------------------------------------

--CREATE TEMPORARY VIEW ancient_visiteurs
--AS
SELECT v.id_personne FROM visiteur v
INNER JOIN entree_sortie es
ON (v.id_personne = es.id_personne)
WHERE (date_heure_sortie < '01-03-2021 00:00:00')
AND (symptomes = 'aucun');                       --**note: remove semicolon if adding ↓↓↓↓
--DELETE FROM visiteur
--WHERE (ancient_visiteurs.id_personne = v.id_personne);

------------------------------------------------------------------------------------------------------------------------
-- Id #13 --> Priorité : Obligatoire
-- Créer un déclencheur qui insère dans la table « alerte » la liste des personnes (leur id, le nom, la température, la date actuelle) qui ont une température de 39 degrés ou plus au moins 3 fois pendant les 5 derniers jours lors de l’entrée à l’usine.
------------------------------------------------------------------------------------------------------------------------
-- code ici

------------------------------------------------------------------------------------------------------------------------
-- Id #14 --> Priorité : Important
-- En tant qu’administrateur de la base de données, je veux avoir accès à un script me permettant de vider l’ensemble des tables de leurs enregistrements.
------------------------------------------------------------------------------------------------------------------------
-- code ici

------------------------------------------------------------------------------------------------------------------------
-- Id #15 --> Priorité : Important
-- Le système doit s’assurer que les codes postaux respectent bien le format suivant : A#A #A#
------------------------------------------------------------------------------------------------------------------------
-- code ici

------------------------------------------------------------------------------------------------------------------------
-- Id #16 --> Priorité : Important
-- En tant qu’administrateur de la base de données, je veux que votre base de données soit déjà optimisée à l’aide d’index, un index sur les noms des visiteurs et un index sur les noms des employés.
------------------------------------------------------------------------------------------------------------------------
-- code ici

------------------------------------------------------------------------------------------------------------------------
-- Id #17 --> Priorité : Important
-- En tant que directeur, je veux être en mesure d’augmenter les salaires de 2% pour les employés qui ont reçu les deux vaccins et qui ont travaillé plus de 20 jours entre le 1er mai et le 30 mai 2021.
------------------------------------------------------------------------------------------------------------------------
-- code ici

------------------------------------------------------------------------------------------------------------------------
--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx--
------------------------------------------------------------------------------------------------------------------------
-- Fin de la création des déclencheurs et des fonctions --
------------------------------------------------------------------------------------------------------------------------
