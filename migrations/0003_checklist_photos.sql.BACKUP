-- Migration: Module Checklist Audit avec Photos
-- Date: 2025-01-21
-- Description: Tables pour checklist terrain, photos, et retours audit

-- Table Checklist Items (points de contrôle)
CREATE TABLE IF NOT EXISTS checklist_items (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  mission_id INTEGER NOT NULL,
  categorie TEXT NOT NULL CHECK(categorie IN ('VISUEL', 'ELECTRIQUE', 'MECANIQUE', 'SECURITE', 'PERFORMANCE')),
  ordre INTEGER NOT NULL,
  titre TEXT NOT NULL,
  description TEXT,
  statut TEXT CHECK(statut IN ('CONFORME', 'NON_CONFORME', 'NA', 'PENDING')) DEFAULT 'PENDING',
  commentaire TEXT,
  date_verification DATETIME,
  FOREIGN KEY (mission_id) REFERENCES ordres_mission(id) ON DELETE CASCADE
);

-- Table Photos Audit
CREATE TABLE IF NOT EXISTS audit_photos (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  mission_id INTEGER NOT NULL,
  checklist_item_id INTEGER,
  filename TEXT NOT NULL,
  url TEXT,
  blob_data TEXT, -- Base64 si stockage local temporaire
  taille_bytes INTEGER,
  mime_type TEXT DEFAULT 'image/jpeg',
  latitude REAL,
  longitude REAL,
  date_prise DATETIME DEFAULT CURRENT_TIMESTAMP,
  legende TEXT,
  FOREIGN KEY (mission_id) REFERENCES ordres_mission(id) ON DELETE CASCADE,
  FOREIGN KEY (checklist_item_id) REFERENCES checklist_items(id) ON DELETE CASCADE
);

-- Table Retours JSON (consolidation finale)
CREATE TABLE IF NOT EXISTS retours_json (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  mission_id INTEGER NOT NULL,
  centrale_id INTEGER NOT NULL,
  technicien_id INTEGER NOT NULL,
  json_data TEXT NOT NULL, -- JSON complet checklist + métadonnées
  nb_photos INTEGER DEFAULT 0,
  taille_mo REAL DEFAULT 0,
  statut TEXT DEFAULT 'BROUILLON' CHECK(statut IN ('BROUILLON', 'ENVOYE', 'VALIDE', 'REJETE')),
  date_upload DATETIME DEFAULT CURRENT_TIMESTAMP,
  date_validation DATETIME,
  validateur_id INTEGER,
  commentaires_validateur TEXT,
  FOREIGN KEY (mission_id) REFERENCES ordres_mission(id) ON DELETE CASCADE,
  FOREIGN KEY (centrale_id) REFERENCES centrales(id) ON DELETE CASCADE,
  FOREIGN KEY (technicien_id) REFERENCES techniciens(id) ON DELETE CASCADE
);

-- Index pour performance
CREATE INDEX IF NOT EXISTS idx_checklist_mission ON checklist_items(mission_id);
CREATE INDEX IF NOT EXISTS idx_checklist_categorie ON checklist_items(categorie);
CREATE INDEX IF NOT EXISTS idx_checklist_statut ON checklist_items(statut);
CREATE INDEX IF NOT EXISTS idx_photos_mission ON audit_photos(mission_id);
CREATE INDEX IF NOT EXISTS idx_photos_checklist ON audit_photos(checklist_item_id);
CREATE INDEX IF NOT EXISTS idx_retours_mission ON retours_json(mission_id);
CREATE INDEX IF NOT EXISTS idx_retours_statut ON retours_json(statut);

-- Template Checklist par défaut (à insérer lors de l'init d'une mission)
-- Ces données seront insérées dynamiquement via API lors de POST /api/checklist/:mission_id/init
