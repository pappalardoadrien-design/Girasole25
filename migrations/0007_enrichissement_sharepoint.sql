-- Migration 0007: Enrichissement des données centrales avec métadonnées SharePoint
-- Date: 2025-11-24
-- Source: ANNEXE 1 - Liste des installations a auditer_v4(Liste audit) (1).csv
-- Ajout UNIQUEMENT des colonnes manquantes (latitude, longitude, dept existent déjà)

ALTER TABLE centrales ADD COLUMN spv TEXT;
ALTER TABLE centrales ADD COLUMN adresse TEXT;
ALTER TABLE centrales ADD COLUMN type_centrale TEXT;
ALTER TABLE centrales ADD COLUMN installateur TEXT;
ALTER TABLE centrales ADD COLUMN date_mes TEXT;
ALTER TABLE centrales ADD COLUMN si TEXT;
ALTER TABLE centrales ADD COLUMN panneaux TEXT;
ALTER TABLE centrales ADD COLUMN contact_exploitation TEXT;
ALTER TABLE centrales ADD COLUMN tel_exploitation TEXT;
ALTER TABLE centrales ADD COLUMN contact_gestion TEXT;
ALTER TABLE centrales ADD COLUMN tel_gestion TEXT;
ALTER TABLE centrales ADD COLUMN audit_toiture TEXT;
ALTER TABLE centrales ADD COLUMN audit_hors_toiture TEXT;
ALTER TABLE centrales ADD COLUMN ratio_pr TEXT;
ALTER TABLE centrales ADD COLUMN date_prev_audit TEXT;

-- Création d'index pour optimiser les requêtes
CREATE INDEX IF NOT EXISTS idx_centrales_dept ON centrales(dept);
CREATE INDEX IF NOT EXISTS idx_centrales_gps ON centrales(latitude, longitude);
CREATE INDEX IF NOT EXISTS idx_centrales_date_mes ON centrales(date_mes);
CREATE INDEX IF NOT EXISTS idx_centrales_contact_exploitation ON centrales(contact_exploitation);
