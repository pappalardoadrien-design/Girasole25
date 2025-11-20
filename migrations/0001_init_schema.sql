-- Table des centrales photovoltaïques
CREATE TABLE IF NOT EXISTS centrales (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nom TEXT UNIQUE NOT NULL,
  type TEXT NOT NULL CHECK(type IN ('SOL', 'TOITURE')),
  puissance_kwc REAL,
  localisation TEXT,
  statut TEXT DEFAULT 'A_AUDITER' CHECK(statut IN ('A_AUDITER', 'EN_COURS', 'TERMINE', 'VALIDE')),
  date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
  date_audit DATETIME,
  date_validation DATETIME
);

-- Table des retours JSON V4 (métadonnées uniquement, pas le JSON complet)
CREATE TABLE IF NOT EXISTS retours_json (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  centrale_id INTEGER NOT NULL,
  nom_fichier TEXT NOT NULL,
  taille_mo REAL,
  nombre_photos INTEGER,
  date_upload DATETIME DEFAULT CURRENT_TIMESTAMP,
  technicien TEXT,
  version TEXT DEFAULT 'V4',
  FOREIGN KEY (centrale_id) REFERENCES centrales(id)
);

-- Table des statistiques globales mission
CREATE TABLE IF NOT EXISTS stats_mission (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  date_snapshot DATETIME DEFAULT CURRENT_TIMESTAMP,
  centrales_total INTEGER,
  centrales_auditees INTEGER,
  centrales_validees INTEGER,
  photos_total INTEGER,
  volumetrie_json_mb REAL,
  volumetrie_photos_mb REAL,
  heures_terrain_estimees REAL
);

-- Indexes pour performance
CREATE INDEX IF NOT EXISTS idx_centrales_statut ON centrales(statut);
CREATE INDEX IF NOT EXISTS idx_centrales_type ON centrales(type);
CREATE INDEX IF NOT EXISTS idx_retours_centrale ON retours_json(centrale_id);
CREATE INDEX IF NOT EXISTS idx_stats_date ON stats_mission(date_snapshot DESC);

-- Insertion données initiales (52 centrales GIRASOLE 2025)
-- SOL: 39 centrales
INSERT OR IGNORE INTO centrales (nom, type, puissance_kwc, localisation) VALUES
  ('SOL_01', 'SOL', 0, 'Site A'),
  ('SOL_02', 'SOL', 0, 'Site B'),
  ('SOL_03', 'SOL', 0, 'Site C'),
  ('SOL_04', 'SOL', 0, 'Site D'),
  ('SOL_05', 'SOL', 0, 'Site E'),
  ('SOL_06', 'SOL', 0, 'Site F'),
  ('SOL_07', 'SOL', 0, 'Site G'),
  ('SOL_08', 'SOL', 0, 'Site H'),
  ('SOL_09', 'SOL', 0, 'Site I'),
  ('SOL_10', 'SOL', 0, 'Site J'),
  ('SOL_11', 'SOL', 0, 'Site K'),
  ('SOL_12', 'SOL', 0, 'Site L'),
  ('SOL_13', 'SOL', 0, 'Site M'),
  ('SOL_14', 'SOL', 0, 'Site N'),
  ('SOL_15', 'SOL', 0, 'Site O'),
  ('SOL_16', 'SOL', 0, 'Site P'),
  ('SOL_17', 'SOL', 0, 'Site Q'),
  ('SOL_18', 'SOL', 0, 'Site R'),
  ('SOL_19', 'SOL', 0, 'Site S'),
  ('SOL_20', 'SOL', 0, 'Site T'),
  ('SOL_21', 'SOL', 0, 'Site U'),
  ('SOL_22', 'SOL', 0, 'Site V'),
  ('SOL_23', 'SOL', 0, 'Site W'),
  ('SOL_24', 'SOL', 0, 'Site X'),
  ('SOL_25', 'SOL', 0, 'Site Y'),
  ('SOL_26', 'SOL', 0, 'Site Z'),
  ('SOL_27', 'SOL', 0, 'Site AA'),
  ('SOL_28', 'SOL', 0, 'Site AB'),
  ('SOL_29', 'SOL', 0, 'Site AC'),
  ('SOL_30', 'SOL', 0, 'Site AD'),
  ('SOL_31', 'SOL', 0, 'Site AE'),
  ('SOL_32', 'SOL', 0, 'Site AF'),
  ('SOL_33', 'SOL', 0, 'Site AG'),
  ('SOL_34', 'SOL', 0, 'Site AH'),
  ('SOL_35', 'SOL', 0, 'Site AI'),
  ('SOL_36', 'SOL', 0, 'Site AJ'),
  ('SOL_37', 'SOL', 0, 'Site AK'),
  ('SOL_38', 'SOL', 0, 'Site AL'),
  ('SOL_39', 'SOL', 0, 'Site AM');

-- TOITURE: 13 centrales
INSERT OR IGNORE INTO centrales (nom, type, puissance_kwc, localisation) VALUES
  ('TOIT_01', 'TOITURE', 0, 'Bâtiment A'),
  ('TOIT_02', 'TOITURE', 0, 'Bâtiment B'),
  ('TOIT_03', 'TOITURE', 0, 'Bâtiment C'),
  ('TOIT_04', 'TOITURE', 0, 'Bâtiment D'),
  ('TOIT_05', 'TOITURE', 0, 'Bâtiment E'),
  ('TOIT_06', 'TOITURE', 0, 'Bâtiment F'),
  ('TOIT_07', 'TOITURE', 0, 'Bâtiment G'),
  ('TOIT_08', 'TOITURE', 0, 'Bâtiment H'),
  ('TOIT_09', 'TOITURE', 0, 'Bâtiment I'),
  ('TOIT_10', 'TOITURE', 0, 'Bâtiment J'),
  ('TOIT_11', 'TOITURE', 0, 'Bâtiment K'),
  ('TOIT_12', 'TOITURE', 0, 'Bâtiment L'),
  ('TOIT_13', 'TOITURE', 0, 'Bâtiment M');

-- Statistique initiale
INSERT INTO stats_mission (centrales_total, centrales_auditees, centrales_validees, photos_total, volumetrie_json_mb, volumetrie_photos_mb, heures_terrain_estimees)
VALUES (52, 0, 0, 0, 0, 0, 360);
