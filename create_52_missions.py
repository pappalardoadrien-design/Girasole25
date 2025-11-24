#!/usr/bin/env python3
"""
Création des 52 missions GIRASOLE avec checklists adaptées (toiture/sol)
"""

import json
import sys

# Charger les centrales
with open('/tmp/centrales_52.json', 'r') as f:
    data = json.load(f)
    centrales = data[0]['results']

print(f"✅ {len(centrales)} centrales chargées")

# Générer SQL pour créer les missions
sql_missions = []
sql_checklists = []

# Checklist points COMMUNE (tous types)
checklist_commune = [
    # DOC - 4 points
    ("DOC", 1, "Présence autocontrôle correctement renseigné par installateur"),
    ("DOC", 2, "Présence PV réception lot PV signé GIRASOLE + installateur"),
    ("DOC", 3, "Présence ≥1 CR visite chantier lot PV rédigé GIRASOLE"),
    ("DOC", 4, "Respect cahier des charges tranchées fourni au bailleur"),
    
    # ELEC - 10 points
    ("ELEC", 5, "Méthode et qualité fixations du chemin de câbles"),
    ("ELEC", 6, "Type de cheminement câbles utilisé (galvanisé chaud, froid, etc.)"),
    ("ELEC", 7, "Protections mécaniques câbles (protection contact bord saillant, etc.)"),
    ("ELEC", 8, "Contrôle rayons courbure câbles AC et DC"),
    ("ELEC", 9, "Qualité brassage des câbles"),
    ("ELEC", 10, "Type repérage câble ou filerie (sérigraphié, manuscrit, etc.)"),
    ("ELEC", 11, "Type repérage câbles (tenant-aboutissant, etc.)"),
    ("ELEC", 12, "Repérage équipements (présence, inscrit sur équipement lui-même)"),
    ("ELEC", 13, "Repérage serrage connexions câbles AC"),
    ("ELEC", 14, "Couleurs câbles DC -/+ différents"),
    
    # TABLEAUX - 8 points
    ("TABLEAUX", 15, "Présence cosses bimétal jonction cuivre/alu (raccordement + accroche terre nu)"),
    ("TABLEAUX", 16, "Cheminement terre le long chemins câbles (crapaud, bornier laiton, etc.)"),
    ("TABLEAUX", 17, "Réglages AGCP conforme aux plans"),
    ("TABLEAUX", 18, "Respect préconisations tranchée AC (Shelter vers PDL)"),
    ("TABLEAUX", 19, "Type/longueur câble DC (modèle référence installateur)"),
    ("TABLEAUX", 20, "Qualité sertissage MC4 (vérifier à l'œil, contrôle force d'arrachement)"),
    ("TABLEAUX", 21, "Contrôle serrages câbles AC"),
    ("TABLEAUX", 22, "Continuité terre châssis (contrôle visuel/testeur)"),
    
    # CABLAGE - 8 points
    ("CABLAGE", 23, "Conformité générale câbles DC (longueur, fixation, protection UV)"),
    ("CABLAGE", 24, "Vérification polarités DC aux boîtes jonction"),
    ("CABLAGE", 25, "Câbles AC dimensionnement conforme (section vs puissance)"),
    ("CABLAGE", 26, "Passage câbles AC/DC (traversées étanches bâtiments)"),
    ("CABLAGE", 27, "Identification câbles (étiquetage strings, phases AC)"),
    ("CABLAGE", 28, "Absence points durs câblage (coudes trop serrés, frottements)"),
    ("CABLAGE", 29, "Dispositifs coupure DC (interrupteurs sectionneurs)"),
    ("CABLAGE", 30, "Présence parafoudre DC/AC (conformité norme)"),
    
    # MODULES - 10 points
    ("MODULES", 31, "Aspect visuel modules (fissures, décolorations, brûlures)"),
    ("MODULES", 32, "Fixation modules sur châssis (clips, boulons serrés)"),
    ("MODULES", 33, "Espacement inter-modules conforme (min 10mm recommandé)"),
    ("MODULES", 34, "Câbles module (boîtes jonction étanches, pas de contraintes)"),
    ("MODULES", 35, "Conformité numéros série modules (vs fiches techniques)"),
    ("MODULES", 36, "Diodes bypass testées (tension directe/inverse)"),
    ("MODULES", 37, "Onduleurs: fixation murale/sol solide"),
    ("MODULES", 38, "Onduleurs: ventilation suffisante (pas d'obstruction)"),
    ("MODULES", 39, "Onduleurs: affichage/voyants fonctionnels"),
    ("MODULES", 40, "Monitoring connecté (Wi-Fi/Ethernet, transmission données)"),
    
    # STRUCTURES - 8 points
    ("STRUCTURES", 41, "Fixation châssis structure (boulons M10/M12 serrés au couple)"),
    ("STRUCTURES", 42, "Absence corrosion visible (acier galvanisé, inox)"),
    ("STRUCTURES", 43, "Mise à la terre châssis métalliques (continuité)"),
    ("STRUCTURES", 44, "Étanchéité traversées toiture (si toiture)"),
    ("STRUCTURES", 45, "Lestage/ancrage au sol conforme (si sol)"),
    ("STRUCTURES", 46, "Absence déformation structures (vérifier alignements)"),
    ("STRUCTURES", 47, "Fixations anti-vol modules (vis inviolables si requis)"),
    ("STRUCTURES", 48, "Clôture/barrière sécurité périmètre (si au sol)"),
]

# Checklist TOITURE SPÉCIFIQUE (6 points supplémentaires)
checklist_toiture = [
    ("TOITURE", 49, "Étanchéité membrane toiture (absence fuites, joints silicone)"),
    ("TOITURE", 50, "Fixation bacs acier/supports (vérifier vis autoperceuses)"),
    ("TOITURE", 51, "Conformité DTU 40.35 (espacements, surcharges)"),
    ("TOITURE", 52, "Notice montage fabricant respectée"),
    ("TOITURE", 53, "Système anti-chute installé (lignes de vie, garde-corps)"),
    ("TOITURE", 54, "Accès toiture sécurisé (échelles, passerelles)"),
]

# ID technicien par défaut (à créer si n'existe pas)
# Sous-traitant 1 = ARTEMIS, 2 = CADENET
default_technicien_id = 1
default_sous_traitant_id = 1

mission_id = 1
for centrale in centrales:
    centrale_id = centrale['id']
    centrale_nom = centrale['nom']
    audit_toiture = centrale.get('audit_toiture') == 'X'
    
    # Créer la mission
    sql_missions.append(f"""
-- Mission {mission_id}: {centrale_nom}
INSERT INTO ordres_mission (
    id, centrale_id, sous_traitant_id, technicien_id, 
    date_mission, heure_debut, duree_estimee_heures, statut, created_at
) VALUES (
    {mission_id}, {centrale_id}, {default_sous_traitant_id}, {default_technicien_id},
    '2025-12-01', '08:00', 4, 'PLANIFIE', datetime('now')
);
""")
    
    # Créer checklist items (commune + toiture si nécessaire)
    checklist_items = checklist_commune.copy()
    if audit_toiture:
        checklist_items.extend(checklist_toiture)
    
    for categorie, numero, description in checklist_items:
        sql_checklists.append(f"""
INSERT INTO checklist_items (
    ordre_mission_id, categorie, numero, description, 
    conforme, commentaire, photo_url, created_at
) VALUES (
    {mission_id}, '{categorie}', {numero}, '{description.replace("'", "''")}',
    NULL, NULL, NULL, datetime('now')
);
""")
    
    nb_points = len(checklist_items)
    print(f"  ✓ Mission {mission_id}: {centrale_nom} ({nb_points} points - {'TOITURE' if audit_toiture else 'SOL'})")
    mission_id += 1

# Écrire le fichier SQL
output_sql = f"""-- ═══════════════════════════════════════════════════════════════════════════════
-- CRÉATION 52 MISSIONS GIRASOLE + CHECKLISTS ADAPTÉES
-- Date: 2025-11-24
-- ═══════════════════════════════════════════════════════════════════════════════

-- Créer technicien par défaut si n'existe pas
INSERT OR IGNORE INTO techniciens (id, prenom, nom, telephone, email, specialite, created_at)
VALUES (1, 'Technicien', 'GIRASOLE', '0600000000', 'technicien@girasole.fr', 'Audit PV', datetime('now'));

-- Créer sous-traitants si n'existent pas
INSERT OR IGNORE INTO sous_traitants (id, nom_entreprise, contact_nom, telephone, email, created_at)
VALUES (1, 'ARTEMIS', 'Contact ARTEMIS', '0600000001', 'contact@artemis.fr', datetime('now'));

INSERT OR IGNORE INTO sous_traitants (id, nom_entreprise, contact_nom, telephone, email, created_at)
VALUES (2, 'CADENET', 'Contact CADENET', '0600000002', 'contact@cadenet.fr', datetime('now'));

-- ═══════════════════════════════════════════════════════════════════════════════
-- MISSIONS (52 centrales)
-- ═══════════════════════════════════════════════════════════════════════════════
{''.join(sql_missions)}

-- ═══════════════════════════════════════════════════════════════════════════════
-- CHECKLIST ITEMS ({len(sql_checklists)} items au total)
-- - 48 points commune (toutes centrales)
-- - 54 points pour centrales avec audit toiture (48 + 6)
-- ═══════════════════════════════════════════════════════════════════════════════
{''.join(sql_checklists)}

-- ═══════════════════════════════════════════════════════════════════════════════
-- RÉSUMÉ
-- ═══════════════════════════════════════════════════════════════════════════════
-- ✅ {mission_id - 1} missions créées
-- ✅ {len(sql_checklists)} checklist items créés
-- ✅ 17 audits TOITURE (54 points chacun)
-- ✅ 35 audits SOL (48 points chacun)
"""

with open('/tmp/create_52_missions.sql', 'w') as f:
    f.write(output_sql)

print(f"\n✅ Fichier SQL généré: /tmp/create_52_missions.sql")
print(f"✅ {mission_id - 1} missions")
print(f"✅ {len(sql_checklists)} checklist items")
print(f"\n🚀 Prêt à exécuter sur D1 production")
