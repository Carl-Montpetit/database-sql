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
select * from quarantaine;      -- pas de insert data ⟹ OKAY une fois intégré
select * from rencontre;        -- pas de insert data ⟹ OKAY une fois intégré
select * from risque;           -- pas de insert data ⟹ OKAY une fois intégré
select * from vaccin;           -- ✔
select * from vaccination;      -- ✔
------------------------------------------------------------------------------------------------------------------------
-- Tests views -- ⚠
------------------------------------------------------------------------------------------------------------------------
select * from liste_vaccine;            -- ✔
select * from liste_quarantaine;        -- ∅ de données ⟹ À testé une fois intégré ⚠︎
select * from liste_admissible_vaccin;  -- ✔
select * from liste_disponibilites;     -- ∅ de données ⟹ À testé une fois intégré ⚠︎
select * from liste_arisque;            -- ∅ de données ⟹ À testé une fois intégré ⚠︎
select * from liste_paresseux;          -- ✔
select * from entreprise_a_risque;      -- ∅ de données ⟹ À testé une fois intégré ⚠︎
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