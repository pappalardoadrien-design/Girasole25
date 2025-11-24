-- ══════════════════════════════════════════════════════════════
-- AJOUT CADENET + PRÉ-ATTRIBUTION DES 27 CENTRALES
-- ══════════════════════════════════════════════════════════════

-- 1. Ajouter CADENET
INSERT INTO sous_traitants (
  nom_entreprise,
  email_contact,
  telephone,
  adresse,
  contact_principal,
  statut,
  notes
) VALUES (
  'CADENET',
  'contact@cadenet.fr',
  '+33 X XX XX XX XX',
  'Adresse CADENET - Départements 26, 7, 3, 71',
  'Contact CADENET',
  'ACTIF',
  '10 centrales GIRASOLE • 3910.35 kWc • Audits qualité NF C 15-100, UTE C 15-712-1, DTU 40.35 • Conformes CDC PERF-CDC-001'
);

-- 2. Créer techniciens CADENET
INSERT INTO techniciens (sous_traitant_id, nom, prenom, email, telephone, statut)
VALUES 
  (4, 'TECHNICIEN', 'Cadenet 1', 'technicien1@cadenet.fr', '+33 X XX XX XX XX', 'DISPONIBLE'),
  (4, 'TECHNICIEN', 'Cadenet 2', 'technicien2@cadenet.fr', '+33 X XX XX XX XX', 'DISPONIBLE');

-- 3. PRÉ-ATTRIBUER LES 17 CENTRALES À ARTEMIS
UPDATE centrales 
SET sous_traitant_prevu = 'ARTEMIS'
WHERE id IN (
  3251, 3252, 3253, 3254, 3255, 3256, 3257, 3258, 3259,
  3261, 3262, 3271, 3272, 3273, 3274, 3276, 3277
);

-- 4. PRÉ-ATTRIBUER LES 10 CENTRALES À CADENET
UPDATE centrales 
SET sous_traitant_prevu = 'CADENET'
WHERE id IN (
  3275, 3260, 3270, 3266, 3268, 3265, 3264, 3267, 3263, 3269
);

-- VÉRIFICATIONS
SELECT '✅ SOUS-TRAITANTS' as check_type;
SELECT id, nom_entreprise, statut FROM sous_traitants ORDER BY id;

SELECT '✅ TECHNICIENS' as check_type;
SELECT t.id, s.nom_entreprise, t.prenom, t.nom, t.statut 
FROM techniciens t 
JOIN sous_traitants s ON t.sous_traitant_id = s.id
ORDER BY s.nom_entreprise, t.id;

SELECT '✅ CENTRALES PRÉ-ATTRIBUÉES' as check_type;
SELECT 
  sous_traitant_prevu,
  COUNT(*) as nb_centrales,
  ROUND(SUM(puissance_kwc), 2) as puissance_totale_kwc
FROM centrales 
WHERE sous_traitant_prevu IS NOT NULL
GROUP BY sous_traitant_prevu;
