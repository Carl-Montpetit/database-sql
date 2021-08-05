--  Nom : Carl Montpetit 
--  Code permanent : MONC08069000 
--
--  Nom : Matthew Jovani
--  Code permanent : JOVM19108705
--
--  Nom : Mathieu Dumont
--  Code permanent : DUMM21059400 
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
-- Dépôt GIT du TP au besoin --> https://gitlab.info.uqam.ca/mONtpetit.carl/basededONnees.git
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
------------------------------------------------------------------------------------------------------------------------
-- CE FICHIER INCLUT LA CRÉATION DES TABLES --
------------------------------------------------------------------------------------------------------------------------
-- On met le commit automatique après chaque requêtes validés avec succès 
SET AUTOCOMMIT ON;
-- Pour activer les outputs
SET SERVEROUTPUT ON;
-- Changement de format des dates --> Par défaut c'est DD-MON-YY dans Oracle SQL --
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY'; -- Pour jj-mm-aaaa
ALTER SESSION SET NLS_TIMESTAMP_FORMAT = 'DD-MM-YYYY HH24:MI:SS'; -- idem, mais pour le timestamp 
------------------------------------------------------------------------------------------------------------------------
-- On efface les tables et les vues  s'ils existent préalablement --
------------------------------------------------------------------------------------------------------------------------
-- Drop tables
DROP TABLE Vaccination;
DROP TABLE Vaccin;
DROP TABLE Risque;
DROP TABLE Rencontre;
DROP TABLE Quarantaine;
DROP TABLE Entree_Sortie;
DROP TABLE Alerte;
DROP TABLE Visiteur;
DROP TABLE Employe;
DROP TABLE Departement;
DROP TABLE Personne;
------------------------------------------------------------------------------------------------------------------------
-- Drop vues
DROP VIEW liste_vaccine;
DROP VIEW liste_quarantaine;
DROP VIEW liste_admissible_vaccin;
DROP VIEW liste_disponibilites;
DROP VIEW liste_arisque;
DROP VIEW liste_paresseux;
DROP VIEW liste_entreprise_a_risque;
------------------------------------------------------------------------------------------------------------------------
-- Drop procedures
DROP PROCEDURE p_presence;
DROP PROCEDURE p_vider_tables;
DROP PROCEDURE p_augmenter_salaire;
------------------------------------------------------------------------------------------------------------------------
-- Drop fonctions
-- ø 
------------------------------------------------------------------------------------------------------------------------
-- Drop triggers
DROP TRIGGER t_risque_contamination;
DROP TRIGGER t_personne_alerte;
------------------------------------------------------------------------------------------------------------------------
-- Création des utilisateurs (avec un mot de passe commun pour simplifier) --
------------------------------------------------------------------------------------------------------------------------
-- CREATE USER directeur IDENTIFIED BY '1234';
-- CREATE USER employe IDENTIFIED BY '1234';
-- CREATE USER visiteur IDENTIFIED BY '1234';
-- CREATE USER administrateur IDENTIFIED BY '1234';
------------------------------------------------------------------------------------------------------------------------
-- Création des tables --
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- Id #15 --> Priorité : Important
-- Le système doit s’assurer que les codes postaux respectent bien le format suivant : A#A #A#
------------------------------------------------------------------------------------------------------------------------
-- //TODO
CREATE  TABLE  personne (
    id_personne         INTEGER NOT NULL ,
    nom                 VARCHAR(45) NOT NULL ,
    adresse_numero      VARCHAR(45) NULL ,
    rue                 VARCHAR(45) NOT NULL ,
    ville               VARCHAR(45) NOT NULL ,
    code_postal         VARCHAR(45) NOT NULL CHECK (regexp_like (nom, '^[[:alpha:]] {1}...')) , -- //TODO pas complet

    PRIMARY KEY (id_personne)
);

CREATE TABLE Departement (
    nom_departement     VARCHAR(45) NOT NULL ,
    pourcentage_risque  NUMERIC(5, 2) NOT NULL ,

    PRIMARY KEY (nom_departement)
);

CREATE TABLE Employe (
    id_personne          INTEGER NOT NULL ,
    date_naissance      DATE NOT NULL ,
    poste               VARCHAR(45) NOT NULL ,
    salaire             NUMERIC(7, 2) NOT NULL ,
    nom_departement     VARCHAR(45) NOT NULL ,

    PRIMARY KEY (id_personne),
    FOREIGN KEY (id_personne) REFERENCES personne(id_personne)
     ON DELETE CASCADE,
    FOREIGN KEY (nom_departement) REFERENCES Departement (nom_departement)
     ON DELETE CASCADE
);

CREATE TABLE Visiteur (
    id_personne         INTEGER NOT NULL ,
    nom_entreprise      VARCHAR(45) NOT NULL ,

    PRIMARY KEY (id_personne),
    FOREIGN KEY (id_personne) REFERENCES personne (id_personne)
     ON DELETE CASCADE
);

CREATE TABLE Alerte (
    date_actuelle       DATE NOT NULL ,
    id_personne         INTEGER NOT NULL ,

    PRIMARY KEY (date_actuelle, id_personne),
    FOREIGN KEY (id_personne) REFERENCES personne (id_personne)
     ON DELETE CASCADE
);

CREATE TABLE Entree_Sortie (
    date_heure_entree   TIMESTAMP NOT NULL ,
    id_personne         INTEGER NOT NULL ,
    date_heure_sortie   TIMESTAMP NULL ,
    temperature         NUMERIC(5, 2) NOT NULL ,
    symptomes           VARCHAR(45) null,
    risque_voisinage    VARCHAR(45) NOT NULL ,

    PRIMARY KEY (date_heure_entree, id_personne),
    FOREIGN KEY (id_personne) REFERENCES personne (id_personne)
     ON DELETE CASCADE
);

CREATE TABLE Quarantaine (
    id_quarantaine      INTEGER NOT NULL ,
    date_debut          DATE NOT NULL ,
    date_fin            DATE NOT NULL ,
    id_personne         INTEGER NOT NULL ,

    PRIMARY KEY (id_quarantaine),
    FOREIGN KEY (id_personne) REFERENCES Employe (id_personne)
     ON DELETE CASCADE
);

CREATE TABLE Rencontre (
    id_visiteur         INTEGER NOT NULL ,
    id_employe          INTEGER NOT NULL ,
    date_rencontre      TIMESTAMP NOT NULL ,

    PRIMARY KEY (id_visiteur, id_employe, date_rencontre),
    FOREIGN KEY (id_visiteur) REFERENCES Visiteur (id_personne)
     ON DELETE CASCADE,
    FOREIGN KEY (id_employe) REFERENCES Employe (id_personne)
     ON DELETE CASCADE
);

CREATE TABLE Risque (
    date_actuelle       DATE NOT NULL ,
    id_personne         INTEGER NOT NULL ,

    PRIMARY KEY (date_actuelle, id_personne),
    FOREIGN KEY (id_personne) REFERENCES personne (id_personne)
     ON DELETE CASCADE
);

CREATE TABLE Vaccin (
    nom_vaccin          VARCHAR(45) NOT NULL ,
    age_min             INTEGER NOT NULL ,
    date_autorisatio    DATE NOT NULL ,
    effets_secondaires  VARCHAR(500) NOT NULL ,

    PRIMARY KEY (nom_vaccin)
);

CREATE TABLE vaccination (
    id_personne         INTEGER NOT NULL ,
    nom_vaccin          VARCHAR(45) NOT NULL ,
    date_vaccination    DATE NOT NULL ,

    PRIMARY KEY (id_personne, nom_vaccin, date_vaccination),
    FOREIGN KEY (id_personne) REFERENCES personne (id_personne)
     ON DELETE CASCADE,
    FOREIGN KEY (nom_vaccin) REFERENCES Vaccin (nom_vaccin)
     ON DELETE CASCADE
);
------------------------------------------------------------------------------------------------------------------------
-- Permissions pour les utilisateurs --
------------------------------------------------------------------------------------------------------------------------
-- Directeur

-- Id #17 --> Priorité : Important
-- En tant que directeur, je veux être en mesure d’augmenter les salaires de 2% pour les employés qui ont reçu les deux vaccins et qui ont travaillé plus de 20 jours entre le 1er mai et le 30 mai 2021.
-- GRANT INSERT, UPDATE, DELETE, SELECT ON personne TO directeur;
-- GRANT INSERT, UPDATE, DELETE, SELECT ON employe TO directeur;
-- GRANT INSERT, UPDATE, DELETE, SELECT ON visiteur TO directeur;
-- GRANT INSERT, UPDATE, DELETE, SELECT ON vaccination TO directeur;
------------------------------------------------------------------------------------------------------------------------
-- Employés
-- GRANT INSERT, SELECT ON vaccination TO employe;
-- GRANT INSERT, SELECT ON vaccin TO employe; 
-- GRANT INSERT, SELECT ON Entree_Sortie TO employe;
------------------------------------------------------------------------------------------------------------------------
-- Visiteurs
-- GRANT INSERT, SELECT ON vaccination TO visiteur;
-- GRANT INSERT, SELECT ON vaccin TO visiteur; 
-- GRANT INSERT, SELECT ON Entree_Sortie TO visiteur;
------------------------------------------------------------------------------------------------------------------------
-- Administrateur (pour ∀ les TABLES)

-- Id #14 --> Priorité : Important
-- En tant qu’administrateur de la base de données, je veux avoir accès à un script me permettant de remplir chacune des tables avec des données de test.
-- Les drop n'existe pas pour le grant
-- GRANT INSERT, UPDATE, DELETE, TRUNCATE ON personne TO administrateur;
-- GRANT INSERT, UPDATE, DELETE, TRUNCATE ON departement TO administrateur;
-- GRANT INSERT, UPDATE, DELETE, TRUNCATE ON visiteur TO administrateur;
-- GRANT INSERT, UPDATE, DELETE, TRUNCATE ON alerte TO administrateur;
-- GRANT INSERT, UPDATE, DELETE, TRUNCATE ON Entree_Sortie TO administrateur;
-- GRANT INSERT, UPDATE, DELETE, TRUNCATE ON Quarantaine TO administrateur;
-- GRANT INSERT, UPDATE, DELETE, TRUNCATE ON rencONtre TO administrateur;
-- GRANT INSERT, UPDATE, DELETE, TRUNCATE ON risque TO administrateur;
-- GRANT INSERT, UPDATE, DELETE, TRUNCATE ON vaccin TO administrateur;
-- GRANT INSERT, UPDATE, DELETE, TRUNCATE ON vaccination TO administrateur;
------------------------------------------------------------------------------------------------------------------------
--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx--
------------------------------------------------------------------------------------------------------------------------
-- Fin de la création --
------------------------------------------------------------------------------------------------------------------------