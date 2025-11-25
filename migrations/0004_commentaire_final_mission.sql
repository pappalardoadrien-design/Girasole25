-- Migration 0004: Ajout commentaire final mission + photos générales
-- Date: 2025-11-25
-- Description: Section synthèse générale en fin d'audit

-- Table pour commentaire final mission
CREATE TABLE IF NOT EXISTS ordres_mission_commentaires_finaux (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  mission_id INTEGER NOT NULL,
  commentaire_final TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (mission_id) REFERENCES ordres_mission(id) ON DELETE CASCADE,
  UNIQUE(mission_id)
);

-- Table pour photos générales mission (non liées à un item)
CREATE TABLE IF NOT EXISTS ordres_mission_photos_generales (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  mission_id INTEGER NOT NULL,
  filename TEXT NOT NULL,
  photo_base64 TEXT NOT NULL,
  description TEXT,
  uploaded_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (mission_id) REFERENCES ordres_mission(id) ON DELETE CASCADE
);

-- Index pour performance
CREATE INDEX IF NOT EXISTS idx_commentaires_finaux_mission ON ordres_mission_commentaires_finaux(mission_id);
CREATE INDEX IF NOT EXISTS idx_photos_generales_mission ON ordres_mission_photos_generales(mission_id);
