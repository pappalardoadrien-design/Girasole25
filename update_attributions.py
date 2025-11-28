#!/usr/bin/env python3
"""
Script de mise à jour des attributions sous-traitants
Basé sur le fichier HTML fourni par Adrien
Croise avec DB existante pour préserver données
"""

import json

# Mapping sous-traitants selon fichier attributions
# Format: {dept: sous_traitant_nom}
MAPPING_DEPTS = {
    # ARTEMIS: 03, 07, 26, 42, 71, 38
    '03': 'ARTEMIS', '3': 'ARTEMIS',
    '07': 'ARTEMIS', '7': 'ARTEMIS',
    '26': 'ARTEMIS',
    '42': 'ARTEMIS',
    '71': 'ARTEMIS',
    '38': 'ARTEMIS',
    
    # CADENET: 19, 46, 15
    '19': 'CADENET',
    '46': 'CADENET',
    '15': 'CADENET',
    
    # EDOUARD: 17, 79, 44, 37
    '17': 'EDOUARD - Martial',
    '79': 'EDOUARD - Martial',
    '44': 'EDOUARD - Martial',
    '37': 'EDOUARD - Martial',
    
    # COURTIADE: 32
    '32': 'COURTIADE DISTRIB',
    
    # DRONE AVEYRON SERVICE: 12
    '12': 'DRONE AVEYRON SERVICE',
    
    # En attente attribution: 23 (Creuse)
    '23': 'En attente attribution',
    
    # DIAGPV A&F: 11, 31, 34, 47 (selon contexte GIRASOLE - Toulouse/Sud)
    '11': 'DIAGPV - Adrien & Fabien',
    '31': 'DIAGPV - Adrien & Fabien',
    '34': 'DIAGPV - Adrien & Fabien',
    '47': 'DIAGPV - Adrien & Fabien',
}

# IDs sous-traitants en DB
SOUS_TRAITANT_IDS = {
    'DiagPV Solutions': 1,
    'SolarTech Audits': 2,
    'ARTEMIS': 3,
    'CADENET': 4,
    'DIAGPV - Adrien & Fabien': 5,
    'EDOUARD - Martial': 6,
    'COURTIADE DISTRIB': 7,
    'DRONE AVEYRON SERVICE': 8,
    'En attente attribution': 9,
}

# Données centrales DB (à partir de wrangler query)
CENTRALES_DB = [
    {"centrale_id": 1, "nom": "Antunez - SCI ANAUJA", "dept": "34", "mission_id": 1},
    {"centrale_id": 2, "nom": "EARL CADOT", "dept": "42", "mission_id": 2},
    {"centrale_id": 3, "nom": "Azemar", "dept": "12", "mission_id": 3},
    {"centrale_id": 4, "nom": "Mathieu Montet", "dept": "38", "mission_id": 4},
    {"centrale_id": 5, "nom": "Hangar Laurent ROUX", "dept": "15", "mission_id": 5},
    {"centrale_id": 6, "nom": "Hangar Bernard MAGE", "dept": "46", "mission_id": 6},
    {"centrale_id": 7, "nom": "Hangar Pierre MOURGUES", "dept": "46", "mission_id": 7},
    {"centrale_id": 8, "nom": "Hangar Karl Biteau", "dept": "17", "mission_id": 8},
    {"centrale_id": 9, "nom": "Burgat Et Fils Tp", "dept": "11", "mission_id": 9},
    {"centrale_id": 10, "nom": "HANGAR Angelina SIMMONET", "dept": "3", "mission_id": 10},
    {"centrale_id": 11, "nom": "Maymat", "dept": "3", "mission_id": 11},
    {"centrale_id": 12, "nom": "HANGAR Christian MIGNARD", "dept": "11", "mission_id": 12},
    {"centrale_id": 13, "nom": "DUMONT GUY", "dept": "3", "mission_id": 13},
    {"centrale_id": 14, "nom": "MARTEL 184 Construction", "dept": "23", "mission_id": 14},
    {"centrale_id": 15, "nom": "BOUCHARDY 203 LOC", "dept": "23", "mission_id": 15},
    {"centrale_id": 16, "nom": "BOULOIR 206 LOC", "dept": "23", "mission_id": 16},
    {"centrale_id": 17, "nom": "Hangar Renaud Sonnard", "dept": "79", "mission_id": 17},
    {"centrale_id": 18, "nom": "Hangar Fabrice COMBY", "dept": "19", "mission_id": 18},
    {"centrale_id": 19, "nom": "Hangar Julien Vaudin", "dept": "3", "mission_id": 19},
    {"centrale_id": 20, "nom": "Hangar Richard VAN ZANTEN", "dept": "47", "mission_id": 20},
    {"centrale_id": 21, "nom": "HANGAR Benoit BERTELOOT", "dept": "89", "mission_id": 21},
    {"centrale_id": 22, "nom": "Hangar Laurent ROUX (2)", "dept": None, "mission_id": 22},
    {"centrale_id": 23, "nom": "Serge Maltaverne", "dept": "71", "mission_id": 23},
    {"centrale_id": 24, "nom": "Hangar Christophe CARRERE n°2", "dept": "47", "mission_id": 24},
    {"centrale_id": 25, "nom": "Hangar Frédéric CASTET", "dept": "31", "mission_id": 25},
    {"centrale_id": 26, "nom": "MARTEL 183 LOC", "dept": "23", "mission_id": 26},
    {"centrale_id": 27, "nom": "Hangar Frederic Sinaud", "dept": "23", "mission_id": 27},
    {"centrale_id": 28, "nom": "Hangar Frederic Sinaud (2)", "dept": None, "mission_id": 28},
    {"centrale_id": 29, "nom": "HARAS DE LA MAJORIE/MANOHA", "dept": "7", "mission_id": 29},
    {"centrale_id": 30, "nom": "Hangar Yannick CLEMENT", "dept": "31", "mission_id": 30},
    {"centrale_id": 31, "nom": "Concept-TY Chambray 2", "dept": "37", "mission_id": 31},
    {"centrale_id": 32, "nom": "Hangar Patrick BLANCHET", "dept": "26", "mission_id": 32},
    {"centrale_id": 33, "nom": "MATHIEU Vincent", "dept": "11", "mission_id": 33},
    {"centrale_id": 34, "nom": "Cheraud", "dept": "44", "mission_id": 34},
    {"centrale_id": 35, "nom": "Hangar Frédéric CASTET (2)", "dept": None, "mission_id": 35},
    {"centrale_id": 36, "nom": "Didier - PRIEUR", "dept": "26", "mission_id": 36},
    {"centrale_id": 37, "nom": "Hangar Eric LOGNON", "dept": "3", "mission_id": 37},
    {"centrale_id": 38, "nom": "Hangar LAMIOT", "dept": "42", "mission_id": 38},
    {"centrale_id": 39, "nom": "VIEL", "dept": "44", "mission_id": 39},
    {"centrale_id": 40, "nom": "Serge Maltaverne (2)", "dept": None, "mission_id": 40},
    {"centrale_id": 41, "nom": "SCI KILJOR", "dept": "7", "mission_id": 41},
    {"centrale_id": 42, "nom": "Hangar Benjamin CHASSON", "dept": "26", "mission_id": 42},
    {"centrale_id": 43, "nom": "Bourgeois", "dept": "44", "mission_id": 43},
    {"centrale_id": 44, "nom": "EARL GOUNY", "dept": "47", "mission_id": 44},
    {"centrale_id": 45, "nom": "Hangar Maxime Bayle", "dept": "11", "mission_id": 45},
    {"centrale_id": 46, "nom": "Commune De Pomas", "dept": "11", "mission_id": 46},
    {"centrale_id": 47, "nom": "GFA LASCOMBES - ANTOINE MICOULEAU", "dept": "11", "mission_id": 47},
    {"centrale_id": 48, "nom": "HANGAR Gérald Guillet", "dept": "17", "mission_id": 48},
    {"centrale_id": 49, "nom": "Hangar Joris SAINT MARTIN", "dept": "32", "mission_id": 49},
    {"centrale_id": 50, "nom": "GAYET 42", "dept": "42", "mission_id": 50},
    {"centrale_id": 51, "nom": "Hangar Sebastien RUDELLE", "dept": "12", "mission_id": 51},
    {"centrale_id": 52, "nom": "TOURNIER", "dept": "31", "mission_id": 52},
]

def generate_updates():
    """Génère les commandes SQL UPDATE"""
    updates = []
    stats = {}
    non_mappes = []
    
    for centrale in CENTRALES_DB:
        dept = centrale['dept']
        mission_id = centrale['mission_id']
        nom = centrale['nom']
        
        if dept and dept in MAPPING_DEPTS:
            sous_traitant_nom = MAPPING_DEPTS[dept]
            sous_traitant_id = SOUS_TRAITANT_IDS.get(sous_traitant_nom)
            
            if sous_traitant_id:
                updates.append({
                    'mission_id': mission_id,
                    'centrale_nom': nom,
                    'dept': dept,
                    'sous_traitant_nom': sous_traitant_nom,
                    'sous_traitant_id': sous_traitant_id
                })
                
                # Stats
                if sous_traitant_nom not in stats:
                    stats[sous_traitant_nom] = 0
                stats[sous_traitant_nom] += 1
        else:
            non_mappes.append({
                'mission_id': mission_id,
                'centrale_nom': nom,
                'dept': dept or 'NULL'
            })
    
    return updates, stats, non_mappes

def generate_sql_script(updates):
    """Génère le script SQL pour wrangler"""
    sql = "-- Script de mise à jour des attributions sous-traitants\n"
    sql += "-- Généré automatiquement depuis update_attributions.py\n"
    sql += "-- Ne supprime AUCUNE donnée (checklists, photos, commentaires)\n\n"
    
    for update in updates:
        sql += f"-- Mission {update['mission_id']}: {update['centrale_nom']} (dept {update['dept']}) → {update['sous_traitant_nom']}\n"
        sql += f"UPDATE ordres_mission SET sous_traitant_id = {update['sous_traitant_id']} WHERE id = {update['mission_id']};\n\n"
    
    return sql

if __name__ == '__main__':
    print("=" * 80)
    print("🔄 GÉNÉRATION SCRIPT MISE À JOUR ATTRIBUTIONS")
    print("=" * 80)
    
    updates, stats, non_mappes = generate_updates()
    
    print(f"\n📊 STATISTIQUES:")
    print(f"Total missions: {len(CENTRALES_DB)}")
    print(f"Missions mappées: {len(updates)}")
    print(f"Missions non-mappées: {len(non_mappes)}")
    
    print(f"\n📈 DISTRIBUTION PAR SOUS-TRAITANT:")
    for st, count in sorted(stats.items(), key=lambda x: x[1], reverse=True):
        print(f"  - {st}: {count} missions")
    
    if non_mappes:
        print(f"\n⚠️  MISSIONS NON-MAPPÉES (dept NULL ou non défini):")
        for nm in non_mappes:
            print(f"  - Mission {nm['mission_id']}: {nm['centrale_nom']} (dept: {nm['dept']})")
    
    # Générer le script SQL
    sql_script = generate_sql_script(updates)
    
    with open('update_attributions.sql', 'w', encoding='utf-8') as f:
        f.write(sql_script)
    
    print(f"\n✅ Script SQL généré: update_attributions.sql")
    print(f"   {len(updates)} commandes UPDATE")
    
    # Générer aussi le JSON pour vérification
    with open('update_attributions.json', 'w', encoding='utf-8') as f:
        json.dump({
            'updates': updates,
            'stats': stats,
            'non_mappes': non_mappes
        }, f, indent=2, ensure_ascii=False)
    
    print(f"✅ Données JSON générées: update_attributions.json")
    print("\n🔒 GARANTIE: Aucune donnée perdue (checklists, photos, commentaires préservés)")
