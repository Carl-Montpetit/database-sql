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
    Nas                         number(9),    
    Prenom                      varchar(15) not null,  
    Nom                         varchar(15) not null,     
    primary key (Nas),
);

create table Adresse (
    Numero                      number(5),  
    Rue                         varchar2(50),  
    Code_postal                 char(6),    
    Ville                       varchar2(50),   
    Province                    char(2),
    Pays                        varchar2(50),
    foreign key (Nas) references Personne,   
);

create table Visiteur (
    Id_visiteur                 integer(5),  
    Nom_entreprise              varchar2(50),
    primary key (Id_visiteur),
    foreign key (Nas) references Personne,
);

create table Employe (
    Id_employe                  integer(5),  
    Date_de_naissance           date,     
    Poste                       char(...),  
    Departement                 char(...),  
    primary key (Id_employe),
);

create table Salaire (
    Salaire                     decimal(7,2),  
    Pourcentage_augmentation     integer check (Pourcentage_augmentation between 1 and 100 and unique),
    Raison_augmentation         varchar(20),   
    primary key (Salaire),
);

create table Departement (
    Id_departement              char(...),  
    Nom_departement             char(...),  
    Pourcentage_attraper_covid  char(4),    --100% = 4 = max
    primary key (Id_departement),
);

create table check_in_out (
    Date_et_heure_Entree        timestamp,  
    Date_et_heure_sortie        timestamp,  
    Temperature                 char(4),    --max nombre 3 chiffres + symbole de degrée
    Symptomes                   char(...),  
    Risque_voisinage            char(...),  
); 

create table Vaccin (
    Nom_vaccin                  char(...),  
    Age_minimum                 char(3),    --max 3 chiffres
    Date_autorisation           char(...),  
    Effets_secondaires_possibles    char(...),
    primary key (Nom_vaccin),
);

create table Personne_a_risque (
    Nas                         char(9),    
    Prenom                      char(...),  
    Nom                         char(...),  
    Contact_moins_2_metres      char(...),  
    Date_actuelle               char(...),  
    primary key (Nas),
);

create table Alerte (
    Nas                         char(9),    
    Prenom                      char(...),  
    Nom                         char(...),  
    Temperature                 char(4),    --max 3 chiffres + symbole degrée
    Date_actuelle               char(...),  
    primary key (Nas),   
);