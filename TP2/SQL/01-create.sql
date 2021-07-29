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
-- Changement de format des dates --> Par défaut c'est DD-MON-YY dans Oracle SQL --
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY'; -- Pour jj-mm-aaaa
------------------------------------------------------------------------------------------------------------------------
-- On efface les tables s'ils existent préalablement --
------------------------------------------------------------------------------------------------------------------------
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
-- Création des utilisateurs (avec un mot de passe commun pour simplifier) --
------------------------------------------------------------------------------------------------------------------------
CREATE USER directeur IDENTIFIED BY '1234';
CREATE USER employe IDENTIFIED BY '1234';
CREATE USER visiteur IDENTIFIED BY '1234';
CREATE USER administrateur IDENTIFIED BY '1234';
------------------------------------------------------------------------------------------------------------------------
-- Création des tables --
------------------------------------------------------------------------------------------------------------------------
CREATE  TABLE  personne (
    id_personne         INTEGER NOT NULL ,
    nom                 VARCHAR(45) NOT NULL ,
    adresse_numero      VARCHAR(45) NULL ,
    rue                 VARCHAR(45) NOT NULL ,
    ville               VARCHAR(45) NOT NULL ,
    code_postal         VARCHAR(45) NOT NULL ,

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
    FOREIGN KEY (id_personne) REFERENCES personne(id_personne),
    FOREIGN KEY (nom_departement) REFERENCES Departement (nom_departement)
);

CREATE TABLE Visiteur (
    id_personne         INTEGER NOT NULL ,
    nom_entreprise      VARCHAR(45) NOT NULL ,

    PRIMARY KEY (id_personne),
    FOREIGN KEY (id_personne) REFERENCES personne (id_personne)
);

CREATE TABLE Alerte (
    date_actuelle       DATE NOT NULL ,
    id_personne         INTEGER NOT NULL ,

    PRIMARY KEY (date_actuelle, id_personne),
    FOREIGN KEY (id_personne) REFERENCES personne (id_personne)
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
);

CREATE TABLE Quarantaine (
    id_quarantaine      INTEGER NOT NULL ,
    date_debut          DATE NOT NULL ,
    date_fin            DATE NOT NULL ,
    id_personne         INTEGER NOT NULL ,

    PRIMARY KEY (id_quarantaine),
    FOREIGN KEY (id_personne) REFERENCES Employe (id_personne)
);

CREATE TABLE Rencontre (
    id_visiteur         INTEGER NOT NULL ,
    id_employe          INTEGER NOT NULL ,
    date_rencontre      TIMESTAMP NOT NULL ,

    PRIMARY KEY (id_visiteur, id_employe, date_rencontre),
    FOREIGN KEY (id_visiteur) REFERENCES Visiteur (id_personne),
    FOREIGN KEY (id_employe) REFERENCES Employe (id_personne)
);

CREATE TABLE Risque (
    date_actuelle       DATE NOT NULL ,
    id_personne         INTEGER NOT NULL ,

    PRIMARY KEY (date_actuelle, id_personne),
    FOREIGN KEY (id_personne) REFERENCES personne (id_personne)
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
    FOREIGN KEY (id_personne) REFERENCES personne (id_personne),
    FOREIGN KEY (nom_vaccin) REFERENCES Vaccin (nom_vaccin)
);
------------------------------------------------------------------------------------------------------------------------
-- Permissions pour les utilisateurs --
------------------------------------------------------------------------------------------------------------------------
-- Directeur
GRANT INSERT, UPDATE, DELETE, SELECT ON personne TO directeur;
GRANT INSERT, UPDATE, DELETE, SELECT ON employe TO directeur;
GRANT INSERT, UPDATE, DELETE, SELECT ON visiteur TO directeur;
GRANT INSERT, UPDATE, DELETE, SELECT ON vaccination TO directeur;
------------------------------------------------------------------------------------------------------------------------
-- Employés
GRANT INSERT, SELECT ON vaccination TO employe;
GRANT INSERT, SELECT ON vaccin TO employe; 
GRANT INSERT, SELECT ON Entree_Sortie TO employe;
------------------------------------------------------------------------------------------------------------------------
-- Visiteurs
GRANT INSERT, SELECT ON vaccination TO visiteur;
GRANT INSERT, SELECT ON vaccin TO visiteur; 
GRANT INSERT, SELECT ON Entree_Sortie TO visiteur;
------------------------------------------------------------------------------------------------------------------------
-- Administrateur (pour ∀ les TABLEs)
-- Les drop n'existe pas pour le grant
GRANT INSERT, UPDATE, DELETE ON personne TO administrateur;
GRANT INSERT, UPDATE, DELETE ON departement TO administrateur;
GRANT INSERT, UPDATE, DELETE ON visiteur TO administrateur;
GRANT INSERT, UPDATE, DELETE ON alerte TO administrateur;
GRANT INSERT, UPDATE, DELETE ON Entree_Sortie TO administrateur;
GRANT INSERT, UPDATE, DELETE ON Quarantaine TO administrateur;
GRANT INSERT, UPDATE, DELETE ON rencONtre TO administrateur;
GRANT INSERT, UPDATE, DELETE ON risque TO administrateur;
GRANT INSERT, UPDATE, DELETE ON vaccin TO administrateur;
GRANT INSERT, UPDATE, DELETE ON vaccination TO administrateur;
------------------------------------------------------------------------------------------------------------------------
--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx--
------------------------------------------------------------------------------------------------------------------------
-- Fin de la création --
------------------------------------------------------------------------------------------------------------------------