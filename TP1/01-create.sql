--  Nom : Carl Montpetit 
--  Code permanent : MONC08069000 
--
--  Nom : Matthew Jovani
--  Code permanent : JOVM19108705
--
--  Nom : Mathieu Dumont
--  Code permanent : DUMM21059400 

--Création des tables
create table Personne (
    Nas                         number(9) not null,    
    Prenom                      varchar(15) not null,  
    Nom                         varchar(15) not null,     
    primary key (Nas),
);

create table Adresse (
    Numero                      number(5) not null,  
    Rue                         varchar2(50) not null,  
    Code_postal                 char(6) not null,    
    Ville                       varchar2(50) not null,   
    Province                    char(2) not null,
    Pays                        varchar2(50) not null,
    foreign key (Nas) references Personne,   
);

create table Visiteur (
    Id_visiteur                 integer() not null,  
    Nom_entreprise              varchar2(50) not null,
    primary key (Id_visiteur),
    foreign key (Nas) references Personne,
);

create table Employe (
    Id_employe                  integer() not null,  
    Date_de_naissance           date not null,     
    Poste                       varchar(15) not null,  
    Departement                 varchar(15) not null,  
    primary key (Id_employe),
    foreign key (Nas) references Personne,
);

create table Salaire (
    Salaire                     decimal(7,2) not null,  
    Pourcentage_augmentation     integer check (Pourcentage_augmentation between 1 and 100),
    Raison_augmentation         varchar(20),   
    primary key (Salaire),
    foreign key (Id_employe) references Employe,
);

create table Departement (
    Id_departement              integer() not null,  
    Nom_departement             varchar(20) not null,  
    Pourcentage_attraper_covid  integer(4) check (Pourcentage_augmentation between 1 and 100),
    primary key (Id_departement),
    foreign key (Id_employe) references Employe,
    foreign key (Id_visiteur) references Visiteur,

);

create table check_in_out (
    Date_et_heure_Entree        timestamp,  
    Date_et_heure_sortie        timestamp,  
    Temperature                 decimal(3,1),
    Symptomes                   varchar(100),  
    Risque_voisinage            char(3),   --peut etre boolean (binaire)
    foreign key (Nas) references Personne,
); 

create table Vaccin (
    Nom_vaccin                  varchar(20) not null,  
    Age_minimum                 integer(),
    Date_autorisation           date,  
    Effets_secondaires_possibles    varchar(100),
    primary key (Nom_vaccin),
    foreign key (Nas) references Personne,
);

create table Personne_a_risque (
    Nas                         number(9),    
    Prenom                      varchar(15),  
    Nom                         varchar(15),  
    Contact_moins_2_metres      char(3),  --peut etre boolean (binaire)
    Date_actuelle               date,  
    primary key (Nas),
);

create table Alerte (
    Nas                         char(9),    
    Prenom                      varchar(15),  
    Nom                         varchar(15),  
    Temperature                 decimal(3),
    Date_actuelle               date,  
    primary key (Nas),   
);
