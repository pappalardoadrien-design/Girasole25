-- RESET COMPLET CENTRALES DEPUIS ANNEXE 1 V4
-- Date: 2025-11-21
-- Source: ANNEXE 1 - Liste des installations a auditer_v4.xlsx

DELETE FROM centrales;

INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('31971', 'Antunez - SCI ANAUJA', 'OMBRIERE', 269.45, 
  '253 Bd Robert Koch, 34500 Béziers, France', 'A_AUDITER', 
  43.3654, 3.2529, 148.3, 294.7, 'Toulouse', '34');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('89219', 'EARL CADOT', 'SOL', 309.4, 
  'La Maisonneuve, 42310 Urbise, France', 'A_AUDITER', 
  46.24919, 3.88361, 351.2, 91.2, 'Lyon', '42');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('83705', 'Azemar', 'SOL', 319.0, 
  '12160 Camboulazet, France', 'A_AUDITER', 
  44.25786, 2.45787, 109.0, 251.0, 'Toulouse', '12');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('17996', 'Mathieu Montet', 'TOITURE', 256.055, 
  '127 Route de la Tour, 38110 Montagnieu, France', 'A_AUDITER', 
  45.53534, 5.45229, 383.2, 54.2, 'Lyon', '38');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('17966', 'Hangar Laurent ROUX', 'TOITURE', 123.41, 
  'Cros et Vareine, 15260 Neuvéglise-sur-Truyère, France', 'A_AUDITER', 
  44.92766, 2.99036, 191.9, 171.6, 'Lyon', '15');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('70087', 'Hangar Bernard MAGE', 'SOL', 300.82, 
  'Broussoles, 46210 Montet-et-Bouxal, France', 'A_AUDITER', 
  44.75755, 2.04496, 136.9, 245.4, 'Toulouse', '46');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('30489', 'Hangar Pierre MOURGUES', 'SOL', 222.5, 
  'Mondounet - Fargues, 46800 Porte-du-Quercy, France', 'A_AUDITER', 
  44.38426, 1.16738, 89.5, 326.3, 'Toulouse', '46');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('58962', 'Hangar Karl Biteau', 'SOL', 324.22, 
  '17250 Sainte-Gemme, France', 'A_AUDITER', 
  45.7447, -0.92605, 302.9, 447.0, 'Toulouse', '17');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('28173', 'Burgat Et Fils Tp', 'TOITURE', 113.03, 
  'La Plaine 11300 Cournanel', 'A_AUDITER', 
  43.04294, 2.23988, 89.6, 366.1, 'Toulouse', '11');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('29246', 'HANGAR Angelina SIMMONET', 'SOL', 173.55, 
  'L''Étang Fouché, 03230 Paray-le-Frésil, France', 'A_AUDITER', 
  46.63388, 3.58233, 376.3, 136.6, 'Lyon', '3');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('76547', 'Maymat', 'SOL', 345.8, 
  'Les Sorreaux, 03400 Toulon-sur-Allier, France', 'A_AUDITER', 
  46.51456, 3.41436, 358.7, 137.7, 'Lyon', '3');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('22147', 'HANGAR Christian MIGNARD', 'SOL', 97.11, 
  'Chemin de Rieux 11700 Pépieux', 'A_AUDITER', 
  43.297058, 2.665955, 104.4, 323.8, 'Toulouse', '11');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('60830', 'DUMONT GUY', 'SOL', 232.2, 
  'Les Sabots, 03230 Chevagnes, France', 'A_AUDITER', 
  46.628738, 3.585084, 375.9, 136.1, 'Lyon', '3');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('95686', 'MARTEL 184 Construction', 'SOL', 499.95, 
  'Lieudit Les Ribières, 23240 Le Grand Bourg', 'A_AUDITER', 
  46.21212, 1.66779, 290.5, 249.8, 'Lyon', '23');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('95689', 'BOUCHARDY 203 LOC', 'TOITURE', 498.68, 
  'Saint-Martin, 23320 Saint-Vaury, France', 'A_AUDITER', 
  46.18866, 1.70087, 288.1, 246.8, 'Lyon', '23');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('95691', 'BOULOIR 206 LOC', 'TOITURE', 499.14, 
  '23240 Le Grand-Bourg, France', 'A_AUDITER', 
  46.21057, 1.67252, 290.4, 249.4, 'Lyon', '23');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('83431', 'Hangar Renaud Sonnard', 'SOL', 324.87, 
  'Les grandes versaines, 79160 Villiers-en-Plaine, France', 'A_AUDITER', 
  46.41411, -0.53832, 349.1, 420.6, 'Toulouse', '79');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('96546', 'Hangar Fabrice COMBY', 'TOITURE', 499.59, 
  'Besse, 19210 Saint-Éloy-les-Tuileries, France', 'A_AUDITER', 
  45.452821, 1.2834, 206.0, 278.5, 'Toulouse', '19');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('82076', 'Hangar Julien Vaudin', 'TOITURE', 348.88, 
  'Les Jacquets, 03230 Chevagnes, France', 'A_AUDITER', 
  46.58741, 3.5494, 370.6, 134.9, 'Lyon', '3');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('98584', 'Hangar Richard VAN ZANTEN', 'SOL', 330.785, 
  'La Tuque, 47210 Parranquet, France', 'A_AUDITER', 
  44.66239, 0.83643, 127.3, 336.3, 'Toulouse', '47');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('20614', 'HANGAR Benoit BERTELOOT', 'SOL', 278.64, 
  '127 Lieu Dit les Cleris 89150 Vernoy', 'A_AUDITER', 
  48.107174, 3.120535, 517.3, 291.3, 'Lyon', '89');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('15843', 'Hangar Laurent ROUX', 'SOL', 313.95, 
  '10 Rue de Vareine 15260 Neuvéglise-sur-Truyère', 'A_AUDITER', 
  44.92782, 2.98992, 191.9, 171.6, 'Lyon', '15');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('90361', 'Serge Maltaverne', 'TOITURE', 218.855, 
  '638 Chard, 71320 Sainte-Radegonde, France', 'A_AUDITER', 
  46.6938, 4.10361, 401.9, 117.7, 'Lyon', '71');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('33559', 'Hangar Christophe CARRERE n°2', 'SOL', 278.005, 
  'Boy, 47600 Montagnac-sur-Auvignon, France', 'A_AUDITER', 
  44.14804, 0.44966, 100.1, 389.0, 'Toulouse', '47');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('95918', 'Hangar Frédéric CASTET', 'SOL', 309.4, 
  '11 Carrère de la Goutille, 31160 Estadens, France', 'A_AUDITER', 
  43.043825, 0.859333, 78.2, 437.3, 'Toulouse', '31');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('95695', 'MARTEL 183 LOC', 'TOITURE', 456.82, 
  'LIEU-DIT LES RIBIERES LE GRAND BOURG', 'A_AUDITER', 
  46.2125953274947, 1.66652635015915, 290.6, 249.9, 'Lyon', '23');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('86550', 'Hangar Frederic Sinaud', 'SOL', 499.59, 
  '11 La Quaire, 23240 Saint-Priest-la-Plaine, France', 'A_AUDITER', 
  46.2183, 1.65147, 291.2, 251.1, 'Lyon', '23');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('90034', 'Hangar Frederic Sinaud', 'SOL', 218.4, 
  'La Drable, 23300 Saint Priest la feuille', 'A_AUDITER', 
  46.23163, 1.52775, 292.3, 260.8, 'Lyon', '23');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('90189', 'HARAS DE LA MAJORIE/MANOHA', 'SOL', 499.59, 
  'L''Homme, 07790 Saint-Alban-d''Ay, France', 'A_AUDITER', 
  45.19709, 4.66906, 311.4, 64.4, 'Lyon', '7');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('99373', 'Hangar Yannick CLEMENT', 'SOL', 331.24, 
  'Gazailles, 31160 Estadens, France', 'A_AUDITER', 
  43.04786, 0.85301, 78.2, 437.3, 'Toulouse', '31');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('3384', 'Concept-TY Chambray 2', 'TOITURE', 118.37, 
  'Rue Etienne Cosson, 37170 Chambray-lès-Tours, France', 'A_AUDITER', 
  47.32796, 0.70112, 418.1, 360.8, 'Lyon', '37');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('35280', 'Hangar Patrick BLANCHET', 'SOL', 159.25, 
  'Les Exclis, 26110 Venterol, France', 'A_AUDITER', 
  44.36059, 5.07619, 302.5, 157.2, 'Lyon', '26');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('3334', 'MATHIEU Vincent', 'SOL', 218.4, 
  'Lieu-dit Les Avals 11700 LA REDORTE', 'A_AUDITER', 
  43.24989, 2.64117, 104.4, 329.3, 'Toulouse', '11');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('82721', 'Cheraud', 'SOL', 499.59, 
  'Bellevue, 44260 Malville, France', 'A_AUDITER', 
  47.355, -1.83701, 489.2, 539.8, 'Toulouse', '44');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('95919', 'Hangar Frédéric CASTET', 'TOITURE', 268.65, 
  '11 carrère de la Gentille, ESTADENS, 31160', 'A_AUDITER', 
  43.043896, 0.859961, 78.2, 437.2, 'Toulouse', '31');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('32074', 'Didier - PRIEUR', 'SOL', 499.59, 
  'Quartier de Montalivet 26120 Montmeyran', 'A_AUDITER', 
  44.84159, 4.96118, 312.2, 103.0, 'Lyon', '26');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('95309', 'Hangar Eric LOGNON', 'SOL', 324.87, 
  'Château des Millets, 03230 Chevagnes, France', 'A_AUDITER', 
  46.60446, 3.61907, 374.7, 132.3, 'Lyon', '3');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('30516', 'Hangar LAMIOT', 'SOL', 343.07, 
  'La Gélopière, 42110 Feurs, France', 'A_AUDITER', 
  45.73247, 4.2053, 322.0, 49.1, 'Lyon', '42');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('49814', 'VIEL', 'SOL', 211.575, 
  'La Haute Bellangerais, 44390 Les Touches, France', 'A_AUDITER', 
  47.46443, -1.40235, 483.0, 512.4, 'Toulouse', '44');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('61191', 'Serge Maltaverne', 'SOL', 260.26, 
  '638  route Chard, 71320 Sainte-Radegonde, France', 'A_AUDITER', 
  46.69424, 4.10364, 401.9, 117.8, 'Lyon', '71');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('3251', 'SCI KILJOR', 'TOITURE', 109.2, 
  '6 Rue Albert Camus, 07800 La Voulte-sur-Rhône, France', 'A_AUDITER', 
  44.81516, 4.78922, 298.7, 105.6, 'Lyon', '7');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('96147', 'Hangar Benjamin CHASSON', 'SOL', 388.04, 
  '465 Rue Jean Rostand, 26800 Portes-lès-Valence, France', 'A_AUDITER', 
  44.89225, 4.87492, 308.5, 97.0, 'Lyon', '26');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('81492', 'Bourgeois', 'SOL', 225.68, 
  'Le Roscouët, 44440 Teillé, France', 'A_AUDITER', 
  47.44106, -1.27682, 476.3, 502.7, 'Toulouse', '44');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('3391', 'EARL GOUNY', 'SOL', 331.24, 
  'Gouny, 47350 Escassefort, France', 'A_AUDITER', 
  44.56123, 0.24227, 143.3, 384.1, 'Toulouse', '47');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('3085', 'Hangar Maxime Bayle', 'SOL', 324.87, 
  'Château Lagoual, 11400 Lasbordes, France', 'A_AUDITER', 
  43.30401, 2.07536, 60.9, 350.2, 'Toulouse', '11');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('97565', 'Commune De Pomas', 'SOL', 254.8, 
  'Rue de la Mairie, 11250 Pomas, France', 'A_AUDITER', 
  43.11473, 2.2963, 87.8, 356.9, 'Toulouse', '11');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('95592', 'GFA LASCOMBES - ANTOINE MICOULEAU', 'SOL', 277.095, 
  'Lascombes, 11170 Alzonne, France', 'A_AUDITER', 
  43.26257, 2.15214, 68.6, 350.2, 'Toulouse', '11');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('34481', 'HANGAR Gérald Guillet', 'SOL', 197.8, 
  'Bois Rond, 17510 Les Éduts, France', 'A_AUDITER', 
  45.98895, -0.21354, 295.7, 391.6, 'Toulouse', '17');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('35451', 'Hangar Joris SAINT MARTIN', 'SOL', 218.4, 
  'Palancot, 32160 Jû-Belloc, France', 'A_AUDITER', 
  43.56698, 0.0163, 115.1, 452.6, 'Toulouse', '32');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('58166', 'GAYET 42', 'SOL', 309.4, 
  '419 Chemin des Seigles, 42210 Craintilleux, France', 'A_AUDITER', 
  45.57895, 4.21851, 310.6, 52.2, 'Lyon', '42');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('95992', 'Hangar Sebastien RUDELLE', 'SOL', 309.4, 
  'Crayssac, 12120 Salmiech, France', 'A_AUDITER', 
  44.21679, 2.63349, 117.1, 244.1, 'Toulouse', '12');
INSERT INTO centrales (id_ref, nom, type, puissance_kwc, localisation, statut, 
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept)
VALUES ('98563', 'TOURNIER', 'TOITURE', 197.925, 
  '548 Route de Marignac, 31430 Gratens, France', 'A_AUDITER', 
  43.3172, 1.12116, 41.2, 400.8, 'Toulouse', '31');