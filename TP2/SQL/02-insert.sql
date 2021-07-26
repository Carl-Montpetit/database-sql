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
-- CE FICHIER INCLUT LES INSERTIONS --
------------------------------------------------------------------------------------------------------------------------

-- Insertion personne
INSERT INTO "PERSONNE" (ID_PERSONNE, NOM, ADRESSE_NUMERO, RUE, VILLE, CODE_POSTAL) VALUES ('1', 'bob', '123', 'soleil', 'montreal', 'j5z 3c4');
INSERT INTO "PERSONNE" (ID_PERSONNE, NOM, ADRESSE_NUMERO, RUE, VILLE, CODE_POSTAL) VALUES ('2', 'carl', '2400', 'archambault', 'montreal', 'a3i 6x2');
INSERT INTO "PERSONNE" (ID_PERSONNE, NOM, ADRESSE_NUMERO, RUE, VILLE, CODE_POSTAL) VALUES ('3', 'Matthew', '500', 'Linton', 'montreal', 'a6g 2y5');
INSERT INTO "PERSONNE" (ID_PERSONNE, NOM, ADRESSE_NUMERO, RUE, VILLE, CODE_POSTAL) VALUES ('4', 'Mathieu', '3180', 'lune', 'montreal', 'a4g 9t8');
INSERT INTO "PERSONNE" (ID_PERSONNE, NOM, ADRESSE_NUMERO, RUE, VILLE, CODE_POSTAL) VALUES ('5', 'Denise', '700', 'buisson', 'repentigny', 'j5t 2v9');
INSERT INTO "PERSONNE" (ID_PERSONNE, NOM, ADRESSE_NUMERO, RUE, VILLE, CODE_POSTAL) VALUES ('6', 'Real', '127', 'lacordaire', 'montreal', 'h0b h1a');
INSERT INTO "PERSONNE" (ID_PERSONNE, NOM, ADRESSE_NUMERO, RUE, VILLE, CODE_POSTAL) VALUES ('7', 'Kevin', '4321', 'bourassa', 'charlemagne', 'j07 h3q');
INSERT INTO "PERSONNE" (ID_PERSONNE, NOM, ADRESSE_NUMERO, RUE, VILLE, CODE_POSTAL) VALUES ('8', 'Alexandre', '67', 'lafontaine', 'montreal', 'h0b h0c');
INSERT INTO "PERSONNE" (ID_PERSONNE, NOM, ADRESSE_NUMERO, RUE, VILLE, CODE_POSTAL) VALUES ('9', 'Carla', '1000', 'horme', 'montreal', 'h0e h1e');
INSERT INTO "PERSONNE" (ID_PERSONNE, NOM, ADRESSE_NUMERO, RUE, VILLE, CODE_POSTAL) VALUES ('10', 'Benito', '4500', 'van horn', 'montreal', 'r9e 3e5');
INSERT INTO "PERSONNE" (ID_PERSONNE, NOM, ADRESSE_NUMERO, RUE, VILLE, CODE_POSTAL) VALUES ('11', 'alphonso', '8500', 'dupuis', 'montreal', 'e7d 7d1');

-- Insertion département
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

-- Insertion employé
-- J'ai essayé de faire une autre façon plus belle pour insérer plusieurs ligne, mais pas réussi.
-- En passant numeric(7, 2) veut dire qu'il peut y avoir 7 chiffres en tout incluant les 2 nombres après la virgule.
INSERT INTO Employe (id_personne, date_naissance, poste, salaire, nom_departement) VALUES (1, '1994-05-21', 'commis comptoir', 30000.00, 'StockRoom');
INSERT INTO Employe (id_personne, date_naissance, poste, salaire, nom_departement) VALUES (3, '1928-08-08', 'directeur R and D', 10000.00, 'R and D');
INSERT INTO Employe (id_personne, date_naissance, poste, salaire, nom_departement) VALUES (5, '1975-01-17', 'gratte-papier', 99999.28, 'Bureau des plaintes');
INSERT INTO "EMPLOYE" (id_personne, date_naissance, poste, salaire, nom_departement) VALUES (7, '1900-07-15', 'technicien qualité', 41600.41, 'Qualité');
INSERT INTO Employe (id_personne, date_naissance, poste, salaire, nom_departement) VALUES (9, '1964-03-05', 'technicien', 56000.00, 'Production');
INSERT INTO Employe (id_personne, date_naissance, poste, salaire, nom_departement) VALUES (11, '1964-03-05', 'technicien', 56000.00, 'Production');

-- Insertion visiteur
INSERT INTO "VISITEUR" (ID_PERSONNE, NOM_ENTREPRISE) VALUES ('2', 'Maxi');
INSERT INTO "VISITEUR" (ID_PERSONNE, NOM_ENTREPRISE) VALUES ('4', 'Métro');
INSERT INTO "VISITEUR" (ID_PERSONNE, NOM_ENTREPRISE) VALUES ('6', 'IGA');
INSERT INTO "JA291905"."VISITEUR" (ID_PERSONNE, NOM_ENTREPRISE) VALUES ('8', 'Super C');
INSERT INTO "JA291905"."VISITEUR" (ID_PERSONNE, NOM_ENTREPRISE) VALUES ('10', 'Adonis');

-- Insertion entrée_sortie
INSERT INTO "ENTREE_SORTIE" (date_heure_entree, id_personne, date_heure_sortie, temperature, symptomes, risque_voisinage) VALUES ('2021-07-25 14:00:00', 1, '2021-07-25 15:00:00', 37.00, 'aucun', 'non');

-- Insertion Vaccin
INSERT INTO VACCIN VALUES ('Pfizer', 12, '2021-01-01', 'Possédé par démon');

-- Insert
INSERT INTO VACCINATION VALUES (11, 'Pfizer', '2021-07-23');





-- Id #1 --> Priorité : Obligatoire
-- En tant qu’un directeur, je veux avoir le droit d’insertion, modification, suppression et sélection afin d’être en mesure de manipuler les informations au sujet des :
-- ● Dossiers des employés et visiteurs
-- ● Vaccinations

-- Insertion d'au moins 10 enregistrements par table, en s'assurant que les requêtes que vous allez fournir dans les directives qui suivent retournent au moins un enregistrement.
------------------------------------------------------------------------------------------------------------------------
-- code ici

------------------------------------------------------------------------------------------------------------------------
-- Id #2 --> Priorité : Obligatoire
-- En tant qu’un employé ou visiteur, je veux avoir le droit d’insertion et sélection afin d’être en mesure de manipuler les informations au sujet:
-- ● Des dates de vaccination et les types de vaccins
-- ● Des dates des entrées et des sorties dans la compagnie
-- ● Des symptômes
-- ● Des contacts à moins de 2 mètres et plus de 15 minutes avec une personne contaminée

-- Insérer au moins 10 enregistrements par table, en s’assurant que les requêtes que vous allez fournir dans les directives qui suivent retournent au moins un enregistrement.
------------------------------------------------------------------------------------------------------------------------
-- code ici

------------------------------------------------------------------------------------------------------------------------
-- Id #8 --> Priorité : Obligatoire --> présent dans trigger aussi à vérifier plus tard!
-- Créer un déclencheur qui insère dans la table « risque » la liste des personnes (employé/visiteur) (leur id, le nom, la date actuelle) qui ont été en contact avec une personne (employé/visiteur) qui est suspectée d’avoir le Covid-19 jusqu’à 48 heures avant sa déclaration.
------------------------------------------------------------------------------------------------------------------------
-- code ici

------------------------------------------------------------------------------------------------------------------------
-- Id #13 --> Priorité : Obligatoire
-- Créer un déclencheur qui insère dans la table « alerte » la liste des personnes (leur id, le nom, la température, la date actuelle) qui ont une température de 39 degrés ou plus au moins 3 fois pendant les 5 derniers jours lors de l’entrée à l’usine.
------------------------------------------------------------------------------------------------------------------------
-- code ici