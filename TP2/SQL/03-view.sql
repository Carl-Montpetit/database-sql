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
-- CE FICHIER INCLUT LA CRÉATION DES VUES --
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- Id #4 --> Priorité : Obligatoire
-- Créer une vue (liste_vaccine) permettant de fournir la liste des employés vaccinés (seuls ceux qui ont pris les 2 doses doivent être considérés) avec le type de vaccin (pfizer, moderna, ...), regroupé par vaccin et trié par date.
------------------------------------------------------------------------------------------------------------------------
CREATE VIEW liste_vaccine
AS
SELECT vaccination.id_personne, personne.nom, vaccination.nom_vaccin, vaccination.date_vaccination FROM vaccination
INNER JOIN personne ON
    personne.id_personne = vaccination.id_personne
WHERE (vaccination.id_personne) IN 
    (SELECT vaccination.id_personne FROM vaccination
    GROUP BY vaccination.id_personne
    HAVING count(id_personne) = 2
    )
AND EXISTS (
    SELECT null
    FROM employe
    WHERE employe.id_personne = vaccination.id_personne
)
ORDER BY vaccination.date_vaccination;
------------------------------------------------------------------------------------------------------------------------
-- Id #5 --> Priorité : Obligatoire
-- Créer une vue (liste_quarantaine) permettant de fournir la liste de tous les employés en quarantaine avec le nombre de jours restant de leur quarantaine entre le 1er mai et le 30 juin 2021.
------------------------------------------------------------------------------------------------------------------------
CREATE VIEW liste_quarantaine
AS
SELECT quarantaine.id_personne, personne.nom,
-- Fonction qui retourne le nombre absolu de jours entre deux dates pour Oracle SQL
DIFFDAYS(quarantaine.date_debut, 'DD-MM-YYYY', quarantaine.date_fin, 'DD-MM-YYYY') AS date_difference,
-- Le nombre de jours inclusivement --> plus commun d'utiliser ça (j'ai mis les deux je poserai la question prochain cours)
DIFFDAYS(quarantaine.date_debut, 'DD-MM-YYYY', quarantaine.date_fin, 'DD-MM-YYYY') + 1 AS jours_inclusif 
FROM quarantaine
INNER JOIN personne ON quarantaine.id_personne = personne.id_personne
WHERE
quarantaine.date_debut > '01-05-2021' AND quanrantaine.date_fin < '30-06-2021'
GROUP BY personne.nom
ORDER BY jours_inclusif;
------------------------------------------------------------------------------------------------------------------------
-- Id #6 --> Priorité : Obligatoire
-- Créer une vue (liste_admissible_vaccin) permettant de fournir la liste des employés qui sont admissibles pour faire le vaccin moderna.
------------------------------------------------------------------------------------------------------------------------
CREATE VIEW liste_admissible_vaccin
AS
SELECT employe.id_personne, personne.nom FROM employe
LEFT JOIN vaccination ON
    employe.id_personne = vaccination.id_personne
INNER JOIN personne ON
    employe.id_personne = personne.id_personne
WHERE NOT EXISTS (
    SELECT null
    FROM vaccination
    WHERE employe.id_personne = vaccination.id_personne
)
OR (vaccination.nom_vaccin = 'Moderna')
AND NOT EXISTS (
    SELECT null
    FROM liste_vaccine
    WHERE employe.id_personne = liste_vaccine.id_personne
)
ORDER BY employe.id_personne;

------------------------------------------------------------------------------------------------------------------------
-- Id #7 --> Priorité : Obligatoire
-- Créer une vue (liste_disponiblites) permettant de fournir la liste des employés d’un département dans une journée précise qui seront disponibles pour remplacer un employé du même département atteint par le virus.
------------------------------------------------------------------------------------------------------------------------
CREATE VIEW liste_disponibilites
AS
SELECT
    P.id_personne,
    P.Nom,
    E.Nom_departement
FROM employe E
JOIN Personne P ON E.ID_personne = P.ID_personne
JOIN Departement D ON E.Nom_departement = D.Nom_Departement
WHERE NOT EXISTS (
    SELECT NULL
    FROM Entree_sortie
    WHERE E.ID_personne = Entree_sortie.id_personne
)
AND NOT EXISTS(
    SELECT NULL
    FROM Alerte
    WHERE E.ID_personne = Alerte.id_personne
)
ORDER BY D.Nom_Departement;
------------------------------------------------------------------------------------------------------------------------
-- Id #9 --> Priorité : Très important
-- Créer une vue (liste_arisque) permettant de fournir la liste des visiteurs qui ont contacté un employé atteint du Covid-19 durant la visite (l’employé a déclaré les symptômes au maximum 24 heures plus tard).
------------------------------------------------------------------------------------------------------------------------
--// TODO
CREATE VIEW liste_arisque 
AS 
SELECT rencontre.id_visiteur
FROM rencontre
WHERE 

; 
------------------------------------------------------------------------------------------------------------------------
-- Id #11 --> Priorité : Important
-- Créer une vue (liste_paresseux) permettant de fournir la liste des employés qui travaillent dans un département à risque -- de plus que 80% et qui n’ont pas reçu le vaccin, regroupé par département.
-- //FIXME : Pas certain du order by à cause 
------------------------------------------------------------------------------------------------------------------------
CREATE VIEW liste_paresseux 
AS 
SELECT
    P.Nom,
    E.Poste,
    E.Nom_departement,
    D.pourcentage_risque
FROM employe E
JOIN Personne P ON E.ID_personne = P.ID_personne
JOIN Departement D ON E.Nom_departement = D.Nom_Departement
WHERE NOT EXISTS (
    SELECT NULL
    FROM vaccination
    where E.ID_personne = vaccination.id_personne
)
AND D.pourcentage_risque > 80 
ORDER BY D.Nom_Departement;
------------------------------------------------------------------------------------------------------------------------
-- Id #18 --> Priorité : Important
-- En tant que directeur du projet, je veux que vous développiez 4 une nouvelle vue basée sur une requête complexe impliquant au minimum 4 tables. Cette vue doit répondre à un besoin pertinent qui n’est pas déjà été défini dans le cahier des charges.
------------------------------------------------------------------------------------------------------------------------
-- code ici
------------------------------------------------------------------------------------------------------------------------
--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx--
------------------------------------------------------------------------------------------------------------------------
-- Fin de la création des vues --
------------------------------------------------------------------------------------------------------------------------
