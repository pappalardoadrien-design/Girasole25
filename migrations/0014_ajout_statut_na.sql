-- Migration: Ajouter le statut 'NA' (Non Applicable) dans les checklists
-- Date: 2025-11-27
-- Description: Correction bug "N/A" button - Ajouter 'NA' dans la contrainte CHECK
-- Bug: CHECK constraint failed: statut IN ('CONFORME', 'NON_CONFORME', 'A_VERIFIER', 'NON_VERIFIE')
-- Solution: Recréer la table avec 'NA' ajouté

-- ============================================================================
-- ÉTAPE 1 : Créer une table temporaire avec la nouvelle contrainte
-- ============================================================================

CREATE TABLE checklist_items_new (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  ordre_mission_id INTEGER NOT NULL,
  categorie TEXT NOT NULL,
  item_numero INTEGER NOT NULL,
  item_texte TEXT NOT NULL,
  statut TEXT DEFAULT 'NON_VERIFIE' CHECK(statut IN ('CONFORME', 'NON_CONFORME', 'A_VERIFIER', 'NON_VERIFIE', 'NA')),
  conformite INTEGER,
  commentaire TEXT,
  photo_base64 TEXT,
  photo_filename TEXT,
  mesure_valeur REAL,
  mesure_unite TEXT,
  technicien_nom TEXT,
  date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
  date_modification DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (ordre_mission_id) REFERENCES ordres_mission(id) ON DELETE CASCADE
);

-- ============================================================================
-- ÉTAPE 2 : Copier les données existantes
-- ============================================================================

INSERT INTO checklist_items_new 
  (id, ordre_mission_id, categorie, item_numero, item_texte, statut, conformite, commentaire, photo_base64, photo_filename, mesure_valeur, mesure_unite, technicien_nom, date_creation, date_modification)
SELECT 
  id, ordre_mission_id, categorie, item_numero, item_texte, statut, conformite, commentaire, photo_base64, photo_filename, mesure_valeur, mesure_unite, technicien_nom, date_creation, date_modification
FROM checklist_items;

-- ============================================================================
-- ÉTAPE 3 : Supprimer l'ancienne table et renommer
-- ============================================================================

DROP TABLE checklist_items;
ALTER TABLE checklist_items_new RENAME TO checklist_items;

-- ============================================================================
-- ÉTAPE 4 : Recréer les indexes
-- ============================================================================

CREATE INDEX idx_checklist_mission ON checklist_items(ordre_mission_id);
CREATE INDEX idx_checklist_categorie ON checklist_items(categorie);
CREATE INDEX idx_checklist_statut ON checklist_items(statut);

-- ============================================================================
-- VÉRIFICATION
-- ============================================================================
-- SELECT COUNT(*) FROM checklist_items;
-- SELECT DISTINCT statut FROM checklist_items;
