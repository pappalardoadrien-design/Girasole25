-- Migration 0010 : Table rapports audits
-- Date : 2025-11-26
-- Objectif : Stocker les rapports PDF générés + permettre ajout photos/commentaires post-audit

-- Table pour stocker les rapports générés
CREATE TABLE IF NOT EXISTS rapports_audits (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  centrale_id INTEGER NOT NULL,
  ordre_mission_id INTEGER,
  titre TEXT NOT NULL,
  type_rapport TEXT DEFAULT 'AUDIT_QUALITE' CHECK(type_rapport IN ('AUDIT_QUALITE', 'AUDIT_TOITURE', 'AUDIT_COMPLET')),
  statut TEXT DEFAULT 'BROUILLON' CHECK(statut IN ('BROUILLON', 'EN_COURS', 'TERMINE', 'VALIDE')),
  date_generation DATETIME DEFAULT CURRENT_TIMESTAMP,
  date_validation DATETIME,
  
  -- Métadonnées rapport
  auditeur TEXT,
  date_audit DATE,
  nb_items_conformes INTEGER DEFAULT 0,
  nb_items_non_conformes INTEGER DEFAULT 0,
  nb_items_na INTEGER DEFAULT 0,
  
  -- Stockage (JSON pour flexibilité)
  donnees_rapport TEXT, -- JSON contenant items, photos, commentaires
  
  -- Accès et partage
  auteur TEXT, -- Adrien, Fabien, Sous-traitant
  collaborateurs TEXT, -- JSON array des personnes ayant accès
  
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  
  FOREIGN KEY (centrale_id) REFERENCES centrales(id) ON DELETE CASCADE,
  FOREIGN KEY (ordre_mission_id) REFERENCES ordres_mission(id) ON DELETE SET NULL
);

-- Index
CREATE INDEX IF NOT EXISTS idx_rapports_centrale ON rapports_audits(centrale_id);
CREATE INDEX IF NOT EXISTS idx_rapports_statut ON rapports_audits(statut);
CREATE INDEX IF NOT EXISTS idx_rapports_date ON rapports_audits(date_generation);

-- Trigger pour updated_at
CREATE TRIGGER IF NOT EXISTS update_rapports_timestamp 
AFTER UPDATE ON rapports_audits
BEGIN
  UPDATE rapports_audits SET updated_at = CURRENT_TIMESTAMP WHERE id = NEW.id;
END;

-- Table pour photos/commentaires additionnels post-audit (Adrien/Fabien)
CREATE TABLE IF NOT EXISTS rapports_complements (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  rapport_id INTEGER NOT NULL,
  type TEXT CHECK(type IN ('PHOTO', 'COMMENTAIRE', 'OBSERVATION', 'NOTE')) NOT NULL,
  contenu TEXT NOT NULL, -- base64 pour photos, texte pour commentaires
  titre TEXT,
  description TEXT,
  auteur TEXT, -- Adrien / Fabien
  section_rapport TEXT, -- Lien avec section du rapport (ex: "Item 12", "Synthèse")
  ordre_affichage INTEGER DEFAULT 0,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (rapport_id) REFERENCES rapports_audits(id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_complements_rapport ON rapports_complements(rapport_id);
