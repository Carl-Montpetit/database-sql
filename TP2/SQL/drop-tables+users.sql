------------------------------------------------------------------------------------------------------------------------
-- Script de destruction/effacement --
------------------------------------------------------------------------------------------------------------------------
--//FIXME À valider si on doit vraiment faire ce script en plus pour effacer les utilisateurs et les tables
------------------------------------------------------------------------------------------------------------------------
-- On détruit les tables --
------------------------------------------------------------------------------------------------------------------------
drop table Vaccination;
drop table Vaccin;
drop table Risque;
drop table Rencontre;
drop table Quarantaine;
drop table Entree_Sortie;
drop table Alerte;
drop table Visiteur;
drop table Employe;
drop table Departement;
drop table Personne;
------------------------------------------------------------------------------------------------------------------------
-- On détruit les utilisateurs avec leur accès associés --
------------------------------------------------------------------------------------------------------------------------
drop user directeur cascade;
drop user employe cascade;
drop user visiteur cascade;
drop user administrateur cascade;
------------------------------------------------------------------------------------------------------------------------
--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx--
------------------------------------------------------------------------------------------------------------------------
-- Fin de la destruction des tables et des utilisateurs --
------------------------------------------------------------------------------------------------------------------------