-- ═══════════════════════════════════════════════════════════════════════════════
-- SYNCHRONISATION BASE D1 PRODUCTION AVEC SHAREPOINT ANNEXE 1
-- Date génération : 24 Novembre 2025
-- Source : ANNEXE 1 - Liste des installations a auditer_v4(Liste audit) (1).csv
-- Objectif : Enrichir la base D1 avec métadonnées SharePoint
-- ═══════════════════════════════════════════════════════════════════════════════

-- 1. AJOUT DE NOUVELLES COLONNES DANS LA TABLE centrales
-- ═══════════════════════════════════════════════════════════════════════════════

ALTER TABLE centrales ADD COLUMN spv TEXT;
ALTER TABLE centrales ADD COLUMN latitude TEXT;
ALTER TABLE centrales ADD COLUMN longitude TEXT;
ALTER TABLE centrales ADD COLUMN adresse TEXT;
ALTER TABLE centrales ADD COLUMN dept TEXT;
ALTER TABLE centrales ADD COLUMN type_centrale TEXT;
ALTER TABLE centrales ADD COLUMN installateur TEXT;
ALTER TABLE centrales ADD COLUMN date_mes TEXT;
ALTER TABLE centrales ADD COLUMN si TEXT;
ALTER TABLE centrales ADD COLUMN panneaux TEXT;
ALTER TABLE centrales ADD COLUMN contact_exploitation TEXT;
ALTER TABLE centrales ADD COLUMN tel_exploitation TEXT;
ALTER TABLE centrales ADD COLUMN contact_gestion TEXT;
ALTER TABLE centrales ADD COLUMN tel_gestion TEXT;
ALTER TABLE centrales ADD COLUMN audit_toiture TEXT;
ALTER TABLE centrales ADD COLUMN audit_hors_toiture TEXT;
ALTER TABLE centrales ADD COLUMN ratio_pr TEXT;
ALTER TABLE centrales ADD COLUMN date_prev_audit TEXT;

-- 2. MISE À JOUR DES DONNÉES EXISTANTES AVEC VALEURS SHAREPOINT
-- ═══════════════════════════════════════════════════════════════════════════════


-- Centrale ID 3085 : Hangar Maxime Bayle
UPDATE centrales SET
    puissance_kwc = 324.87,
    spv = 'F3 GIRASPV15',
    latitude = '43,30401',
    longitude = '2,07536',
    adresse = 'Château Lagoual, 11400 Lasbordes, France',
    dept = '11',
    type_centrale = 'Bâtiment à construire - A1',
    installateur = 'Yama Energies',
    date_mes = '29/08/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM455M10RT-B54HSW',
    contact_exploitation = 'Yasser BADREZZAMANE',
    tel_exploitation = '06 74 09 71 44',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '95%',
    date_prev_audit = 'semaine 48'
WHERE nom = 'Hangar Maxime Bayle';

-- Centrale ID 3251 : SCI KILJOR
UPDATE centrales SET
    puissance_kwc = 109.2,
    spv = 'F3 DAVAI ENRSPV13',
    latitude = '44,81516',
    longitude = '4,78922',
    adresse = '6 Rue Albert Camus, 07800 La Voulte-sur-Rhône, France',
    dept = '7',
    type_centrale = 'Toiture existante / Rénovation',
    installateur = 'NEOXOM',
    date_mes = '04/08/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM455M10RT-54HSW-HBW',
    contact_exploitation = 'Yasser BADREZZAMANE',
    tel_exploitation = '06 74 09 71 44',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '85%',
    date_prev_audit = ''
WHERE nom = 'SCI KILJOR';

-- Centrale ID 3334 : MATHIEU Vincent
UPDATE centrales SET
    puissance_kwc = 218.4,
    spv = 'F3 GIRASPV15',
    latitude = '43,24989',
    longitude = '2,64117',
    adresse = 'Lieu-dit Les Avals 11700 LA REDORTE',
    dept = '11',
    type_centrale = 'Bâtiment à construire - C',
    installateur = 'KEVEL',
    date_mes = '30/06/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM455M10RT-B54HSW',
    contact_exploitation = 'Yasser BADREZZAMANE',
    tel_exploitation = '06 74 09 71 44',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '87%',
    date_prev_audit = 'semaine 48'
WHERE nom = 'MATHIEU Vincent';

-- Centrale ID 3384 : Concept-TY Chambray 2
UPDATE centrales SET
    puissance_kwc = 118.37,
    spv = 'F2 DAVAI ENRSPV7',
    latitude = '47,32796',
    longitude = '0,70112',
    adresse = 'Rue Etienne Cosson, 37170 Chambray-lès-Tours, France',
    dept = '37',
    type_centrale = 'Toiture existante / PV Ready',
    installateur = 'REGIESOLAIRE',
    date_mes = '24/06/2025',
    si = 'Soprasolar FixEvoTilt',
    panneaux = 'JKM445N-54HL4R-V',
    contact_exploitation = 'Yasser BADREZZAMANE',
    tel_exploitation = '06 74 09 71 44',
    contact_gestion = 'Victor PONTAIS',
    tel_gestion = '06 69 21 76 42',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '97%',
    date_prev_audit = ''
WHERE nom = 'Concept-TY Chambray 2';

-- Centrale ID 3391 : EARL GOUNY
UPDATE centrales SET
    puissance_kwc = 331.24,
    spv = 'F3 GIRASPV15',
    latitude = '44,56123',
    longitude = '0,24227',
    adresse = 'Gouny, 47350 Escassefort, France',
    dept = '47',
    type_centrale = 'Bâtiment à construire - C',
    installateur = 'HBBAT',
    date_mes = '11/08/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM455M10RT-54HSW-HBW',
    contact_exploitation = 'Parfait MEZEME ONA',
    tel_exploitation = '06 63 06 94 73',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '104%',
    date_prev_audit = 'semaine 49'
WHERE nom = 'EARL GOUNY';

-- Centrale ID 15843 : Hangar Laurent ROUX
UPDATE centrales SET
    puissance_kwc = 313.95,
    spv = 'F2 DAVAI ENRSPV6',
    latitude = '44,92782',
    longitude = '2,98992',
    adresse = '10 Rue de Vareine 15260 Neuvéglise-sur-Truyère',
    dept = '15',
    type_centrale = 'Bâtiment à construire -  A2',
    installateur = 'Yama Energies',
    date_mes = '22/04/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM455M10RT-54HSW-HBW',
    contact_exploitation = 'Parfait MEZEME ONA',
    tel_exploitation = '06 63 06 94 73',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '95%',
    date_prev_audit = ''
WHERE nom = 'Hangar Laurent ROUX';

-- Centrale ID 17966 : Hangar Laurent ROUX
UPDATE centrales SET
    puissance_kwc = 123.41,
    spv = 'F2 DAVAI ENRSPV8',
    latitude = '44,92766',
    longitude = '2,99036',
    adresse = 'Cros et Vareine, 15260 Neuvéglise-sur-Truyère, France',
    dept = '15',
    type_centrale = 'Toiture existante / Rénovation',
    installateur = 'OFT ',
    date_mes = '22/10/2024',
    si = 'DOMESOLAR Ital Solar',
    panneaux = 'DMEGC-DM430M10T-54HSW-HBW',
    contact_exploitation = 'Parfait MEZEME ONA',
    tel_exploitation = '06 63 06 94 73',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '67%',
    date_prev_audit = ''
WHERE nom = 'Hangar Laurent ROUX';

-- Centrale ID 17996 : Mathieu Montet
UPDATE centrales SET
    puissance_kwc = 256.055,
    spv = 'F2 DAVAI ENRSPV12',
    latitude = '45,53534',
    longitude = '5,45229',
    adresse = '127 Route de la Tour, 38110 Montagnieu, France',
    dept = '38',
    type_centrale = 'Toiture existante / Rénovation',
    installateur = 'PROSUNFRANCE',
    date_mes = '02/10/2024',
    si = 'DOMESOLAR Hb²/NPA 3.45',
    panneaux = 'DMEGC-DM415M10-54HSW-V',
    contact_exploitation = 'Yasser BADREZZAMANE',
    tel_exploitation = '06 74 09 71 44',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '90%',
    date_prev_audit = ''
WHERE nom = 'Mathieu Montet';

-- Centrale ID 20614 : HANGAR Benoit BERTELOOT
UPDATE centrales SET
    puissance_kwc = 278.64,
    spv = 'F2 DAVAI ENRSPV8',
    latitude = '48,107174',
    longitude = '3,120535',
    adresse = '127 Lieu Dit les Cleris 89150 Vernoy',
    dept = '89',
    type_centrale = 'Bâtiment à construire - A1',
    installateur = 'LE TRIANGLE',
    date_mes = '30/01/2025',
    si = 'Triangle ISB',
    panneaux = 'DMEGC-DM430M10T-54HSW-HBW',
    contact_exploitation = 'Yasser BADREZZAMANE',
    tel_exploitation = '06 74 09 71 44',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = 'X',
    audit_hors_toiture = 'X',
    ratio_pr = '103%',
    date_prev_audit = ''
WHERE nom = 'HANGAR Benoit BERTELOOT';

-- Centrale ID 22147 : HANGAR Christian MIGNARD
UPDATE centrales SET
    puissance_kwc = 97.11,
    spv = 'F2 DAVAI ENRSPV9',
    latitude = '43,297058',
    longitude = '2,665955',
    adresse = 'Chemin de Rieux 11700 Pépieux',
    dept = '11',
    type_centrale = 'Bâtiment à construire - B',
    installateur = 'Solartis',
    date_mes = '16/12/2024',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM415M10-54HSW-V',
    contact_exploitation = 'Parfait MEZEME ONA',
    tel_exploitation = '06 63 06 94 73',
    contact_gestion = 'Victor PONTAIS',
    tel_gestion = '06 69 21 76 42',
    audit_toiture = 'X',
    audit_hors_toiture = 'X',
    ratio_pr = '100%',
    date_prev_audit = 'semaine 48'
WHERE nom = 'HANGAR Christian MIGNARD';

-- Centrale ID 28173 : Burgat Et Fils Tp
UPDATE centrales SET
    puissance_kwc = 113.03,
    spv = 'F2 DAVAI ENRSPV6',
    latitude = '43,04294',
    longitude = '2,23988',
    adresse = 'La Plaine 11300 Cournanel',
    dept = '11',
    type_centrale = 'Toiture existante / Rénovation',
    installateur = 'SOLARTIS',
    date_mes = '20/11/2024',
    si = 'DOMESOLAR Ital Solar',
    panneaux = 'DMEGC-DM445M10RT-54HSW-HBW',
    contact_exploitation = 'Parfait MEZEME ONA',
    tel_exploitation = '06 63 06 94 73',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '85%',
    date_prev_audit = 'semaine 48'
WHERE nom = 'Burgat Et Fils Tp';

-- Centrale ID 29246 : HANGAR Angelina SIMMONET
UPDATE centrales SET
    puissance_kwc = 173.55,
    spv = 'F2 DAVAI ENRSPV6',
    latitude = '46,63388',
    longitude = '3,58233',
    adresse = 'L''Étang Fouché, 03230 Paray-le-Frésil, France',
    dept = '3',
    type_centrale = 'Bâtiment à construire - A1',
    installateur = 'LE TRIANGLE',
    date_mes = '10/01/2025',
    si = 'Triangle ISB',
    panneaux = 'DMEGC-DM455M10RT-54HSW-HBW',
    contact_exploitation = 'Yasser BADREZZAMANE',
    tel_exploitation = '06 74 09 71 44',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '96%',
    date_prev_audit = ''
WHERE nom = 'HANGAR Angelina SIMMONET';

-- Centrale ID 30489 : Hangar Pierre MOURGUES
UPDATE centrales SET
    puissance_kwc = 222.5,
    spv = 'F2 DAVAI ENRSPV9',
    latitude = '44,38426',
    longitude = '1,16738',
    adresse = 'Mondounet - Fargues, 46800 Porte-du-Quercy, France',
    dept = '46',
    type_centrale = 'Bâtiment à construire - C',
    installateur = 'Acrom',
    date_mes = '15/11/2024',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM445M10RT-54HSW-HBW',
    contact_exploitation = 'Parfait MEZEME ONA',
    tel_exploitation = '06 63 06 94 73',
    contact_gestion = 'Victor PONTAIS',
    tel_gestion = '06 69 21 76 42',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '93%',
    date_prev_audit = 'semaine 49'
WHERE nom = 'Hangar Pierre MOURGUES';

-- Centrale ID 30516 : Hangar LAMIOT
UPDATE centrales SET
    puissance_kwc = 343.07,
    spv = 'F3 DAVAI ENRSPV10',
    latitude = '45,73247',
    longitude = '4,2053',
    adresse = 'La Gélopière, 42110 Feurs, France',
    dept = '42',
    type_centrale = 'Bâtiment à construire - C',
    installateur = 'PROSUNFRANCE',
    date_mes = '16/07/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM455M10RT-B54HSW',
    contact_exploitation = 'Yasser BADREZZAMANE',
    tel_exploitation = '06 74 09 71 44',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = 'X',
    audit_hors_toiture = 'X',
    ratio_pr = '99%',
    date_prev_audit = ''
WHERE nom = 'Hangar LAMIOT';

-- Centrale ID 31971 : Antunez - SCI ANAUJA
UPDATE centrales SET
    puissance_kwc = 269.45,
    spv = 'F2 DAVAI ENRSPV8',
    latitude = '43,3654',
    longitude = '3,2529',
    adresse = '253 Bd Robert Koch, 34500 Béziers, France',
    dept = '34',
    type_centrale = 'Ombrière simple',
    installateur = 'LE TRIANGLE',
    date_mes = '28/03/2025',
    si = 'Triangle IAB',
    panneaux = 'DMEGC-DM425M10T-B54HSW-HBW',
    contact_exploitation = 'Parfait MEZEME ONA',
    tel_exploitation = '06 63 06 94 73',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '100%',
    date_prev_audit = 'semaine 50'
WHERE nom = 'Antunez - SCI ANAUJA';

-- Centrale ID 32074 : Didier - PRIEUR
UPDATE centrales SET
    puissance_kwc = 499.59,
    spv = 'F3 DAVAI ENRSPV10',
    latitude = '44,84159',
    longitude = '4,96118',
    adresse = 'Quartier de Montalivet 26120 Montmeyran',
    dept = '26',
    type_centrale = 'Bâtiment à construire - C',
    installateur = 'KEVEL',
    date_mes = '24/07/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM455M10RT-54HSW-HBW',
    contact_exploitation = 'Yasser BADREZZAMANE',
    tel_exploitation = '06 74 09 71 44',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = 'X',
    audit_hors_toiture = 'X',
    ratio_pr = '95%',
    date_prev_audit = ''
WHERE nom = 'Didier - PRIEUR';

-- Centrale ID 33559 : Hangar Christophe CARRERE n°2
UPDATE centrales SET
    puissance_kwc = 278.005,
    spv = 'F2 DAVAI ENRSPV7',
    latitude = '44,14804',
    longitude = '0,44966',
    adresse = 'Boy, 47600 Montagnac-sur-Auvignon, France',
    dept = '47',
    type_centrale = 'Bâtiment à construire - A1',
    installateur = 'Acrom',
    date_mes = '16/05/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM455M10RT-B54HSW',
    contact_exploitation = 'Parfait MEZEME ONA',
    tel_exploitation = '06 63 06 94 73',
    contact_gestion = 'Victor PONTAIS',
    tel_gestion = '06 69 21 76 42',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '122%',
    date_prev_audit = 'semaine 49'
WHERE nom = 'Hangar Christophe CARRERE n°2';

-- Centrale ID 34481 : HANGAR Gérald Guillet
UPDATE centrales SET
    puissance_kwc = 197.8,
    spv = 'F2 DAVAI ENRSPV7',
    latitude = '45,98895',
    longitude = '-0,21354',
    adresse = 'Bois Rond, 17510 Les Éduts, France',
    dept = '17',
    type_centrale = 'Bâtiment à construire -  A2',
    installateur = 'Eiffage',
    date_mes = '19/09/2024',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM430M10T-54HSW-HBW',
    contact_exploitation = 'Parfait MEZEME ONA',
    tel_exploitation = '06 63 06 94 73',
    contact_gestion = 'Victor PONTAIS',
    tel_gestion = '06 69 21 76 42',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '123%',
    date_prev_audit = ''
WHERE nom = 'HANGAR Gérald Guillet';

-- Centrale ID 35280 : Hangar Patrick BLANCHET
UPDATE centrales SET
    puissance_kwc = 159.25,
    spv = 'F3 DAVAI ENRSPV14',
    latitude = '44,36059',
    longitude = '5,07619',
    adresse = 'Les Exclis, 26110 Venterol, France',
    dept = '26',
    type_centrale = 'Bâtiment à construire - C',
    installateur = 'KEVEL',
    date_mes = '30/06/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM455M10RT-B54HSW',
    contact_exploitation = 'Yasser BADREZZAMANE',
    tel_exploitation = '06 74 09 71 44',
    contact_gestion = 'Victor PONTAIS',
    tel_gestion = '06 69 21 76 42',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '95%',
    date_prev_audit = ''
WHERE nom = 'Hangar Patrick BLANCHET';

-- Centrale ID 35451 : Hangar Joris SAINT MARTIN
UPDATE centrales SET
    puissance_kwc = 218.4,
    spv = 'F3 DAVAI ENRSPV10',
    latitude = '43,56698',
    longitude = '0,0163',
    adresse = 'Palancot, 32160 Jû-Belloc, France',
    dept = '32',
    type_centrale = 'Bâtiment à construire - C',
    installateur = 'Acrom',
    date_mes = '19/03/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM455M10RT-54HSW-HBW',
    contact_exploitation = 'Parfait MEZEME ONA',
    tel_exploitation = '06 63 06 94 73',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '97%',
    date_prev_audit = 'semaine 50'
WHERE nom = 'Hangar Joris SAINT MARTIN';

-- Centrale ID 49814 : VIEL
UPDATE centrales SET
    puissance_kwc = 211.575,
    spv = 'F3 DAVAI ENRSPV11',
    latitude = '47,46443',
    longitude = '-1,40235',
    adresse = 'La Haute Bellangerais, 44390 Les Touches, France',
    dept = '44',
    type_centrale = 'Bâtiment à construire - A1',
    installateur = 'OFT',
    date_mes = '28/07/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM455M10RT-54HSW-HBW',
    contact_exploitation = 'Yasser BADREZZAMANE',
    tel_exploitation = '06 74 09 71 44',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = 'X',
    audit_hors_toiture = 'X',
    ratio_pr = '55%',
    date_prev_audit = ''
WHERE nom = 'VIEL';

-- Centrale ID 58166 : GAYET 42
UPDATE centrales SET
    puissance_kwc = 309.4,
    spv = 'F3 DAVAI ENRSPV10',
    latitude = '45,57895',
    longitude = '4,21851',
    adresse = '419 Chemin des Seigles, 42210 Craintilleux, France',
    dept = '42',
    type_centrale = 'Bâtiment à construire - C',
    installateur = '3C instal',
    date_mes = '13/05/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM455M10RT-B54HSW',
    contact_exploitation = 'Yasser BADREZZAMANE',
    tel_exploitation = '06 74 09 71 44',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '93%',
    date_prev_audit = ''
WHERE nom = 'GAYET 42';

-- Centrale ID 58962 : Hangar Karl Biteau
UPDATE centrales SET
    puissance_kwc = 324.22,
    spv = 'F2 DAVAI ENRSPV8',
    latitude = '45,7447',
    longitude = '-0,92605',
    adresse = '17250 Sainte-Gemme, France',
    dept = '17',
    type_centrale = 'Bâtiment à construire - C',
    installateur = 'Eiffage',
    date_mes = '19/11/2024',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM430M10T-54HSW-HBW',
    contact_exploitation = 'Parfait MEZEME ONA',
    tel_exploitation = '06 63 06 94 73',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = 'X',
    audit_hors_toiture = 'X',
    ratio_pr = '98%',
    date_prev_audit = ''
WHERE nom = 'Hangar Karl Biteau';

-- Centrale ID 60830 : DUMONT GUY
UPDATE centrales SET
    puissance_kwc = 232.2,
    spv = 'F2 DAVAI ENRSPV8',
    latitude = '46,628738',
    longitude = '3,585084',
    adresse = 'Les Sabots, 03230 Chevagnes, France',
    dept = '3',
    type_centrale = 'Bâtiment à construire - A1',
    installateur = 'LE TRIANGLE',
    date_mes = '30/01/2025',
    si = 'Triangle ISB',
    panneaux = 'DMEGC-DM430M10T-54HSW-HBW',
    contact_exploitation = 'Yasser BADREZZAMANE',
    tel_exploitation = '06 74 09 71 44',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '122%',
    date_prev_audit = ''
WHERE nom = 'DUMONT GUY';

-- Centrale ID 61191 : Serge Maltaverne
UPDATE centrales SET
    puissance_kwc = 260.26,
    spv = 'F3 DAVAI ENRSPV10',
    latitude = '46,69424',
    longitude = '4,10364',
    adresse = '638  route Chard, 71320 Sainte-Radegonde, France',
    dept = '71',
    type_centrale = 'Bâtiment à construire - C',
    installateur = 'PROSUNFRANCE',
    date_mes = '30/07/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM455M10RT-B54HSW',
    contact_exploitation = 'Yasser BADREZZAMANE',
    tel_exploitation = '06 74 09 71 44',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '99%',
    date_prev_audit = ''
WHERE nom = 'Serge Maltaverne';

-- Centrale ID 70087 : Hangar Bernard MAGE
UPDATE centrales SET
    puissance_kwc = 300.82,
    spv = 'F2 DAVAI ENRSPV8',
    latitude = '44,75755',
    longitude = '2,04496',
    adresse = 'Broussoles, 46210 Montet-et-Bouxal, France',
    dept = '46',
    type_centrale = 'Bâtiment à construire -  A2',
    installateur = 'Acrom',
    date_mes = '13/11/2024',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'JKM445N-54HL4R-V',
    contact_exploitation = 'Parfait MEZEME ONA',
    tel_exploitation = '06 63 06 94 73',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = 'X',
    audit_hors_toiture = 'X',
    ratio_pr = '102%',
    date_prev_audit = ''
WHERE nom = 'Hangar Bernard MAGE';

-- Centrale ID 76547 : Maymat
UPDATE centrales SET
    puissance_kwc = 345.8,
    spv = 'F2 DAVAI ENRSPV9',
    latitude = '46,51456',
    longitude = '3,41436',
    adresse = 'Les Sorreaux, 03400 Toulon-sur-Allier, France',
    dept = '3',
    type_centrale = 'Bâtiment à construire - C',
    installateur = 'LE TRIANGLE',
    date_mes = '15/01/2025',
    si = 'Triangle ISB',
    panneaux = 'DMEGC-DM455M10RT-54HSW-HBW',
    contact_exploitation = 'Yasser BADREZZAMANE',
    tel_exploitation = '06 74 09 71 44',
    contact_gestion = 'Victor PONTAIS',
    tel_gestion = '06 69 21 76 42',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '84%',
    date_prev_audit = ''
WHERE nom = 'Maymat';

-- Centrale ID 81492 : Bourgeois
UPDATE centrales SET
    puissance_kwc = 225.68,
    spv = 'F3 GIRASPV15',
    latitude = '47,44106',
    longitude = '-1,27682',
    adresse = 'Le Roscouët, 44440 Teillé, France',
    dept = '44',
    type_centrale = 'Bâtiment à construire - A1',
    installateur = 'INNOVA',
    date_mes = '06/08/2025',
    si = 'DOME SOLAR Helios B²',
    panneaux = 'DMEGC-DM455M10RT-B54HSW',
    contact_exploitation = 'Parfait MEZEME ONA',
    tel_exploitation = '06 63 06 94 73',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = 'X',
    audit_hors_toiture = 'X',
    ratio_pr = '99%',
    date_prev_audit = ''
WHERE nom = 'Bourgeois';

-- Centrale ID 82076 : Hangar Julien Vaudin
UPDATE centrales SET
    puissance_kwc = 348.88,
    spv = 'F2 DAVAI ENRSPV7',
    latitude = '46,58741',
    longitude = '3,5494',
    adresse = 'Les Jacquets, 03230 Chevagnes, France',
    dept = '3',
    type_centrale = 'Toiture existante / Rénovation',
    installateur = 'PROSUNFRANCE',
    date_mes = '04/04/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM445M10RT-54HSW-HBW',
    contact_exploitation = 'Yasser BADREZZAMANE',
    tel_exploitation = '06 74 09 71 44',
    contact_gestion = 'Victor PONTAIS',
    tel_gestion = '06 69 21 76 42',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '97%',
    date_prev_audit = ''
WHERE nom = 'Hangar Julien Vaudin';

-- Centrale ID 82721 : Cheraud
UPDATE centrales SET
    puissance_kwc = 499.59,
    spv = 'F3 DAVAI ENRSPV13',
    latitude = '47,355',
    longitude = '-1,83701',
    adresse = 'Bellevue, 44260 Malville, France',
    dept = '44',
    type_centrale = 'Bâtiment à construire -  A2',
    installateur = 'OFT',
    date_mes = '18/07/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM455M10RT-B54HSW',
    contact_exploitation = 'Parfait MEZEME ONA',
    tel_exploitation = '06 63 06 94 73',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '102%',
    date_prev_audit = ''
WHERE nom = 'Cheraud';

-- Centrale ID 83431 : Hangar Renaud Sonnard
UPDATE centrales SET
    puissance_kwc = 324.87,
    spv = 'F3 DAVAI ENRSPV11',
    latitude = '46,41411',
    longitude = '-0,53832',
    adresse = 'Les grandes versaines, 79160 Villiers-en-Plaine, France',
    dept = '79',
    type_centrale = 'Bâtiment à construire - A1',
    installateur = 'REGIESOLAIRE',
    date_mes = '20/03/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM455M10RT-54HSW-HBW',
    contact_exploitation = 'Yasser BADREZZAMANE',
    tel_exploitation = '06 74 09 71 44',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = 'X',
    audit_hors_toiture = 'X',
    ratio_pr = '110%',
    date_prev_audit = ''
WHERE nom = 'Hangar Renaud Sonnard';

-- Centrale ID 83705 : Azemar
UPDATE centrales SET
    puissance_kwc = 319,
    spv = 'F3 DAVAI ENRSPV13',
    latitude = '44,25786',
    longitude = '2,45787',
    adresse = '12160 Camboulazet, France',
    dept = '12',
    type_centrale = 'Bâtiment à construire - C',
    installateur = '3C instal',
    date_mes = '06/05/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM455M10RT-B54HSW',
    contact_exploitation = 'Parfait MEZEME ONA',
    tel_exploitation = '06 63 06 94 73',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '97%',
    date_prev_audit = 'semaine 49'
WHERE nom = 'Azemar';

-- Centrale ID 86550 : Hangar Frederic Sinaud
UPDATE centrales SET
    puissance_kwc = 499.59,
    spv = 'F3 DAVAI ENRSPV11',
    latitude = '46,2183',
    longitude = '1,65147',
    adresse = '11 La Quaire, 23240 Saint-Priest-la-Plaine, France',
    dept = '23',
    type_centrale = 'Bâtiment à construire - C',
    installateur = 'INNOVA',
    date_mes = '04/06/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM455M10RT-54HSW-HBW',
    contact_exploitation = 'Parfait MEZEME ONA',
    tel_exploitation = '06 63 06 94 73',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '97%',
    date_prev_audit = ''
WHERE nom = 'Hangar Frederic Sinaud';

-- Centrale ID 89219 : EARL CADOT
UPDATE centrales SET
    puissance_kwc = 309.4,
    spv = 'F3 DAVAI ENRSPV10',
    latitude = '46,24919',
    longitude = '3,88361',
    adresse = 'La Maisonneuve, 42310 Urbise, France',
    dept = '42',
    type_centrale = 'Bâtiment à construire - C',
    installateur = '3C instal',
    date_mes = '01/04/2025',
    si = 'JORIS RS-R',
    panneaux = 'DMEGC-DM455M10RT-54HSW-HBW',
    contact_exploitation = 'Yasser BADREZZAMANE',
    tel_exploitation = '06 74 09 71 44',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = 'X',
    audit_hors_toiture = 'X',
    ratio_pr = '99%',
    date_prev_audit = ''
WHERE nom = 'EARL CADOT';

-- Centrale ID 90034 : Hangar Frederic Sinaud
UPDATE centrales SET
    puissance_kwc = 218.4,
    spv = 'F3 DAVAI ENRSPV11',
    latitude = '46,23163',
    longitude = '1,52775',
    adresse = 'La Drable, 23300 Saint Priest la feuille',
    dept = '23',
    type_centrale = 'Bâtiment à construire - C',
    installateur = 'INNOVA',
    date_mes = '04/06/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM455M10RT-B54HSW',
    contact_exploitation = 'Parfait MEZEME ONA',
    tel_exploitation = '06 63 06 94 73',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '101%',
    date_prev_audit = ''
WHERE nom = 'Hangar Frederic Sinaud';

-- Centrale ID 90189 : HARAS DE LA MAJORIE/MANOHA
UPDATE centrales SET
    puissance_kwc = 499.59,
    spv = 'F3 DAVAI ENRSPV10',
    latitude = '45,19709',
    longitude = '4,66906',
    adresse = 'L''Homme, 07790 Saint-Alban-d''Ay, France',
    dept = '7',
    type_centrale = 'Bâtiment à construire - C',
    installateur = 'KEVEL',
    date_mes = '23/06/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM455M10RT-54HSW-HBW',
    contact_exploitation = 'Yasser BADREZZAMANE',
    tel_exploitation = '06 74 09 71 44',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '103%',
    date_prev_audit = ''
WHERE nom = 'HARAS DE LA MAJORIE/MANOHA';

-- Centrale ID 90361 : Serge Maltaverne
UPDATE centrales SET
    puissance_kwc = 218.855,
    spv = 'F3 DAVAI ENRSPV10',
    latitude = '46,6938',
    longitude = '4,10361',
    adresse = '638 Chard, 71320 Sainte-Radegonde, France',
    dept = '71',
    type_centrale = 'Toiture existante / Rénovation',
    installateur = 'PROSUNFRANCE',
    date_mes = '22/05/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM455M10RT-54HSW-HBW',
    contact_exploitation = 'Yasser BADREZZAMANE',
    tel_exploitation = '06 74 09 71 44',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '103%',
    date_prev_audit = ''
WHERE nom = 'Serge Maltaverne';

-- Centrale ID 95309 : Hangar Eric LOGNON
UPDATE centrales SET
    puissance_kwc = 324.87,
    spv = 'F3 DAVAI ENRSPV11',
    latitude = '46,60446',
    longitude = '3,61907',
    adresse = 'Château des Millets, 03230 Chevagnes, France',
    dept = '3',
    type_centrale = 'Bâtiment à construire -  A2',
    installateur = 'PROSUNFRANCE',
    date_mes = '25/07/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM455M10RT-54HSW-HBW',
    contact_exploitation = 'Yasser BADREZZAMANE',
    tel_exploitation = '06 74 09 71 44',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '134%',
    date_prev_audit = ''
WHERE nom = 'Hangar Eric LOGNON';

-- Centrale ID 95592 : GFA LASCOMBES - ANTOINE MICOULEAU
UPDATE centrales SET
    puissance_kwc = 277.095,
    spv = 'F3 DAVAI ENRSPV14',
    latitude = '43,26257',
    longitude = '2,15214',
    adresse = 'Lascombes, 11170 Alzonne, France',
    dept = '11',
    type_centrale = 'Bâtiment à construire - A1',
    installateur = 'Yama Energies',
    date_mes = '19/08/2025',
    si = 'DOME SOLAR Helios B²',
    panneaux = 'DMEGC-DM455M10RT-B54HSW',
    contact_exploitation = 'Parfait MEZEME ONA',
    tel_exploitation = '06 63 06 94 73',
    contact_gestion = 'Victor PONTAIS',
    tel_gestion = '06 69 21 76 42',
    audit_toiture = 'X',
    audit_hors_toiture = 'X',
    ratio_pr = '147%',
    date_prev_audit = 'semaine 48'
WHERE nom = 'GFA LASCOMBES - ANTOINE MICOULEAU';

-- Centrale ID 95686 : MARTEL 184 Construction
UPDATE centrales SET
    puissance_kwc = 499.95,
    spv = 'F2 DAVAI ENRSPV9',
    latitude = '46,21212',
    longitude = '1,66779',
    adresse = 'Lieudit Les Ribières, 23240 Le Grand Bourg',
    dept = '23',
    type_centrale = 'Bâtiment à construire -  A2',
    installateur = 'NEOXOM',
    date_mes = '04/02/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'JKM450N-54HL4R-V',
    contact_exploitation = 'Parfait MEZEME ONA',
    tel_exploitation = '06 63 06 94 73',
    contact_gestion = 'Victor PONTAIS',
    tel_gestion = '06 69 21 76 42',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '69%',
    date_prev_audit = ''
WHERE nom = 'MARTEL 184 Construction';

-- Centrale ID 95689 : BOUCHARDY 203 LOC
UPDATE centrales SET
    puissance_kwc = 498.68,
    spv = 'F2 DAVAI ENRSPV9',
    latitude = '46,18866',
    longitude = '1,70087',
    adresse = 'Saint-Martin, 23320 Saint-Vaury, France',
    dept = '23',
    type_centrale = 'Toiture existante / Rénovation',
    installateur = 'OFT',
    date_mes = '12/03/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM455M10RT-54HSW-HBW',
    contact_exploitation = 'Parfait MEZEME ONA',
    tel_exploitation = '06 63 06 94 73',
    contact_gestion = 'Victor PONTAIS',
    tel_gestion = '06 69 21 76 42',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '87%',
    date_prev_audit = ''
WHERE nom = 'BOUCHARDY 203 LOC';

-- Centrale ID 95691 : BOULOIR 206 LOC
UPDATE centrales SET
    puissance_kwc = 499.14,
    spv = 'F2 DAVAI ENRSPV9',
    latitude = '46,21057',
    longitude = '1,67252',
    adresse = '23240 Le Grand-Bourg, France',
    dept = '23',
    type_centrale = 'Toiture existante / Rénovation',
    installateur = 'OFT',
    date_mes = '11/03/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM455M10RT-54HSW-HBW',
    contact_exploitation = 'Parfait MEZEME ONA',
    tel_exploitation = '06 63 06 94 73',
    contact_gestion = 'Victor PONTAIS',
    tel_gestion = '06 69 21 76 42',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '92%',
    date_prev_audit = ''
WHERE nom = 'BOULOIR 206 LOC';

-- Centrale ID 95695 : MARTEL 183 LOC
UPDATE centrales SET
    puissance_kwc = 456.82,
    spv = 'F2 DAVAI ENRSPV9',
    latitude = '46,21259533',
    longitude = '1,66652635',
    adresse = 'LIEU-DIT LES RIBIERES LE GRAND BOURG',
    dept = '23',
    type_centrale = 'Toiture existante / Rénovation',
    installateur = 'NEOXOM',
    date_mes = '27/03/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM455M10RT-54HSW-HBW',
    contact_exploitation = 'Parfait MEZEME ONA',
    tel_exploitation = '06 63 06 94 73',
    contact_gestion = 'Victor PONTAIS',
    tel_gestion = '06 69 21 76 42',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '97%',
    date_prev_audit = ''
WHERE nom = 'MARTEL 183 LOC';

-- Centrale ID 95918 : Hangar Frédéric CASTET
UPDATE centrales SET
    puissance_kwc = 309.4,
    spv = 'F2 DAVAI ENRSPV9',
    latitude = '43,043825',
    longitude = '0,859333',
    adresse = '11 Carrère de la Goutille, 31160 Estadens, France',
    dept = '31',
    type_centrale = 'Bâtiment à construire - C',
    installateur = 'KEVEL',
    date_mes = '26/05/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM455M10RT-B54HSW',
    contact_exploitation = 'Yasser BADREZZAMANE',
    tel_exploitation = '06 74 09 71 44',
    contact_gestion = 'Victor PONTAIS',
    tel_gestion = '06 69 21 76 42',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '96%',
    date_prev_audit = 'semaine 49'
WHERE nom = 'Hangar Frédéric CASTET';

-- Centrale ID 95919 : Hangar Frédéric CASTET
UPDATE centrales SET
    puissance_kwc = 268.65,
    spv = 'F3 DAVAI ENRSPV13',
    latitude = '43,043896',
    longitude = '0,859961',
    adresse = '11 carrère de la Gentille, ESTADENS, 31160',
    dept = '31',
    type_centrale = 'Toiture existante / Rénovation',
    installateur = 'NEOXOM',
    date_mes = '26/05/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM455M10RT-54HSW-HBW',
    contact_exploitation = 'Yasser BADREZZAMANE',
    tel_exploitation = '06 74 09 71 44',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = 'X',
    audit_hors_toiture = 'X',
    ratio_pr = '95%',
    date_prev_audit = 'semaine 49'
WHERE nom = 'Hangar Frédéric CASTET';

-- Centrale ID 95992 : Hangar Sebastien RUDELLE
UPDATE centrales SET
    puissance_kwc = 309.4,
    spv = 'F3 DAVAI ENRSPV11',
    latitude = '44,21679',
    longitude = '2,63349',
    adresse = 'Crayssac, 12120 Salmiech, France',
    dept = '12',
    type_centrale = 'Bâtiment à construire - C',
    installateur = '3C instal',
    date_mes = '18/06/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM455M10RT-54HSW-HBW',
    contact_exploitation = 'Parfait MEZEME ONA',
    tel_exploitation = '06 63 06 94 73',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '94%',
    date_prev_audit = 'semaine 49'
WHERE nom = 'Hangar Sebastien RUDELLE';

-- Centrale ID 96147 : Hangar Benjamin CHASSON
UPDATE centrales SET
    puissance_kwc = 388.04,
    spv = 'F3 DAVAI ENRSPV13',
    latitude = '44,89225',
    longitude = '4,87492',
    adresse = '465 Rue Jean Rostand, 26800 Portes-lès-Valence, France',
    dept = '26',
    type_centrale = 'Bâtiment à construire - C',
    installateur = 'NEOXOM ',
    date_mes = '21/07/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM445M10RT-54HSW-HBW',
    contact_exploitation = 'Yasser BADREZZAMANE',
    tel_exploitation = '06 74 09 71 44',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '73%',
    date_prev_audit = ''
WHERE nom = 'Hangar Benjamin CHASSON';

-- Centrale ID 96546 : Hangar Fabrice COMBY
UPDATE centrales SET
    puissance_kwc = 499.59,
    spv = 'F3 DAVAI ENRSPV11',
    latitude = '45,452821',
    longitude = '1,2834',
    adresse = 'Besse, 19210 Saint-Éloy-les-Tuileries, France',
    dept = '19',
    type_centrale = 'Toiture existante / PV Ready',
    installateur = 'HBBAT',
    date_mes = '25/03/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM455M10RT-54HSW-HBW',
    contact_exploitation = 'Parfait MEZEME ONA',
    tel_exploitation = '06 63 06 94 73',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = 'X',
    audit_hors_toiture = 'X',
    ratio_pr = '89%',
    date_prev_audit = ''
WHERE nom = 'Hangar Fabrice COMBY';

-- Centrale ID 97565 : Commune De Pomas
UPDATE centrales SET
    puissance_kwc = 254.8,
    spv = 'F3 DAVAI ENRSPV14',
    latitude = '43,11473',
    longitude = '2,2963',
    adresse = 'Rue de la Mairie, 11250 Pomas, France',
    dept = '11',
    type_centrale = 'Bâtiment à construire - C',
    installateur = 'KEVEL',
    date_mes = '21/08/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM455M10RT-B54HSW',
    contact_exploitation = 'Parfait MEZEME ONA',
    tel_exploitation = '06 63 06 94 73',
    contact_gestion = 'Victor PONTAIS',
    tel_gestion = '06 69 21 76 42',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '96%',
    date_prev_audit = 'semaine 48'
WHERE nom = 'Commune De Pomas';

-- Centrale ID 98563 : TOURNIER
UPDATE centrales SET
    puissance_kwc = 197.925,
    spv = 'F2 DAVAI ENRSPV7',
    latitude = '43,3172',
    longitude = '1,12116',
    adresse = '548 Route de Marignac, 31430 Gratens, France',
    dept = '31',
    type_centrale = 'Toiture existante / Rénovation',
    installateur = 'KEVEL',
    date_mes = '13/01/2025',
    si = 'DOMESOLAR Ital Solar',
    panneaux = 'DMEGC-DM455M10RT-54HSW-HBW',
    contact_exploitation = 'Parfait MEZEME ONA',
    tel_exploitation = '06 63 06 94 73',
    contact_gestion = 'Victor PONTAIS',
    tel_gestion = '06 69 21 76 42',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '76%',
    date_prev_audit = ''
WHERE nom = 'TOURNIER';

-- Centrale ID 98584 : Hangar Richard VAN ZANTEN
UPDATE centrales SET
    puissance_kwc = 330.785,
    spv = 'F2 DAVAI ENRSPV7',
    latitude = '44,66239',
    longitude = '0,83643',
    adresse = 'La Tuque, 47210 Parranquet, France',
    dept = '47',
    type_centrale = 'Bâtiment à construire -  A2',
    installateur = 'Acrom',
    date_mes = '16/04/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM455M10RT-B54HSW',
    contact_exploitation = 'Yasser BADREZZAMANE',
    tel_exploitation = '06 74 09 71 44',
    contact_gestion = 'Victor PONTAIS',
    tel_gestion = '06 69 21 76 42',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '95%',
    date_prev_audit = 'semaine 49'
WHERE nom = 'Hangar Richard VAN ZANTEN';

-- Centrale ID 99373 : Hangar Yannick CLEMENT
UPDATE centrales SET
    puissance_kwc = 331.24,
    spv = 'F3 GIRASPV15',
    latitude = '43,04786',
    longitude = '0,85301',
    adresse = 'Gazailles, 31160 Estadens, France',
    dept = '31',
    type_centrale = 'Bâtiment à construire - C',
    installateur = 'KEVEL',
    date_mes = '23/05/2025',
    si = 'DOMESOLAR NPA 3.45',
    panneaux = 'DMEGC-DM455M10RT-B54HSW',
    contact_exploitation = 'Parfait MEZEME ONA',
    tel_exploitation = '06 63 06 94 73',
    contact_gestion = 'Jean-Paul THOROGOOD',
    tel_gestion = '06 74 94 09 90',
    audit_toiture = '',
    audit_hors_toiture = 'X',
    ratio_pr = '110%',
    date_prev_audit = 'semaine 49'
WHERE nom = 'Hangar Yannick CLEMENT';

-- 3. VÉRIFICATION DES MISES À JOUR
-- ═══════════════════════════════════════════════════════════════════════════════

SELECT 
    COUNT(*) as total_centrales,
    COUNT(CASE WHEN contact_exploitation IS NOT NULL AND contact_exploitation != '' THEN 1 END) as avec_contact_exploitation,
    COUNT(CASE WHEN latitude IS NOT NULL AND latitude != '' THEN 1 END) as avec_gps,
    COUNT(CASE WHEN date_mes IS NOT NULL AND date_mes != '' THEN 1 END) as avec_date_mes
FROM centrales;
