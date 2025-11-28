-- Script de mise à jour des attributions sous-traitants
-- Généré automatiquement depuis update_attributions.py
-- Ne supprime AUCUNE donnée (checklists, photos, commentaires)

-- Mission 1: Antunez - SCI ANAUJA (dept 34) → DIAGPV - Adrien & Fabien
UPDATE ordres_mission SET sous_traitant_id = 5 WHERE id = 1;

-- Mission 2: EARL CADOT (dept 42) → ARTEMIS
UPDATE ordres_mission SET sous_traitant_id = 3 WHERE id = 2;

-- Mission 3: Azemar (dept 12) → DRONE AVEYRON SERVICE
UPDATE ordres_mission SET sous_traitant_id = 8 WHERE id = 3;

-- Mission 4: Mathieu Montet (dept 38) → ARTEMIS
UPDATE ordres_mission SET sous_traitant_id = 3 WHERE id = 4;

-- Mission 5: Hangar Laurent ROUX (dept 15) → CADENET
UPDATE ordres_mission SET sous_traitant_id = 4 WHERE id = 5;

-- Mission 6: Hangar Bernard MAGE (dept 46) → CADENET
UPDATE ordres_mission SET sous_traitant_id = 4 WHERE id = 6;

-- Mission 7: Hangar Pierre MOURGUES (dept 46) → CADENET
UPDATE ordres_mission SET sous_traitant_id = 4 WHERE id = 7;

-- Mission 8: Hangar Karl Biteau (dept 17) → EDOUARD - Martial
UPDATE ordres_mission SET sous_traitant_id = 6 WHERE id = 8;

-- Mission 9: Burgat Et Fils Tp (dept 11) → DIAGPV - Adrien & Fabien
UPDATE ordres_mission SET sous_traitant_id = 5 WHERE id = 9;

-- Mission 10: HANGAR Angelina SIMMONET (dept 3) → ARTEMIS
UPDATE ordres_mission SET sous_traitant_id = 3 WHERE id = 10;

-- Mission 11: Maymat (dept 3) → ARTEMIS
UPDATE ordres_mission SET sous_traitant_id = 3 WHERE id = 11;

-- Mission 12: HANGAR Christian MIGNARD (dept 11) → DIAGPV - Adrien & Fabien
UPDATE ordres_mission SET sous_traitant_id = 5 WHERE id = 12;

-- Mission 13: DUMONT GUY (dept 3) → ARTEMIS
UPDATE ordres_mission SET sous_traitant_id = 3 WHERE id = 13;

-- Mission 14: MARTEL 184 Construction (dept 23) → En attente attribution
UPDATE ordres_mission SET sous_traitant_id = 9 WHERE id = 14;

-- Mission 15: BOUCHARDY 203 LOC (dept 23) → En attente attribution
UPDATE ordres_mission SET sous_traitant_id = 9 WHERE id = 15;

-- Mission 16: BOULOIR 206 LOC (dept 23) → En attente attribution
UPDATE ordres_mission SET sous_traitant_id = 9 WHERE id = 16;

-- Mission 17: Hangar Renaud Sonnard (dept 79) → EDOUARD - Martial
UPDATE ordres_mission SET sous_traitant_id = 6 WHERE id = 17;

-- Mission 18: Hangar Fabrice COMBY (dept 19) → CADENET
UPDATE ordres_mission SET sous_traitant_id = 4 WHERE id = 18;

-- Mission 19: Hangar Julien Vaudin (dept 3) → ARTEMIS
UPDATE ordres_mission SET sous_traitant_id = 3 WHERE id = 19;

-- Mission 20: Hangar Richard VAN ZANTEN (dept 47) → DIAGPV - Adrien & Fabien
UPDATE ordres_mission SET sous_traitant_id = 5 WHERE id = 20;

-- Mission 23: Serge Maltaverne (dept 71) → ARTEMIS
UPDATE ordres_mission SET sous_traitant_id = 3 WHERE id = 23;

-- Mission 24: Hangar Christophe CARRERE n°2 (dept 47) → DIAGPV - Adrien & Fabien
UPDATE ordres_mission SET sous_traitant_id = 5 WHERE id = 24;

-- Mission 25: Hangar Frédéric CASTET (dept 31) → DIAGPV - Adrien & Fabien
UPDATE ordres_mission SET sous_traitant_id = 5 WHERE id = 25;

-- Mission 26: MARTEL 183 LOC (dept 23) → En attente attribution
UPDATE ordres_mission SET sous_traitant_id = 9 WHERE id = 26;

-- Mission 27: Hangar Frederic Sinaud (dept 23) → En attente attribution
UPDATE ordres_mission SET sous_traitant_id = 9 WHERE id = 27;

-- Mission 29: HARAS DE LA MAJORIE/MANOHA (dept 7) → ARTEMIS
UPDATE ordres_mission SET sous_traitant_id = 3 WHERE id = 29;

-- Mission 30: Hangar Yannick CLEMENT (dept 31) → DIAGPV - Adrien & Fabien
UPDATE ordres_mission SET sous_traitant_id = 5 WHERE id = 30;

-- Mission 31: Concept-TY Chambray 2 (dept 37) → EDOUARD - Martial
UPDATE ordres_mission SET sous_traitant_id = 6 WHERE id = 31;

-- Mission 32: Hangar Patrick BLANCHET (dept 26) → ARTEMIS
UPDATE ordres_mission SET sous_traitant_id = 3 WHERE id = 32;

-- Mission 33: MATHIEU Vincent (dept 11) → DIAGPV - Adrien & Fabien
UPDATE ordres_mission SET sous_traitant_id = 5 WHERE id = 33;

-- Mission 34: Cheraud (dept 44) → EDOUARD - Martial
UPDATE ordres_mission SET sous_traitant_id = 6 WHERE id = 34;

-- Mission 36: Didier - PRIEUR (dept 26) → ARTEMIS
UPDATE ordres_mission SET sous_traitant_id = 3 WHERE id = 36;

-- Mission 37: Hangar Eric LOGNON (dept 3) → ARTEMIS
UPDATE ordres_mission SET sous_traitant_id = 3 WHERE id = 37;

-- Mission 38: Hangar LAMIOT (dept 42) → ARTEMIS
UPDATE ordres_mission SET sous_traitant_id = 3 WHERE id = 38;

-- Mission 39: VIEL (dept 44) → EDOUARD - Martial
UPDATE ordres_mission SET sous_traitant_id = 6 WHERE id = 39;

-- Mission 41: SCI KILJOR (dept 7) → ARTEMIS
UPDATE ordres_mission SET sous_traitant_id = 3 WHERE id = 41;

-- Mission 42: Hangar Benjamin CHASSON (dept 26) → ARTEMIS
UPDATE ordres_mission SET sous_traitant_id = 3 WHERE id = 42;

-- Mission 43: Bourgeois (dept 44) → EDOUARD - Martial
UPDATE ordres_mission SET sous_traitant_id = 6 WHERE id = 43;

-- Mission 44: EARL GOUNY (dept 47) → DIAGPV - Adrien & Fabien
UPDATE ordres_mission SET sous_traitant_id = 5 WHERE id = 44;

-- Mission 45: Hangar Maxime Bayle (dept 11) → DIAGPV - Adrien & Fabien
UPDATE ordres_mission SET sous_traitant_id = 5 WHERE id = 45;

-- Mission 46: Commune De Pomas (dept 11) → DIAGPV - Adrien & Fabien
UPDATE ordres_mission SET sous_traitant_id = 5 WHERE id = 46;

-- Mission 47: GFA LASCOMBES - ANTOINE MICOULEAU (dept 11) → DIAGPV - Adrien & Fabien
UPDATE ordres_mission SET sous_traitant_id = 5 WHERE id = 47;

-- Mission 48: HANGAR Gérald Guillet (dept 17) → EDOUARD - Martial
UPDATE ordres_mission SET sous_traitant_id = 6 WHERE id = 48;

-- Mission 49: Hangar Joris SAINT MARTIN (dept 32) → COURTIADE DISTRIB
UPDATE ordres_mission SET sous_traitant_id = 7 WHERE id = 49;

-- Mission 50: GAYET 42 (dept 42) → ARTEMIS
UPDATE ordres_mission SET sous_traitant_id = 3 WHERE id = 50;

-- Mission 51: Hangar Sebastien RUDELLE (dept 12) → DRONE AVEYRON SERVICE
UPDATE ordres_mission SET sous_traitant_id = 8 WHERE id = 51;

-- Mission 52: TOURNIER (dept 31) → DIAGPV - Adrien & Fabien
UPDATE ordres_mission SET sous_traitant_id = 5 WHERE id = 52;

