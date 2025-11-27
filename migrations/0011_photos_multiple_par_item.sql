-- Migration : Photos multiples par item checklist
-- Permet d'attacher plusieurs photos à chaque point CDC
-- Permet d'ajouter des photos après audit

-- Table photos liées aux items de checklist
CREATE TABLE IF NOT EXISTS ordres_mission_item_photos (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  ordre_mission_id INTEGER NOT NULL,
  item_checklist_id INTEGER NOT NULL,
  photo_base64 TEXT NOT NULL,
  photo_filename TEXT,
  ordre INTEGER DEFAULT 1,
  commentaire TEXT,
  date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
  date_modification DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (ordre_mission_id) REFERENCES ordres_mission(id) ON DELETE CASCADE,
  FOREIGN KEY (item_checklist_id) REFERENCES ordres_mission_checklist(id) ON DELETE CASCADE
);

-- Index pour performance
CREATE INDEX IF NOT EXISTS idx_item_photos_mission ON ordres_mission_item_photos(ordre_mission_id);
CREATE INDEX IF NOT EXISTS idx_item_photos_item ON ordres_mission_item_photos(item_checklist_id);
CREATE INDEX IF NOT EXISTS idx_item_photos_ordre ON ordres_mission_item_photos(ordre_mission_id, item_checklist_id, ordre);
