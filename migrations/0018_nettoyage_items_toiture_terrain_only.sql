-- Migration 0018 : Nettoyage checklist toiture - Garder uniquement contrôles terrain
-- Date : 2025-12-01
-- Objectif : Supprimer items BE/documentation, garder seulement contrôles visuels terrain
-- Action : Supprimer items 29-41 (ETN, Notices, GIRASOLE docs) + renommer items 42-44 en 29-31
-- IMPORTANT : Ne modifie AUCUNE donnée de missions en cours (template uniquement)

-- ============================================================================
-- ÉTAPE 1 : SUPPRIMER ITEMS BE/DOCUMENTATION (29-41)
-- ============================================================================

-- Supprimer items 29-34 : Conformité ETN (Bureau d'Études)
DELETE FROM checklist_toiture_template 
WHERE item_numero BETWEEN 29 AND 34;

-- Supprimer items 35-37 : Conformité notices montage (Revue documentaire)
DELETE FROM checklist_toiture_template 
WHERE item_numero BETWEEN 35 AND 37;

-- Supprimer items 38-41 : Prescriptions GIRASOLE (Documents administratifs)
DELETE FROM checklist_toiture_template 
WHERE item_numero BETWEEN 38 AND 41;


-- ============================================================================
-- ÉTAPE 2 : RENOMMER ITEMS BONNES/MAUVAISES PRATIQUES (42-44 → 29-31)
-- ============================================================================

UPDATE checklist_toiture_template 
SET item_numero = 29, categorie = 'PRATIQUES_TERRAIN'
WHERE item_numero = 42;

UPDATE checklist_toiture_template 
SET item_numero = 30, categorie = 'PRATIQUES_TERRAIN'
WHERE item_numero = 43;

UPDATE checklist_toiture_template 
SET item_numero = 31, categorie = 'PRATIQUES_TERRAIN'
WHERE item_numero = 44;


-- ============================================================================
-- VÉRIFICATION POST-MIGRATION
-- ============================================================================
-- Pour vérifier que le nettoyage a été effectué :
-- SELECT COUNT(*) FROM checklist_toiture_template;
-- → Attendu : 31 items (11 base + 20 nouveaux terrain)

-- SELECT item_numero, libelle, categorie FROM checklist_toiture_template ORDER BY item_numero;

-- STRUCTURE FINALE (31 items) :
-- Items 1-11   : Base existante (AUDIT_TOITURE)
-- Items 12-20  : Dépose panneaux détaillée (9 items - DEPOSE_PANNEAUX)
-- Items 21-28  : DTU 40.35 contrôle visuel (8 items - CONFORMITE_DTU)
-- Items 29-31  : Bonnes/mauvaises pratiques terrain (3 items - PRATIQUES_TERRAIN)
