-- Script: Mise à jour techniciens DiagPV (Adrien + Fabien)
-- Date: 2025-01-21
-- Usage: Pour préparer le planning GIRASOLE

-- Mettre à jour technicien ID 1 → Adrien Pappalardon
UPDATE techniciens SET 
  prenom = 'Adrien', 
  nom = 'Pappalardon', 
  email = 'adrien.pappalardon@diagpv.fr',
  telephone = '+33 6 XX XX XX XX',
  notes = 'Business Developer - Audits terrain Toulouse'
WHERE id = 1;

-- Mettre à jour technicien ID 2 → Fabien
UPDATE techniciens SET 
  prenom = 'Fabien', 
  nom = 'COLLABORATEUR',
  email = 'fabien@diagpv.fr', 
  telephone = '+33 6 XX XX XX XX',
  notes = 'Technicien terrain - Audits Toulouse'
WHERE id = 2;

-- Vérifier les modifications
SELECT 
  id, 
  prenom, 
  nom, 
  email, 
  telephone,
  notes
FROM techniciens 
WHERE sous_traitant_id = 1
ORDER BY id;
