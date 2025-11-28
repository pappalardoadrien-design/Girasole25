-- Migration 0016: Système d'authentification par URLs secrètes
-- Date: 2024-11-28
-- Version: v2.5.0
-- Description: Ajoute table access_tokens pour gestion accès par sous-traitant

-- Table pour les tokens d'accès
CREATE TABLE IF NOT EXISTS access_tokens (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  token TEXT UNIQUE NOT NULL,
  sous_traitant_id INTEGER,
  nom TEXT NOT NULL,
  role TEXT DEFAULT 'SOUS_TRAITANT' CHECK(role IN ('ADMIN', 'SOUS_TRAITANT')),
  date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
  derniere_utilisation DATETIME,
  statut TEXT DEFAULT 'ACTIF' CHECK(statut IN ('ACTIF', 'REVOQUE')),
  FOREIGN KEY (sous_traitant_id) REFERENCES sous_traitants(id)
);

-- Index pour performance
CREATE INDEX IF NOT EXISTS idx_access_tokens_token ON access_tokens(token);
CREATE INDEX IF NOT EXISTS idx_access_tokens_statut ON access_tokens(statut);

-- Données initiales : 1 admin + 7 sous-traitants
INSERT INTO access_tokens (token, sous_traitant_id, nom, role) VALUES
-- Admin (Adrien - accès complet)
('admin-adrien-xyz789abc456def123ghi', NULL, 'Adrien PAPPALARDO', 'ADMIN'),

-- 7 Sous-traitants (accès filtré)
('st-artemis-a7f2e9d8c1b4a5f3e2d1c0b9', 3, 'ARTEMIS', 'SOUS_TRAITANT'),
('st-cadenet-b8g3f0e9d2c5b6g4f3e2d1c0', 4, 'CADENET', 'SOUS_TRAITANT'),
('st-diagpv-c9h4g1f0e3d6c7h5g4f3e2d1', 5, 'DIAGPV - Adrien & Fabien', 'SOUS_TRAITANT'),
('st-edouard-d0i5h2g1f4e7d8i6h5g4f3e2', 6, 'EDOUARD - Martial', 'SOUS_TRAITANT'),
('st-courtiade-e1j6i3h2g5f8e9j7i6h5g4f3', 7, 'COURTIADE DISTRIB', 'SOUS_TRAITANT'),
('st-drone-f2k7j4i3h6g9f0k8j7i6h5g4', 8, 'DRONE AVEYRON SERVICE', 'SOUS_TRAITANT'),
('st-attente-g3l8k5j4i7h0g1l9k8j7i6h5', 9, 'En attente attribution', 'SOUS_TRAITANT');
