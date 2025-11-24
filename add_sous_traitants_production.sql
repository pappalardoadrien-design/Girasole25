-- ══════════════════════════════════════════════════════════════
-- AJOUT SOUS-TRAITANTS ARTEMIS + CADENET PRODUCTION
-- ══════════════════════════════════════════════════════════════

-- Supprimer les sous-traitants de test existants
DELETE FROM sous_traitants WHERE nom IN ('DiagPV Solutions', 'SolarTech Audits');
DELETE FROM techniciens WHERE sous_traitant_id IN (1, 2);

-- Réinitialiser les séquences
DELETE FROM sqlite_sequence WHERE name IN ('sous_traitants', 'techniciens');

-- ══════════════════════════════════════════════════════════════
-- 1. CRÉER ARTEMIS (ID: 1)
-- ══════════════════════════════════════════════════════════════

INSERT INTO sous_traitants (
  nom,
  contact_nom,
  contact_email,
  contact_tel,
  adresse,
  specialites,
  zone_intervention,
  tarif_journalier_indicatif,
  nb_techniciens_disponibles,
  statut,
  notes
) VALUES (
  'ARTEMIS',
  'Contact ARTEMIS',
  'contact@artemis.fr',
  '+33 X XX XX XX XX',
  'Adresse ARTEMIS',
  'Audits toiture NF C 15-100, UTE C 15-712-1, DTU 40.35',
  'Départements 26, 3, 38, 42, 7, 71, 89',
  0,
  2,
  'actif',
  '17 centrales GIRASOLE • 5056.65 kWc • Audits qualité conformes CDC PERF-CDC-001'
);

-- ══════════════════════════════════════════════════════════════
-- 2. CRÉER CADENET (ID: 2)
-- ══════════════════════════════════════════════════════════════

INSERT INTO sous_traitants (
  nom,
  contact_nom,
  contact_email,
  contact_tel,
  adresse,
  specialites,
  zone_intervention,
  tarif_journalier_indicatif,
  nb_techniciens_disponibles,
  statut,
  notes
) VALUES (
  'CADENET',
  'Contact CADENET',
  'contact@cadenet.fr',
  '+33 X XX XX XX XX',
  'Adresse CADENET',
  'Audits toiture NF C 15-100, UTE C 15-712-1, DTU 40.35',
  'Départements 26, 7, 3, 71',
  0,
  2,
  'actif',
  '10 centrales GIRASOLE • 3910.35 kWc • Audits qualité conformes CDC PERF-CDC-001'
);

-- ══════════════════════════════════════════════════════════════
-- 3. CRÉER TECHNICIENS ARTEMIS
-- ══════════════════════════════════════════════════════════════

INSERT INTO techniciens (sous_traitant_id, nom, prenom, email, tel, statut)
VALUES 
  (1, 'TECHNICIEN', 'Artemis 1', 'technicien1@artemis.fr', '+33 X XX XX XX XX', 'disponible'),
  (1, 'TECHNICIEN', 'Artemis 2', 'technicien2@artemis.fr', '+33 X XX XX XX XX', 'disponible');

-- ══════════════════════════════════════════════════════════════
-- 4. CRÉER TECHNICIENS CADENET
-- ══════════════════════════════════════════════════════════════

INSERT INTO techniciens (sous_traitant_id, nom, prenom, email, tel, statut)
VALUES 
  (2, 'TECHNICIEN', 'Cadenet 1', 'technicien1@cadenet.fr', '+33 X XX XX XX XX', 'disponible'),
  (2, 'TECHNICIEN', 'Cadenet 2', 'technicien2@cadenet.fr', '+33 X XX XX XX XX', 'disponible');

-- ══════════════════════════════════════════════════════════════
-- 5. PRÉ-ATTRIBUER LES 17 CENTRALES À ARTEMIS
-- ══════════════════════════════════════════════════════════════

UPDATE centrales 
SET sous_traitant_prevu = 'ARTEMIS'
WHERE id IN (
  3251, -- SCI KILJOR
  3252, -- SCI SOLARWEST
  3253, -- TERALTA CHAVANOZ 2
  3254, -- SCI TERALTA COURTHEZON
  3255, -- SCI TERALTA DARDILLY
  3256, -- SCI TERALTA MONTBRISON
  3257, -- SCI TERALTA SATILLIEU
  3258, -- SCI TERALTA SAVASSE
  3259, -- SCI TERALTA SEYSSUEL
  3261, -- SCI RISSOAN
  3262, -- SCI SARL RENOUERGIE
  3271, -- SCI KIRDM
  3272, -- SCI MDEA BEAUREPAIRE
  3273, -- SCI MDP
  3274, -- SCI MEGAWATT ANSE
  3276, -- MONTELIMAR Toiture
  3277  -- ROYBON Toiture
);

-- ══════════════════════════════════════════════════════════════
-- 6. PRÉ-ATTRIBUER LES 10 CENTRALES À CADENET
-- ══════════════════════════════════════════════════════════════

UPDATE centrales 
SET sous_traitant_prevu = 'CADENET'
WHERE id IN (
  3275, -- CHAMPLITTE Toiture
  3260, -- SCI EQMV SAINT GERMAIN LAPRADE
  3270, -- SCI GVLG
  3266, -- SCI LAVILLENIE CHAMBON
  3268, -- SCI LEBRE ENERGIE
  3265, -- SCI LRNR
  3264, -- SCI MEGAWATT JALIGNY
  3267, -- SCI SCBNSL
  3263, -- SCI SOLAIRE TOURNON
  3269  -- SCI THIBIER 2
);

-- ══════════════════════════════════════════════════════════════
-- VÉRIFICATIONS
-- ══════════════════════════════════════════════════════════════

SELECT '✅ SOUS-TRAITANTS CRÉÉS' as status;
SELECT id, nom, nb_techniciens_disponibles, zone_intervention FROM sous_traitants;

SELECT '✅ TECHNICIENS CRÉÉS' as status;
SELECT t.id, s.nom as sous_traitant, t.prenom, t.nom, t.statut 
FROM techniciens t 
JOIN sous_traitants s ON t.sous_traitant_id = s.id;

SELECT '✅ CENTRALES PRÉ-ATTRIBUÉES' as status;
SELECT 
  sous_traitant_prevu,
  COUNT(*) as nb_centrales,
  ROUND(SUM(puissance_kwc), 2) as puissance_totale_kwc
FROM centrales 
WHERE sous_traitant_prevu IS NOT NULL
GROUP BY sous_traitant_prevu;
