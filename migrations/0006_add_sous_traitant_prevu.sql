-- Migration 0006: Ajouter colonne sous_traitant_prevu dans centrales
ALTER TABLE centrales ADD COLUMN sous_traitant_prevu TEXT;

-- Créer un index pour optimiser les requêtes
CREATE INDEX IF NOT EXISTS idx_centrales_sous_traitant_prevu ON centrales(sous_traitant_prevu);
