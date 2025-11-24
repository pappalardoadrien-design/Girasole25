-- Migration: Fix Checklist Tables
-- Date: 2025-01-22  
-- Description: Drop existing tables and recreate correctly

-- Drop existing tables
DROP TABLE IF EXISTS audit_photos;
DROP TABLE IF EXISTS checklist_items;
DROP TABLE IF EXISTS retours_json;

-- Table Checklist Items
CREATE TABLE checklist_items (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  ordre_mission_id INTEGER NOT NULL,
  categorie TEXT NOT NULL,
  item_numero INTEGER NOT NULL,
  item_texte TEXT NOT NULL,
  statut TEXT DEFAULT 'NON_VERIFIE' CHECK(statut IN ('CONFORME', 'NON_CONFORME', 'A_VERIFIER', 'NON_VERIFIE')),
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

-- Table Photos Audit
CREATE TABLE audit_photos (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  ordre_mission_id INTEGER NOT NULL,
  checklist_item_id INTEGER,
  filename TEXT NOT NULL,
  url TEXT,
  blob_data TEXT,
  taille_bytes INTEGER,
  mime_type TEXT DEFAULT 'image/jpeg',
  latitude REAL,
  longitude REAL,
  date_prise DATETIME DEFAULT CURRENT_TIMESTAMP,
  legende TEXT,
  FOREIGN KEY (ordre_mission_id) REFERENCES ordres_mission(id) ON DELETE CASCADE,
  FOREIGN KEY (checklist_item_id) REFERENCES checklist_items(id) ON DELETE CASCADE
);

-- Table Retours JSON
CREATE TABLE retours_json (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  ordre_mission_id INTEGER NOT NULL,
  centrale_id INTEGER NOT NULL,
  technicien_id INTEGER NOT NULL,
  json_data TEXT NOT NULL,
  nb_photos INTEGER DEFAULT 0,
  taille_mo REAL DEFAULT 0,
  statut TEXT DEFAULT 'BROUILLON' CHECK(statut IN ('BROUILLON', 'ENVOYE', 'VALIDE', 'REJETE')),
  date_upload DATETIME DEFAULT CURRENT_TIMESTAMP,
  date_validation DATETIME,
  validateur_id INTEGER,
  commentaires_validateur TEXT,
  FOREIGN KEY (ordre_mission_id) REFERENCES ordres_mission(id) ON DELETE CASCADE,
  FOREIGN KEY (centrale_id) REFERENCES centrales(id) ON DELETE CASCADE,
  FOREIGN KEY (technicien_id) REFERENCES techniciens(id) ON DELETE CASCADE
);

-- Indexes
CREATE INDEX idx_checklist_mission ON checklist_items(ordre_mission_id);
CREATE INDEX idx_checklist_categorie ON checklist_items(categorie);
CREATE INDEX idx_checklist_statut ON checklist_items(statut);
CREATE INDEX idx_photos_mission ON audit_photos(ordre_mission_id);
CREATE INDEX idx_photos_checklist ON audit_photos(checklist_item_id);
CREATE INDEX idx_retours_mission ON retours_json(ordre_mission_id);
CREATE INDEX idx_retours_statut ON retours_json(statut);
