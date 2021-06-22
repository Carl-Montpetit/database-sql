--Création des tables
--TODO pas certain pour les ";" et les "," + va faloir mettre les relations entre les tables etc
create table Salaire (
    Salaire                     char(...),  --nbr de caractères
    Pourcentage_augmentation    char(4),    --100% = 4 = max
    Raison_augmentation         cjar(...),  --nbr de caractères
    primary key (Salaire);
)

create table Employe (
    Id_employe                  char(...),  --nbr de caractères
    Date_de_naissance           char(...),  --nbr de caractères
    Poste                       char(...),  --nbr de caractères
    Departement                 char(...),  --nbr de caractères
    primary key (Id_employe);
)

create Departement (
    Id_departement              char(...),  --nbr de caractères
    Nom_departement             char(...),  --nbr de caractères
    Pourcentage_attraper_covid  char(4),    --100% = 4 = max
    primary key (Id_departement);
)

create check_in_out (
    Date_et_heure_Entree        char(...),  --nbr de caractères
    Date_et_heure_sortie        char(...),  --nbr de caractères
    Temperature                 char(4),    --max nombre 3 chiffres + symbole de degrée
    Symptomes                   char(...),  --nbr de caractères
    Risque_voisinage            char(...);  --nbr de caractères
) 

create Visiteur (
    Id_visiteur                 char(...);  --nbr de caractères
    -- TODO Nom_entreprise ?             char(...),
)

create Personne (
    Nas                         char(9),    --nbr de caractères
    Prenom                      char(...),  --nbr de caractères
    Nom                         char(...),  --nbr de caractères   
    primary key (Nas);
)

create Vaccin (
    Nom_vaccin                  char(...),  --nbr de caractères
    Age_minimum                 char(3),    --max 3 chiffres
    Date_autorisation           char(...),  --nbr de caractères
    Effets_secondaires_possibles    char(...),
    primary key (Nom_vaccin);
)

--TODO On fait quoi avec Date_vaccination ??

create Personne_a_risque (
    Nas                         char(9),    --nbr de caractères
    Prenom                      char(...),  --nbr de caractères
    Nom                         char(...),  --nbr de caractères
    Contact_moins_2_metres      char(...),  --nbr de caractères
    Date_actuelle               char(...),  --nbr de caractères
    primary key (Nas);
)

create Alerte (
    Nas                         char(9),    --nbr de caractères
    Prenom                      char(...),  --nbr de caractères
    Nom                         char(...),  --nbr de caractères
    Temperature                 char(4),    --max 3 chiffres + symbole degrée
    Date_actuelle               char(...),  --nbr de caractères
    primary key (Nas);   
)

create Adresse (
    Numero                      char(...),  --nbr de caractères
    Rue                         char(...),  --nbr de caractères
    Code_postal                 char(7),    --6 caracteres incluant un espace
    Ville                       char(...),   --nbr de caractères
    Province                    char(2),     --deux lettres majuscules
    Pays                        char(...);   --nbr de caractères
)