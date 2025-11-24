-- ============================================================================
-- SCRIPT CRÉATION 52 ORDRES DE MISSION + CHECKLISTS
-- Date: 24 novembre 2025
-- ============================================================================

-- Désactiver les contraintes temporairement
PRAGMA foreign_keys = OFF;

-- ====== ARTEMIS (17 centrales) ======

-- Mission 1: SCI KILJOR (N° 3251) - Type: TOITURE
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '3251', 'SCI KILJOR', 'Toiture existante / Rénovation', 3,
  'EN_ATTENTE', datetime('now'), 'TOITURE'
);

-- Checklist TOITURE pour mission 1 (42 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'TOITURE', 31, 'DTU 40.35 respecté (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'TOITURE', 32, 'Étanchéité toiture conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'TOITURE', 33, 'Pénétrations étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'TOITURE', 34, 'Écran sous-toiture présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'TOITURE', 35, 'Ventilation toiture adéquate (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'TOITURE', 36, 'Liteaux/chevrons conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'TOITURE', 37, 'Crochets inox conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'TOITURE', 38, 'Respect poids admissible toiture (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'TOITURE', 39, 'Cheminements sécurisés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'TOITURE', 40, 'Dispositifs antichute présents (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'TOITURE', 41, 'Jonctions tuiles/modules étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3251'),
  'TOITURE', 42, 'Respect DTU série 40 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 2: Mathieu Montet (N° 17996) - Type: TOITURE
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '17996', 'Mathieu Montet', 'Toiture existante / Rénovation', 3,
  'EN_ATTENTE', datetime('now'), 'TOITURE'
);

-- Checklist TOITURE pour mission 2 (42 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'TOITURE', 31, 'DTU 40.35 respecté (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'TOITURE', 32, 'Étanchéité toiture conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'TOITURE', 33, 'Pénétrations étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'TOITURE', 34, 'Écran sous-toiture présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'TOITURE', 35, 'Ventilation toiture adéquate (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'TOITURE', 36, 'Liteaux/chevrons conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'TOITURE', 37, 'Crochets inox conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'TOITURE', 38, 'Respect poids admissible toiture (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'TOITURE', 39, 'Cheminements sécurisés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'TOITURE', 40, 'Dispositifs antichute présents (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'TOITURE', 41, 'Jonctions tuiles/modules étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17996'),
  'TOITURE', 42, 'Respect DTU série 40 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 3: HANGAR Benoit BERTELOOT (N° 20614) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '20614', 'HANGAR Benoit BERTELOOT', 'Bâtiment à construire - A1', 3,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 3 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '20614'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '20614'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '20614'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '20614'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '20614'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '20614'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '20614'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '20614'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '20614'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '20614'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '20614'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '20614'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '20614'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '20614'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '20614'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '20614'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '20614'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '20614'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '20614'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '20614'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '20614'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '20614'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '20614'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '20614'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '20614'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '20614'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '20614'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '20614'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '20614'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '20614'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 4: HANGAR Angelina SIMMONET (N° 29246) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '29246', 'HANGAR Angelina SIMMONET', 'Bâtiment à construire - A1', 3,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 4 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '29246'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '29246'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '29246'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '29246'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '29246'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '29246'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '29246'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '29246'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '29246'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '29246'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '29246'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '29246'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '29246'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '29246'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '29246'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '29246'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '29246'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '29246'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '29246'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '29246'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '29246'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '29246'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '29246'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '29246'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '29246'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '29246'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '29246'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '29246'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '29246'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '29246'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 5: Hangar LAMIOT (N° 30516) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '30516', 'Hangar LAMIOT', 'Bâtiment à construire - C', 3,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 5 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30516'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30516'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30516'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30516'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30516'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30516'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30516'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30516'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30516'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30516'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30516'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30516'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30516'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30516'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30516'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30516'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30516'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30516'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30516'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30516'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30516'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30516'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30516'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30516'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30516'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30516'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30516'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30516'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30516'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30516'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 6: Didier - PRIEUR (N° 32074) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '32074', 'Didier - PRIEUR', 'Bâtiment à construire - C', 3,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 6 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '32074'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '32074'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '32074'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '32074'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '32074'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '32074'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '32074'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '32074'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '32074'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '32074'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '32074'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '32074'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '32074'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '32074'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '32074'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '32074'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '32074'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '32074'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '32074'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '32074'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '32074'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '32074'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '32074'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '32074'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '32074'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '32074'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '32074'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '32074'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '32074'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '32074'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 7: Hangar Patrick BLANCHET (N° 35280) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '35280', 'Hangar Patrick BLANCHET', 'Bâtiment à construire - C', 3,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 7 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35280'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35280'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35280'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35280'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35280'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35280'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35280'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35280'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35280'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35280'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35280'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35280'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35280'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35280'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35280'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35280'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35280'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35280'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35280'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35280'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35280'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35280'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35280'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35280'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35280'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35280'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35280'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35280'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35280'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35280'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 8: GAYET 42 (N° 58166) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '58166', 'GAYET 42', 'Bâtiment à construire - C', 3,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 8 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58166'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58166'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58166'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58166'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58166'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58166'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58166'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58166'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58166'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58166'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58166'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58166'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58166'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58166'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58166'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58166'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58166'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58166'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58166'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58166'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58166'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58166'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58166'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58166'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58166'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58166'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58166'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58166'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58166'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58166'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 9: DUMONT GUY (N° 60830) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '60830', 'DUMONT GUY', 'Bâtiment à construire - A1', 3,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 9 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '60830'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '60830'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '60830'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '60830'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '60830'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '60830'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '60830'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '60830'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '60830'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '60830'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '60830'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '60830'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '60830'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '60830'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '60830'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '60830'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '60830'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '60830'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '60830'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '60830'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '60830'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '60830'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '60830'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '60830'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '60830'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '60830'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '60830'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '60830'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '60830'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '60830'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 10: Serge Maltaverne (N° 61191) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '61191', 'Serge Maltaverne', 'Bâtiment à construire - C', 3,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 10 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '61191'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '61191'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '61191'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '61191'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '61191'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '61191'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '61191'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '61191'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '61191'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '61191'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '61191'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '61191'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '61191'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '61191'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '61191'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '61191'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '61191'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '61191'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '61191'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '61191'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '61191'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '61191'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '61191'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '61191'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '61191'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '61191'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '61191'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '61191'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '61191'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '61191'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 11: Maymat (N° 76547) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '76547', 'Maymat', 'Bâtiment à construire - C', 3,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 11 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '76547'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '76547'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '76547'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '76547'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '76547'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '76547'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '76547'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '76547'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '76547'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '76547'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '76547'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '76547'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '76547'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '76547'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '76547'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '76547'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '76547'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '76547'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '76547'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '76547'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '76547'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '76547'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '76547'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '76547'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '76547'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '76547'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '76547'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '76547'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '76547'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '76547'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 12: Hangar Julien Vaudin (N° 82076) - Type: TOITURE
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '82076', 'Hangar Julien Vaudin', 'Toiture existante / Rénovation', 3,
  'EN_ATTENTE', datetime('now'), 'TOITURE'
);

-- Checklist TOITURE pour mission 12 (42 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'TOITURE', 31, 'DTU 40.35 respecté (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'TOITURE', 32, 'Étanchéité toiture conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'TOITURE', 33, 'Pénétrations étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'TOITURE', 34, 'Écran sous-toiture présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'TOITURE', 35, 'Ventilation toiture adéquate (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'TOITURE', 36, 'Liteaux/chevrons conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'TOITURE', 37, 'Crochets inox conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'TOITURE', 38, 'Respect poids admissible toiture (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'TOITURE', 39, 'Cheminements sécurisés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'TOITURE', 40, 'Dispositifs antichute présents (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'TOITURE', 41, 'Jonctions tuiles/modules étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82076'),
  'TOITURE', 42, 'Respect DTU série 40 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 13: EARL CADOT (N° 89219) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '89219', 'EARL CADOT', 'Bâtiment à construire - C', 3,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 13 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '89219'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '89219'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '89219'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '89219'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '89219'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '89219'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '89219'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '89219'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '89219'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '89219'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '89219'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '89219'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '89219'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '89219'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '89219'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '89219'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '89219'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '89219'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '89219'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '89219'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '89219'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '89219'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '89219'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '89219'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '89219'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '89219'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '89219'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '89219'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '89219'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '89219'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 14: HARAS DE LA MAJORIE/MANOHA (N° 90189) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '90189', 'HARAS DE LA MAJORIE/MANOHA', 'Bâtiment à construire - C', 3,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 14 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90189'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90189'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90189'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90189'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90189'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90189'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90189'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90189'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90189'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90189'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90189'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90189'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90189'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90189'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90189'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90189'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90189'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90189'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90189'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90189'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90189'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90189'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90189'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90189'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90189'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90189'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90189'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90189'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90189'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90189'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 15: Serge Maltaverne (N° 90361) - Type: TOITURE
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '90361', 'Serge Maltaverne', 'Toiture existante / Rénovation', 3,
  'EN_ATTENTE', datetime('now'), 'TOITURE'
);

-- Checklist TOITURE pour mission 15 (42 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'TOITURE', 31, 'DTU 40.35 respecté (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'TOITURE', 32, 'Étanchéité toiture conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'TOITURE', 33, 'Pénétrations étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'TOITURE', 34, 'Écran sous-toiture présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'TOITURE', 35, 'Ventilation toiture adéquate (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'TOITURE', 36, 'Liteaux/chevrons conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'TOITURE', 37, 'Crochets inox conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'TOITURE', 38, 'Respect poids admissible toiture (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'TOITURE', 39, 'Cheminements sécurisés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'TOITURE', 40, 'Dispositifs antichute présents (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'TOITURE', 41, 'Jonctions tuiles/modules étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90361'),
  'TOITURE', 42, 'Respect DTU série 40 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 16: Hangar Eric LOGNON (N° 95309) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '95309', 'Hangar Eric LOGNON', 'Bâtiment à construire -  A2', 3,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 16 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95309'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95309'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95309'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95309'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95309'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95309'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95309'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95309'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95309'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95309'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95309'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95309'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95309'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95309'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95309'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95309'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95309'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95309'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95309'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95309'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95309'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95309'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95309'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95309'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95309'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95309'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95309'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95309'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95309'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95309'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 17: Hangar Benjamin CHASSON (N° 96147) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '96147', 'Hangar Benjamin CHASSON', 'Bâtiment à construire - C', 3,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 17 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96147'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96147'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96147'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96147'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96147'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96147'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96147'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96147'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96147'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96147'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96147'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96147'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96147'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96147'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96147'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96147'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96147'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96147'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96147'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96147'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96147'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96147'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96147'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96147'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96147'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96147'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96147'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96147'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96147'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96147'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- ====== CADENET (10 centrales) ======

-- Mission 18: Hangar Laurent ROUX (N° 15843) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '15843', 'Hangar Laurent ROUX', 'Bâtiment à construire -  A2', 4,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 18 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '15843'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '15843'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '15843'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '15843'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '15843'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '15843'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '15843'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '15843'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '15843'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '15843'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '15843'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '15843'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '15843'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '15843'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '15843'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '15843'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '15843'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '15843'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '15843'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '15843'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '15843'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '15843'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '15843'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '15843'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '15843'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '15843'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '15843'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '15843'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '15843'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '15843'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 19: Hangar Laurent ROUX (N° 17966) - Type: TOITURE
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '17966', 'Hangar Laurent ROUX', 'Toiture existante / Rénovation', 4,
  'EN_ATTENTE', datetime('now'), 'TOITURE'
);

-- Checklist TOITURE pour mission 19 (42 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'TOITURE', 31, 'DTU 40.35 respecté (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'TOITURE', 32, 'Étanchéité toiture conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'TOITURE', 33, 'Pénétrations étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'TOITURE', 34, 'Écran sous-toiture présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'TOITURE', 35, 'Ventilation toiture adéquate (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'TOITURE', 36, 'Liteaux/chevrons conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'TOITURE', 37, 'Crochets inox conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'TOITURE', 38, 'Respect poids admissible toiture (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'TOITURE', 39, 'Cheminements sécurisés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'TOITURE', 40, 'Dispositifs antichute présents (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'TOITURE', 41, 'Jonctions tuiles/modules étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '17966'),
  'TOITURE', 42, 'Respect DTU série 40 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 20: Hangar Bernard MAGE (N° 70087) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '70087', 'Hangar Bernard MAGE', 'Bâtiment à construire -  A2', 4,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 20 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '70087'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '70087'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '70087'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '70087'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '70087'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '70087'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '70087'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '70087'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '70087'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '70087'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '70087'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '70087'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '70087'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '70087'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '70087'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '70087'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '70087'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '70087'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '70087'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '70087'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '70087'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '70087'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '70087'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '70087'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '70087'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '70087'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '70087'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '70087'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '70087'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '70087'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 21: Hangar Frederic Sinaud (N° 86550) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '86550', 'Hangar Frederic Sinaud', 'Bâtiment à construire - C', 4,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 21 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '86550'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '86550'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '86550'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '86550'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '86550'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '86550'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '86550'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '86550'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '86550'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '86550'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '86550'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '86550'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '86550'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '86550'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '86550'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '86550'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '86550'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '86550'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '86550'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '86550'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '86550'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '86550'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '86550'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '86550'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '86550'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '86550'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '86550'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '86550'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '86550'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '86550'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 22: Hangar Frederic Sinaud (N° 90034) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '90034', 'Hangar Frederic Sinaud', 'Bâtiment à construire - C', 4,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 22 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90034'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90034'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90034'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90034'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90034'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90034'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90034'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90034'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90034'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90034'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90034'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90034'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90034'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90034'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90034'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90034'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90034'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90034'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90034'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90034'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90034'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90034'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90034'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90034'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90034'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90034'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90034'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90034'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90034'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '90034'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 23: MARTEL 184 Construction (N° 95686) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '95686', 'MARTEL 184 Construction', 'Bâtiment à construire -  A2', 4,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 23 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95686'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95686'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95686'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95686'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95686'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95686'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95686'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95686'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95686'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95686'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95686'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95686'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95686'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95686'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95686'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95686'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95686'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95686'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95686'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95686'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95686'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95686'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95686'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95686'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95686'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95686'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95686'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95686'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95686'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95686'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 24: BOUCHARDY 203 LOC (N° 95689) - Type: TOITURE
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '95689', 'BOUCHARDY 203 LOC', 'Toiture existante / Rénovation', 4,
  'EN_ATTENTE', datetime('now'), 'TOITURE'
);

-- Checklist TOITURE pour mission 24 (42 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'TOITURE', 31, 'DTU 40.35 respecté (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'TOITURE', 32, 'Étanchéité toiture conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'TOITURE', 33, 'Pénétrations étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'TOITURE', 34, 'Écran sous-toiture présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'TOITURE', 35, 'Ventilation toiture adéquate (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'TOITURE', 36, 'Liteaux/chevrons conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'TOITURE', 37, 'Crochets inox conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'TOITURE', 38, 'Respect poids admissible toiture (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'TOITURE', 39, 'Cheminements sécurisés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'TOITURE', 40, 'Dispositifs antichute présents (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'TOITURE', 41, 'Jonctions tuiles/modules étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95689'),
  'TOITURE', 42, 'Respect DTU série 40 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 25: BOULOIR 206 LOC (N° 95691) - Type: TOITURE
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '95691', 'BOULOIR 206 LOC', 'Toiture existante / Rénovation', 4,
  'EN_ATTENTE', datetime('now'), 'TOITURE'
);

-- Checklist TOITURE pour mission 25 (42 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'TOITURE', 31, 'DTU 40.35 respecté (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'TOITURE', 32, 'Étanchéité toiture conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'TOITURE', 33, 'Pénétrations étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'TOITURE', 34, 'Écran sous-toiture présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'TOITURE', 35, 'Ventilation toiture adéquate (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'TOITURE', 36, 'Liteaux/chevrons conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'TOITURE', 37, 'Crochets inox conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'TOITURE', 38, 'Respect poids admissible toiture (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'TOITURE', 39, 'Cheminements sécurisés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'TOITURE', 40, 'Dispositifs antichute présents (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'TOITURE', 41, 'Jonctions tuiles/modules étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95691'),
  'TOITURE', 42, 'Respect DTU série 40 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 26: MARTEL 183 LOC (N° 95695) - Type: TOITURE
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '95695', 'MARTEL 183 LOC', 'Toiture existante / Rénovation', 4,
  'EN_ATTENTE', datetime('now'), 'TOITURE'
);

-- Checklist TOITURE pour mission 26 (42 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'TOITURE', 31, 'DTU 40.35 respecté (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'TOITURE', 32, 'Étanchéité toiture conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'TOITURE', 33, 'Pénétrations étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'TOITURE', 34, 'Écran sous-toiture présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'TOITURE', 35, 'Ventilation toiture adéquate (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'TOITURE', 36, 'Liteaux/chevrons conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'TOITURE', 37, 'Crochets inox conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'TOITURE', 38, 'Respect poids admissible toiture (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'TOITURE', 39, 'Cheminements sécurisés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'TOITURE', 40, 'Dispositifs antichute présents (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'TOITURE', 41, 'Jonctions tuiles/modules étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95695'),
  'TOITURE', 42, 'Respect DTU série 40 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 27: Hangar Fabrice COMBY (N° 96546) - Type: TOITURE
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '96546', 'Hangar Fabrice COMBY', 'Toiture existante / PV Ready', 4,
  'EN_ATTENTE', datetime('now'), 'TOITURE'
);

-- Checklist TOITURE pour mission 27 (42 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'TOITURE', 31, 'DTU 40.35 respecté (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'TOITURE', 32, 'Étanchéité toiture conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'TOITURE', 33, 'Pénétrations étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'TOITURE', 34, 'Écran sous-toiture présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'TOITURE', 35, 'Ventilation toiture adéquate (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'TOITURE', 36, 'Liteaux/chevrons conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'TOITURE', 37, 'Crochets inox conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'TOITURE', 38, 'Respect poids admissible toiture (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'TOITURE', 39, 'Cheminements sécurisés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'TOITURE', 40, 'Dispositifs antichute présents (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'TOITURE', 41, 'Jonctions tuiles/modules étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '96546'),
  'TOITURE', 42, 'Respect DTU série 40 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- ====== DIAGPV (18 centrales) ======

-- Mission 28: Antunez - SCI ANAUJA (N° 31971) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '31971', 'Antunez - SCI ANAUJA', 'Ombrière simple', 5,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 28 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '31971'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '31971'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '31971'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '31971'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '31971'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '31971'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '31971'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '31971'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '31971'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '31971'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '31971'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '31971'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '31971'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '31971'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '31971'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '31971'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '31971'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '31971'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '31971'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '31971'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '31971'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '31971'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '31971'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '31971'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '31971'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '31971'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '31971'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '31971'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '31971'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '31971'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 29: Hangar Joris SAINT MARTIN (N° 35451) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '35451', 'Hangar Joris SAINT MARTIN', 'Bâtiment à construire - C', 5,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 29 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35451'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35451'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35451'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35451'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35451'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35451'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35451'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35451'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35451'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35451'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35451'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35451'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35451'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35451'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35451'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35451'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35451'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35451'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35451'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35451'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35451'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35451'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35451'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35451'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35451'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35451'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35451'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35451'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35451'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '35451'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 30: EARL GOUNY (N° 3391) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '3391', 'EARL GOUNY', 'Bâtiment à construire - C', 5,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 30 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3391'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3391'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3391'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3391'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3391'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3391'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3391'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3391'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3391'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3391'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3391'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3391'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3391'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3391'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3391'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3391'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3391'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3391'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3391'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3391'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3391'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3391'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3391'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3391'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3391'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3391'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3391'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3391'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3391'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3391'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 31: Hangar Pierre MOURGUES (N° 30489) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '30489', 'Hangar Pierre MOURGUES', 'Bâtiment à construire - C', 5,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 31 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30489'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30489'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30489'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30489'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30489'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30489'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30489'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30489'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30489'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30489'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30489'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30489'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30489'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30489'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30489'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30489'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30489'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30489'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30489'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30489'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30489'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30489'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30489'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30489'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30489'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30489'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30489'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30489'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30489'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '30489'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 32: Hangar Christophe CARRERE n°2 (N° 33559) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '33559', 'Hangar Christophe CARRERE n°2', 'Bâtiment à construire - A1', 5,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 32 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '33559'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '33559'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '33559'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '33559'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '33559'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '33559'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '33559'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '33559'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '33559'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '33559'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '33559'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '33559'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '33559'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '33559'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '33559'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '33559'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '33559'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '33559'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '33559'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '33559'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '33559'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '33559'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '33559'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '33559'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '33559'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '33559'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '33559'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '33559'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '33559'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '33559'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 33: Azemar (N° 83705) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '83705', 'Azemar', 'Bâtiment à construire - C', 5,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 33 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83705'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83705'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83705'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83705'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83705'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83705'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83705'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83705'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83705'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83705'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83705'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83705'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83705'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83705'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83705'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83705'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83705'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83705'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83705'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83705'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83705'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83705'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83705'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83705'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83705'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83705'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83705'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83705'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83705'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83705'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 34: Hangar Frédéric CASTET (N° 95918) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '95918', 'Hangar Frédéric CASTET', 'Bâtiment à construire - C', 5,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 34 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95918'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95918'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95918'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95918'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95918'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95918'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95918'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95918'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95918'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95918'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95918'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95918'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95918'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95918'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95918'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95918'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95918'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95918'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95918'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95918'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95918'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95918'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95918'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95918'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95918'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95918'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95918'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95918'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95918'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95918'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 35: Hangar Frédéric CASTET (N° 95919) - Type: TOITURE
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '95919', 'Hangar Frédéric CASTET', 'Toiture existante / Rénovation', 5,
  'EN_ATTENTE', datetime('now'), 'TOITURE'
);

-- Checklist TOITURE pour mission 35 (42 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'TOITURE', 31, 'DTU 40.35 respecté (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'TOITURE', 32, 'Étanchéité toiture conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'TOITURE', 33, 'Pénétrations étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'TOITURE', 34, 'Écran sous-toiture présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'TOITURE', 35, 'Ventilation toiture adéquate (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'TOITURE', 36, 'Liteaux/chevrons conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'TOITURE', 37, 'Crochets inox conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'TOITURE', 38, 'Respect poids admissible toiture (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'TOITURE', 39, 'Cheminements sécurisés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'TOITURE', 40, 'Dispositifs antichute présents (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'TOITURE', 41, 'Jonctions tuiles/modules étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95919'),
  'TOITURE', 42, 'Respect DTU série 40 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 36: Hangar Sebastien RUDELLE (N° 95992) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '95992', 'Hangar Sebastien RUDELLE', 'Bâtiment à construire - C', 5,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 36 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95992'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95992'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95992'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95992'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95992'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95992'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95992'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95992'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95992'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95992'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95992'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95992'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95992'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95992'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95992'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95992'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95992'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95992'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95992'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95992'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95992'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95992'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95992'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95992'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95992'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95992'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95992'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95992'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95992'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95992'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 37: Hangar Richard VAN ZANTEN (N° 98584) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '98584', 'Hangar Richard VAN ZANTEN', 'Bâtiment à construire -  A2', 5,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 37 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98584'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98584'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98584'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98584'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98584'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98584'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98584'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98584'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98584'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98584'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98584'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98584'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98584'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98584'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98584'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98584'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98584'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98584'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98584'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98584'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98584'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98584'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98584'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98584'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98584'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98584'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98584'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98584'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98584'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98584'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 38: Hangar Yannick CLEMENT (N° 99373) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '99373', 'Hangar Yannick CLEMENT', 'Bâtiment à construire - C', 5,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 38 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '99373'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '99373'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '99373'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '99373'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '99373'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '99373'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '99373'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '99373'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '99373'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '99373'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '99373'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '99373'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '99373'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '99373'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '99373'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '99373'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '99373'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '99373'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '99373'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '99373'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '99373'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '99373'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '99373'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '99373'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '99373'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '99373'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '99373'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '99373'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '99373'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '99373'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 39: Hangar Maxime Bayle (N° 3085) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '3085', 'Hangar Maxime Bayle', 'Bâtiment à construire - A1', 5,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 39 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3085'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3085'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3085'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3085'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3085'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3085'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3085'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3085'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3085'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3085'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3085'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3085'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3085'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3085'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3085'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3085'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3085'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3085'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3085'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3085'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3085'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3085'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3085'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3085'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3085'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3085'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3085'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3085'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3085'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3085'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 40: MATHIEU Vincent (N° 3334) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '3334', 'MATHIEU Vincent', 'Bâtiment à construire - C', 5,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 40 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3334'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3334'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3334'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3334'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3334'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3334'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3334'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3334'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3334'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3334'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3334'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3334'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3334'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3334'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3334'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3334'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3334'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3334'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3334'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3334'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3334'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3334'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3334'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3334'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3334'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3334'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3334'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3334'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3334'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3334'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 41: HANGAR Christian MIGNARD (N° 22147) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '22147', 'HANGAR Christian MIGNARD', 'Bâtiment à construire - B', 5,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 41 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '22147'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '22147'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '22147'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '22147'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '22147'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '22147'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '22147'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '22147'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '22147'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '22147'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '22147'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '22147'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '22147'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '22147'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '22147'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '22147'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '22147'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '22147'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '22147'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '22147'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '22147'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '22147'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '22147'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '22147'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '22147'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '22147'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '22147'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '22147'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '22147'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '22147'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 42: Burgat Et Fils Tp (N° 28173) - Type: TOITURE
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '28173', 'Burgat Et Fils Tp', 'Toiture existante / Rénovation', 5,
  'EN_ATTENTE', datetime('now'), 'TOITURE'
);

-- Checklist TOITURE pour mission 42 (42 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'TOITURE', 31, 'DTU 40.35 respecté (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'TOITURE', 32, 'Étanchéité toiture conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'TOITURE', 33, 'Pénétrations étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'TOITURE', 34, 'Écran sous-toiture présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'TOITURE', 35, 'Ventilation toiture adéquate (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'TOITURE', 36, 'Liteaux/chevrons conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'TOITURE', 37, 'Crochets inox conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'TOITURE', 38, 'Respect poids admissible toiture (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'TOITURE', 39, 'Cheminements sécurisés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'TOITURE', 40, 'Dispositifs antichute présents (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'TOITURE', 41, 'Jonctions tuiles/modules étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '28173'),
  'TOITURE', 42, 'Respect DTU série 40 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 43: GFA LASCOMBES - ANTOINE MICOULEAU (N° 95592) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '95592', 'GFA LASCOMBES - ANTOINE MICOULEAU', 'Bâtiment à construire - A1', 5,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 43 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95592'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95592'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95592'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95592'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95592'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95592'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95592'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95592'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95592'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95592'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95592'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95592'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95592'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95592'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95592'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95592'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95592'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95592'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95592'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95592'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95592'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95592'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95592'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95592'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95592'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95592'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95592'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95592'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95592'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '95592'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 44: Commune De Pomas (N° 97565) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '97565', 'Commune De Pomas', 'Bâtiment à construire - C', 5,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 44 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '97565'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '97565'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '97565'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '97565'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '97565'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '97565'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '97565'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '97565'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '97565'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '97565'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '97565'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '97565'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '97565'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '97565'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '97565'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '97565'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '97565'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '97565'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '97565'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '97565'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '97565'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '97565'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '97565'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '97565'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '97565'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '97565'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '97565'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '97565'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '97565'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '97565'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 45: TOURNIER (N° 98563) - Type: TOITURE
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '98563', 'TOURNIER', 'Toiture existante / Rénovation', 5,
  'EN_ATTENTE', datetime('now'), 'TOITURE'
);

-- Checklist TOITURE pour mission 45 (42 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'TOITURE', 31, 'DTU 40.35 respecté (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'TOITURE', 32, 'Étanchéité toiture conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'TOITURE', 33, 'Pénétrations étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'TOITURE', 34, 'Écran sous-toiture présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'TOITURE', 35, 'Ventilation toiture adéquate (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'TOITURE', 36, 'Liteaux/chevrons conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'TOITURE', 37, 'Crochets inox conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'TOITURE', 38, 'Respect poids admissible toiture (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'TOITURE', 39, 'Cheminements sécurisés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'TOITURE', 40, 'Dispositifs antichute présents (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'TOITURE', 41, 'Jonctions tuiles/modules étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '98563'),
  'TOITURE', 42, 'Respect DTU série 40 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- ====== EDOUARD (7 centrales) ======

-- Mission 46: Concept-TY Chambray 2 (N° 3384) - Type: TOITURE
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '3384', 'Concept-TY Chambray 2', 'Toiture existante / PV Ready', 6,
  'EN_ATTENTE', datetime('now'), 'TOITURE'
);

-- Checklist TOITURE pour mission 46 (42 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'TOITURE', 31, 'DTU 40.35 respecté (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'TOITURE', 32, 'Étanchéité toiture conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'TOITURE', 33, 'Pénétrations étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'TOITURE', 34, 'Écran sous-toiture présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'TOITURE', 35, 'Ventilation toiture adéquate (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'TOITURE', 36, 'Liteaux/chevrons conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'TOITURE', 37, 'Crochets inox conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'TOITURE', 38, 'Respect poids admissible toiture (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'TOITURE', 39, 'Cheminements sécurisés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'TOITURE', 40, 'Dispositifs antichute présents (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'TOITURE', 41, 'Jonctions tuiles/modules étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '3384'),
  'TOITURE', 42, 'Respect DTU série 40 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 47: HANGAR Gérald Guillet (N° 34481) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '34481', 'HANGAR Gérald Guillet', 'Bâtiment à construire -  A2', 6,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 47 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '34481'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '34481'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '34481'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '34481'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '34481'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '34481'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '34481'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '34481'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '34481'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '34481'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '34481'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '34481'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '34481'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '34481'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '34481'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '34481'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '34481'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '34481'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '34481'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '34481'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '34481'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '34481'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '34481'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '34481'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '34481'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '34481'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '34481'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '34481'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '34481'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '34481'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 48: VIEL (N° 49814) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '49814', 'VIEL', 'Bâtiment à construire - A1', 6,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 48 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '49814'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '49814'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '49814'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '49814'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '49814'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '49814'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '49814'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '49814'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '49814'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '49814'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '49814'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '49814'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '49814'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '49814'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '49814'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '49814'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '49814'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '49814'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '49814'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '49814'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '49814'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '49814'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '49814'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '49814'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '49814'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '49814'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '49814'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '49814'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '49814'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '49814'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 49: Hangar Karl Biteau (N° 58962) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '58962', 'Hangar Karl Biteau', 'Bâtiment à construire - C', 6,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 49 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58962'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58962'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58962'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58962'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58962'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58962'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58962'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58962'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58962'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58962'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58962'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58962'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58962'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58962'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58962'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58962'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58962'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58962'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58962'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58962'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58962'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58962'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58962'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58962'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58962'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58962'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58962'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58962'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58962'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '58962'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 50: Bourgeois (N° 81492) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '81492', 'Bourgeois', 'Bâtiment à construire - A1', 6,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 50 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '81492'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '81492'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '81492'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '81492'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '81492'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '81492'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '81492'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '81492'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '81492'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '81492'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '81492'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '81492'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '81492'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '81492'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '81492'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '81492'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '81492'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '81492'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '81492'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '81492'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '81492'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '81492'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '81492'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '81492'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '81492'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '81492'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '81492'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '81492'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '81492'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '81492'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 51: Cheraud (N° 82721) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '82721', 'Cheraud', 'Bâtiment à construire -  A2', 6,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 51 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82721'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82721'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82721'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82721'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82721'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82721'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82721'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82721'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82721'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82721'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82721'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82721'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82721'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82721'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82721'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82721'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82721'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82721'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82721'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82721'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82721'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82721'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82721'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82721'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82721'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82721'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82721'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82721'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82721'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '82721'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 52: Hangar Renaud Sonnard (N° 83431) - Type: SOL
INSERT OR IGNORE INTO ordres_mission (
  id_girasole, nom_centrale, type_centrale, sous_traitant_id,
  statut, date_creation, checklist_type
) VALUES (
  '83431', 'Hangar Renaud Sonnard', 'Bâtiment à construire - A1', 6,
  'EN_ATTENTE', datetime('now'), 'SOL'
);

-- Checklist SOL pour mission 52 (30 items)
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83431'),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83431'),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83431'),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83431'),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83431'),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83431'),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83431'),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83431'),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83431'),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83431'),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83431'),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83431'),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83431'),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83431'),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83431'),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83431'),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83431'),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83431'),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83431'),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83431'),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83431'),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83431'),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83431'),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83431'),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83431'),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83431'),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83431'),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83431'),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83431'),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte, 
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE id_girasole = '83431'),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);


-- Réactiver les contraintes
PRAGMA foreign_keys = ON;

-- ============================================================================
-- RÉSUMÉ:
-- • 52 ordres de mission créés
-- • 1716 items de checklist créés
--   - ARTEMIS: 17 missions
--   - CADENET: 10 missions
--   - DIAGPV: 18 missions
--   - EDOUARD: 7 missions
-- ============================================================================