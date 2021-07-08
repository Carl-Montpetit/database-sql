--  Nom : Carl Montpetit 
--  Code permanent : MONC08069000 
--
--  Nom : Matthew Jovani
--  Code permanent : JOVM19108705
--
--  Nom : Mathieu Dumont
--  Code permanent : DUMM21059400 
------------------------------------------------------------------------------------------------------------------------
-- CE FICHIER INCLUT LES INSERTIONS --
------------------------------------------------------------------------------------------------------------------------
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