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
-- CE FICHIER INCLUT LES VUS --
------------------------------------------------------------------------------------------------------------------------
-- Id #4 --> Priorité : Obligatoire
-- Créer une vue (liste_vaccine) permettant de fournir la liste des employés vaccinés (seuls ceux qui ont pris les 2 doses doivent être considérés) avec le type de vaccin (pfizer, moderna, ...), regroupé par vaccin et trié par date.
------------------------------------------------------------------------------------------------------------------------
create view liste_vaccine
as
select vaccination.id_personne, personne.nom, vaccination.nom_vaccin, vaccination.date_vaccination from vaccination
inner join personne on
    personne.id_personne = vaccination.id_personne
where (vaccination.id_personne) in 
    (select vaccination.id_personne from vaccination
    group by vaccination.id_personne
    having count(id_personne) = 2
    )
order by vaccination.date_vaccination;
/
------------------------------------------------------------------------------------------------------------------------
-- Id #5 --> Priorité : Obligatoire
-- Créer une vue (liste_quarantaine) permettant de fournir la liste de tous les employés en quarantaine avec le nombre de jours restant de leur quarantaine entre le 1er mai et le 30 juin 2021.
------------------------------------------------------------------------------------------------------------------------
-- code ici

------------------------------------------------------------------------------------------------------------------------
-- Id #6 --> Priorité : Obligatoire
-- Créer une vue (liste_admissible_vaccin) permettant de fournir la liste des employés qui sont admissibles pour faire le vaccin moderna.
------------------------------------------------------------------------------------------------------------------------
-- code ici

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
-- code ici

------------------------------------------------------------------------------------------------------------------------
-- Id #11 --> Priorité : Important
-- Créer une vue (liste_paresseux) permettant de fournir la liste des employés qui travaillent dans un département à risque de plus que 80% et qui n’ont pas reçu le vaccin, regroupé par département.
-- **********************************
-- Pas certain du order by à cause 
-- **********************************
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
