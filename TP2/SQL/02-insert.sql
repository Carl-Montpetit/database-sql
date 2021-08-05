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
INTO personne VALUES ('1', 'Bob', '123', 'soleil', 'montreal', 'J5Z 3C4')
INTO personne VALUES ('2', 'Carl', '2400', 'archambault', 'montreal', 'A3I 6X2')
INTO personne VALUES ('3', 'Matthew', '500', 'Linton', 'montreal', 'A6G 2Y5')
INTO personne VALUES ('4', 'Mathieu', '3180', 'lune', 'montreal', 'A4G 9T8')
INTO personne VALUES ('5', 'Denise', '700', 'buisson', 'repentigny', 'J5T 2V9')
INTO personne VALUES ('6', 'Real', '127', 'lacordaire', 'montreal', 'H0B 1W3')
INTO personne VALUES ('7', 'Kevin', '4321', 'bourassa', 'charlemagne', 'J07 5N8')
INTO personne VALUES ('8', 'Alexandre', '67', 'lafontaine', 'montreal', 'H0B 7H0')
INTO personne VALUES ('9', 'Carla', '1000', 'horme', 'montreal', 'H0E 5C5')
INTO personne VALUES ('10', 'Benito', '4500', 'van horn', 'montreal', 'R9E 3E5')
INTO personne VALUES ('11', 'Alphonso', '8500', 'dupuis', 'montreal', 'E7D 7D1')
INTO personne VALUES ('12', 'Serge', '3641', 'roy', 'montreal', 'Z9D 4E3')
INTO personne VALUES ('13', 'Antoine', '3641', 'lemire', 'montreal', 'N6X 7B8')
INTO personne VALUES ('14', 'Montserrat', '1134', 'laurier', 'montreal', 'H2J 1G7')
INTO personne VALUES ('15', 'Freda', '142', 'papineau', 'chateauguay', 'J6K 1L9')
INTO personne VALUES ('16', 'Gaston', '29', 'bolduc', 'gaspesie', 'G4X 1G2')
INTO personne VALUES ('17', 'Albert', '5254', 'garnier', 'montreal', 'H2L 3T8')
INTO personne VALUES ('18', 'Vincent', '144', 'dion', 'cowansville', 'J2K 2W6')
INTO personne VALUES ('19', 'Cedric', '4055', 'dagenais O', 'laval', 'H7R 1L3')
INTO personne VALUES ('20', 'Chantal', '281', 'saint catherine', 'montreal', 'H2X 1K7')
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
INTO employe VALUES (5, TO_DATE('17-01-1975', 'DD-MM-YYYY'), 'gratte-papier', 65000.00, 'Bureau des plaintes')
INTO employe VALUES (7, TO_DATE('15-07-1900', 'DD-MM-YYYY'), 'technicien qualité', 41600.00, 'Qualité')
INTO employe VALUES (9, TO_DATE('05-03-1964', 'DD-MM-YYYY'), 'technicien', 56000.00, 'Production')
INTO employe VALUES (11, TO_DATE('05-03-1964', 'DD-MM-YYYY'), 'technicien', 56000.00, 'Production')
INTO employe VALUES (13, TO_DATE('06-11-2003', 'DD-MM-YYYY'), 'technicien', 56000.00, 'Production')
INTO employe VALUES (15, TO_DATE('03-10-1931', 'DD-MM-YYYY'), 'paye', 60000.00, 'Finance')
INTO employe VALUES (17, TO_DATE('11-08-1982', 'DD_MM-YYYY'), 'le boss', 80000.00, 'Administration')
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
-- Insertion risque --
------------------------------------------------------------------------------------------------------------------------
INSERT ALL
INTO risque VALUES (TO_DATE('01-07-2020', 'DD-MM-YYYY'), 1)
INTO risque VALUES (TO_DATE('31-10-2020', 'DD-MM-YYYY'), 3)
INTO risque VALUES (TO_DATE('11-11-2020', 'DD-MM-YYYY'), 5)
INTO risque VALUES (TO_DATE('25-12-2020', 'DD-MM-YYYY'), 7)
INTO risque VALUES (TO_DATE('01-01-2021', 'DD-MM-YYYY'), 9)
INTO risque VALUES (TO_DATE('14-02-2021', 'DD-MM-YYYY'), 11)
INTO risque VALUES (TO_DATE('23-05-2021', 'DD-MM-YYYY'), 13)
INTO risque VALUES (TO_DATE('30-06-2021', 'DD-MM-YYYY'), 15)
INTO risque VALUES (TO_DATE('01-07-2021', 'DD-MM-YYYY'), 17)
INTO risque VALUES (TO_DATE('22-07-2021', 'DD-MM-YYYY'), 19)
SELECT * FROM dual;
------------------------------------------------------------------------------------------------------------------------
-- Insertion Alerte --
------------------------------------------------------------------------------------------------------------------------
INSERT ALL
INTO Alerte VALUES (TO_DATE('01-07-2020', 'DD-MM-YYYY'), 6)
INTO Alerte VALUES (TO_DATE('31-10-2020', 'DD-MM-YYYY'), 10)
INTO Alerte VALUES (TO_DATE('11-11-2020', 'DD-MM-YYYY'), 4)
INTO Alerte VALUES (TO_DATE('25-12-2020', 'DD-MM-YYYY'), 2)
INTO Alerte VALUES (TO_DATE('01-01-2021', 'DD-MM-YYYY'), 14)
INTO Alerte VALUES (TO_DATE('14-02-2021', 'DD-MM-YYYY'), 16)
INTO Alerte VALUES (TO_DATE('23-05-2021', 'DD-MM-YYYY'), 8)
INTO Alerte VALUES (TO_DATE('30-06-2021', 'DD-MM-YYYY'), 20)
INTO Alerte VALUES (TO_DATE('01-07-2021', 'DD-MM-YYYY'), 18)
INTO Alerte VALUES (TO_DATE('22-07-2021', 'DD-MM-YYYY'), 12)
SELECT * FROM dual;
------------------------------------------------------------------------------------------------------------------------
-- Insertion rencontre --
------------------------------------------------------------------------------------------------------------------------
INSERT ALL
INTO rencontre VALUES (6, 1, TO_DATE('01-07-2020', 'DD-MM-YYYY'))
INTO rencontre VALUES (10, 3, TO_DATE('31-10-2020', 'DD-MM-YYYY'))
INTO rencontre VALUES (4, 5, TO_DATE('11-11-2020', 'DD-MM-YYYY'))
INTO rencontre VALUES (2, 7, TO_DATE('25-12-2020', 'DD-MM-YYYY'))
INTO rencontre VALUES (14, 9, TO_DATE('01-01-2021', 'DD-MM-YYYY'))
INTO rencontre VALUES (16, 11, TO_DATE('14-02-2021', 'DD-MM-YYYY'))
INTO rencontre VALUES (8, 13, TO_DATE('23-05-2021', 'DD-MM-YYYY'))
INTO rencontre VALUES (20, 15, TO_DATE('30-06-2021', 'DD-MM-YYYY'))
INTO rencontre VALUES (18, 17, TO_DATE('01-07-2021', 'DD-MM-YYYY'))
INTO rencontre VALUES (12, 19, TO_DATE('22-07-2021', 'DD-MM-YYYY'))
SELECT * FROM dual;
------------------------------------------------------------------------------------------------------------------------
-- Insertion quarantaine --
------------------------------------------------------------------------------------------------------------------------
INSERT ALL
INTO quarantaine VALUES (1, TO_DATE('01-07-2020', 'DD-MM-YYYY'), TO_DATE('10-08-2020', 'DD-MM-YYYY'), 1)
INTO quarantaine VALUES (2, TO_DATE('31-10-2020', 'DD-MM-YYYY'), TO_DATE('10-12-2020', 'DD-MM-YYYY'), 3)
INTO quarantaine VALUES (3, TO_DATE('11-11-2020', 'DD-MM-YYYY'), TO_DATE('21-12-2020', 'DD-MM-YYYY'), 5)
INTO quarantaine VALUES (4, TO_DATE('25-12-2020', 'DD-MM-YYYY'), TO_DATE('03-02-2021', 'DD-MM-YYYY'), 7)
INTO quarantaine VALUES (5, TO_DATE('01-01-2021', 'DD-MM-YYYY'), TO_DATE('10-02-2021', 'DD-MM-YYYY'), 9)
INTO quarantaine VALUES (6, TO_DATE('14-02-2021', 'DD-MM-YYYY'), TO_DATE('26-03-2021', 'DD-MM-YYYY'), 11)
INTO quarantaine VALUES (7, TO_DATE('23-05-2021', 'DD-MM-YYYY'), TO_DATE('02-07-2021', 'DD-MM-YYYY'), 13)
INTO quarantaine VALUES (8, TO_DATE('30-06-2021', 'DD-MM-YYYY'), TO_DATE('09-08-2021', 'DD-MM-YYYY'), 15)
INTO quarantaine VALUES (9, TO_DATE('01-07-2021', 'DD-MM-YYYY'), TO_DATE('10-08-2021', 'DD-MM-YYYY'), 17)
INTO quarantaine VALUES (10, TO_DATE('22-07-2021', 'DD-MM-YYYY'), TO_DATE('31-08-2021', 'DD-MM-YYYY'), 19)
SELECT * FROM dual;
------------------------------------------------------------------------------------------------------------------------
--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx--
------------------------------------------------------------------------------------------------------------------------
-- Fin des insertions --
------------------------------------------------------------------------------------------------------------------------
