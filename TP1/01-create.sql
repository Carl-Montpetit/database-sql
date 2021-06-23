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
    Nas                         number(9) not null,  
    Nom_vaccin                  varchar(20) not null,  
    Prenom                      varchar(15) not null,  
    Nom                         varchar(15) not null, 
    Date_vaccination            date,    
    primary key (Nas),
    foreign key (Nom_vaccin) references Vaccin)
/

create table Adresse (
    Nas                         number(9) not null,
    Numero                      number(5) not null,  
    Rue                         varchar2(50) not null,  
    Code_postal                 char(6) not null,    
    Ville                       varchar2(50) not null,   
    Province                    char(2) not null,
    Pays                        varchar2(50) not null,
    primary key (Nas),
    foreign key (Nas) references Personne)   
/

create table Departement (
    Id_departement              number not null,  
    Nom_departement             varchar(20) not null,  
    Pourcentage_attraper_covid  number(4),
    primary key (Id_departement))
/

create table Visiteur (
    Id_visiteur                 number,
    Nas                         number(9) not null, 
    Id_departement              number not null,   
    Nom_entreprise              varchar2(50) not null,
    primary key (Id_visiteur),
    foreign key (Nas) references Personne,
    foreign key (Id_departement) references Departement)
/

create table Employe (
    Id_employe                  number, 
    Nas                         number(9) not null, 
    Id_departement              number not null,  
    Date_de_naissance           date not null,     
    Poste                       varchar(15) not null,  
    Departement                 varchar(15) not null,  
    primary key (Id_employe),
    foreign key (Nas) references Personne,
    foreign key (Id_departement) references Departement)
/

create table Salaire (
    Salaire                     number(7,2) not null,
    Id_employe                  number,  
    Pourcentage_augmentation    number check (Pourcentage_augmentation between 1 and 100),
    Raison_augmentation         varchar(20),   
    primary key (Salaire, Id_employe),
    foreign key (Id_employe) references Employe)
/

create table check_in_out (
    Nas                         number(9) not null, 
    Date_et_heure_Entree        timestamp,  
    Date_et_heure_sortie        timestamp,  
    Temperature                 number(3,1),
    Symptomes                   varchar(100),  
    Risque_voisinage            char(3),   --peut etre boolean (binaire)
    primary key (Nas),
    foreign key (Nas) references Personne)
/ 

create table Personne_a_risque (
    Id_personne_a_risque        number,  
    Nas                         number(9) not null,  
    Prenom                      varchar(15),  
    Nom                         varchar(15),  
    Contact_moins_2_metres      char(3),  --peut etre boolean (binaire)
    Date_actuelle               date,  
    primary key (Id_personne_a_risque),
    foreign key (Nas) references Personne)
/

create table Alerte (
    Id_alerte                   number, 
    Id_personne_a_risque        number,
    Nas                         number(9) not null,   
    Prenom                      varchar(15),  
    Nom                         varchar(15),  
    Temperature                 number(3),
    Date_actuelle               date,  
    primary key (Id_alerte),
    foreign key (Id_personne_a_risque) references Personne_a_risque,
    foreign key (Nas) references Personne)   
/