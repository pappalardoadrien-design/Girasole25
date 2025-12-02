-- ============================================================================
-- Migration 0020 : Fix statut 'N/A' → Accepter 'NA' sans slash
-- ============================================================================
-- Problème : Frontend envoie 'NA' mais CHECK constraint refuse
-- Solution : Recréer table avec contrainte correcte
-- ============================================================================

-- ÉTAPE 1 : Créer nouvelle table avec contrainte correcte
CREATE TABLE checklist_items_new (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  ordre_mission_id INTEGER NOT NULL,
  categorie TEXT NOT NULL,
  item_numero INTEGER NOT NULL,
  item_texte TEXT NOT NULL,
  statut TEXT DEFAULT 'NON_VERIFIE' CHECK(statut IN ('CONFORME', 'NON_CONFORME', 'A_VERIFIER', 'NON_VERIFIE', 'NA', 'N/A')),
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

-- ÉTAPE 2 : Copier toutes les données
INSERT INTO checklist_items_new 
SELECT * FROM checklist_items;

-- ÉTAPE 3 : Supprimer ancienne table
DROP TABLE checklist_items;

-- ÉTAPE 4 : Renommer nouvelle table
ALTER TABLE checklist_items_new RENAME TO checklist_items;

-- ÉTAPE 5 : Recréer index
CREATE INDEX IF NOT EXISTS idx_checklist_items_mission ON checklist_items(ordre_mission_id);
CREATE INDEX IF NOT EXISTS idx_checklist_items_statut ON checklist_items(statut);
