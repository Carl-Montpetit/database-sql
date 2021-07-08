--  Nom : Carl Montpetit 
--  Code permanent : MONC08069000 
--
--  Nom : Matthew Jovani
--  Code permanent : JOVM19108705
--
--  Nom : Mathieu Dumont
--  Code permanent : DUMM21059400 
------------------------------------------------------------------------------------------------------------------------
-- CE FICHIER INCLUT LA CRÉATION DES TABLES --
------------------------------------------------------------------------------------------------------------------------
-- On détruit les tables préalablement --
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
-- Création des tables --
------------------------------------------------------------------------------------------------------------------------
create  table  Personne (
    id_personne         integer NOT NULL ,
    nom                 varchar(45) NOT NULL ,
    adresse_numero      varchar(45) NULL ,
    rue                 varchar(45) NOT NULL ,
    ville               varchar(45) NOT NULL ,
    code_postal         varchar(45) NOT NULL ,

    primary key (id_personne)
)
/

create table Departement (
    nom_departement     varchar(45) NOT NULL ,
    pourcentage_risque  numeric(5, 2) NOT NULL ,

    primary key (nom_departement)
)
/

create table Employe (
    id_personne          integer NOT NULL ,
    date_naissance      date NOT NULL ,
    poste               varchar(45) NOT NULL ,
    salaire             numeric(7, 2) NOT NULL ,
    nom_departement     varchar(45) NOT NULL ,

    primary key (id_personne),
    foreign key (id_personne) references Personne(id_personne),
    foreign key (nom_departement) references Departement (nom_departement)
)
/

create table Visiteur (
    id_personne         integer NOT NULL ,
    nom_entreprise      varchar(45) NOT NULL ,

    primary key (id_personne),
    foreign key (id_personne) references Personne (id_personne)
)
/

create table Alerte (
    date_actuelle       date NOT NULL ,
    id_personne         integer NOT NULL ,

    primary key (date_actuelle, id_personne),
    foreign key (id_personne) references Personne (id_personne)
)
/

create table Entree_Sortie (
    date_heure_entree   timestamp NOT NULL ,
    id_personne         integer NOT NULL ,
    date_heure_sortie   timestamp NULL ,
    temperature         numeric(5, 2) NOT NULL ,
    symptomes           varchar(45) null,
    risque_voisinage    varchar(45) NOT NULL ,

    primary key (date_heure_entree, id_personne),
    foreign key (id_personne) references Personne (id_personne)
)
/

create table Quarantaine (
    id_quarantaine      integer NOT NULL ,
    date_debut          date NOT NULL ,
    date_fin            date NOT NULL ,
    id_personne         integer NOT NULL ,

    primary key (id_quarantaine),
    foreign key (id_personne) references Employe (id_personne)
)
/

create table Rencontre (
    id_visiteur         integer NOT NULL ,
    id_employe          integer NOT NULL ,
    date_rencontre      timestamp NOT NULL ,

    primary key (id_visiteur, id_employe, date_rencontre),
    foreign key (id_visiteur) references Visiteur (id_personne),
    foreign key (id_employe) references Employe (id_personne)
)
/

create table Risque (
    date_actuelle       date NOT NULL ,
    id_personne         integer NOT NULL ,

    primary key (date_actuelle, id_personne),
    foreign key (id_personne) references Personne (id_personne)
)
/

create table Vaccin (
    nom_vaccin          varchar(45) NOT NULL ,
    age_min             integer NOT NULL ,
    date_autorisation   date NOT NULL ,
    effets_secondaires  varchar(500) NOT NULL ,

    primary key (nom_vaccin)
)
/

create table Vaccination (
    id_personne         integer NOT NULL ,
    nom_vaccin          varchar(45) NOT NULL ,
    date_vaccination    date NOT NULL ,

    primary key (id_personne, nom_vaccin, date_vaccination),
    foreign key (id_personne) references Personne (id_personne),
    foreign key (nom_vaccin) references Vaccin (nom_vaccin)
)
/
------------------------------------------------------------------------------------------------------------------------
-- Fin de la création --
------------------------------------------------------------------------------------------------------------------------