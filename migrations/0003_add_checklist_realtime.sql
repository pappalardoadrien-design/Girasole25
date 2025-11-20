-- Migration: Checklist Temps Réel & Rapport Final
-- Date: 2025-01-20
-- Description: Ajout table pour sauvegarde temps réel des items checklist V4 durant audit terrain

-- Table Checklist Items (54 points CDC V4 par mission)
CREATE TABLE IF NOT EXISTS checklist_items (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  ordre_mission_id INTEGER NOT NULL,
  categorie TEXT NOT NULL CHECK(categorie IN ('DOC', 'ELEC', 'TABLEAUX', 'CABLAGE', 'MODULES', 'STRUCTURES', 'TOITURE')),
  item_numero INTEGER NOT NULL, -- Position dans la catégorie (1-12)
  item_texte TEXT NOT NULL,
  statut TEXT DEFAULT 'NON_VERIFIE' CHECK(statut IN ('NON_VERIFIE', 'CONFORME', 'NON_CONFORME', 'NA', 'ANOMALIE_MINEURE', 'ANOMALIE_MAJEURE')),
  conformite BOOLEAN, -- true=conforme, false=non-conforme, null=NA
  commentaire TEXT,
  photo_base64 TEXT, -- Photo associée (Base64)
  photo_filename TEXT,
  mesure_valeur TEXT, -- Valeur mesurée (ex: "523V", "12.5A")
  mesure_unite TEXT, -- Unité (ex: "V", "A", "Ohm")
  date_verification DATETIME DEFAULT CURRENT_TIMESTAMP,
  date_modification DATETIME DEFAULT CURRENT_TIMESTAMP,
  technicien_nom TEXT, -- Nom du technicien ayant rempli
  FOREIGN KEY (ordre_mission_id) REFERENCES ordres_mission(id) ON DELETE CASCADE,
  UNIQUE(ordre_mission_id, categorie, item_numero) -- Empêche doublons
);

-- Table Retours JSON V4 (stockage uploads techniciens)
CREATE TABLE IF NOT EXISTS retours_json (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  ordre_mission_id INTEGER NOT NULL,
  centrale_id INTEGER NOT NULL,
  technicien_id INTEGER NOT NULL,
  json_data TEXT NOT NULL, -- JSON V4 complet avec photos Base64
  taille_mo REAL, -- Taille fichier en Mo
  nb_photos INTEGER, -- Nombre photos dans JSON
  date_upload DATETIME DEFAULT CURRENT_TIMESTAMP,
  statut TEXT DEFAULT 'RECU' CHECK(statut IN ('RECU', 'EN_ANALYSE', 'VALIDE', 'REJETE')),
  rapport_final_genere BOOLEAN DEFAULT 0,
  date_rapport_final DATETIME,
  FOREIGN KEY (ordre_mission_id) REFERENCES ordres_mission(id) ON DELETE CASCADE,
  FOREIGN KEY (centrale_id) REFERENCES centrales(id) ON DELETE CASCADE,
  FOREIGN KEY (technicien_id) REFERENCES techniciens(id) ON DELETE CASCADE
);

-- Créer indexes pour performance
CREATE INDEX IF NOT EXISTS idx_checklist_mission ON checklist_items(ordre_mission_id);
CREATE INDEX IF NOT EXISTS idx_checklist_categorie ON checklist_items(categorie);
CREATE INDEX IF NOT EXISTS idx_checklist_statut ON checklist_items(statut);
CREATE INDEX IF NOT EXISTS idx_retours_mission ON retours_json(ordre_mission_id);
CREATE INDEX IF NOT EXISTS idx_retours_centrale ON retours_json(centrale_id);
CREATE INDEX IF NOT EXISTS idx_retours_date ON retours_json(date_upload);

-- Insérer structure checklist V4 vide pour test (ordre_mission_id = 1 si existe)
-- DOC (8 points)
INSERT OR IGNORE INTO checklist_items (ordre_mission_id, categorie, item_numero, item_texte) VALUES
(1, 'DOC', 1, 'Plaques signalétiques modules'),
(1, 'DOC', 2, 'Plan installation (as-built)'),
(1, 'DOC', 3, 'Schémas électriques (DC/AC)'),
(1, 'DOC', 4, 'Attestation Consuel'),
(1, 'DOC', 5, 'Certificats conformité onduleurs'),
(1, 'DOC', 6, 'Rapport mise en service'),
(1, 'DOC', 7, 'Contrat maintenance O&M'),
(1, 'DOC', 8, 'Notice technique modules');

-- ELEC (12 points)
INSERT OR IGNORE INTO checklist_items (ordre_mission_id, categorie, item_numero, item_texte) VALUES
(1, 'ELEC', 1, 'Mesure tension Voc strings (à vide)'),
(1, 'ELEC', 2, 'Mesure courant Isc strings (court-circuit)'),
(1, 'ELEC', 3, 'Test isolement DC (> 1 MΩ)'),
(1, 'ELEC', 4, 'Mesure continuité terres'),
(1, 'ELEC', 5, 'Polarité strings (+ et -)'),
(1, 'ELEC', 6, 'Protection différentielle 30mA'),
(1, 'ELEC', 7, 'Disjoncteurs calibrage correct'),
(1, 'ELEC', 8, 'Parafoudres DC/AC état'),
(1, 'ELEC', 9, 'Test fonctionnel onduleurs'),
(1, 'ELEC', 10, 'Monitoring production réel vs théorique'),
(1, 'ELEC', 11, 'Équilibrage phases AC'),
(1, 'ELEC', 12, 'Cos φ (facteur puissance)');

-- TABLEAUX (8 points)
INSERT OR IGNORE INTO checklist_items (ordre_mission_id, categorie, item_numero, item_texte) VALUES
(1, 'TABLEAUX', 1, 'État général coffrets DC'),
(1, 'TABLEAUX', 2, 'Étanchéité IP65 boîtiers'),
(1, 'TABLEAUX', 3, 'Serrage bornes électriques'),
(1, 'TABLEAUX', 4, 'Signalétique circuits'),
(1, 'TABLEAUX', 5, 'Ventilation coffrets'),
(1, 'TABLEAUX', 6, 'Absence corrosion/oxydation'),
(1, 'TABLEAUX', 7, 'Échauffement anormal (thermographie)'),
(1, 'TABLEAUX', 8, 'Accessibilité maintenance');

-- CABLAGE (7 points)
INSERT OR IGNORE INTO checklist_items (ordre_mission_id, categorie, item_numero, item_texte) VALUES
(1, 'CABLAGE', 1, 'Connecteurs MC4 serrés/étanches'),
(1, 'CABLAGE', 2, 'Gaines ICTA/IRL état'),
(1, 'CABLAGE', 3, 'Chemins câbles fixations'),
(1, 'CABLAGE', 4, 'Protection UV câbles DC'),
(1, 'CABLAGE', 5, 'Rayon courbure respecté'),
(1, 'CABLAGE', 6, 'Absence points chauds (thermographie)'),
(1, 'CABLAGE', 7, 'Marquage câbles positif/négatif');

-- MODULES (10 points)
INSERT OR IGNORE INTO checklist_items (ordre_mission_id, categorie, item_numero, item_texte) VALUES
(1, 'MODULES', 1, 'État visuel face avant (fissures/casse)'),
(1, 'MODULES', 2, 'État cadres (corrosion/déformation)'),
(1, 'MODULES', 3, 'Boîtiers jonction étanches'),
(1, 'MODULES', 4, 'Diodes by-pass fonctionnelles'),
(1, 'MODULES', 5, 'Hotspots thermographie (ΔT > 10°C)'),
(1, 'MODULES', 6, 'Délamination/bulles'),
(1, 'MODULES', 7, 'Snail trails (traces escargot)'),
(1, 'MODULES', 8, 'Salissures importantes'),
(1, 'MODULES', 9, 'Ombres portées permanentes'),
(1, 'MODULES', 10, 'PID (Potential Induced Degradation)');

-- STRUCTURES (5 points)
INSERT OR IGNORE INTO checklist_items (ordre_mission_id, categorie, item_numero, item_texte) VALUES
(1, 'STRUCTURES', 1, 'Fixations modules (boulons/clips)'),
(1, 'STRUCTURES', 2, 'État rails (corrosion/déformation)'),
(1, 'STRUCTURES', 3, 'Fondations/lestage stable'),
(1, 'STRUCTURES', 4, 'Mise à la terre structures'),
(1, 'STRUCTURES', 5, 'Espacement inter-rangées ventilation');

-- TOITURE (4 points - si applicable)
INSERT OR IGNORE INTO checklist_items (ordre_mission_id, categorie, item_numero, item_texte) VALUES
(1, 'TOITURE', 1, 'Étanchéité traversées toiture'),
(1, 'TOITURE', 2, 'État couverture (tuiles/bac acier)'),
(1, 'TOITURE', 3, 'Écrans sous-toiture intacts'),
(1, 'TOITURE', 4, 'Zinguerie/gouttières fonctionnelles');
