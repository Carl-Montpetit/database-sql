--  Nom : Carl Montpetit 
--  Code permanent : MONC08069000 
--
--  Nom : Matthew Jovani
--  Code permanent : JOVM19108705
--
--  Nom : Mathieu Dumont
--  Code permanent : DUMM21059400 

DROP TABLE Alerte;
DROP TABLE Personne_a_risque;
DROP TABLE check_in_out;
DROP TABLE Salaire;
DROP TABLE Employe;
DROP TABLE Visiteur;
DROP TABLE Departement;
DROP TABLE Adresse;
DROP TABLE Personne;
DROP TABLE Vaccin;

create table Vaccin (
    Nom_vaccin                  varchar(20) not null, 
    Age_minimum                 number,
    Date_autorisation           date,  
    Effets_secondaires_possibles    varchar(100),
    primary key (Nom_vaccin))
/

create table Personne (
    Nas                         number(9) not null unique,  
    Nom_vaccin                  varchar(20),  
    Prenom                      varchar(15) not null,  
    Nom                         varchar(15) not null, 
    Date_vaccination            date,    
    primary key (Nas),
    foreign key (Nom_vaccin) references Vaccin)
/

create table Adresse (
    Nas                         number(9) not null,
    Numero                      number(5),  
    Rue                         varchar(50),  
    Code_postal                 char(6),    
    Ville                       varchar(50),   
    Province                    char(2),
    Pays                        varchar(50),
    primary key (Nas),
    foreign key (Nas) references Personne)   
/

create table Departement (
    Id_departement              number not null,  
    Nom_departement             varchar(20),  
    Pourcentage_attraper_covid  number(4),
    primary key (Id_departement))
/

create table Visiteur (
    Id_visiteur                 number not null,
    Nas                         number(9) not null, 
    Id_departement              number not null,   
    Nom_entreprise              varchar(50),
    primary key (Id_visiteur),
    foreign key (Nas) references Personne,
    foreign key (Id_departement) references Departement)
/

create table Employe (
    Id_employe                  number not null, 
    Nas                         number(9) not null, 
    Id_departement              number not null,  
    Date_de_naissance           date not null,     
    Poste                       varchar(15) not null,    
    primary key (Id_employe),
    foreign key (Nas) references Personne,
    foreign key (Id_departement) references Departement)
/

create table Salaire (
    Salaire                     number(7,2) not null,
    Id_employe                  number not null,  
    Pourcentage_augmentation    number,
    Raison_augmentation         varchar(20),   
    primary key (Salaire, Id_employe),
    foreign key (Id_employe) references Employe)
/

create table check_in_out (
    Nas                         number(9) not null, 
    Date_et_heure_Entree        timestamp not null,  
    Date_et_heure_sortie        timestamp not null,  
    Temperature                 number(3,1),
    Symptomes                   varchar(100),  
    Risque_voisinage            char(3),   --peut etre boolean (binaire)
    primary key (Nas),
    foreign key (Nas) references Personne)
/ 

create table Personne_a_risque (
    Id_personne_a_risque        number not null,  
    Nas                         number(9) not null,  
    Prenom                      varchar(15),  
    Nom                         varchar(15),  
    Contact_moins_2_metres      char(3),  --peut etre boolean (binaire)
    Date_actuelle               date,  
    primary key (Id_personne_a_risque),
    foreign key (Nas) references Personne)
/

create table Alerte (
    Id_alerte                   number not null, 
    Id_personne_a_risque        number not null,
    Nas                         number(9) not null,   
    Prenom                      varchar(15),  
    Nom                         varchar(15),  
    Temperature                 number(3,1),
    Date_actuelle               date,  
    primary key (Id_alerte),
    foreign key (Id_personne_a_risque) references Personne_a_risque,
    foreign key (Nas) references Personne)   
/