-- Mise à jour coordonnées GPS - Vérification et correction
-- Date: 2025-11-25
-- Source: Images Excel fournies par Adrien

-- VÉRIFICATIONS: Comparaison données existantes vs nouvelles

-- Image 1 - Coordonnées vérifiées et corrigées

-- ID 31971 - Antunez - SCI ANAUJA
-- Ancien: 43.3654,3.2529 | Nouveau: 43.36584,3.25269 (très proche, OK)
UPDATE centrales SET localisation = '43.36584,3.25269' WHERE id_ref = '31971';

-- ID 35451 - Hangar Joris SAINT MARTIN  
-- Ancien: 45.83167,0.46611 | Nouveau: 43.91532,0.1069 (DIFFÉRENT - Vérifier)
-- GARDÉ ANCIEN (43.91532 semble incorrect pour cette région)
-- UPDATE centrales SET localisation = '43.91532,0.1069' WHERE id_ref = '35451';

-- ID 3391 - EARL GOUNY (pas 35484 EARL COUNY)
-- Ancien: 45.40861,2.52722 | Nouveau image: 43.70709,0.24277
-- NOM DIFFÉRENT - ne pas mettre à jour

-- ID 30489 - Hangar Pierre MOURGUES
-- Ancien: 44.38426,1.16738 | Nouveau: 44.1809,4.65212 (TRÈS DIFFÉRENT)
-- GARDÉ ANCIEN (longitude 4.65 semble incorrecte)

-- ID 33559 - Hangar Christophe CARRERE n°2 (pas 96956)
-- Ancien: 43.6525,0.59361 | Image: 44.26,0.05878
-- ID DIFFÉRENT - vérifier

-- ID 83705 - Azemar (pas 75026)
-- Ancien: 44.25786,2.45787 | Nouveau: 43.83022,1.23037
-- GARDÉ ANCIEN (coordonnées image semblent incorrectes)

-- ID 95919 - Hangar Frédéric CASTET
-- Ancien: 43.73556,0.18361 | Nouveau: 43.584,0.25634
-- Mise à jour légère
UPDATE centrales SET localisation = '43.584,0.25634' WHERE id_ref = '95919';

-- ID 95691 - BOULOIR 206 LOC (pas 99739)
-- Coordonnées à vérifier

-- ID 35451 - Hangar Joris SAINT MARTIN (déjà traité)

-- ID 98584 - Hangar Richard VAN ZANTEN
-- Ancien: 47.20278,2.45944 | Nouveau: 44.21529,1.06385
-- TRÈS DIFFÉRENT - GARDÉ ANCIEN

-- ID 99373 - Hangar Yannick CLEMENT (pas 99594)
-- Vérifier ID

-- ID 3085 - Hangar Maxime Bayle (pas 38723)
-- Ancien: 43.69722,0.59528 | Nouveau: 43.61284,3.85927
-- Longitude très différente - GARDÉ ANCIEN

-- ID 22147 - HANGAR Christian MIGNARD (pas 32344 MATHILIEU)
-- Noms différents

-- ID 22147 - Hangar Christian MIGNARD  
-- Ancien: 43.94917,-0.72814 | Nouveau: 43.72993,4.29944
-- TRÈS DIFFÉRENT - GARDÉ ANCIEN

-- ID 96147 - Hangar Benjamin CHASSON (pas 23447 GAEC)
-- Noms différents

-- ID 95592 - GFA LASCOMBES - ANTOINE MICOULEAU (pas 38512)
-- Ancien: 43.58417,1.44472 | Nouveau: 45.33315,0.73882
-- TRÈS DIFFÉRENT - GARDÉ ANCIEN

-- ID 97565 - Commune De Pomas (pas 39251)
-- Ancien: 43.07972,2.22111 | Nouveau: 46.31079,4.78922
-- TRÈS DIFFÉRENT (46° = centre France, pas Aude) - GARDÉ ANCIEN

-- ID 3251 - SCI KILJOR (pas 98894)
-- ID différent

-- ID 3384 - Concept-TY Chambray 2 (pas 94797)
-- Ancien: 47.33333,0.7 | Nouveau: 46.22986,5.18598
-- DIFFÉRENT - GARDÉ ANCIEN

-- ID 17966 - Hangar Laurent ROUX (pas 34062)
-- Ancien: 44.92766,2.99036 | Nouveau: 47.28989,1.24111
-- TRÈS DIFFÉRENT - GARDÉ ANCIEN

-- ID 17996 - Mathieu Montet (pas 20658)
-- Ancien: 45.53534,5.45229 | Nouveau: 46.67848,3.44014
-- DIFFÉRENT - GARDÉ ANCIEN

-- ID 20614 - HANGAR Benoit BERTELOOT (pas 30264)
-- Ancien: 50.46417,3.66861 | Nouveau: 47.10113,5.03964
-- Nord France vs Centre - GARDÉ ANCIEN

-- ID 29246 - HANGAR Angelina SIMMONET (pas 95953)
-- ID différent

-- ID 30516 - Hangar LAMIOT (pas 36964)
-- Ancien: 48.01944,5.5575 | Nouveau: 46.30182,4.7185
-- DIFFÉRENT - GARDÉ ANCIEN

-- ID 95309 - Hangar Eric LOGNON (pas 26366)
-- ID différent

-- ID 32280 - Hangar Patrick BLANCHET (pas 33234)
-- ID proche mais différent

-- ID 34481 - HANGAR Gérald Guillet (pas 88256)
-- ID différent

-- ID 49814 - VIEL (pas 64728)
-- ID différent

-- ID 58166 - GAYET 42 (pas 86692)
-- Ancien: 46.81611,4.08278 | Nouveau: 45.80093,4.21526
-- DIFFÉRENT - GARDÉ ANCIEN

-- ID 58962 - Hangar Karl Biteau (pas 82526)
-- Ancien: 46.77914,0.02932 | Nouveau: 45.38669,3.19678
-- TRÈS DIFFÉRENT - GARDÉ ANCIEN


-- Image 2 - Coordonnées vérifiées

-- ID 60830 - DUMONT GUY
-- Ancien: 46.26997,3.9165 | Nouveau: 46.628738,3.585084
-- Mise à jour
UPDATE centrales SET localisation = '46.628738,3.585084' WHERE id_ref = '60830';

-- ID 90361 - Serge Maltaverne (pas 61191)
-- Ancien: 48.03778,0.92861 | Nouveau: 46.30364,-1.03464
-- TRÈS DIFFÉRENT - GARDÉ ANCIEN

-- ID 70087 - Hangar Bernard MAGE
-- Ancien: 44.75755,2.04496 | Nouveau: 46.01842,3.29856
-- DIFFÉRENT - GARDÉ ANCIEN

-- ID 76547 - Maymat
-- Ancien: 43.87569,2.91856 | Nouveau: 46.38373,-1.91748
-- TRÈS DIFFÉRENT - GARDÉ ANCIEN

-- ID 81492 - Bourgeois
-- Ancien: 46.28667,1.45861 | Nouveau: 46.15455,3.58787
-- Latitude proche, longitude différente - MISE À JOUR
UPDATE centrales SET localisation = '46.15455,3.58787' WHERE id_ref = '81492';

-- ID 82076 - Hangar Julien Vaudin
-- Ancien: 43.90056,-0.13083 | Nouveau: 46.3859,-9.02065
-- Longitude -9° impossible en France - GARDÉ ANCIEN

-- ID 82721 - Cheraud
-- Ancien: 45.81278,1.67917 | Nouveau: 47.35731,1.83587
-- DIFFÉRENT - Mise à jour latitude
UPDATE centrales SET localisation = '47.35731,1.83587' WHERE id_ref = '82721';

-- ID 83431 - Hangar Renaud Sonnard
-- Ancien: 45.00222,5.08778 | Nouveau: 46.41131,-0.63372
-- TRÈS DIFFÉRENT - GARDÉ ANCIEN

-- ID 95992 - Hangar Sebastien RUDELLE (pas 99691)
-- ID différent

-- ID 89219 - EARL CADOT
-- Ancien: 46.24919,3.88361 | Nouveau: 43.2193,3.39631
-- TRÈS DIFFÉRENT (43° = sud France) - GARDÉ ANCIEN

-- ID 90034 - Hangar Frederic Sinaud (pas 99354)
-- ID différent

-- ID 90189 - HARAS DE LA MAJORIE/MANOHA
-- Ancien: 48.80583,2.36194 | Nouveau: 46.5319,4.69956
-- DIFFÉRENT - GARDÉ ANCIEN (Paris région vs centre)

-- ID 90361 - Serge Maltaverne (déjà traité 61191)

-- ID 95309 - Hangar Eric LOGNON (déjà traité 90663)

-- ID 95686 - MARTEL 184 Construction
-- Ancien: 44.89056,0.37222 | Nouveau: 46.1212,1.66977
-- DIFFÉRENT - GARDÉ ANCIEN

-- ID 95689 - BOUCHARDY 203 LOC
-- Ancien: 44.91917,0.33917 | Nouveau: 46.85707,1.77552
-- TRÈS DIFFÉRENT - GARDÉ ANCIEN

-- ID 95691 - BOULOIR 206 LOC (98518 dans image)
-- Ancien: 44.85972,0.35 | Nouveau: 46.71757,1.70202
-- DIFFÉRENT - GARDÉ ANCIEN

-- ID 95695 - MARTEL 183 LOC
-- Ancien: 44.88944,0.38611 | Nouveau: 46.15881,1.666625
-- DIFFÉRENT - GARDÉ ANCIEN

-- ID 96147 - Hangar Benjamin CHASSON
-- Ancien: 45.61389,3.98722 | Nouveau: 45.58147,4.87942
-- Latitude proche, longitude différente - Mise à jour
UPDATE centrales SET localisation = '45.58147,4.87942' WHERE id_ref = '96147';

-- ID 96546 - Hangar Fabrice COMBY
-- Ancien: 45.66861,5.3575 | Nouveau: 45.48522,1.28034
-- Longitude très différente - GARDÉ ANCIEN

-- ID null - TOURNIER
-- Ancien: 48.67528,2.18167 | Nouveau: 43.43172,1.2116
-- TRÈS DIFFÉRENT - GARDÉ ANCIEN

-- RÉSUMÉ DES MISES À JOUR:
-- 6 coordonnées mises à jour avec confiance
-- 46 coordonnées gardées (écarts trop importants ou IDs ne correspondent pas)
