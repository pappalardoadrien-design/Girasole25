-- Mise à jour coordonnées GPS - Corrections finales
-- Date: 2025-11-25
-- Source: Vérification croisée images Excel + données existantes

-- MISES À JOUR VALIDÉES (écarts faibles, coordonnées cohérentes)

-- ID 31971 - Antunez - SCI ANAUJA (Béziers, Hérault)
-- Écart minime: amélioration précision
UPDATE centrales SET localisation = '43.36584,3.25269' WHERE id_ref = '31971';

-- ID 95919 - Hangar Frédéric CASTET (Gers)
-- Écart faible: mise à jour
UPDATE centrales SET localisation = '43.584,0.25634' WHERE id_ref = '95919';

-- ID 60830 - DUMONT GUY (Loire)
-- Amélioration précision
UPDATE centrales SET localisation = '46.628738,3.585084' WHERE id_ref = '60830';

-- ID 81492 - Bourgeois (Centre)
-- Latitude proche, longitude corrigée
UPDATE centrales SET localisation = '46.15455,3.58787' WHERE id_ref = '81492';

-- ID 82721 - Cheraud (Limousin)
-- Mise à jour latitude
UPDATE centrales SET localisation = '47.35731,1.83587' WHERE id_ref = '82721';

-- ID 96147 - Hangar Benjamin CHASSON (Auvergne)
-- Latitude proche, longitude corrigée
UPDATE centrales SET localisation = '45.58147,4.87942' WHERE id_ref = '96147';

-- NOTES IMPORTANTES:
-- - 46 autres coordonnées GARDÉES (écarts > 100km ou IDs ne correspondent pas)
-- - Coordonnées existantes proviennent de l'ANNEXE 1 officielle
-- - Certains IDs dans les images ne correspondent pas aux références centrales
-- - Coordonnées aberrantes ignorées (ex: longitude -9° impossible en France)
