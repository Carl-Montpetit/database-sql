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
SELECT v.id_personne, p.nom, v.nom_vaccin, v.date_vaccination 
FROM vaccination v
INNER JOIN personne p 
ON (p.id_personne = v.id_personne)
WHERE (v.id_personne) IN 
    (SELECT v.id_personne FROM vaccination
    GROUP BY v.id_personne
    HAVING count(id_personne) = 2
    )
AND EXISTS (
    SELECT null
    FROM employe e
    WHERE (e.id_personne = v.id_personne)
)
ORDER BY v.date_vaccination;
------------------------------------------------------------------------------------------------------------------------
-- Id #5 --> Priorité : Obligatoire
-- Créer une vue (liste_quarantaine) permettant de fournir la liste de tous les employés en quarantaine avec le nombre de jours restant de leur quarantaine entre le 1er mai et le 30 juin 2021.
------------------------------------------------------------------------------------------------------------------------
CREATE VIEW liste_quarantaine
AS
SELECT q.id_personne, p.nom,
-- Fonction qui retourne le nombre absolu de jours entre deux dates pour Oracle SQL
DiffDays(q.date_debut, 'DD-MM-YYYY', q.date_fin, 'DD-MM-YYYY') 
AS date_difference,
--  //TODO : Le nombre de jours inclusivement --> plus commun d'utiliser ça (j'ai mis les deux je poserai la question prochain cours)
DiffDays(q.date_debut, 'DD-MM-YYYY', q.date_fin, 'DD-MM-YYYY') + 1 
AS jours_inclusif 
FROM quarantaine q
INNER JOIN personne p 
ON (q.id_personne = p.id_personne)
WHERE (q.date_debut > '01-05-2021' AND q.date_fin < '30-06-2021')
ORDER BY jours_inclusif;
------------------------------------------------------------------------------------------------------------------------
-- Id #6 --> Priorité : Obligatoire
-- Créer une vue (liste_admissible_vaccin) permettant de fournir la liste des employés qui sont admissibles pour faire le vaccin moderna.
------------------------------------------------------------------------------------------------------------------------
CREATE VIEW liste_admissible_vaccin
AS
SELECT e.id_personne, p.nom 
FROM employe e
LEFT OUTER JOIN vaccination v 
ON (e.id_personne = v.id_personne)
INNER JOIN personne p 
ON (e.id_personne = p.id_personne)
WHERE NOT EXISTS (
    SELECT null
    FROM vaccination v
    WHERE (e.id_personne = v.id_personne)
)
OR (v.nom_vaccin = 'Moderna')
AND NOT EXISTS (
    SELECT null
    FROM liste_vaccine lv
    WHERE (e.id_personne = lv.id_personne)
)
ORDER BY e.id_personne;

------------------------------------------------------------------------------------------------------------------------
-- Id #7 --> Priorité : Obligatoire
-- Créer une vue (liste_disponiblites) permettant de fournir la liste des employés d’un département dans une journée précise qui seront disponibles pour remplacer un employé du même département atteint par le virus.
------------------------------------------------------------------------------------------------------------------------
CREATE VIEW liste_disponibilites
AS
SELECT p.id_personne, p.nom, e.nom_departement
FROM employe e
INNER JOIN personne p 
ON (e.id_personne = p.id_personne)
INNER JOIN departement d 
ON (e.nom_departement = d.nom_departement)
WHERE NOT EXISTS (
    SELECT NULL
    FROM entree_sortie
    WHERE (e.id_personne = entree_sortie.id_personne)
)
AND NOT EXISTS(
    SELECT NULL
    FROM alerte a
    WHERE (e.id_personne = a.id_personne)
)
ORDER BY d.nom_departement;
------------------------------------------------------------------------------------------------------------------------
-- Id #9 --> Priorité : Très important
-- Créer une vue (liste_arisque) permettant de fournir la liste des visiteurs qui ont contacté un employé atteint du Covid-19 durant la visite (l’employé a déclaré les symptômes au maximum 24 heures plus tard).
------------------------------------------------------------------------------------------------------------------------
CREATE VIEW liste_arisque 
AS 
SELECT r.id_visiteur
FROM rencontre r
INNER JOIN visiteur v
ON (r.id_visiteur = v.id_personne) 
INNER JOIN alerte a 
ON (v.id_personne = a.id_personne)
WHERE DiffDays(r.date_rencontre, 'DD-MM-YYYY', a.date_actuelle, 'DD-MM-YYYY') <= 1; 
------------------------------------------------------------------------------------------------------------------------
-- Id #11 --> Priorité : Important
-- Créer une vue (liste_paresseux) permettant de fournir la liste des employés qui travaillent dans un département à risque -- de plus que 80% et qui n’ont pas reçu le vaccin, regroupé par département.
-- //FIXME : Pas certain du order by à cause 
------------------------------------------------------------------------------------------------------------------------
CREATE VIEW liste_paresseux 
AS 
SELECT p.nom, e.poste, e.nom_departement, d.pourcentage_risque
FROM employe e
INNER JOIN personne p 
ON (e.id_personne = p.id_personne)
INNER JOIN departement d 
ON (e.nom_departement = d.nom_departement)
WHERE NOT EXISTS (
    SELECT NULL
    FROM vaccination v
    WHERE (e.id_personne = v.id_personne)
)
AND (d.pourcentage_risque > 80) 
ORDER BY d.nom_departement;
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
