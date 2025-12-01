-- Migration 0019 : Suppression doublons items 12-14 (anciens de migration 0010/0013)
-- Date : 2025-12-01
-- Objectif : Supprimer les 3 anciens items 12-14 qui font doublon avec nouveaux items migration 0017
-- Raison : Items 12-14 existent en double (catégorie AUDIT_TOITURE ancien vs DEPOSE_PANNEAUX/CONFORMITE_DTU nouveau)

-- ============================================================================
-- SUPPRIMER LES 3 ANCIENS ITEMS 12-14 (catégorie AUDIT_TOITURE)
-- ============================================================================

-- Item 12 ancien : "Présence de film anticondensation ?"
DELETE FROM checklist_toiture_template 
WHERE item_numero = 12 
  AND categorie = 'AUDIT_TOITURE'
  AND libelle LIKE '%film anticondensation%';

-- Item 13 ancien : "Présence de limaille sous les modules..."
DELETE FROM checklist_toiture_template 
WHERE item_numero = 13 
  AND categorie = 'AUDIT_TOITURE'
  AND libelle LIKE '%limaille%';

-- Item 14 ancien : "Mesurer la distance Modules > Rives / Modules > Faitage"
DELETE FROM checklist_toiture_template 
WHERE item_numero = 14 
  AND categorie = 'AUDIT_TOITURE'
  AND libelle LIKE '%distance Modules%';


-- ============================================================================
-- VÉRIFICATION POST-MIGRATION
-- ============================================================================
-- SELECT COUNT(*) FROM checklist_toiture_template;
-- → Attendu : 31 items (11 base + 20 nouveaux terrain)

-- SELECT item_numero, COUNT(*) FROM checklist_toiture_template GROUP BY item_numero HAVING COUNT(*) > 1;
-- → Attendu : aucun doublon

-- STRUCTURE FINALE CORRECTE (31 items uniques) :
-- Items 1-11   : Base existante (AUDIT_TOITURE)
-- Items 12-20  : Dépose panneaux détaillée (9 items - DEPOSE_PANNEAUX)
-- Items 21-28  : DTU 40.35 contrôle visuel (8 items - CONFORMITE_DTU)
-- Items 29-31  : Bonnes/mauvaises pratiques terrain (3 items - PRATIQUES_TERRAIN)
