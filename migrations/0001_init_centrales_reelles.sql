-- Migration: Centrales réelles GIRASOLE 2025 (ANNEXE 1)
-- Date: 2025-01-20
-- Source: ANNEXE 1 - Liste des installations a auditer_v4.xlsx
-- Total: 52 centrales (39 SOL + 13 TOITURE)

-- Créer tables
CREATE TABLE IF NOT EXISTS centrales (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nom TEXT UNIQUE NOT NULL,
  type TEXT NOT NULL CHECK(type IN ('SOL', 'TOITURE')),
  puissance_kwc REAL,
  localisation TEXT,
  statut TEXT DEFAULT 'A_AUDITER' CHECK(statut IN ('A_AUDITER', 'EN_COURS', 'TERMINE', 'VALIDE')),
  date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
  date_audit DATETIME,
  date_validation DATETIME
);

CREATE TABLE IF NOT EXISTS retours_json (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  centrale_id INTEGER NOT NULL,
  nom_fichier TEXT NOT NULL,
  taille_mo REAL,
  nombre_photos INTEGER,
  date_upload DATETIME DEFAULT CURRENT_TIMESTAMP,
  technicien TEXT,
  version TEXT DEFAULT 'V4',
  FOREIGN KEY (centrale_id) REFERENCES centrales(id)
);

CREATE TABLE IF NOT EXISTS stats_mission (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  date_snapshot DATETIME DEFAULT CURRENT_TIMESTAMP,
  centrales_total INTEGER,
  centrales_auditees INTEGER,
  centrales_validees INTEGER,
  photos_total INTEGER,
  volumetrie_json_mb REAL,
  volumetrie_photos_mb REAL,
  heures_terrain_estimees REAL
);

-- Créer indexes
CREATE INDEX IF NOT EXISTS idx_centrales_statut ON centrales(statut);
CREATE INDEX IF NOT EXISTS idx_centrales_type ON centrales(type);
CREATE INDEX IF NOT EXISTS idx_retours_centrale ON retours_json(centrale_id);
CREATE INDEX IF NOT EXISTS idx_stats_date ON stats_mission(date_snapshot DESC);

-- Insérer centrales réelles (52)
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Antunez - SCI ANAUJA', 'SOL', 269.45, '253 Bd Robert Koch, 34500 Béziers, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('EARL CADOT', 'SOL', 309.4, 'La Maisonneuve, 42310 Urbise, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Azemar', 'SOL', 319.0, '12160 Camboulazet, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Mathieu Montet', 'TOITURE', 256.055, '127 Route de la Tour, 38110 Montagnieu, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Hangar Laurent ROUX', 'TOITURE', 123.41, 'Cros et Vareine, 15260 Neuvéglise-sur-Truyère, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Hangar Bernard MAGE', 'SOL', 300.82, 'Broussoles, 46210 Montet-et-Bouxal, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Hangar Pierre MOURGUES', 'SOL', 222.5, 'Mondounet - Fargues, 46800 Porte-du-Quercy, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Hangar Karl Biteau', 'SOL', 324.22, '17250 Sainte-Gemme, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Burgat Et Fils Tp', 'TOITURE', 113.03, 'La Plaine 11300 Cournanel', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('HANGAR Angelina SIMMONET', 'SOL', 173.55, 'L''Étang Fouché, 03230 Paray-le-Frésil, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Maymat', 'SOL', 345.8, 'Les Sorreaux, 03400 Toulon-sur-Allier, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('HANGAR Christian MIGNARD', 'SOL', 97.11, 'Chemin de Rieux 11700 Pépieux', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('DUMONT GUY', 'SOL', 232.2, 'Les Sabots, 03230 Chevagnes, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('MARTEL 184 Construction', 'SOL', 499.95, 'Lieudit Les Ribières, 23240 Le Grand Bourg', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('BOUCHARDY 203 LOC', 'TOITURE', 498.68, 'Saint-Martin, 23320 Saint-Vaury, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('BOULOIR 206 LOC', 'TOITURE', 499.14, '23240 Le Grand-Bourg, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Hangar Renaud Sonnard', 'SOL', 324.87, 'Les grandes versaines, 79160 Villiers-en-Plaine, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Hangar Fabrice COMBY', 'TOITURE', 499.59, 'Besse, 19210 Saint-Éloy-les-Tuileries, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Hangar Julien Vaudin', 'TOITURE', 348.88, 'Les Jacquets, 03230 Chevagnes, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Hangar Richard VAN ZANTEN', 'SOL', 330.785, 'La Tuque, 47210 Parranquet, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('HANGAR Benoit BERTELOOT', 'SOL', 278.64, '127 Lieu Dit les Cleris 89150 Vernoy', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Hangar Laurent ROUX (2)', 'SOL', 313.95, '10 Rue de Vareine 15260 Neuvéglise-sur-Truyère', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Serge Maltaverne', 'TOITURE', 218.855, '638 Chard, 71320 Sainte-Radegonde, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Hangar Christophe CARRERE n°2', 'SOL', 278.005, 'Boy, 47600 Montagnac-sur-Auvignon, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Hangar Frédéric CASTET', 'SOL', 309.4, '11 Carrère de la Goutille, 31160 Estadens, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('MARTEL 183 LOC', 'TOITURE', 456.82, 'LIEU-DIT LES RIBIERES LE GRAND BOURG', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Hangar Frederic Sinaud', 'SOL', 499.59, '11 La Quaire, 23240 Saint-Priest-la-Plaine, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Hangar Frederic Sinaud (2)', 'SOL', 218.4, 'La Drable, 23300 Saint Priest la feuille', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('HARAS DE LA MAJORIE/MANOHA', 'SOL', 499.59, 'L''Homme, 07790 Saint-Alban-d''Ay, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Hangar Yannick CLEMENT', 'SOL', 331.24, 'Gazailles, 31160 Estadens, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Concept-TY Chambray 2', 'TOITURE', 118.37, 'Rue Etienne Cosson, 37170 Chambray-lès-Tours, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Hangar Patrick BLANCHET', 'SOL', 159.25, 'Les Exclis, 26110 Venterol, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('MATHIEU Vincent', 'SOL', 218.4, 'Lieu-dit Les Avals 11700 LA REDORTE', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Cheraud', 'SOL', 499.59, 'Bellevue, 44260 Malville, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Hangar Frédéric CASTET (2)', 'TOITURE', 268.65, '11 carrère de la Gentille, ESTADENS, 31160', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Didier - PRIEUR', 'SOL', 499.59, 'Quartier de Montalivet 26120 Montmeyran', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Hangar Eric LOGNON', 'SOL', 324.87, 'Château des Millets, 03230 Chevagnes, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Hangar LAMIOT', 'SOL', 343.07, 'La Gélopière, 42110 Feurs, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('VIEL', 'SOL', 211.575, 'La Haute Bellangerais, 44390 Les Touches, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Serge Maltaverne (2)', 'SOL', 260.26, '638  route Chard, 71320 Sainte-Radegonde, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('SCI KILJOR', 'TOITURE', 109.2, '6 Rue Albert Camus, 07800 La Voulte-sur-Rhône, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Hangar Benjamin CHASSON', 'SOL', 388.04, '465 Rue Jean Rostand, 26800 Portes-lès-Valence, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Bourgeois', 'SOL', 225.68, 'Le Roscouët, 44440 Teillé, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('EARL GOUNY', 'SOL', 331.24, 'Gouny, 47350 Escassefort, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Hangar Maxime Bayle', 'SOL', 324.87, 'Château Lagoual, 11400 Lasbordes, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Commune De Pomas', 'SOL', 254.8, 'Rue de la Mairie, 11250 Pomas, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('GFA LASCOMBES - ANTOINE MICOULEAU', 'SOL', 277.095, 'Lascombes, 11170 Alzonne, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('HANGAR Gérald Guillet', 'SOL', 197.8, 'Bois Rond, 17510 Les Éduts, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Hangar Joris SAINT MARTIN', 'SOL', 218.4, 'Palancot, 32160 Jû-Belloc, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('GAYET 42', 'SOL', 309.4, '419 Chemin des Seigles, 42210 Craintilleux, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('Hangar Sebastien RUDELLE', 'SOL', 309.4, 'Crayssac, 12120 Salmiech, France', 'A_AUDITER');
INSERT INTO centrales (nom, type, puissance_kwc, localisation, statut) VALUES ('TOURNIER', 'TOITURE', 197.925, '548 Route de Marignac, 31430 Gratens, France', 'A_AUDITER');

-- Insérer statistiques mission
INSERT INTO stats_mission (centrales_total, centrales_auditees, centrales_validees, photos_total, volumetrie_json_mb, volumetrie_photos_mb, heures_terrain_estimees)
VALUES (52, 0, 0, 0, 0, 0, 360);