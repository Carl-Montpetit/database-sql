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
-- CE FICHIER INCLUT LES InsertionS --
------------------------------------------------------------------------------------------------------------------------
-- Insertion d'au moins 10 enregistrements par table, en s'assurant que les requêtes que vous allez fournir dans les directives qui suivent retournent au moins un enregistrement.
------------------------------------------------------------------------------------------------------------------------
-- Insertion personne --
------------------------------------------------------------------------------------------------------------------------
INSERT INTO "PERSONNE" (ID_PERSONNE, NOM, ADRESSE_NUMERO, RUE, VILLE, CODE_POSTAL) 
VALUES ('1', 'Bob', '123', 'soleil', 'montreal', 'j5z 3c4');

INSERT INTO "PERSONNE" (ID_PERSONNE, NOM, ADRESSE_NUMERO, RUE, VILLE, CODE_POSTAL) 
VALUES ('2', 'Carl', '2400', 'archambault', 'montreal', 'a3i 6x2');

INSERT INTO "PERSONNE" (ID_PERSONNE, NOM, ADRESSE_NUMERO, RUE, VILLE, CODE_POSTAL) 
VALUES ('3', 'Matthew', '500', 'LINTOn', 'montreal', 'a6g 2y5');

INSERT INTO "PERSONNE" (ID_PERSONNE, NOM, ADRESSE_NUMERO, RUE, VILLE, CODE_POSTAL) 
VALUES ('4', 'Mathieu', '3180', 'lune', 'montreal', 'a4g 9t8');

INSERT INTO "PERSONNE" (ID_PERSONNE, NOM, ADRESSE_NUMERO, RUE, VILLE, CODE_POSTAL) 
VALUES ('5', 'Denise', '700', 'buisson', 'repentigny', 'j5t 2v9');

INSERT INTO "PERSONNE" (ID_PERSONNE, NOM, ADRESSE_NUMERO, RUE, VILLE, CODE_POSTAL) 
VALUES ('6', 'Real', '127', 'lacordaire', 'montreal', 'h0b h1a');

INSERT INTO "PERSONNE" (ID_PERSONNE, NOM, ADRESSE_NUMERO, RUE, VILLE, CODE_POSTAL) 
VALUES ('7', 'Kevin', '4321', 'bourassa', 'charlemagne', 'j07 h3q');

INSERT INTO "PERSONNE" (ID_PERSONNE, NOM, ADRESSE_NUMERO, RUE, VILLE, CODE_POSTAL) 
VALUES ('8', 'Alexandre', '67', 'lafontaine', 'montreal', 'h0b h0c');

INSERT INTO "PERSONNE" (ID_PERSONNE, NOM, ADRESSE_NUMERO, RUE, VILLE, CODE_POSTAL) 
VALUES ('9', 'Carla', '1000', 'horme', 'montreal', 'h0e h1e');

INSERT INTO "PERSONNE" (ID_PERSONNE, NOM, ADRESSE_NUMERO, RUE, VILLE, CODE_POSTAL) 
VALUES ('10', 'Benito', '4500', 'van horn', 'montreal', 'r9e 3e5');

INSERT INTO "PERSONNE" (ID_PERSONNE, NOM, ADRESSE_NUMERO, RUE, VILLE, CODE_POSTAL) 
VALUES ('11', 'Alphonso', '8500', 'dupuis', 'montreal', 'e7d 7d1');

INSERT INTO "PERSONNE" (ID_PERSONNE, NOM, ADRESSE_NUMERO, RUE, VILLE, CODE_POSTAL) 
VALUES ('12', 'Serge', '3641', 'roy', 'montreal', 'z9d 4e3');

INSERT INTO "PERSONNE" (ID_PERSONNE, NOM, ADRESSE_NUMERO, RUE, VILLE, CODE_POSTAL) 
VALUES ('13', 'Antoine', '3641', 'lemire', 'montreal', 'n6x 7b8');

INSERT INTO "PERSONNE" (ID_PERSONNE, NOM, ADRESSE_NUMERO, RUE, VILLE, CODE_POSTAL) 
VALUES ('14', 'Montserrat', '1134', 'laurier', 'montreal', 'h2j 1g7');

INSERT INTO "PERSONNE" (ID_PERSONNE, NOM, ADRESSE_NUMERO, RUE, VILLE, CODE_POSTAL) 
VALUES ('15', 'Freda', '142', 'papineau', 'chateauguay', 'j6k 1l9');

INSERT INTO "PERSONNE" (ID_PERSONNE, NOM, ADRESSE_NUMERO, RUE, VILLE, CODE_POSTAL) 
VALUES ('16', 'Gaston', '29', 'bolduc', 'gaspesie', 'g4x 1g2');

INSERT INTO "PERSONNE" (ID_PERSONNE, NOM, ADRESSE_NUMERO, RUE, VILLE, CODE_POSTAL) 
VALUES ('17', 'Albert', '5254', 'garnier', 'montreal', 'h2l 3t8');

INSERT INTO "PERSONNE" (ID_PERSONNE, NOM, ADRESSE_NUMERO, RUE, VILLE, CODE_POSTAL) 
VALUES ('18', 'Vincent', '144', 'dion', 'cowansville', 'j2k 2w6');

INSERT INTO "PERSONNE" (ID_PERSONNE, NOM, ADRESSE_NUMERO, RUE, VILLE, CODE_POSTAL) 
VALUES ('19', 'Cedric', '4055', 'dagenais O', 'laval', 'h7r 1l3');

INSERT INTO "PERSONNE" (ID_PERSONNE, NOM, ADRESSE_NUMERO, RUE, VILLE, CODE_POSTAL) 
VALUES ('20', 'Chantal', '281', 'saint catherine', 'montreal', 'h2x 1k7');
------------------------------------------------------------------------------------------------------------------------
-- Insertion département --
------------------------------------------------------------------------------------------------------------------------
INSERT INTO "DEPARTEMENT" (NOM_DEPARTEMENT, POURCENTAGE_RISQUE) VALUES ('StockRoom', '75');
INSERT INTO "DEPARTEMENT" (NOM_DEPARTEMENT, POURCENTAGE_RISQUE) VALUES ('R and D', '80');
INSERT INTO "DEPARTEMENT" (NOM_DEPARTEMENT, POURCENTAGE_RISQUE) VALUES ('Production', '95');
INSERT INTO "DEPARTEMENT" (NOM_DEPARTEMENT, POURCENTAGE_RISQUE) VALUES ('Finance', '75');
INSERT INTO "DEPARTEMENT" (NOM_DEPARTEMENT, POURCENTAGE_RISQUE) VALUES ('Administration', '23');
INSERT INTO "DEPARTEMENT" (NOM_DEPARTEMENT, POURCENTAGE_RISQUE) VALUES ('Projet', '49');
INSERT INTO "DEPARTEMENT" (NOM_DEPARTEMENT, POURCENTAGE_RISQUE) VALUES ('Qualité', '50');
INSERT INTO "DEPARTEMENT" (NOM_DEPARTEMENT, POURCENTAGE_RISQUE) VALUES ('Entretient', '79');
INSERT INTO "DEPARTEMENT" (NOM_DEPARTEMENT, POURCENTAGE_RISQUE) VALUES ('Bureau des plaintes', '0');
INSERT INTO "DEPARTEMENT" (NOM_DEPARTEMENT, POURCENTAGE_RISQUE) VALUES ('Livraison', '10');
------------------------------------------------------------------------------------------------------------------------
-- Insertion employé --
-- J'ai essayé de faire une autre façon plus belle pour insérer plusieurs ligne, mais pas réussi.
-- En passant numeric(7, 2) veut dire qu'il peut y avoir 7 chiffres en tout incluant les 2 nombres après la virgule.
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Employe (id_personne, date_naissance, poste, salaire, nom_departement) 
VALUES (1, '1994-05-21', 'commis comptoir', 30000.00, 'StockRoom');

INSERT INTO Employe (id_personne, date_naissance, poste, salaire, nom_departement) 
VALUES (3, '1928-08-08', 'directeur R and D', 10000.00, 'R and D');

INSERT INTO Employe (id_personne, date_naissance, poste, salaire, nom_departement) 
VALUES (5, '1975-01-17', 'gratte-papier', 99999.28, 'Bureau des plaintes');

INSERT INTO "EMPLOYE" (id_personne, date_naissance, poste, salaire, nom_departement) 
VALUES (7, '1900-07-15', 'technicien qualité', 41600.41, 'Qualité');

INSERT INTO Employe (id_personne, date_naissance, poste, salaire, nom_departement) 
VALUES (9, '1964-03-05', 'technicien', 56000.00, 'Production');

INSERT INTO Employe (id_personne, date_naissance, poste, salaire, nom_departement) 
VALUES (11, '1964-03-05', 'technicien', 56000.00, 'Production');

INSERT INTO Employe (id_personne, date_naissance, poste, salaire, nom_departement) 
VALUES (12, '2000-06-11', 'technicien', 56000.00, 'Production');

INSERT INTO Employe (id_personne, date_naissance, poste, salaire, nom_departement) 
VALUES (13, '2003-11-06', 'technicien', 56000.00, 'Production');

INSERT INTO Employe (id_personne, date_naissance, poste, salaire, nom_departement) 
VALUES (15, '1931-10-03', 'paye', 60000.01, 'Finance');

INSERT INTO Employe (id_personne, date_naissance, poste, salaire, nom_departement) 
VALUES (17, '1982-08-11', 'le boss', 99999.99, 'Administration');

INSERT INTO Employe (id_personne, date_naissance, poste, salaire, nom_departement) 
VALUES (19, '2005-04-01', 'livreur', 25000.00, 'Livraison');
------------------------------------------------------------------------------------------------------------------------
-- Insertion visiteur --
------------------------------------------------------------------------------------------------------------------------
INSERT INTO "VISITEUR" (ID_PERSONNE, NOM_ENTREPRISE) VALUES ('2', 'Maxi');
INSERT INTO "VISITEUR" (ID_PERSONNE, NOM_ENTREPRISE) VALUES ('4', 'Métro');
INSERT INTO "VISITEUR" (ID_PERSONNE, NOM_ENTREPRISE) VALUES ('6', 'IGA');
INSERT INTO "VISITEUR" (ID_PERSONNE, NOM_ENTREPRISE) VALUES ('8', 'Super C');
INSERT INTO "VISITEUR" (ID_PERSONNE, NOM_ENTREPRISE) VALUES ('10', 'Adonis');
INSERT INTO "VISITEUR" (ID_PERSONNE, NOM_ENTREPRISE) VALUES ('12', 'Loblaws');
INSERT INTO "VISITEUR" (ID_PERSONNE, NOM_ENTREPRISE) VALUES ('14', 'Sobeys');
INSERT INTO "VISITEUR" (ID_PERSONNE, NOM_ENTREPRISE) VALUES ('16', 'Provigo');
INSERT INTO "VISITEUR" (ID_PERSONNE, NOM_ENTREPRISE) VALUES ('18', 'Tigre Geant');
INSERT INTO "VISITEUR" (ID_PERSONNE, NOM_ENTREPRISE) VALUES ('20', 'Walmart');
------------------------------------------------------------------------------------------------------------------------
-- Insertion entrée_sortie --
------------------------------------------------------------------------------------------------------------------------
INSERT INTO "ENTREE_SORTIE"  VALUES ('2021-07-25 14:00:00', 1, '2021-07-25 15:00:00', 37.00, 'aucun', 'non');
INSERT INTO "ENTREE_SORTIE"  VALUES ('2021-07-25 08:00:00', 9, '2021-07-25 15:00:00', 40.00, 'aucun', 'oui');
INSERT INTO "ENTREE_SORTIE"  VALUES ('2021-07-25 08:30:00', 11, '2021-07-25 15:00:00', 40.00, 'aucun', 'oui');
------------------------------------------------------------------------------------------------------------------------
-- Insertion Vaccin --
------------------------------------------------------------------------------------------------------------------------
INSERT ALL
INTO vaccin VALUES ('Pfizer', 12, '2021-01-08', 'fievre, maux de tete, faiblesse, fatigue')
INTO vaccin VALUES ('Moderna', 12, '2020-10-12', 'fievre, maux de tete, faiblesse, fatigue')
INTO vaccin VALUES ('AstraZeneca', 50, '2021-02-26', 'fievre, maux de tete, faiblesse, fatigue, caillots sanguins')
INTO vaccin VALUES ('Janssen', 18, '2021-02-27', 'fievre, maux de tete, faiblesse, fatigue, caillots sanguins')
INTO vaccin VALUES ('Sputnik V', 12, '2020-08-11', 'fievre, maux de tete, faiblesse, fatigue')
INTO vaccin VALUES ('Sinopharm', 18, '2021-05-07', 'fievre, maux de tete, faiblesse, fatigue')
INTO vaccin VALUES ('Covaxin', 12, '2021-07-25', 'fievre, maux de tete, faiblesse, fatigue, caillots sanguins') 
INTO vaccin VALUES ('EpiVacCorona', 18, '2020-12-07', 'fievre, maux de tete, faiblesse, fatigue, caillots sanguins')
INTO vaccin VALUES ('ZF2001', 18, '2021-03-01', 'fievre, maux de tete, faiblesse, fatigue')
INTO vaccin VALUES ('Soberana 02', 3, '2021-03-21', 'fievre, maux de tete, faiblesse, fatigue, caillots sanguins')
SELECT * FROM dual;
------------------------------------------------------------------------------------------------------------------------
-- Insertion vaccination--
------------------------------------------------------------------------------------------------------------------------
INSERT ALL
INTO vaccination VALUES (2, 'Moderna', '2021-05-23')
INTO vaccination VALUES (2, 'Moderna', '2021-07-23')
INTO vaccination VALUES (3, 'Pfizer', '2021-05-16')
INTO vaccination VALUES (3, 'Pfizer', '2021-07-18')
INTO vaccination VALUES (4, 'Sputnik V', '2021-04-29')
INTO vaccination VALUES (4, 'Sputnik V', '2021-06-30')
INTO vaccination VALUES (14, 'AstraZeneca', '2021-03-12')
INTO vaccination VALUES (15, 'Janssen', '2021-04-04')
INTO vaccination VALUES (16, 'Soberana 02', '2021-04-19')
INTO vaccination VALUES (17, 'AstraZeneca', '2021-03-12')
select * from dual;
------------------------------------------------------------------------------------------------------------------------
-- Insertion Alerte --
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Alerte VALUES ('2021-07-23', 12);
------------------------------------------------------------------------------------------------------------------------
--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx--
------------------------------------------------------------------------------------------------------------------------
-- Fin des insertions --
------------------------------------------------------------------------------------------------------------------------
