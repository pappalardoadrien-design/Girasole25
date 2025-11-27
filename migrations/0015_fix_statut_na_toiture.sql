-- Migration: Uniformiser le statut NA dans checklist_items_toiture
-- Date: 2025-11-27
-- Description: Remplacer 'N/A' par 'NA' pour uniformiser avec checklist_items
-- Bug: Incohérence entre 'N/A' (TOITURE) et 'NA' (SOL)

-- ============================================================================
-- ÉTAPE 1 : Créer une table temporaire avec la contrainte uniformisée
-- ============================================================================

CREATE TABLE checklist_items_toiture_new (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  ordre_mission_id INTEGER NOT NULL,
  item_numero INTEGER NOT NULL,
  libelle TEXT NOT NULL,
  categorie TEXT DEFAULT 'AUDIT_TOITURE',
  statut TEXT DEFAULT 'NON_VERIFIE' CHECK(statut IN ('NON_VERIFIE', 'CONFORME', 'NON_CONFORME', 'NA')),
  conformite TEXT,
  commentaire TEXT,
  technicien TEXT,
  date_verification DATETIME,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (ordre_mission_id) REFERENCES ordres_mission(id) ON DELETE CASCADE
);

-- ============================================================================
-- ÉTAPE 2 : Copier les données en remplaçant 'N/A' par 'NA'
-- ============================================================================

INSERT INTO checklist_items_toiture_new 
  (id, ordre_mission_id, item_numero, libelle, categorie, statut, conformite, commentaire, technicien, date_verification, created_at, updated_at)
SELECT 
  id, ordre_mission_id, item_numero, libelle, categorie, 
  CASE WHEN statut = 'N/A' THEN 'NA' ELSE statut END as statut,
  conformite, commentaire, technicien, date_verification, created_at, updated_at
FROM checklist_items_toiture;

-- ============================================================================
-- ÉTAPE 3 : Supprimer l'ancienne table et renommer
-- ============================================================================

DROP TABLE checklist_items_toiture;
ALTER TABLE checklist_items_toiture_new RENAME TO checklist_items_toiture;

-- ============================================================================
-- ÉTAPE 4 : Recréer les indexes et trigger
-- ============================================================================

CREATE INDEX IF NOT EXISTS idx_checklist_toiture_mission ON checklist_items_toiture(ordre_mission_id);
CREATE INDEX IF NOT EXISTS idx_checklist_toiture_statut ON checklist_items_toiture(statut);

CREATE TRIGGER IF NOT EXISTS update_checklist_toiture_timestamp 
AFTER UPDATE ON checklist_items_toiture
BEGIN
  UPDATE checklist_items_toiture SET updated_at = CURRENT_TIMESTAMP WHERE id = NEW.id;
END;

-- ============================================================================
-- VÉRIFICATION
-- ============================================================================
-- SELECT COUNT(*) FROM checklist_items_toiture;
-- SELECT DISTINCT statut FROM checklist_items_toiture;
