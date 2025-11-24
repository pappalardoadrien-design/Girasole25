-- PRÉ-ATTRIBUTION PAR NOMS DES CENTRALES

UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom LIKE '%SCI KILJOR%';
UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom LIKE '%SCI SOLARWEST%';
UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom LIKE '%TERALTA CHAVANOZ 2%';
UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom LIKE '%SCI TERALTA COURTHEZON%';
UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom LIKE '%SCI TERALTA DARDILLY%';
UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom LIKE '%SCI TERALTA MONTBRISON%';
UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom LIKE '%SCI TERALTA SATILLIEU%';
UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom LIKE '%SCI TERALTA SAVASSE%';
UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom LIKE '%SCI TERALTA SEYSSUEL%';
UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom LIKE '%SCI RISSOAN%';
UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom LIKE '%SCI SARL RENOUERGIE%';
UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom LIKE '%SCI KIRDM%';
UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom LIKE '%SCI MDEA BEAUREPAIRE%';
UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom LIKE '%SCI MDP%';
UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom LIKE '%SCI MEGAWATT ANSE%';
UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom LIKE '%MONTELIMAR Toiture%';
UPDATE centrales SET sous_traitant_prevu = 'ARTEMIS' WHERE nom LIKE '%ROYBON Toiture%';

UPDATE centrales SET sous_traitant_prevu = 'CADENET' WHERE nom LIKE '%CHAMPLITTE Toiture%';
UPDATE centrales SET sous_traitant_prevu = 'CADENET' WHERE nom LIKE '%SCI EQMV SAINT GERMAIN LAPRADE%';
UPDATE centrales SET sous_traitant_prevu = 'CADENET' WHERE nom LIKE '%SCI GVLG%';
UPDATE centrales SET sous_traitant_prevu = 'CADENET' WHERE nom LIKE '%SCI LAVILLENIE CHAMBON%';
UPDATE centrales SET sous_traitant_prevu = 'CADENET' WHERE nom LIKE '%SCI LEBRE ENERGIE%';
UPDATE centrales SET sous_traitant_prevu = 'CADENET' WHERE nom LIKE '%SCI LRNR%';
UPDATE centrales SET sous_traitant_prevu = 'CADENET' WHERE nom LIKE '%SCI MEGAWATT JALIGNY%';
UPDATE centrales SET sous_traitant_prevu = 'CADENET' WHERE nom LIKE '%SCI SCBNSL%';
UPDATE centrales SET sous_traitant_prevu = 'CADENET' WHERE nom LIKE '%SCI SOLAIRE TOURNON%';
UPDATE centrales SET sous_traitant_prevu = 'CADENET' WHERE nom LIKE '%SCI THIBIER 2%';

-- VÉRIFICATION
SELECT sous_traitant_prevu, COUNT(*) as nb, ROUND(SUM(puissance_kwc), 2) as total_kwc
FROM centrales WHERE sous_traitant_prevu IS NOT NULL
GROUP BY sous_traitant_prevu;