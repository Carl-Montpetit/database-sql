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
INSERT ALL
INTO personne VALUES ('1', 'Bob', '123', 'soleil', 'montreal', 'j5z 3c4')
INTO personne VALUES ('2', 'Carl', '2400', 'archambault', 'montreal', 'a3i 6x2')
INTO personne VALUES ('3', 'Matthew', '500', 'LINTOn', 'montreal', 'a6g 2y5')
INTO personne VALUES ('4', 'Mathieu', '3180', 'lune', 'montreal', 'a4g 9t8')
INTO personne VALUES ('5', 'Denise', '700', 'buisson', 'repentigny', 'j5t 2v9')
INTO personne VALUES ('6', 'Real', '127', 'lacordaire', 'montreal', 'h0b h1a')
INTO personne VALUES ('7', 'Kevin', '4321', 'bourassa', 'charlemagne', 'j07 h3q')
INTO personne VALUES ('8', 'Alexandre', '67', 'lafontaine', 'montreal', 'h0b h0c')
INTO personne VALUES ('9', 'Carla', '1000', 'horme', 'montreal', 'h0e h1e')
INTO personne VALUES ('10', 'Benito', '4500', 'van horn', 'montreal', 'r9e 3e5')
INTO personne VALUES ('11', 'Alphonso', '8500', 'dupuis', 'montreal', 'e7d 7d1')
INTO personne VALUES ('12', 'Serge', '3641', 'roy', 'montreal', 'z9d 4e3')
INTO personne VALUES ('13', 'Antoine', '3641', 'lemire', 'montreal', 'n6x 7b8')
INTO personne VALUES ('14', 'Montserrat', '1134', 'laurier', 'montreal', 'h2j 1g7')
INTO personne VALUES ('15', 'Freda', '142', 'papineau', 'chateauguay', 'j6k 1l9')
INTO personne VALUES ('16', 'Gaston', '29', 'bolduc', 'gaspesie', 'g4x 1g2')
INTO personne VALUES ('17', 'Albert', '5254', 'garnier', 'montreal', 'h2l 3t8')
INTO personne VALUES ('18', 'Vincent', '144', 'dion', 'cowansville', 'j2k 2w6')
INTO personne VALUES ('19', 'Cedric', '4055', 'dagenais O', 'laval', 'h7r 1l3')
INTO personne VALUES ('20', 'Chantal', '281', 'saint catherine', 'montreal', 'h2x 1k7')
SELECT * FROM dual;
------------------------------------------------------------------------------------------------------------------------
-- Insertion département --
------------------------------------------------------------------------------------------------------------------------
INSERT ALL
INTO departement VALUES ('StockRoom', '75')
INTO departement VALUES ('R and D', '80')
INTO departement VALUES ('Production', '95')
INTO departement VALUES ('Finance', '75')
INTO departement VALUES ('Administration', '23')
INTO departement VALUES ('Projet', '49')
INTO departement VALUES ('Qualité', '50')
INTO departement VALUES ('Entretient', '79')
INTO departement VALUES ('Bureau des plaintes', '0')
INTO departement VALUES ('Livraison', '10')
SELECT * FROM dual;
------------------------------------------------------------------------------------------------------------------------
-- Insertion employé --
------------------------------------------------------------------------------------------------------------------------
INSERT ALL
INTO employe VALUES (1, TO_DATE('21-05-1994', 'DD-MM-YYYY'), 'commis comptoir', 30000.00, 'StockRoom')
INTO employe VALUES (3, TO_DATE('08-08-1928', 'DD-MM-YYYY'), 'directeur R and D', 10000.00, 'R and D')
INTO employe VALUES (5, TO_DATE('17-01-1975', 'DD-MM-YYYY'), 'gratte-papier', 99999.28, 'Bureau des plaintes')
INTO employe VALUES (7, TO_DATE('15-07-1900', 'DD-MM-YYYY'), 'technicien qualité', 41600.41, 'Qualité')
INTO employe VALUES (9, TO_DATE('05-03-1964', 'DD-MM-YYYY'), 'technicien', 56000.00, 'Production')
INTO employe VALUES (11, TO_DATE('05-03-1964', 'DD-MM-YYYY'), 'technicien', 56000.00, 'Production')
INTO employe VALUES (12, TO_DATE('11-06-2000', 'DD-MM-YYYY'), 'technicien', 56000.00, 'Production')
INTO employe VALUES (13, TO_DATE('06-11-2003', 'DD-MM-YYYY'), 'technicien', 56000.00, 'Production')
INTO employe VALUES (15, TO_DATE('03-10-1931', 'DD-MM-YYYY'), 'paye', 60000.01, 'Finance')
INTO employe VALUES (17, TO_DATE('11-08-1982', 'DD_MM-YYYY'), 'le boss', 99999.99, 'Administration')
INTO employe VALUES (19, TO_DATE('01-04-2005', 'DD-MM-YYYY'), 'livreur', 25000.00, 'Livraison')
SELECT * FROM dual;
------------------------------------------------------------------------------------------------------------------------
-- Insertion visiteur --
------------------------------------------------------------------------------------------------------------------------
INSERT ALL
INTO visiteur VALUES ('2', 'Maxi')
INTO visiteur VALUES ('4', 'Métro')
INTO visiteur VALUES ('6', 'IGA')
INTO visiteur VALUES ('8', 'Super C')
INTO visiteur VALUES ('10', 'Adonis')
INTO visiteur VALUES ('12', 'Loblaws')
INTO visiteur VALUES ('14', 'Sobeys')
INTO visiteur VALUES ('16', 'Provigo')
INTO visiteur VALUES ('18', 'Tigre Geant')
INTO visiteur VALUES ('20', 'Walmart')
SELECT * FROM dual;
------------------------------------------------------------------------------------------------------------------------
-- Insertion entrée_sortie --
------------------------------------------------------------------------------------------------------------------------
INSERT ALL
INTO entree_sortie VALUES (TO_DATE('28-02-2021 06:00:00', 'DD-MM-YYYY HH24:MI:SS'), 15,
                           TO_DATE('28-02-2021 14:00:00', 'DD-MM-YYYY HH24:MI:SS'), 36.70, 'aucun', 'non')
INTO entree_sortie VALUES (TO_DATE('28-02-2021 11:30:00', 'DD-MM-YYYY HH24:MI:SS'), 12,
                           TO_DATE('28-02-2021 13:30:00', 'DD-MM-YYYY HH24:MI:SS'), 36.00, 'aucun', 'oui')
INTO entree_sortie VALUES (TO_DATE('28-02-2021 18:00:00', 'DD-MM-YYYY HH24:MI:SS'), 16,
                           TO_DATE('28-02-2021 20:00:00', 'DD-MM-YYYY HH24:MI:SS'), 40.20, 'fievre', 'oui')
INTO entree_sortie VALUES (TO_DATE('28-02-2021 14:00:00', 'DD-MM-YYYY HH24:MI:SS'), 17,
                           TO_DATE('28-02-2021 22:00:00', 'DD-MM-YYYY HH24:MI:SS'), 41.00, 'fievre', 'non')
INTO entree_sortie VALUES (TO_DATE('01-03-2021 10:30:00', 'DD-MM-YYYY HH24:MI:SS'), 5,
                           TO_DATE('01-03-2021 18:30:00', 'DD-MM-YYYY HH24:MI:SS'), 36.10, 'aucun', 'non')
INTO entree_sortie VALUES (TO_DATE('01-03-2021 12:00:00', 'DD-MM-YYYY HH24:MI:SS'), 14,
                           TO_DATE('01-03-2021 12:34:00', 'DD-MM-YYYY HH24:MI:SS'), 35.80, 'aucun', 'oui')
INTO entree_sortie VALUES (TO_DATE('04-04-2021 10:30:00', 'DD-MM-YYYY HH24:MI:SS'), 19,
                           TO_DATE('04-04-2021 18:30:00', 'DD-MM-YYYY HH24:MI:SS'), 38.00, 'faiblesse', 'oui')
INTO entree_sortie VALUES (TO_DATE('04-04-2021 10:30:00', 'DD-MM-YYYY HH24:MI:SS'), 10,
                           TO_DATE('04-04-2021 11:15:00', 'DD-MM-YYYY HH24:MI:SS'), 38.20, 'fatigue', 'oui')
INTO entree_sortie VALUES (TO_DATE('04-04-2021 12:45:00', 'DD-MM-YYYY HH24:MI:SS'), 4,
                           TO_DATE('04-04-2021 14:00:00', 'DD-MM-YYYY HH24:MI:SS'), 36.60, 'aucun', 'oui')
INTO entree_sortie VALUES (TO_DATE('04-04-2021 13:55:00', 'DD-MM-YYYY HH24:MI:SS'), 20,
                           TO_DATE('04-04-2021 16:30:00', 'DD-MM-YYYY HH24:MI:SS'), 36.90, 'aucun', 'oui')
INTO entree_sortie VALUES (TO_DATE('18-05-2021 10:30:00', 'DD-MM-YYYY HH24:MI:SS'), 1,
                           TO_DATE('18-05-2021 18:30:00', 'DD-MM-YYYY HH24:MI:SS'), 37.00, 'aucun', 'non')
INTO entree_sortie VALUES (TO_DATE('23-06-2021 6:00:00', 'DD-MM-YYYY HH24:MI:SS'), 9,
                           TO_DATE('23-06-2021 14:00:00', 'DD-MM-YYYY HH24:MI:SS'), 40.00, 'aucun', 'oui')
INTO entree_sortie VALUES (TO_DATE('23-06-2021 14:00:00', 'DD-MM-YYYY HH24:MI:SS'), 11,
                           TO_DATE('23-06-2021 22:00:00', 'DD-MM-YYYY HH24:MI:SS'), 40.00, 'aucun', 'oui')
INTO entree_sortie VALUES (TO_DATE('23-06-2021 08:30:00', 'DD-MM-YYYY HH24:MI:SS'), 2,
                           TO_DATE('23-06-2021 15:00:00', 'DD-MM-YYYY HH24:MI:SS'), 41.00, 'fievre', 'non')
INTO entree_sortie VALUES (TO_DATE('25-06-2021 10:30:00', 'DD-MM-YYYY HH24:MI:SS'), 7,
                           TO_DATE('25-06-2021 18:30:00', 'DD-MM-YYYY HH24:MI:SS'), 36.10, 'aucun', 'non')
INTO entree_sortie VALUES (TO_DATE('25-06-2021 11:11:00', 'DD-MM-YYYY HH24:MI:SS'), 6,
                           TO_DATE('25-06-2021 11:45:00', 'DD-MM-YYYY HH24:MI:SS'), 35.80, 'aucun', 'oui')
INTO entree_sortie VALUES (TO_DATE('25-06-2021 16:30:00', 'DD-MM-YYYY HH24:MI:SS'), 8,
                           TO_DATE('25-06-2021 18:25:00', 'DD-MM-YYYY HH24:MI:SS'), 38.00, 'faiblesse', 'oui')
INTO entree_sortie VALUES (TO_DATE('02-07-2021 10:30:00', 'DD-MM-YYYY HH24:MI:SS'), 13,
                           TO_DATE('02-07-2021 18:30:00', 'DD-MM-YYYY HH24:MI:SS'), 38.20, 'fatigue', 'oui')
INTO entree_sortie VALUES (TO_DATE('25-07-2021 08:30:00', 'DD-MM-YYYY HH24:MI:SS'), 3,
                           TO_DATE('25-07-2021 15:00:00', 'DD-MM-YYYY HH24:MI:SS'), 36.60, 'aucun', 'oui')
INTO entree_sortie VALUES (TO_DATE('25-07-2021 08:30:00', 'DD-MM-YYYY HH24:MI:SS'), 18,
                           TO_DATE('25-07-2021 15:00:00', 'DD-MM-YYYY HH24:MI:SS'), 36.90, 'aucun', 'oui')
SELECT * FROM dual;
------------------------------------------------------------------------------------------------------------------------
-- Insertion Vaccin --
------------------------------------------------------------------------------------------------------------------------
INSERT ALL
INTO vaccin VALUES ('Pfizer', 12, TO_DATE('08-01-2021', 'DD-MM-YYYY'), 'fievre, maux de tete, faiblesse, fatigue')
INTO vaccin VALUES ('Moderna', 12, TO_DATE('12-10-2020', 'DD-MM-YYYY'), 'fievre, maux de tete, faiblesse, fatigue')
INTO vaccin VALUES ('AstraZeneca', 50, TO_DATE('26-02-2021', 'DD-MM-YYYY'), 'fievre, maux de tete, faiblesse, fatigue, caillots sanguins')
INTO vaccin VALUES ('Janssen', 18, TO_DATE('27-02-2021', 'DD-MM-YYYY'), 'fievre, maux de tete, faiblesse, fatigue, caillots sanguins')
INTO vaccin VALUES ('Sputnik V', 12, TO_DATE('11-08-2020', 'DD-MM-YYYY'), 'fievre, maux de tete, faiblesse, fatigue')
INTO vaccin VALUES ('Sinopharm', 18, TO_DATE('07-05-2021', 'DD-MM-YYYY'), 'fievre, maux de tete, faiblesse, fatigue')
INTO vaccin VALUES ('Covaxin', 12, TO_DATE('25-07-2021', 'DD-MM-YYYY'), 'fievre, maux de tete, faiblesse, fatigue, caillots sanguins')
INTO vaccin VALUES ('EpiVacCorona', 18, TO_DATE('07-12-2020', 'DD-MM-YYYY'), 'fievre, maux de tete, faiblesse, fatigue, caillots sanguins')
INTO vaccin VALUES ('ZF2001', 18, TO_DATE('01-03-2021', 'DD-MM-YYYY'), 'fievre, maux de tete, faiblesse, fatigue')
INTO vaccin VALUES ('Soberana 02', 3, TO_DATE('21-03-2021', 'DD-MM-YYYY'), 'fievre, maux de tete, faiblesse, fatigue, caillots sanguins')
SELECT * FROM dual;
------------------------------------------------------------------------------------------------------------------------
-- Insertion vaccination--
------------------------------------------------------------------------------------------------------------------------
INSERT ALL
INTO vaccination VALUES (2, 'Moderna', TO_DATE('23-05-2021', 'DD-MM-YYYY'))
INTO vaccination VALUES (2, 'Moderna', TO_DATE('23-07-2021', 'DD-MM-YYYY'))
INTO vaccination VALUES (3, 'Pfizer', TO_DATE('16-05-2021', 'DD-MM-YYYY'))
INTO vaccination VALUES (3, 'Pfizer', TO_DATE('18-07-2021', 'DD-MM-YYYY'))
INTO vaccination VALUES (4, 'Sputnik V', TO_DATE('29-04-2021', 'DD-MM-YYYY'))
INTO vaccination VALUES (4, 'Sputnik V', TO_DATE('30-06-2021', 'DD-MM-YYYY'))
INTO vaccination VALUES (14, 'AstraZeneca', TO_DATE('12-03-2021', 'DD-MM-YYYY'))
INTO vaccination VALUES (15, 'Janssen', TO_DATE('04-04-2021', 'DD-MM-YYYY'))
INTO vaccination VALUES (16, 'Soberana 02', TO_DATE('19-04-2021', 'DD-MM-YYYY'))
INTO vaccination VALUES (17, 'AstraZeneca', TO_DATE('12-03-2021', 'DD-MM-YYYY'))
SELECT * from dual;
------------------------------------------------------------------------------------------------------------------------
-- Insertion Alerte --
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Alerte VALUES (TO_DATE('23-07-2021', 'DD-MM-YYYY'), 12);
------------------------------------------------------------------------------------------------------------------------
--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx--
------------------------------------------------------------------------------------------------------------------------
-- Fin des insertions --
------------------------------------------------------------------------------------------------------------------------