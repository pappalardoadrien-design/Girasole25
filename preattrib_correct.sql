-- PRÉ-ATTRIBUTION CORRECTE DES 27 CENTRALES

UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom = 'SCI KILJOR';
UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom = 'Mathieu Montet';
UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom = 'HANGAR Benoit BERTELOOT';
UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom = 'HANGAR Angelina SIMMONET';
UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom = 'Hangar LAMIOT';
UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom = 'Didier - PRIEUR';
UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom = 'Hangar Patrick BLANCHET';
UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom = 'GAYET 42';
UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom = 'DUMONT GUY';
UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom = 'Serge Maltaverne';
UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom = 'Maymat';
UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom = 'Hangar Julien Vaudin';
UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom = 'EARL CADOT';
UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom = 'HARAS DE LA MAJORIE/MANOHA';
UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom = 'Serge Maltaverne';
UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom = 'Hangar Eric LOGNON';
UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom = 'Hangar Benjamin CHASSON';

UPDATE centrales SET sous_traitant_prevu = 'CADENET' WHERE nom = 'Hangar Laurent ROUX';
UPDATE centrales SET sous_traitant_prevu = 'CADENET' WHERE nom = 'Hangar Laurent ROUX';
UPDATE centrales SET sous_traitant_prevu = 'CADENET' WHERE nom = 'Hangar Bernard MAGE';
UPDATE centrales SET sous_traitant_prevu = 'CADENET' WHERE nom = 'Hangar Frederic Sinaud';
UPDATE centrales SET sous_traitant_prevu = 'CADENET' WHERE nom = 'Hangar Frederic Sinaud';
UPDATE centrales SET sous_traitant_prevu = 'CADENET' WHERE nom = 'MARTEL 184 Construction';
UPDATE centrales SET sous_traitant_prevu = 'CADENET' WHERE nom = 'BOUCHARDY 203 LOC';
UPDATE centrales SET sous_traitant_prevu = 'CADENET' WHERE nom = 'BOULOIR 206 LOC';
UPDATE centrales SET sous_traitant_prevu = 'CADENET' WHERE nom = 'MARTEL 183 LOC';
UPDATE centrales SET sous_traitant_prevu = 'CADENET' WHERE nom = 'Hangar Fabrice COMBY';

-- VÉRIFICATION
SELECT sous_traitant_prevu, COUNT(*) as nb, ROUND(SUM(puissance_kwc), 2) as total_kwc
FROM centrales WHERE sous_traitant_prevu IS NOT NULL
GROUP BY sous_traitant_prevu;