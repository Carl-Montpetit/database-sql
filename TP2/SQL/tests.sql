------------------------------------------------------------------------------------------------------------------------
-- Ce scripts inclus des tests pour vérifier le bon fonctionnement des fonctionnalités du TP --
------------------------------------------------------------------------------------------------------------------------
-- test insert & tables -- ✔
------------------------------------------------------------------------------------------------------------------------
select * from personne;         -- ✔
select * from departement;      -- ✔
select * from employe;          -- ✔
select * from visiteur;         -- ✔
select * from alerte;           -- ✔
select * from entree_sortie;    -- ✔
select * from quarantaine;      -- ✔
select * from rencontre;        -- ✔
select * from risque;           -- ✔
select * from vaccin;           -- ✔
select * from vaccination;      -- ✔
------------------------------------------------------------------------------------------------------------------------
-- Tests views -- ⚠
------------------------------------------------------------------------------------------------------------------------
select * from liste_vaccine;            -- ✔
select * from liste_quarantaine;        -- ✔
select * from liste_admissible_vaccin;  -- ✔
select * from liste_disponibilites;     -- ∅ À fixer
select * from liste_arisque;            -- ∅ devrait être bon, mais à valider
select * from liste_paresseux;          -- ✔ 
select * from entreprise_a_risque;      -- ✔
------------------------------------------------------------------------------------------------------------------------
-- Tests procedures --
------------------------------------------------------------------------------------------------------------------------
-- rien fonctionne pour l'instant ⟹ lamentable échec 😭💔
------------------------------------------------------------------------------------------------------------------------
-- Tests functions --
------------------------------------------------------------------------------------------------------------------------
-- rien fonctionne pour l'instant ⟹ lamentable échec 😭💔
------------------------------------------------------------------------------------------------------------------------
-- Tests triggers --
------------------------------------------------------------------------------------------------------------------------
-- rien fonctionne pour l'instant ⟹ lamentable échec 😭💔
------------------------------------------------------------------------------------------------------------------------
-- Tests indexs --
------------------------------------------------------------------------------------------------------------------------
-- rien de fait encore