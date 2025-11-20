-- Migration: Module Planning & Gestion Sous-Traitants
-- Date: 2025-01-20
-- Description: Ajout tables pour sous-traitants, techniciens, ordres de mission

-- Table Sous-Traitants (5-6 entreprises)
CREATE TABLE IF NOT EXISTS sous_traitants (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nom_entreprise TEXT UNIQUE NOT NULL,
  email_contact TEXT,
  telephone TEXT,
  adresse TEXT,
  siret TEXT,
  contact_principal TEXT,
  statut TEXT DEFAULT 'ACTIF' CHECK(statut IN ('ACTIF', 'INACTIF', 'SUSPENDU')),
  date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
  date_modification DATETIME DEFAULT CURRENT_TIMESTAMP,
  notes TEXT
);

-- Table Techniciens (~10 personnes)
CREATE TABLE IF NOT EXISTS techniciens (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  sous_traitant_id INTEGER NOT NULL,
  prenom TEXT NOT NULL,
  nom TEXT NOT NULL,
  email TEXT UNIQUE,
  telephone TEXT,
  statut TEXT DEFAULT 'DISPONIBLE' CHECK(statut IN ('DISPONIBLE', 'OCCUPE', 'INDISPONIBLE', 'CONGE')),
  date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
  date_modification DATETIME DEFAULT CURRENT_TIMESTAMP,
  notes TEXT,
  FOREIGN KEY (sous_traitant_id) REFERENCES sous_traitants(id) ON DELETE CASCADE
);

-- Table Ordres de Mission (52 max pour GIRASOLE)
CREATE TABLE IF NOT EXISTS ordres_mission (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  centrale_id INTEGER NOT NULL,
  technicien_id INTEGER NOT NULL,
  sous_traitant_id INTEGER NOT NULL,
  date_mission DATE NOT NULL,
  heure_debut TIME,
  heure_fin TIME,
  duree_estimee_heures REAL DEFAULT 7.0,
  statut TEXT DEFAULT 'PLANIFIE' CHECK(statut IN ('PLANIFIE', 'CONFIRME', 'EN_COURS', 'TERMINE', 'VALIDE', 'ANNULE', 'REPORTE')),
  checklist_generee BOOLEAN DEFAULT 0,
  ordre_mission_pdf TEXT, -- URL/chemin du PDF généré
  date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
  date_validation DATETIME,
  date_annulation DATETIME,
  commentaires TEXT,
  raison_annulation TEXT,
  FOREIGN KEY (centrale_id) REFERENCES centrales(id) ON DELETE CASCADE,
  FOREIGN KEY (technicien_id) REFERENCES techniciens(id) ON DELETE CASCADE,
  FOREIGN KEY (sous_traitant_id) REFERENCES sous_traitants(id) ON DELETE CASCADE,
  UNIQUE(centrale_id) -- Une centrale = un seul ordre de mission actif
);

-- Table Planning Events (vue calendrier)
CREATE TABLE IF NOT EXISTS planning_events (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  ordre_mission_id INTEGER NOT NULL,
  centrale_id INTEGER NOT NULL,
  technicien_id INTEGER NOT NULL,
  sous_traitant_id INTEGER NOT NULL,
  date_debut DATETIME NOT NULL,
  date_fin DATETIME NOT NULL,
  titre TEXT NOT NULL,
  description TEXT,
  couleur TEXT DEFAULT '#3b82f6', -- Bleu par défaut
  statut TEXT DEFAULT 'PLANIFIE',
  FOREIGN KEY (ordre_mission_id) REFERENCES ordres_mission(id) ON DELETE CASCADE,
  FOREIGN KEY (centrale_id) REFERENCES centrales(id) ON DELETE CASCADE,
  FOREIGN KEY (technicien_id) REFERENCES techniciens(id) ON DELETE CASCADE,
  FOREIGN KEY (sous_traitant_id) REFERENCES sous_traitants(id) ON DELETE CASCADE
);

-- Créer indexes pour performance
CREATE INDEX IF NOT EXISTS idx_techniciens_sous_traitant ON techniciens(sous_traitant_id);
CREATE INDEX IF NOT EXISTS idx_techniciens_statut ON techniciens(statut);
CREATE INDEX IF NOT EXISTS idx_ordres_centrale ON ordres_mission(centrale_id);
CREATE INDEX IF NOT EXISTS idx_ordres_technicien ON ordres_mission(technicien_id);
CREATE INDEX IF NOT EXISTS idx_ordres_sous_traitant ON ordres_mission(sous_traitant_id);
CREATE INDEX IF NOT EXISTS idx_ordres_date ON ordres_mission(date_mission);
CREATE INDEX IF NOT EXISTS idx_ordres_statut ON ordres_mission(statut);
CREATE INDEX IF NOT EXISTS idx_planning_date ON planning_events(date_debut, date_fin);
CREATE INDEX IF NOT EXISTS idx_planning_technicien ON planning_events(technicien_id);

-- Insérer données de test (2 sous-traitants + 4 techniciens)
INSERT INTO sous_traitants (nom_entreprise, email_contact, telephone, contact_principal, statut) VALUES 
('DiagPV Solutions', 'contact@diagpv-solutions.fr', '+33 6 12 34 56 78', 'Pierre Martin', 'ACTIF'),
('SolarTech Audits', 'info@solartech-audits.fr', '+33 6 23 45 67 89', 'Marie Dubois', 'ACTIF');

INSERT INTO techniciens (sous_traitant_id, prenom, nom, email, telephone, statut) VALUES 
(1, 'Jean', 'Dupont', 'jean.dupont@diagpv.fr', '+33 6 11 22 33 44', 'DISPONIBLE'),
(1, 'Sophie', 'Lambert', 'sophie.lambert@diagpv.fr', '+33 6 22 33 44 55', 'DISPONIBLE'),
(2, 'Thomas', 'Bernard', 'thomas.bernard@solartech.fr', '+33 6 33 44 55 66', 'DISPONIBLE'),
(2, 'Claire', 'Moreau', 'claire.moreau@solartech.fr', '+33 6 44 55 66 77', 'DISPONIBLE');
