-- Migration 0004: Import de toutes les centrales GIRASOLE depuis Excel
-- Date: 2025-11-21
-- Total centrales: 52

-- Ajout colonnes GPS et métadonnées (ignorer erreur si existe déjà)
ALTER TABLE centrales ADD COLUMN latitude REAL;
ALTER TABLE centrales ADD COLUMN longitude REAL;
ALTER TABLE centrales ADD COLUMN distance_toulouse_km REAL;
ALTER TABLE centrales ADD COLUMN distance_lyon_km REAL;
ALTER TABLE centrales ADD COLUMN base_proche TEXT;
ALTER TABLE centrales ADD COLUMN dept TEXT;
ALTER TABLE centrales ADD COLUMN id_ref TEXT;

-- Import des centrales GIRASOLE
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '3085',
  'Hangar Maxime Bayle',
  'SOL',
  324.87,
  'Château Lagoual, 11400 Lasbordes, France',
  'A_AUDITER',
  43.298645,
  2.075894,
  61.3,
  350.7,
  'Toulouse',
  '11'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '97565',
  'Commune De Pomas',
  'SOL',
  254.8,
  'Rue de la Mairie, 11250 Pomas, France',
  'A_AUDITER',
  43.115116,
  2.296403,
  87.8,
  356.9,
  'Toulouse',
  '11'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '95592',
  'GFA LASCOMBES - ANTOINE MICOULEAU',
  'SOL',
  277.095,
  'Lascombes, 11170 Alzonne, France',
  'A_AUDITER',
  43.261285,
  2.150816,
  68.7,
  350.3,
  'Toulouse',
  '11'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '61191',
  'Serge Maltaverne',
  'SOL',
  260.26,
  '638  route Chard, 71320 Sainte-Radegonde, France',
  'A_AUDITER',
  46.693226,
  4.104066,
  401.8,
  117.7,
  'Lyon',
  '71'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '49814',
  'VIEL',
  'SOL',
  211.58,
  'La Haute Bellangerais, 44390 Les Touches, France',
  'A_AUDITER',
  47.465262,
  -1.403811,
  483.1,
  512.6,
  'Toulouse',
  '44'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '32074',
  'Didier - PRIEUR',
  'SOL',
  449.54,
  'Quartier de Montalivet 26120 Montmeyran',
  'A_AUDITER',
  44.846622,
  4.958897,
  312.2,
  102.5,
  'Lyon',
  '26'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '3251',
  'SCI KILJOR',
  'TOITURE',
  109.2,
  '6 Rue Albert Camus, 07800 La Voulte-sur-Rhône, France',
  'A_AUDITER',
  44.8155816,
  4.788295,
  298.6,
  105.5,
  'Lyon',
  '07'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '96147',
  'Hangar Benjamin CHASSON',
  'SOL',
  388.04,
  '465 Rue Jean Rostand, 26800 Portes-lès-Valence, France',
  'A_AUDITER',
  44.891874,
  4.875345,
  308.5,
  97.0,
  'Lyon',
  '26'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '30516',
  'Hangar LAMIOT',
  'SOL',
  343.07,
  'La Gélopière, 42110 Feurs, France',
  'A_AUDITER',
  45.73213,
  4.2051523,
  321.9,
  49.1,
  'Lyon',
  '42'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '81492',
  'Bourgeois',
  'SOL',
  225.68,
  'Le Roscouët, 44440 Teillé, France',
  'A_AUDITER',
  47.441894,
  -1.276208,
  476.3,
  502.6,
  'Toulouse',
  '44'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '3391',
  'EARL GOUNY',
  'SOL',
  331.24,
  'Gouny, 47350 Escassefort, France',
  'A_AUDITER',
  44.5612009,
  0.237459,
  143.5,
  384.5,
  'Toulouse',
  '47'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '95309',
  'Hangar Eric LOGNON',
  'SOL',
  324.87,
  'Château des Millets, 03230 Chevagnes, France',
  'A_AUDITER',
  46.604544,
  3.617219,
  374.6,
  132.4,
  'Lyon',
  '03'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '3334',
  'MATHIEU Vincent',
  'SOL',
  218.4,
  'Lieu-dit Les Avals 11700 LA REDORTE',
  'A_AUDITER',
  43.2511259,
  2.6540254,
  105.3,
  328.6,
  'Toulouse',
  '11'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '35280',
  'Hangar Patrick BLANCHET',
  'SOL',
  159.25,
  'Les Exclis, 26110 Venterol, France',
  'A_AUDITER',
  44.366335,
  5.075442,
  302.6,
  156.5,
  'Lyon',
  '26'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '82721',
  'Cheraud',
  'SOL',
  499.59,
  'Bellevue, 44260 Malville, France',
  'A_AUDITER',
  47.3537581,
  -1.8332084,
  488.9,
  539.5,
  'Toulouse',
  '44'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '95992',
  'Hangar Sebastien RUDELLE',
  'SOL',
  309.4,
  'Crayssac, 12120 Salmiech, France',
  'A_AUDITER',
  44.218003,
  2.632367,
  117.1,
  244.1,
  'Toulouse',
  '12'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '99373',
  'Hangar Yannick CLEMENT',
  'SOL',
  331.24,
  'Gazailles, 31160 Estadens, France',
  'A_AUDITER',
  43.049103,
  0.855347,
  78.0,
  437.1,
  'Toulouse',
  '31'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '3384',
  'Concept-TY Chambray 2',
  'TOITURE',
  118.37,
  'Rue Etienne Cosson, 37170 Chambray-lès-Tours, France',
  'A_AUDITER',
  47.3288574,
  0.7034245,
  418.1,
  360.7,
  'Lyon',
  '37'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '86550',
  'Hangar Frederic Sinaud',
  'SOL',
  499.59,
  '11 La Quaire, 23240 Saint-Priest-la-Plaine, France',
  'A_AUDITER',
  46.2179017937812,
  1.65188544121681,
  291.0,
  251.1,
  'Lyon',
  '23'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '90034',
  'Hangar Frederic Sinaud',
  'SOL',
  218.4,
  'La Drable, 23300 Saint Priest la feuille',
  'A_AUDITER',
  46.2176709,
  1.6448961,
  291.0,
  251.6,
  'Lyon',
  '23'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '58166',
  'GAYET 42',
  'SOL',
  309.4,
  '419 Chemin des Seigles, 42210 Craintilleux, France',
  'A_AUDITER',
  45.578898,
  4.2194231,
  310.6,
  52.1,
  'Lyon',
  '42'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '33559',
  'Hangar Christophe CARRERE n°2',
  'SOL',
  278.005,
  'Boy, 47600 Montagnac-sur-Auvignon, France',
  'A_AUDITER',
  44.148762,
  0.45057,
  100.0,
  388.9,
  'Toulouse',
  '47'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '90189',
  'HARAS DE LA MAJORIE/MANOHA',
  'SOL',
  499.59,
  'L''Homme, 07790 Saint-Alban-d''Ay, France',
  'A_AUDITER',
  45.1973395,
  4.6689206,
  311.4,
  64.3,
  'Lyon',
  '07'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '83705',
  'Azemar',
  'SOL',
  319.41,
  '12160 Camboulazet, France',
  'A_AUDITER',
  44.227405,
  2.4430679,
  105.8,
  254.1,
  'Toulouse',
  '12'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '95190',
  'Hangar Denis Balavoine',
  'SOL',
  499.59,
  'Chem. du Piot, 32500 Fleurance, France',
  'A_AUDITER',
  43.836537,
  0.671232,
  67.3,
  392.2,
  'Toulouse',
  '32'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '95918',
  'Hangar Frédéric CASTET',
  'SOL',
  309.4,
  '11 Carrère de la Goutille, 31160 Estadens, France',
  'A_AUDITER',
  43.0438324,
  0.8606065,
  78.2,
  437.2,
  'Toulouse',
  '31'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '95919',
  'Hangar Frédéric CASTET',
  'TOITURE',
  286.65,
  '11 carrère de la Gentille, ESTADENS, 31160',
  'A_AUDITER',
  43.0438324,
  0.8606065,
  78.2,
  437.2,
  'Toulouse',
  '31'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '98584',
  'Hangar Richard VAN ZANTEN',
  'SOL',
  331.695,
  'La Tuque, 47210 Parranquet, France',
  'A_AUDITER',
  44.661452,
  0.838125,
  127.1,
  336.2,
  'Toulouse',
  '47'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '95695',
  'MARTEL 183 LOC',
  'TOITURE',
  456.82,
  'LIEU-DIT LES RIBIERES LE GRAND BOURG',
  'A_AUDITER',
  46.212786,
  1.666932,
  290.5,
  249.8,
  'Lyon',
  '23'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '96546',
  'Hangar Fabrice COMBY',
  'TOITURE',
  499.59,
  'Besse, 19210 Saint-Éloy-les-Tuileries, France',
  'A_AUDITER',
  45.453183,
  1.284294,
  205.9,
  278.4,
  'Toulouse',
  '19'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '31971',
  'Antunez - SCI ANAUJA',
  'SOL',
  269.45,
  '253 Bd Robert Koch, 34500 Béziers, France',
  'A_AUDITER',
  43.365364,
  3.252847,
  148.3,
  294.7,
  'Toulouse',
  '34'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '15843',
  'Hangar Laurent ROUX',
  'SOL',
  313.95,
  '10 Rue de Vareine 15260 Neuvéglise-sur-Truyère',
  'A_AUDITER',
  44.927516,
  2.99105,
  191.8,
  171.6,
  'Lyon',
  '15'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '83431',
  'Hangar Renaud Sonnard',
  'SOL',
  324.87,
  'Les grandes versaines, 79160 Villiers-en-Plaine, France',
  'A_AUDITER',
  46.4137152,
  -0.5364936,
  349.0,
  420.5,
  'Toulouse',
  '79'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '89219',
  'EARL CADOT',
  'SOL',
  309.4,
  'La Maisonneuve, 42310 Urbise, France',
  'A_AUDITER',
  46.248955,
  3.883046,
  351.1,
  91.2,
  'Lyon',
  '42'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '90361',
  'Serge Maltaverne',
  'TOITURE',
  218.855,
  '638 Chard, 71320 Sainte-Radegonde, France',
  'A_AUDITER',
  46.6938,
  4.10361,
  401.8,
  117.7,
  'Lyon',
  '71'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '95689',
  'BOUCHARDY 203 LOC',
  'TOITURE',
  498.68,
  'Saint-Martin, 23320 Saint-Vaury, France',
  'A_AUDITER',
  46.18989,
  1.698707,
  288.2,
  247.0,
  'Lyon',
  '23'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '95691',
  'BOULOIR 206 LOC',
  'TOITURE',
  499.59,
  '23240 Le Grand-Bourg, France',
  'A_AUDITER',
  46.210831,
  1.672983,
  290.3,
  249.3,
  'Lyon',
  '23'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '20614',
  'HANGAR Benoit BERTELOOT',
  'SOL',
  279.5,
  '127 Lieu Dit les Cleris 89150 Vernoy',
  'A_AUDITER',
  48.106608,
  3.119685,
  517.1,
  291.2,
  'Lyon',
  '89'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '35451',
  'Hangar Joris SAINT MARTIN',
  'SOL',
  218.4,
  'Palancot, 32160 Jû-Belloc, France',
  'A_AUDITER',
  43.5674319,
  0.015617,
  115.1,
  452.6,
  'Toulouse',
  '32'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '29246',
  'HANGAR Angelina SIMMONET',
  'SOL',
  177.45,
  'L''Étang Fouché, 03230 Paray-le-Frésil, France',
  'A_AUDITER',
  46.633756,
  3.581285,
  376.2,
  136.7,
  'Lyon',
  '03'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '22147',
  'HANGAR Christian MIGNARD',
  'SOL',
  97.11,
  'Chemin de Rieux 11700 Pépieux',
  'A_AUDITER',
  43.297328,
  2.67123,
  104.8,
  323.5,
  'Toulouse',
  '11'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '76547',
  'Maymat',
  'SOL',
  345.8,
  'Les Sorreaux, 03400 Toulon-sur-Allier, France',
  'A_AUDITER',
  46.513475,
  3.415977,
  358.6,
  137.5,
  'Lyon',
  '03'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '60830',
  'DUMONT GUY',
  'SOL',
  232.2,
  'Les Sabots, 03230 Chevagnes, France',
  'A_AUDITER',
  46.628304,
  3.5856557,
  375.8,
  136.0,
  'Lyon',
  '03'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '95686',
  'MARTEL 184 Construction',
  'SOL',
  499.95,
  'Lieudit Les Ribières, 23240 Le Grand Bourg',
  'A_AUDITER',
  46.212786,
  1.666932,
  290.5,
  249.8,
  'Lyon',
  '23'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '70087',
  'Hangar Bernard MAGE',
  'SOL',
  300.82,
  'Broussoles, 46210 Montet-et-Bouxal, France',
  'A_AUDITER',
  44.7583384,
  2.0448836,
  136.9,
  245.4,
  'Toulouse',
  '46'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '82076',
  'Hangar Julien Vaudin',
  'TOITURE',
  348.88,
  'Les Jacquets, 03230 Chevagnes, France',
  'A_AUDITER',
  46.588052,
  3.549109,
  370.6,
  134.9,
  'Lyon',
  '03'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '28173',
  'Burgat Et Fils Tp',
  'TOITURE',
  113.03,
  'La Plaine 11300 Cournanel',
  'A_AUDITER',
  42.994422,
  2.1968467,
  91.2,
  372.5,
  'Toulouse',
  '11'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '30489',
  'Hangar Pierre MOURGUES',
  'SOL',
  222.5,
  'Mondounet - Fargues, 46800 Porte-du-Quercy, France',
  'A_AUDITER',
  44.382264,
  1.167541,
  89.2,
  326.4,
  'Toulouse',
  '46'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '17966',
  'Hangar Laurent ROUX',
  'TOITURE',
  123.41,
  'Cros et Vareine, 15260 Neuvéglise-sur-Truyère, France',
  'A_AUDITER',
  44.9272045,
  2.9902171,
  191.8,
  171.6,
  'Lyon',
  '15'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '58962',
  'Hangar Karl Biteau',
  'SOL',
  324.22,
  '17250 Sainte-Gemme, France',
  'A_AUDITER',
  45.77182,
  -0.888342,
  303.4,
  443.9,
  'Toulouse',
  '17'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '17996',
  'Mathieu Montet',
  'TOITURE',
  432.015,
  '127 Route de la Tour, 38110 Montagnieu, France',
  'A_AUDITER',
  45.5349688,
  5.4518868,
  383.1,
  54.2,
  'Lyon',
  '38'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;
INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  '34481',
  'HANGAR Gérald Guillet',
  'SOL',
  197.8,
  'Bois Rond, 17510 Les Éduts, France',
  'A_AUDITER',
  45.988003,
  -0.212433,
  295.5,
  391.5,
  'Toulouse',
  '17'
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;