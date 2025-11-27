-- Migration 0009 : Checklist AUDIT TOITURE (complémentaire à checklist SOL)
-- Date : 2025-11-26
-- Objectif : Ajouter checklist spécifique pour audits EN TOITURE (démontage panneaux)
-- ATTENTION : Ne touche PAS aux tables existantes (checklist_items, ordres_mission_item_photos)

-- Table pour items checklist TOITURE (11 points CDC Girasole)
CREATE TABLE IF NOT EXISTS checklist_items_toiture (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  ordre_mission_id INTEGER NOT NULL,
  item_numero INTEGER NOT NULL,
  libelle TEXT NOT NULL,
  categorie TEXT DEFAULT 'AUDIT_TOITURE',
  statut TEXT DEFAULT 'NON_VERIFIE' CHECK(statut IN ('NON_VERIFIE', 'CONFORME', 'NON_CONFORME', 'N/A')),
  conformite TEXT,
  commentaire TEXT,
  technicien TEXT,
  date_verification DATETIME,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (ordre_mission_id) REFERENCES ordres_mission(id) ON DELETE CASCADE
);

-- Index pour performance
CREATE INDEX IF NOT EXISTS idx_checklist_toiture_mission ON checklist_items_toiture(ordre_mission_id);
CREATE INDEX IF NOT EXISTS idx_checklist_toiture_statut ON checklist_items_toiture(statut);

-- Trigger pour updated_at
CREATE TRIGGER IF NOT EXISTS update_checklist_toiture_timestamp 
AFTER UPDATE ON checklist_items_toiture
BEGIN
  UPDATE checklist_items_toiture SET updated_at = CURRENT_TIMESTAMP WHERE id = NEW.id;
END;

-- Insertion des 11 points de contrôle AUDIT TOITURE (basés CDC Girasole page 8)
-- Ces items seront copiés automatiquement pour chaque ordre de mission nécessitant audit toiture

-- Template des items TOITURE (seront dupliqués par ordre_mission_id)
CREATE TABLE IF NOT EXISTS checklist_toiture_template (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  item_numero INTEGER NOT NULL,
  libelle TEXT NOT NULL,
  categorie TEXT DEFAULT 'AUDIT_TOITURE',
  description TEXT,
  reference_normative TEXT
);

-- Insertion des 11 points CDC GIRASOLE Audit Toiture
INSERT INTO checklist_toiture_template (item_numero, libelle, description, reference_normative) VALUES
(1, 'Démontage/remontage ~25 panneaux pertinents', 'Démontage d''au moins 25 panneaux pertinents (1er et dernier panneau d''une chaîne, etc.). Remontage sans atteinte à l''intégrité des panneaux ou de leurs supports.', 'CDC Girasole §2.2'),
(2, 'Conformité DTU 40.35', 'Vérification de la conformité aux règles du DTU 40.35 (couvertures par éléments métalliques en feuilles et longues feuilles en zinc).', 'DTU 40.35'),
(3, 'Qualité montage/serrage SI sur support', 'Contrôle de la qualité et conformité du montage et serrage des Structures d''Intégration (SI) sur leur support.', 'CDC Girasole page 8'),
(4, 'Qualité montage/serrage panneaux sur SI', 'Contrôle de la qualité et conformité du montage et serrage des panneaux photovoltaïques sur les structures d''intégration.', 'CDC Girasole page 8'),
(5, 'Fixation cheminement câbles (supports, étanchéité)', 'Contrôle de la fixation du cheminement des câbles : pertinence des supports de fixation, maintien de l''étanchéité toiture, absence de percement non maîtrisé.', 'CDC Girasole page 8'),
(6, 'Compatibilité/serrage/étanchéité connecteurs MC4', 'Contrôle des raccordements : compatibilité des connecteurs mâle/femelle (type PVZH202B), serrages corrects, étanchéité assurée, protection contre ruissellement.', 'CDC Girasole page 8'),
(7, 'Qualité cheminement câbles DC dans chemins de câbles', 'Contrôle de la qualité du cheminement des câbles DC dans les chemins de câbles : fixation adéquate, rayons de courbure respectés, absence de contraintes mécaniques.', 'CDC Girasole page 8'),
(8, 'Cheminement câbles (pas directement sur couverture)', 'Vérification que les câbles ne cheminent PAS directement sur la couverture. Utilisation obligatoire de supports adaptés.', 'CDC Girasole page 8'),
(9, 'Raccordements terres', 'Contrôle de la qualité du cheminement et du raccordement des terres : continuité électrique, serrage des connexions, utilisation de cosses adaptées.', 'CDC Girasole page 8'),
(10, 'Étiquettes réglementaires tension DC', 'Présence et conformité des étiquettes réglementaires indiquant la présence de tension DC dangereuse.', 'CDC Girasole page 8 + Réglementation'),
(11, 'Respect notices montage / Interdiction marcher sur panneaux', 'Vérification du respect des notices de montage des panneaux. Contrôle visuel qu''aucune trace de passage sur panneaux n''est visible. INTERDICTION ABSOLUE de marcher sur les panneaux pendant l''audit.', 'CDC Girasole §2.2');

-- Commentaire sur la stratégie
-- Les items de checklist_toiture_template seront copiés dans checklist_items_toiture
-- pour chaque ordre_mission nécessitant un audit toiture (quand centrale.audit_toiture = 'X')
-- Cela permet de garder une structure flexible et évolutive

-- Note : Les photos pour items toiture utiliseront la table existante ordres_mission_item_photos
-- en spécifiant item_checklist_id correspondant à l'id de checklist_items_toiture
