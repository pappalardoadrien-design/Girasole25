-- ============================================================================
-- CRÉATION 52 ORDRES DE MISSION + CHECKLISTS - PRODUCTION
-- Compatible avec schéma existant (centrale_id)
-- ============================================================================

PRAGMA foreign_keys = OFF;

-- ====== ARTEMIS (17 missions) ======

-- Mission 1: SCI KILJOR (TOITURE)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1),
  3, 3,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'TOITURE', 31, 'DTU 40.35 respecté (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'TOITURE', 32, 'Étanchéité toiture conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'TOITURE', 33, 'Pénétrations étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'TOITURE', 34, 'Écran sous-toiture présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'TOITURE', 35, 'Ventilation toiture adéquate (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'TOITURE', 36, 'Liteaux/chevrons conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'TOITURE', 37, 'Crochets inox conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'TOITURE', 38, 'Respect poids admissible toiture (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'TOITURE', 39, 'Cheminements sécurisés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'TOITURE', 40, 'Dispositifs antichute présents (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'TOITURE', 41, 'Jonctions tuiles/modules étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'SCI KILJOR' LIMIT 1) LIMIT 1),
  'TOITURE', 42, 'Respect DTU série 40 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 2: Mathieu Montet (TOITURE)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1),
  3, 3,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'TOITURE', 31, 'DTU 40.35 respecté (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'TOITURE', 32, 'Étanchéité toiture conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'TOITURE', 33, 'Pénétrations étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'TOITURE', 34, 'Écran sous-toiture présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'TOITURE', 35, 'Ventilation toiture adéquate (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'TOITURE', 36, 'Liteaux/chevrons conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'TOITURE', 37, 'Crochets inox conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'TOITURE', 38, 'Respect poids admissible toiture (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'TOITURE', 39, 'Cheminements sécurisés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'TOITURE', 40, 'Dispositifs antichute présents (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'TOITURE', 41, 'Jonctions tuiles/modules étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Mathieu Montet' LIMIT 1) LIMIT 1),
  'TOITURE', 42, 'Respect DTU série 40 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 3: HANGAR Benoit BERTELOOT (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'HANGAR Benoit BERTELOOT' LIMIT 1),
  3, 3,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Benoit BERTELOOT' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Benoit BERTELOOT' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Benoit BERTELOOT' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Benoit BERTELOOT' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Benoit BERTELOOT' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Benoit BERTELOOT' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Benoit BERTELOOT' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Benoit BERTELOOT' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Benoit BERTELOOT' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Benoit BERTELOOT' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Benoit BERTELOOT' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Benoit BERTELOOT' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Benoit BERTELOOT' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Benoit BERTELOOT' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Benoit BERTELOOT' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Benoit BERTELOOT' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Benoit BERTELOOT' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Benoit BERTELOOT' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Benoit BERTELOOT' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Benoit BERTELOOT' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Benoit BERTELOOT' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Benoit BERTELOOT' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Benoit BERTELOOT' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Benoit BERTELOOT' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Benoit BERTELOOT' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Benoit BERTELOOT' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Benoit BERTELOOT' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Benoit BERTELOOT' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Benoit BERTELOOT' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Benoit BERTELOOT' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 4: HANGAR Angelina SIMMONET (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'HANGAR Angelina SIMMONET' LIMIT 1),
  3, 3,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Angelina SIMMONET' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Angelina SIMMONET' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Angelina SIMMONET' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Angelina SIMMONET' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Angelina SIMMONET' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Angelina SIMMONET' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Angelina SIMMONET' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Angelina SIMMONET' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Angelina SIMMONET' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Angelina SIMMONET' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Angelina SIMMONET' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Angelina SIMMONET' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Angelina SIMMONET' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Angelina SIMMONET' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Angelina SIMMONET' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Angelina SIMMONET' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Angelina SIMMONET' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Angelina SIMMONET' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Angelina SIMMONET' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Angelina SIMMONET' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Angelina SIMMONET' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Angelina SIMMONET' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Angelina SIMMONET' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Angelina SIMMONET' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Angelina SIMMONET' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Angelina SIMMONET' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Angelina SIMMONET' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Angelina SIMMONET' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Angelina SIMMONET' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Angelina SIMMONET' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 5: Hangar LAMIOT (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Hangar LAMIOT' LIMIT 1),
  3, 3,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar LAMIOT' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar LAMIOT' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar LAMIOT' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar LAMIOT' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar LAMIOT' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar LAMIOT' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar LAMIOT' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar LAMIOT' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar LAMIOT' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar LAMIOT' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar LAMIOT' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar LAMIOT' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar LAMIOT' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar LAMIOT' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar LAMIOT' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar LAMIOT' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar LAMIOT' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar LAMIOT' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar LAMIOT' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar LAMIOT' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar LAMIOT' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar LAMIOT' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar LAMIOT' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar LAMIOT' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar LAMIOT' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar LAMIOT' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar LAMIOT' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar LAMIOT' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar LAMIOT' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar LAMIOT' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 6: Didier - PRIEUR (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Didier - PRIEUR' LIMIT 1),
  3, 3,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Didier - PRIEUR' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Didier - PRIEUR' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Didier - PRIEUR' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Didier - PRIEUR' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Didier - PRIEUR' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Didier - PRIEUR' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Didier - PRIEUR' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Didier - PRIEUR' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Didier - PRIEUR' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Didier - PRIEUR' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Didier - PRIEUR' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Didier - PRIEUR' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Didier - PRIEUR' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Didier - PRIEUR' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Didier - PRIEUR' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Didier - PRIEUR' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Didier - PRIEUR' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Didier - PRIEUR' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Didier - PRIEUR' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Didier - PRIEUR' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Didier - PRIEUR' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Didier - PRIEUR' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Didier - PRIEUR' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Didier - PRIEUR' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Didier - PRIEUR' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Didier - PRIEUR' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Didier - PRIEUR' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Didier - PRIEUR' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Didier - PRIEUR' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Didier - PRIEUR' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 7: Hangar Patrick BLANCHET (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Hangar Patrick BLANCHET' LIMIT 1),
  3, 3,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Patrick BLANCHET' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Patrick BLANCHET' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Patrick BLANCHET' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Patrick BLANCHET' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Patrick BLANCHET' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Patrick BLANCHET' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Patrick BLANCHET' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Patrick BLANCHET' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Patrick BLANCHET' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Patrick BLANCHET' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Patrick BLANCHET' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Patrick BLANCHET' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Patrick BLANCHET' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Patrick BLANCHET' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Patrick BLANCHET' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Patrick BLANCHET' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Patrick BLANCHET' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Patrick BLANCHET' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Patrick BLANCHET' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Patrick BLANCHET' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Patrick BLANCHET' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Patrick BLANCHET' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Patrick BLANCHET' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Patrick BLANCHET' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Patrick BLANCHET' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Patrick BLANCHET' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Patrick BLANCHET' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Patrick BLANCHET' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Patrick BLANCHET' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Patrick BLANCHET' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 8: GAYET 42 (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'GAYET 42' LIMIT 1),
  3, 3,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GAYET 42' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GAYET 42' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GAYET 42' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GAYET 42' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GAYET 42' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GAYET 42' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GAYET 42' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GAYET 42' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GAYET 42' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GAYET 42' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GAYET 42' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GAYET 42' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GAYET 42' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GAYET 42' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GAYET 42' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GAYET 42' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GAYET 42' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GAYET 42' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GAYET 42' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GAYET 42' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GAYET 42' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GAYET 42' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GAYET 42' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GAYET 42' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GAYET 42' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GAYET 42' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GAYET 42' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GAYET 42' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GAYET 42' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GAYET 42' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 9: DUMONT GUY (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'DUMONT GUY' LIMIT 1),
  3, 3,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'DUMONT GUY' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'DUMONT GUY' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'DUMONT GUY' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'DUMONT GUY' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'DUMONT GUY' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'DUMONT GUY' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'DUMONT GUY' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'DUMONT GUY' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'DUMONT GUY' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'DUMONT GUY' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'DUMONT GUY' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'DUMONT GUY' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'DUMONT GUY' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'DUMONT GUY' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'DUMONT GUY' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'DUMONT GUY' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'DUMONT GUY' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'DUMONT GUY' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'DUMONT GUY' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'DUMONT GUY' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'DUMONT GUY' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'DUMONT GUY' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'DUMONT GUY' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'DUMONT GUY' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'DUMONT GUY' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'DUMONT GUY' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'DUMONT GUY' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'DUMONT GUY' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'DUMONT GUY' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'DUMONT GUY' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 10: Serge Maltaverne (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1),
  3, 3,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 11: Maymat (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Maymat' LIMIT 1),
  3, 3,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Maymat' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Maymat' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Maymat' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Maymat' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Maymat' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Maymat' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Maymat' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Maymat' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Maymat' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Maymat' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Maymat' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Maymat' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Maymat' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Maymat' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Maymat' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Maymat' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Maymat' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Maymat' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Maymat' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Maymat' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Maymat' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Maymat' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Maymat' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Maymat' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Maymat' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Maymat' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Maymat' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Maymat' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Maymat' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Maymat' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 12: Hangar Julien Vaudin (TOITURE)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1),
  3, 3,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'TOITURE', 31, 'DTU 40.35 respecté (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'TOITURE', 32, 'Étanchéité toiture conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'TOITURE', 33, 'Pénétrations étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'TOITURE', 34, 'Écran sous-toiture présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'TOITURE', 35, 'Ventilation toiture adéquate (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'TOITURE', 36, 'Liteaux/chevrons conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'TOITURE', 37, 'Crochets inox conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'TOITURE', 38, 'Respect poids admissible toiture (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'TOITURE', 39, 'Cheminements sécurisés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'TOITURE', 40, 'Dispositifs antichute présents (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'TOITURE', 41, 'Jonctions tuiles/modules étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Julien Vaudin' LIMIT 1) LIMIT 1),
  'TOITURE', 42, 'Respect DTU série 40 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 13: EARL CADOT (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'EARL CADOT' LIMIT 1),
  3, 3,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL CADOT' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL CADOT' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL CADOT' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL CADOT' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL CADOT' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL CADOT' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL CADOT' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL CADOT' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL CADOT' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL CADOT' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL CADOT' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL CADOT' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL CADOT' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL CADOT' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL CADOT' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL CADOT' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL CADOT' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL CADOT' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL CADOT' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL CADOT' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL CADOT' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL CADOT' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL CADOT' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL CADOT' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL CADOT' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL CADOT' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL CADOT' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL CADOT' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL CADOT' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL CADOT' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 14: HARAS DE LA MAJORIE/MANOHA (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'HARAS DE LA MAJORIE/MANOHA' LIMIT 1),
  3, 3,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HARAS DE LA MAJORIE/MANOHA' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HARAS DE LA MAJORIE/MANOHA' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HARAS DE LA MAJORIE/MANOHA' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HARAS DE LA MAJORIE/MANOHA' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HARAS DE LA MAJORIE/MANOHA' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HARAS DE LA MAJORIE/MANOHA' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HARAS DE LA MAJORIE/MANOHA' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HARAS DE LA MAJORIE/MANOHA' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HARAS DE LA MAJORIE/MANOHA' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HARAS DE LA MAJORIE/MANOHA' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HARAS DE LA MAJORIE/MANOHA' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HARAS DE LA MAJORIE/MANOHA' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HARAS DE LA MAJORIE/MANOHA' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HARAS DE LA MAJORIE/MANOHA' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HARAS DE LA MAJORIE/MANOHA' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HARAS DE LA MAJORIE/MANOHA' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HARAS DE LA MAJORIE/MANOHA' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HARAS DE LA MAJORIE/MANOHA' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HARAS DE LA MAJORIE/MANOHA' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HARAS DE LA MAJORIE/MANOHA' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HARAS DE LA MAJORIE/MANOHA' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HARAS DE LA MAJORIE/MANOHA' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HARAS DE LA MAJORIE/MANOHA' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HARAS DE LA MAJORIE/MANOHA' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HARAS DE LA MAJORIE/MANOHA' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HARAS DE LA MAJORIE/MANOHA' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HARAS DE LA MAJORIE/MANOHA' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HARAS DE LA MAJORIE/MANOHA' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HARAS DE LA MAJORIE/MANOHA' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HARAS DE LA MAJORIE/MANOHA' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 15: Serge Maltaverne (TOITURE)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1),
  3, 3,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'TOITURE', 31, 'DTU 40.35 respecté (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'TOITURE', 32, 'Étanchéité toiture conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'TOITURE', 33, 'Pénétrations étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'TOITURE', 34, 'Écran sous-toiture présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'TOITURE', 35, 'Ventilation toiture adéquate (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'TOITURE', 36, 'Liteaux/chevrons conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'TOITURE', 37, 'Crochets inox conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'TOITURE', 38, 'Respect poids admissible toiture (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'TOITURE', 39, 'Cheminements sécurisés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'TOITURE', 40, 'Dispositifs antichute présents (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'TOITURE', 41, 'Jonctions tuiles/modules étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Serge Maltaverne' LIMIT 1) LIMIT 1),
  'TOITURE', 42, 'Respect DTU série 40 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 16: Hangar Eric LOGNON (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Hangar Eric LOGNON' LIMIT 1),
  3, 3,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Eric LOGNON' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Eric LOGNON' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Eric LOGNON' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Eric LOGNON' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Eric LOGNON' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Eric LOGNON' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Eric LOGNON' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Eric LOGNON' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Eric LOGNON' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Eric LOGNON' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Eric LOGNON' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Eric LOGNON' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Eric LOGNON' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Eric LOGNON' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Eric LOGNON' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Eric LOGNON' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Eric LOGNON' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Eric LOGNON' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Eric LOGNON' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Eric LOGNON' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Eric LOGNON' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Eric LOGNON' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Eric LOGNON' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Eric LOGNON' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Eric LOGNON' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Eric LOGNON' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Eric LOGNON' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Eric LOGNON' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Eric LOGNON' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Eric LOGNON' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 17: Hangar Benjamin CHASSON (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Hangar Benjamin CHASSON' LIMIT 1),
  3, 3,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Benjamin CHASSON' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Benjamin CHASSON' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Benjamin CHASSON' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Benjamin CHASSON' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Benjamin CHASSON' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Benjamin CHASSON' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Benjamin CHASSON' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Benjamin CHASSON' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Benjamin CHASSON' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Benjamin CHASSON' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Benjamin CHASSON' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Benjamin CHASSON' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Benjamin CHASSON' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Benjamin CHASSON' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Benjamin CHASSON' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Benjamin CHASSON' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Benjamin CHASSON' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Benjamin CHASSON' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Benjamin CHASSON' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Benjamin CHASSON' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Benjamin CHASSON' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Benjamin CHASSON' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Benjamin CHASSON' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Benjamin CHASSON' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Benjamin CHASSON' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Benjamin CHASSON' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Benjamin CHASSON' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Benjamin CHASSON' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Benjamin CHASSON' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Benjamin CHASSON' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- ====== CADENET (10 missions) ======

-- Mission 18: Hangar Laurent ROUX (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1),
  4, 4,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 19: Hangar Laurent ROUX (TOITURE)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1),
  4, 4,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'TOITURE', 31, 'DTU 40.35 respecté (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'TOITURE', 32, 'Étanchéité toiture conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'TOITURE', 33, 'Pénétrations étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'TOITURE', 34, 'Écran sous-toiture présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'TOITURE', 35, 'Ventilation toiture adéquate (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'TOITURE', 36, 'Liteaux/chevrons conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'TOITURE', 37, 'Crochets inox conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'TOITURE', 38, 'Respect poids admissible toiture (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'TOITURE', 39, 'Cheminements sécurisés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'TOITURE', 40, 'Dispositifs antichute présents (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'TOITURE', 41, 'Jonctions tuiles/modules étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Laurent ROUX' LIMIT 1) LIMIT 1),
  'TOITURE', 42, 'Respect DTU série 40 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 20: Hangar Bernard MAGE (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Hangar Bernard MAGE' LIMIT 1),
  4, 4,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Bernard MAGE' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Bernard MAGE' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Bernard MAGE' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Bernard MAGE' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Bernard MAGE' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Bernard MAGE' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Bernard MAGE' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Bernard MAGE' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Bernard MAGE' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Bernard MAGE' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Bernard MAGE' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Bernard MAGE' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Bernard MAGE' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Bernard MAGE' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Bernard MAGE' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Bernard MAGE' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Bernard MAGE' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Bernard MAGE' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Bernard MAGE' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Bernard MAGE' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Bernard MAGE' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Bernard MAGE' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Bernard MAGE' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Bernard MAGE' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Bernard MAGE' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Bernard MAGE' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Bernard MAGE' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Bernard MAGE' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Bernard MAGE' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Bernard MAGE' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 21: Hangar Frederic Sinaud (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1),
  4, 4,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 22: Hangar Frederic Sinaud (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1),
  4, 4,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frederic Sinaud' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 23: MARTEL 184 Construction (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'MARTEL 184 Construction' LIMIT 1),
  4, 4,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 184 Construction' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 184 Construction' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 184 Construction' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 184 Construction' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 184 Construction' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 184 Construction' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 184 Construction' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 184 Construction' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 184 Construction' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 184 Construction' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 184 Construction' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 184 Construction' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 184 Construction' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 184 Construction' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 184 Construction' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 184 Construction' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 184 Construction' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 184 Construction' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 184 Construction' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 184 Construction' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 184 Construction' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 184 Construction' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 184 Construction' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 184 Construction' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 184 Construction' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 184 Construction' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 184 Construction' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 184 Construction' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 184 Construction' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 184 Construction' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 24: BOUCHARDY 203 LOC (TOITURE)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1),
  4, 4,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 31, 'DTU 40.35 respecté (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 32, 'Étanchéité toiture conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 33, 'Pénétrations étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 34, 'Écran sous-toiture présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 35, 'Ventilation toiture adéquate (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 36, 'Liteaux/chevrons conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 37, 'Crochets inox conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 38, 'Respect poids admissible toiture (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 39, 'Cheminements sécurisés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 40, 'Dispositifs antichute présents (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 41, 'Jonctions tuiles/modules étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOUCHARDY 203 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 42, 'Respect DTU série 40 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 25: BOULOIR 206 LOC (TOITURE)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1),
  4, 4,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 31, 'DTU 40.35 respecté (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 32, 'Étanchéité toiture conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 33, 'Pénétrations étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 34, 'Écran sous-toiture présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 35, 'Ventilation toiture adéquate (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 36, 'Liteaux/chevrons conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 37, 'Crochets inox conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 38, 'Respect poids admissible toiture (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 39, 'Cheminements sécurisés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 40, 'Dispositifs antichute présents (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 41, 'Jonctions tuiles/modules étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'BOULOIR 206 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 42, 'Respect DTU série 40 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 26: MARTEL 183 LOC (TOITURE)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1),
  4, 4,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 31, 'DTU 40.35 respecté (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 32, 'Étanchéité toiture conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 33, 'Pénétrations étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 34, 'Écran sous-toiture présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 35, 'Ventilation toiture adéquate (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 36, 'Liteaux/chevrons conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 37, 'Crochets inox conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 38, 'Respect poids admissible toiture (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 39, 'Cheminements sécurisés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 40, 'Dispositifs antichute présents (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 41, 'Jonctions tuiles/modules étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MARTEL 183 LOC' LIMIT 1) LIMIT 1),
  'TOITURE', 42, 'Respect DTU série 40 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 27: Hangar Fabrice COMBY (TOITURE)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1),
  4, 4,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'TOITURE', 31, 'DTU 40.35 respecté (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'TOITURE', 32, 'Étanchéité toiture conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'TOITURE', 33, 'Pénétrations étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'TOITURE', 34, 'Écran sous-toiture présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'TOITURE', 35, 'Ventilation toiture adéquate (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'TOITURE', 36, 'Liteaux/chevrons conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'TOITURE', 37, 'Crochets inox conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'TOITURE', 38, 'Respect poids admissible toiture (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'TOITURE', 39, 'Cheminements sécurisés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'TOITURE', 40, 'Dispositifs antichute présents (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'TOITURE', 41, 'Jonctions tuiles/modules étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Fabrice COMBY' LIMIT 1) LIMIT 1),
  'TOITURE', 42, 'Respect DTU série 40 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- ====== DIAGPV (18 missions) ======

-- Mission 28: Antunez - SCI ANAUJA (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Antunez - SCI ANAUJA' LIMIT 1),
  5, 5,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Antunez - SCI ANAUJA' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Antunez - SCI ANAUJA' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Antunez - SCI ANAUJA' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Antunez - SCI ANAUJA' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Antunez - SCI ANAUJA' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Antunez - SCI ANAUJA' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Antunez - SCI ANAUJA' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Antunez - SCI ANAUJA' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Antunez - SCI ANAUJA' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Antunez - SCI ANAUJA' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Antunez - SCI ANAUJA' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Antunez - SCI ANAUJA' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Antunez - SCI ANAUJA' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Antunez - SCI ANAUJA' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Antunez - SCI ANAUJA' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Antunez - SCI ANAUJA' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Antunez - SCI ANAUJA' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Antunez - SCI ANAUJA' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Antunez - SCI ANAUJA' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Antunez - SCI ANAUJA' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Antunez - SCI ANAUJA' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Antunez - SCI ANAUJA' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Antunez - SCI ANAUJA' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Antunez - SCI ANAUJA' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Antunez - SCI ANAUJA' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Antunez - SCI ANAUJA' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Antunez - SCI ANAUJA' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Antunez - SCI ANAUJA' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Antunez - SCI ANAUJA' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Antunez - SCI ANAUJA' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 29: Hangar Joris SAINT MARTIN (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Hangar Joris SAINT MARTIN' LIMIT 1),
  5, 5,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Joris SAINT MARTIN' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Joris SAINT MARTIN' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Joris SAINT MARTIN' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Joris SAINT MARTIN' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Joris SAINT MARTIN' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Joris SAINT MARTIN' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Joris SAINT MARTIN' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Joris SAINT MARTIN' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Joris SAINT MARTIN' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Joris SAINT MARTIN' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Joris SAINT MARTIN' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Joris SAINT MARTIN' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Joris SAINT MARTIN' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Joris SAINT MARTIN' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Joris SAINT MARTIN' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Joris SAINT MARTIN' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Joris SAINT MARTIN' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Joris SAINT MARTIN' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Joris SAINT MARTIN' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Joris SAINT MARTIN' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Joris SAINT MARTIN' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Joris SAINT MARTIN' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Joris SAINT MARTIN' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Joris SAINT MARTIN' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Joris SAINT MARTIN' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Joris SAINT MARTIN' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Joris SAINT MARTIN' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Joris SAINT MARTIN' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Joris SAINT MARTIN' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Joris SAINT MARTIN' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 30: EARL GOUNY (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'EARL GOUNY' LIMIT 1),
  5, 5,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL GOUNY' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL GOUNY' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL GOUNY' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL GOUNY' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL GOUNY' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL GOUNY' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL GOUNY' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL GOUNY' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL GOUNY' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL GOUNY' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL GOUNY' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL GOUNY' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL GOUNY' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL GOUNY' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL GOUNY' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL GOUNY' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL GOUNY' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL GOUNY' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL GOUNY' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL GOUNY' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL GOUNY' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL GOUNY' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL GOUNY' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL GOUNY' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL GOUNY' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL GOUNY' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL GOUNY' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL GOUNY' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL GOUNY' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'EARL GOUNY' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 31: Hangar Pierre MOURGUES (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Hangar Pierre MOURGUES' LIMIT 1),
  5, 5,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Pierre MOURGUES' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Pierre MOURGUES' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Pierre MOURGUES' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Pierre MOURGUES' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Pierre MOURGUES' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Pierre MOURGUES' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Pierre MOURGUES' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Pierre MOURGUES' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Pierre MOURGUES' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Pierre MOURGUES' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Pierre MOURGUES' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Pierre MOURGUES' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Pierre MOURGUES' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Pierre MOURGUES' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Pierre MOURGUES' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Pierre MOURGUES' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Pierre MOURGUES' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Pierre MOURGUES' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Pierre MOURGUES' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Pierre MOURGUES' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Pierre MOURGUES' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Pierre MOURGUES' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Pierre MOURGUES' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Pierre MOURGUES' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Pierre MOURGUES' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Pierre MOURGUES' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Pierre MOURGUES' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Pierre MOURGUES' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Pierre MOURGUES' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Pierre MOURGUES' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 32: Hangar Christophe CARRERE n°2 (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Hangar Christophe CARRERE n°2' LIMIT 1),
  5, 5,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Christophe CARRERE n°2' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Christophe CARRERE n°2' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Christophe CARRERE n°2' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Christophe CARRERE n°2' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Christophe CARRERE n°2' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Christophe CARRERE n°2' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Christophe CARRERE n°2' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Christophe CARRERE n°2' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Christophe CARRERE n°2' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Christophe CARRERE n°2' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Christophe CARRERE n°2' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Christophe CARRERE n°2' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Christophe CARRERE n°2' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Christophe CARRERE n°2' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Christophe CARRERE n°2' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Christophe CARRERE n°2' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Christophe CARRERE n°2' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Christophe CARRERE n°2' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Christophe CARRERE n°2' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Christophe CARRERE n°2' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Christophe CARRERE n°2' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Christophe CARRERE n°2' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Christophe CARRERE n°2' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Christophe CARRERE n°2' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Christophe CARRERE n°2' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Christophe CARRERE n°2' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Christophe CARRERE n°2' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Christophe CARRERE n°2' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Christophe CARRERE n°2' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Christophe CARRERE n°2' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 33: Azemar (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Azemar' LIMIT 1),
  5, 5,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Azemar' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Azemar' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Azemar' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Azemar' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Azemar' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Azemar' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Azemar' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Azemar' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Azemar' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Azemar' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Azemar' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Azemar' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Azemar' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Azemar' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Azemar' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Azemar' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Azemar' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Azemar' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Azemar' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Azemar' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Azemar' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Azemar' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Azemar' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Azemar' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Azemar' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Azemar' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Azemar' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Azemar' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Azemar' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Azemar' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 34: Hangar Frédéric CASTET (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1),
  5, 5,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 35: Hangar Frédéric CASTET (TOITURE)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1),
  5, 5,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'TOITURE', 31, 'DTU 40.35 respecté (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'TOITURE', 32, 'Étanchéité toiture conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'TOITURE', 33, 'Pénétrations étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'TOITURE', 34, 'Écran sous-toiture présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'TOITURE', 35, 'Ventilation toiture adéquate (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'TOITURE', 36, 'Liteaux/chevrons conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'TOITURE', 37, 'Crochets inox conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'TOITURE', 38, 'Respect poids admissible toiture (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'TOITURE', 39, 'Cheminements sécurisés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'TOITURE', 40, 'Dispositifs antichute présents (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'TOITURE', 41, 'Jonctions tuiles/modules étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Frédéric CASTET' LIMIT 1) LIMIT 1),
  'TOITURE', 42, 'Respect DTU série 40 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 36: Hangar Sebastien RUDELLE (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Hangar Sebastien RUDELLE' LIMIT 1),
  5, 5,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Sebastien RUDELLE' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Sebastien RUDELLE' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Sebastien RUDELLE' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Sebastien RUDELLE' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Sebastien RUDELLE' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Sebastien RUDELLE' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Sebastien RUDELLE' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Sebastien RUDELLE' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Sebastien RUDELLE' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Sebastien RUDELLE' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Sebastien RUDELLE' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Sebastien RUDELLE' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Sebastien RUDELLE' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Sebastien RUDELLE' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Sebastien RUDELLE' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Sebastien RUDELLE' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Sebastien RUDELLE' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Sebastien RUDELLE' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Sebastien RUDELLE' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Sebastien RUDELLE' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Sebastien RUDELLE' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Sebastien RUDELLE' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Sebastien RUDELLE' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Sebastien RUDELLE' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Sebastien RUDELLE' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Sebastien RUDELLE' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Sebastien RUDELLE' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Sebastien RUDELLE' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Sebastien RUDELLE' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Sebastien RUDELLE' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 37: Hangar Richard VAN ZANTEN (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Hangar Richard VAN ZANTEN' LIMIT 1),
  5, 5,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Richard VAN ZANTEN' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Richard VAN ZANTEN' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Richard VAN ZANTEN' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Richard VAN ZANTEN' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Richard VAN ZANTEN' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Richard VAN ZANTEN' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Richard VAN ZANTEN' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Richard VAN ZANTEN' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Richard VAN ZANTEN' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Richard VAN ZANTEN' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Richard VAN ZANTEN' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Richard VAN ZANTEN' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Richard VAN ZANTEN' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Richard VAN ZANTEN' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Richard VAN ZANTEN' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Richard VAN ZANTEN' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Richard VAN ZANTEN' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Richard VAN ZANTEN' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Richard VAN ZANTEN' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Richard VAN ZANTEN' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Richard VAN ZANTEN' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Richard VAN ZANTEN' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Richard VAN ZANTEN' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Richard VAN ZANTEN' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Richard VAN ZANTEN' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Richard VAN ZANTEN' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Richard VAN ZANTEN' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Richard VAN ZANTEN' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Richard VAN ZANTEN' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Richard VAN ZANTEN' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 38: Hangar Yannick CLEMENT (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Hangar Yannick CLEMENT' LIMIT 1),
  5, 5,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Yannick CLEMENT' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Yannick CLEMENT' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Yannick CLEMENT' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Yannick CLEMENT' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Yannick CLEMENT' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Yannick CLEMENT' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Yannick CLEMENT' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Yannick CLEMENT' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Yannick CLEMENT' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Yannick CLEMENT' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Yannick CLEMENT' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Yannick CLEMENT' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Yannick CLEMENT' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Yannick CLEMENT' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Yannick CLEMENT' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Yannick CLEMENT' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Yannick CLEMENT' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Yannick CLEMENT' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Yannick CLEMENT' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Yannick CLEMENT' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Yannick CLEMENT' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Yannick CLEMENT' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Yannick CLEMENT' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Yannick CLEMENT' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Yannick CLEMENT' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Yannick CLEMENT' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Yannick CLEMENT' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Yannick CLEMENT' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Yannick CLEMENT' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Yannick CLEMENT' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 39: Hangar Maxime Bayle (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Hangar Maxime Bayle' LIMIT 1),
  5, 5,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Maxime Bayle' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Maxime Bayle' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Maxime Bayle' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Maxime Bayle' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Maxime Bayle' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Maxime Bayle' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Maxime Bayle' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Maxime Bayle' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Maxime Bayle' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Maxime Bayle' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Maxime Bayle' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Maxime Bayle' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Maxime Bayle' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Maxime Bayle' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Maxime Bayle' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Maxime Bayle' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Maxime Bayle' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Maxime Bayle' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Maxime Bayle' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Maxime Bayle' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Maxime Bayle' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Maxime Bayle' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Maxime Bayle' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Maxime Bayle' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Maxime Bayle' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Maxime Bayle' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Maxime Bayle' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Maxime Bayle' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Maxime Bayle' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Maxime Bayle' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 40: MATHIEU Vincent (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'MATHIEU Vincent' LIMIT 1),
  5, 5,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MATHIEU Vincent' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MATHIEU Vincent' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MATHIEU Vincent' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MATHIEU Vincent' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MATHIEU Vincent' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MATHIEU Vincent' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MATHIEU Vincent' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MATHIEU Vincent' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MATHIEU Vincent' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MATHIEU Vincent' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MATHIEU Vincent' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MATHIEU Vincent' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MATHIEU Vincent' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MATHIEU Vincent' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MATHIEU Vincent' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MATHIEU Vincent' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MATHIEU Vincent' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MATHIEU Vincent' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MATHIEU Vincent' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MATHIEU Vincent' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MATHIEU Vincent' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MATHIEU Vincent' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MATHIEU Vincent' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MATHIEU Vincent' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MATHIEU Vincent' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MATHIEU Vincent' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MATHIEU Vincent' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MATHIEU Vincent' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MATHIEU Vincent' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'MATHIEU Vincent' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 41: HANGAR Christian MIGNARD (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'HANGAR Christian MIGNARD' LIMIT 1),
  5, 5,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Christian MIGNARD' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Christian MIGNARD' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Christian MIGNARD' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Christian MIGNARD' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Christian MIGNARD' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Christian MIGNARD' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Christian MIGNARD' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Christian MIGNARD' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Christian MIGNARD' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Christian MIGNARD' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Christian MIGNARD' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Christian MIGNARD' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Christian MIGNARD' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Christian MIGNARD' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Christian MIGNARD' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Christian MIGNARD' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Christian MIGNARD' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Christian MIGNARD' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Christian MIGNARD' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Christian MIGNARD' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Christian MIGNARD' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Christian MIGNARD' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Christian MIGNARD' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Christian MIGNARD' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Christian MIGNARD' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Christian MIGNARD' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Christian MIGNARD' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Christian MIGNARD' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Christian MIGNARD' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Christian MIGNARD' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 42: Burgat Et Fils Tp (TOITURE)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1),
  5, 5,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'TOITURE', 31, 'DTU 40.35 respecté (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'TOITURE', 32, 'Étanchéité toiture conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'TOITURE', 33, 'Pénétrations étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'TOITURE', 34, 'Écran sous-toiture présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'TOITURE', 35, 'Ventilation toiture adéquate (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'TOITURE', 36, 'Liteaux/chevrons conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'TOITURE', 37, 'Crochets inox conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'TOITURE', 38, 'Respect poids admissible toiture (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'TOITURE', 39, 'Cheminements sécurisés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'TOITURE', 40, 'Dispositifs antichute présents (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'TOITURE', 41, 'Jonctions tuiles/modules étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Burgat Et Fils Tp' LIMIT 1) LIMIT 1),
  'TOITURE', 42, 'Respect DTU série 40 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 43: GFA LASCOMBES - ANTOINE MICOULEAU (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'GFA LASCOMBES - ANTOINE MICOULEAU' LIMIT 1),
  5, 5,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GFA LASCOMBES - ANTOINE MICOULEAU' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GFA LASCOMBES - ANTOINE MICOULEAU' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GFA LASCOMBES - ANTOINE MICOULEAU' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GFA LASCOMBES - ANTOINE MICOULEAU' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GFA LASCOMBES - ANTOINE MICOULEAU' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GFA LASCOMBES - ANTOINE MICOULEAU' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GFA LASCOMBES - ANTOINE MICOULEAU' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GFA LASCOMBES - ANTOINE MICOULEAU' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GFA LASCOMBES - ANTOINE MICOULEAU' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GFA LASCOMBES - ANTOINE MICOULEAU' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GFA LASCOMBES - ANTOINE MICOULEAU' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GFA LASCOMBES - ANTOINE MICOULEAU' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GFA LASCOMBES - ANTOINE MICOULEAU' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GFA LASCOMBES - ANTOINE MICOULEAU' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GFA LASCOMBES - ANTOINE MICOULEAU' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GFA LASCOMBES - ANTOINE MICOULEAU' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GFA LASCOMBES - ANTOINE MICOULEAU' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GFA LASCOMBES - ANTOINE MICOULEAU' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GFA LASCOMBES - ANTOINE MICOULEAU' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GFA LASCOMBES - ANTOINE MICOULEAU' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GFA LASCOMBES - ANTOINE MICOULEAU' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GFA LASCOMBES - ANTOINE MICOULEAU' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GFA LASCOMBES - ANTOINE MICOULEAU' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GFA LASCOMBES - ANTOINE MICOULEAU' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GFA LASCOMBES - ANTOINE MICOULEAU' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GFA LASCOMBES - ANTOINE MICOULEAU' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GFA LASCOMBES - ANTOINE MICOULEAU' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GFA LASCOMBES - ANTOINE MICOULEAU' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GFA LASCOMBES - ANTOINE MICOULEAU' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'GFA LASCOMBES - ANTOINE MICOULEAU' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 44: Commune De Pomas (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Commune De Pomas' LIMIT 1),
  5, 5,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Commune De Pomas' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Commune De Pomas' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Commune De Pomas' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Commune De Pomas' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Commune De Pomas' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Commune De Pomas' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Commune De Pomas' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Commune De Pomas' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Commune De Pomas' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Commune De Pomas' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Commune De Pomas' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Commune De Pomas' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Commune De Pomas' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Commune De Pomas' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Commune De Pomas' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Commune De Pomas' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Commune De Pomas' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Commune De Pomas' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Commune De Pomas' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Commune De Pomas' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Commune De Pomas' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Commune De Pomas' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Commune De Pomas' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Commune De Pomas' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Commune De Pomas' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Commune De Pomas' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Commune De Pomas' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Commune De Pomas' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Commune De Pomas' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Commune De Pomas' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 45: TOURNIER (TOITURE)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1),
  5, 5,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'TOITURE', 31, 'DTU 40.35 respecté (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'TOITURE', 32, 'Étanchéité toiture conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'TOITURE', 33, 'Pénétrations étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'TOITURE', 34, 'Écran sous-toiture présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'TOITURE', 35, 'Ventilation toiture adéquate (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'TOITURE', 36, 'Liteaux/chevrons conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'TOITURE', 37, 'Crochets inox conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'TOITURE', 38, 'Respect poids admissible toiture (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'TOITURE', 39, 'Cheminements sécurisés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'TOITURE', 40, 'Dispositifs antichute présents (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'TOITURE', 41, 'Jonctions tuiles/modules étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'TOURNIER' LIMIT 1) LIMIT 1),
  'TOITURE', 42, 'Respect DTU série 40 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- ====== EDOUARD (7 missions) ======

-- Mission 46: Concept-TY Chambray 2 (TOITURE)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1),
  6, 6,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'TOITURE', 31, 'DTU 40.35 respecté (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'TOITURE', 32, 'Étanchéité toiture conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'TOITURE', 33, 'Pénétrations étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'TOITURE', 34, 'Écran sous-toiture présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'TOITURE', 35, 'Ventilation toiture adéquate (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'TOITURE', 36, 'Liteaux/chevrons conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'TOITURE', 37, 'Crochets inox conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'TOITURE', 38, 'Respect poids admissible toiture (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'TOITURE', 39, 'Cheminements sécurisés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'TOITURE', 40, 'Dispositifs antichute présents (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'TOITURE', 41, 'Jonctions tuiles/modules étanches (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Concept-TY Chambray 2' LIMIT 1) LIMIT 1),
  'TOITURE', 42, 'Respect DTU série 40 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 47: HANGAR Gérald Guillet (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'HANGAR Gérald Guillet' LIMIT 1),
  6, 6,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Gérald Guillet' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Gérald Guillet' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Gérald Guillet' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Gérald Guillet' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Gérald Guillet' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Gérald Guillet' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Gérald Guillet' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Gérald Guillet' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Gérald Guillet' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Gérald Guillet' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Gérald Guillet' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Gérald Guillet' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Gérald Guillet' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Gérald Guillet' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Gérald Guillet' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Gérald Guillet' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Gérald Guillet' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Gérald Guillet' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Gérald Guillet' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Gérald Guillet' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Gérald Guillet' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Gérald Guillet' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Gérald Guillet' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Gérald Guillet' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Gérald Guillet' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Gérald Guillet' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Gérald Guillet' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Gérald Guillet' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Gérald Guillet' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'HANGAR Gérald Guillet' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 48: VIEL (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'VIEL' LIMIT 1),
  6, 6,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'VIEL' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'VIEL' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'VIEL' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'VIEL' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'VIEL' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'VIEL' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'VIEL' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'VIEL' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'VIEL' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'VIEL' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'VIEL' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'VIEL' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'VIEL' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'VIEL' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'VIEL' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'VIEL' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'VIEL' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'VIEL' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'VIEL' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'VIEL' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'VIEL' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'VIEL' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'VIEL' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'VIEL' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'VIEL' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'VIEL' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'VIEL' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'VIEL' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'VIEL' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'VIEL' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 49: Hangar Karl Biteau (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Hangar Karl Biteau' LIMIT 1),
  6, 6,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Karl Biteau' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Karl Biteau' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Karl Biteau' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Karl Biteau' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Karl Biteau' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Karl Biteau' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Karl Biteau' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Karl Biteau' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Karl Biteau' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Karl Biteau' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Karl Biteau' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Karl Biteau' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Karl Biteau' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Karl Biteau' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Karl Biteau' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Karl Biteau' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Karl Biteau' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Karl Biteau' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Karl Biteau' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Karl Biteau' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Karl Biteau' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Karl Biteau' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Karl Biteau' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Karl Biteau' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Karl Biteau' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Karl Biteau' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Karl Biteau' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Karl Biteau' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Karl Biteau' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Karl Biteau' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 50: Bourgeois (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Bourgeois' LIMIT 1),
  6, 6,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Bourgeois' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Bourgeois' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Bourgeois' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Bourgeois' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Bourgeois' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Bourgeois' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Bourgeois' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Bourgeois' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Bourgeois' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Bourgeois' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Bourgeois' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Bourgeois' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Bourgeois' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Bourgeois' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Bourgeois' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Bourgeois' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Bourgeois' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Bourgeois' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Bourgeois' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Bourgeois' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Bourgeois' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Bourgeois' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Bourgeois' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Bourgeois' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Bourgeois' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Bourgeois' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Bourgeois' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Bourgeois' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Bourgeois' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Bourgeois' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 51: Cheraud (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Cheraud' LIMIT 1),
  6, 6,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Cheraud' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Cheraud' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Cheraud' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Cheraud' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Cheraud' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Cheraud' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Cheraud' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Cheraud' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Cheraud' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Cheraud' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Cheraud' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Cheraud' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Cheraud' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Cheraud' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Cheraud' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Cheraud' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Cheraud' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Cheraud' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Cheraud' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Cheraud' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Cheraud' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Cheraud' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Cheraud' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Cheraud' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Cheraud' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Cheraud' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Cheraud' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Cheraud' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Cheraud' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Cheraud' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

-- Mission 52: Hangar Renaud Sonnard (SOL)
INSERT OR IGNORE INTO ordres_mission (
  centrale_id, technicien_id, sous_traitant_id,
  date_mission, statut, checklist_generee
) VALUES (
  (SELECT id FROM centrales WHERE nom = 'Hangar Renaud Sonnard' LIMIT 1),
  6, 6,
  date('now', '+7 days'), 'PLANIFIE', 1
);

INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Renaud Sonnard' LIMIT 1) LIMIT 1),
  'DOC', 1, 'NF C 15-100 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Renaud Sonnard' LIMIT 1) LIMIT 1),
  'DOC', 2, 'UTE C 15-712 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Renaud Sonnard' LIMIT 1) LIMIT 1),
  'DOC', 3, 'DTU 40.35 (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Renaud Sonnard' LIMIT 1) LIMIT 1),
  'DOC', 4, 'Respect ETN', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Renaud Sonnard' LIMIT 1) LIMIT 1),
  'DOC', 5, 'Bonnes pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Renaud Sonnard' LIMIT 1) LIMIT 1),
  'DOC', 6, 'Mauvaises pratiques constatées (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Renaud Sonnard' LIMIT 1) LIMIT 1),
  'ELEC', 7, 'Autocontrôle présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Renaud Sonnard' LIMIT 1) LIMIT 1),
  'ELEC', 8, 'PV réception lot PV présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Renaud Sonnard' LIMIT 1) LIMIT 1),
  'ELEC', 9, 'CR visite chantier présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Renaud Sonnard' LIMIT 1) LIMIT 1),
  'ELEC', 10, 'Tranchées respectent CDC GIRASOLE (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Renaud Sonnard' LIMIT 1) LIMIT 1),
  'ELEC', 11, 'Documents GIRASOLE signalent écarts (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Renaud Sonnard' LIMIT 1) LIMIT 1),
  'ELEC', 12, 'Mise à la terre conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Renaud Sonnard' LIMIT 1) LIMIT 1),
  'ELEC', 13, 'Schéma électrique présent (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Renaud Sonnard' LIMIT 1) LIMIT 1),
  'ELEC', 14, 'Étiquetage câbles conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Renaud Sonnard' LIMIT 1) LIMIT 1),
  'TABLEAUX', 15, 'Coffret AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Renaud Sonnard' LIMIT 1) LIMIT 1),
  'TABLEAUX', 16, 'Coffret DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Renaud Sonnard' LIMIT 1) LIMIT 1),
  'TABLEAUX', 17, 'Protection foudre présente (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Renaud Sonnard' LIMIT 1) LIMIT 1),
  'TABLEAUX', 18, 'Disjoncteurs dimensionnés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Renaud Sonnard' LIMIT 1) LIMIT 1),
  'CABLAGE', 19, 'Section câbles DC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Renaud Sonnard' LIMIT 1) LIMIT 1),
  'CABLAGE', 20, 'Section câbles AC conforme (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Renaud Sonnard' LIMIT 1) LIMIT 1),
  'CABLAGE', 21, 'Connecteurs MC4 serrés (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Renaud Sonnard' LIMIT 1) LIMIT 1),
  'CABLAGE', 22, 'Passage câbles protégé (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Renaud Sonnard' LIMIT 1) LIMIT 1),
  'MODULES', 23, 'État visuel modules (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Renaud Sonnard' LIMIT 1) LIMIT 1),
  'MODULES', 24, 'Fixations modules conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Renaud Sonnard' LIMIT 1) LIMIT 1),
  'MODULES', 25, 'Orientation optimale (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Renaud Sonnard' LIMIT 1) LIMIT 1),
  'MODULES', 26, 'Absence d''ombrages (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Renaud Sonnard' LIMIT 1) LIMIT 1),
  'STRUCTURES', 27, 'Fondations stables (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Renaud Sonnard' LIMIT 1) LIMIT 1),
  'STRUCTURES', 28, 'Structures métalliques conformes (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Renaud Sonnard' LIMIT 1) LIMIT 1),
  'STRUCTURES', 29, 'Boulonnerie serrée (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);
INSERT INTO checklist_items (
  ordre_mission_id, categorie, item_numero, item_texte,
  statut, input_type
) VALUES (
  (SELECT id FROM ordres_mission WHERE centrale_id = (SELECT id FROM centrales WHERE nom = 'Hangar Renaud Sonnard' LIMIT 1) LIMIT 1),
  'STRUCTURES', 30, 'Absence de corrosion (O/N)', 'NON_VERIFIE', 'CHECKBOX'
);

PRAGMA foreign_keys = ON;

-- RÉSUMÉ: 52 missions, 1716 items checklist