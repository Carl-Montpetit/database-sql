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
CREATE OR REPLACE VIEW liste_vaccine
AS
SELECT v.id_personne, p.nom, v.nom_vaccin, v.date_vaccination 
FROM vaccination v
INNER JOIN personne p 
ON (p.id_personne = v.id_personne)
WHERE (v.id_personne) IN 
    (SELECT v.id_personne FROM vaccination v
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
-- Créer une vue (liste_quarantaine) permettant de fournir la liste de tous les employés en quarantaine avec le nombre de jours restant de leur quarantaine selon le 1er juillet 2021.
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW liste_quarantaine
AS
SELECT q.id_personne, p.nom, (TO_DATE('01-07-2021', 'DD-MM-YYYY') - (TO_DATE(q.date_debut, 'DD-MM-YYYY')) + 40) 
AS jours_restants -- La distance entre le 1er juillet et la date de début + 40 jours doit être dans nbrjours∈(0,40]
FROM quarantaine q
INNER JOIN personne p -- L'⋂ des 2 tables
ON (q.id_personne = p.id_personne)
WHERE 
(TO_DATE('01-07-2021', 'DD-MM-YYYY') - (TO_DATE(q.date_debut, 'DD-MM-YYYY')) + 40) > 0 -- borne exclusive
AND 
(TO_DATE('01-07-2021', 'DD-MM-YYYY') - (TO_DATE(q.date_debut, 'DD-MM-YYYY')) + 40) <= 40 -- borne inclusive 
ORDER BY jours_restants;
------------------------------------------------------------------------------------------------------------------------
-- Id #6 --> Priorité : Obligatoire
-- Créer une vue (liste_admissible_vaccin) permettant de fournir la liste des employés qui sont admissibles pour faire le vaccin moderna.
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW liste_admissible_vaccin
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
-- //FIXME
CREATE OR REPLACE VIEW liste_disponibilites
AS
SELECT p.id_personne, p.nom, e.nom_departement
FROM employe e
INNER JOIN personne p 
ON (e.id_personne = p.id_personne)
INNER JOIN departement d 
ON (e.nom_departement = d.nom_departement)
WHERE NOT EXISTS (
    SELECT NULL
    FROM entree_sortie es
    WHERE (e.id_personne = es.id_personne)
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
CREATE OR REPLACE VIEW liste_arisque 
AS 
SELECT r.id_visiteur
FROM rencontre r
INNER JOIN visiteur v
ON (r.id_visiteur = v.id_personne) 
INNER JOIN alerte a 
ON (v.id_personne = a.id_personne) -- L'⋂ des trois tables
WHERE (TO_DATE(r.date_rencontre, 'DD-MM-YYYY HH24:MI:SS') - TO_DATE(a.date_actuelle, 'DD-MM-YYYY') <= 1) 
-- ∆ entre les 2 dates en jours <= 1 jour
ORDER BY r.id_visiteur; 
------------------------------------------------------------------------------------------------------------------------
-- Id #11 --> Priorité : Important
-- Créer une vue (liste_paresseux) permettant de fournir la liste des employés qui travaillent dans un département à risque -- de plus que 80% et qui n’ont pas reçu le vaccin, regroupé par département.
--// FIXME : Pas certain du order by à cause 
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW liste_paresseux 
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
-- En tant que directeur du projet, je veux que vous développiez une nouvelle vue basée sur une requête complexe impliquant au minimum 4 tables. Cette vue doit répondre à un besoin pertinent qui n’est pas déjà été défini dans le cahier des charges.
------------------------------------------------------------------------------------------------------------------------
-- Description : Affiche la liste des entreprises externes possédant des employés à risque de contaminer leur établissement après leur visite dans la compagnie G2BUqamInc entre le 1er mai et le 30 juin 2021. D'ailleurs, affiche la date de l'alerte pour chacun de leur employé en plus d'afficher les symptômes et la température des personnes contaminée. De plus, le numéro d'assurance sociale (id_personne), ville, numéro d'adresse et code postal des employés des entreprises externe contaminés pour les services médicaux. Finalement, l'affichage est groupé par nom d'entreprise externe et trié par date des alertes des plus récentes au plus anciennes. (5 tables impliqués)
CREATE OR REPLACE VIEW entreprise_a_risque
AS
SELECT v.nom_entreprise, a.date_actuelle, p.id_personne, v.id_personne, a.id_personne, p.nom, p.adresse_numero, p.ville, es.date_heure_entree, es.date_heure_sortie, es.symptomes, es.temperature
FROM personne p
INNER JOIN visiteur v
ON(p.id_personne = v.id_personne)
INNER JOIN alerte a
ON(p.id_personne = a.id_personne)
INNER JOIN entree_sortie es
ON(p.id_personne = es.id_personne)
INNER JOIN employe e
ON(p.id_personne = e.id_personne)
WHERE (es.date_heure_entree) BETWEEN TO_DATE('01-05-2021 00:00:00', 'DD-MM-YYYY HH24:MI:SS') 
AND TO_DATE ('30-06-2021 23:59:59' , 'DD-MM-YYYY HH24:MI:SS')
AND
(es.date_heure_sortie) BETWEEN TO_DATE('01-05-2021 00:00:00', 'DD-MM-YYYY HH24:MI:SS') 
AND TO_DATE ('30-06-2021 23:59:59' , 'DD-MM-YYYY HH24:MI:SS')
AND EXISTS (
    SELECT null
    FROM visiteur v
    WHERE (p.id_personne = v.id_personne)
)
ORDER BY a.date_actuelle ASC;
------------------------------------------------------------------------------------------------------------------------
--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx--
------------------------------------------------------------------------------------------------------------------------
-- Fin de la création des vues --
------------------------------------------------------------------------------------------------------------------------
