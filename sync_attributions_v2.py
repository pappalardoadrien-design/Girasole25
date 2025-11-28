#!/usr/bin/env python3
"""
Script de synchronisation des attributions selon document final Excel
Version: 2.4.5
Date: 28/11/2024
"""

import json
import requests
import pandas as pd
from collections import defaultdict

# Configuration
API_BASE = "https://girasole-diagpv.pages.dev/api"
DOC_SOURCE = {
    'ARTEMIS': 15,
    'DIAGPV - Adrien & Fabien': 15,
    'CADENET': 6,
    'EDOUARD - Martial': 7,
    'COURTIADE DISTRIB': 1,
    'DRONE AVEYRON SERVICE': 2,
    'En attente attribution': 6
}

def get_centrales():
    """Récupérer toutes les centrales depuis l'API"""
    response = requests.get(f"{API_BASE}/centrales")
    data = response.json()
    return data.get('data', [])

def get_sous_traitants():
    """Récupérer tous les sous-traitants"""
    response = requests.get(f"{API_BASE}/sous-traitants")
    data = response.json()
    return {st['nom_entreprise']: st['id'] for st in data.get('data', [])}

def get_ordres_mission():
    """Récupérer tous les ordres de mission"""
    response = requests.get(f"{API_BASE}/ordres-mission")
    data = response.json()
    if isinstance(data, dict) and 'data' in data:
        return data['data']
    return []

def main():
    print("="*70)
    print("SYNCHRONISATION ATTRIBUTIONS - DOCUMENT FINAL")
    print("="*70)
    
    # Récupérer données
    print("\n📊 Récupération des données...")
    centrales = get_centrales()
    sous_traitants = get_sous_traitants()
    ordres = get_ordres_mission()
    
    print(f"✅ {len(centrales)} centrales trouvées")
    print(f"✅ {len(sous_traitants)} sous-traitants trouvés")
    print(f"✅ {len(ordres)} ordres de mission trouvés")
    
    # Créer mapping centrale_id -> ordre_mission_id
    centrale_to_om = {}
    om_to_st = {}
    
    for om in ordres:
        if isinstance(om, dict):
            centrale_id = om.get('centrale_id')
            om_id = om.get('id')
            st_id = om.get('sous_traitant_id')
            if centrale_id and om_id:
                centrale_to_om[centrale_id] = om_id
                if st_id:
                    om_to_st[om_id] = st_id
    
    print(f"✅ {len(centrale_to_om)} centrales avec ordres de mission")
    
    # Analyser distribution actuelle
    print("\n📈 Distribution actuelle en DB:")
    current_dist = defaultdict(int)
    
    for centrale in centrales:
        c_id = centrale.get('id')
        om_id = centrale_to_om.get(c_id)
        if om_id and om_id in om_to_st:
            st_id = om_to_st[om_id]
            # Trouver nom du sous-traitant
            st_name = next((k for k, v in sous_traitants.items() if v == st_id), f"ID_{st_id}")
            current_dist[st_name] += 1
    
    for st_name in sorted(current_dist.keys()):
        count = current_dist[st_name]
        target = DOC_SOURCE.get(st_name, '?')
        status = "✅" if count == target else f"❌ (cible: {target})"
        print(f"  {st_name}: {count} {status}")
    
    print(f"\n  TOTAL: {sum(current_dist.values())} missions attribuées")
    
    # Charger données du document Excel extrait
    print("\n📋 Chargement document source...")
    try:
        df_doc = pd.read_csv('table_2_extracted.csv')
        print("✅ TABLEAU 2 chargé (distribution sous-traitants)")
        
        # DIAGPV A&F depuis TABLEAU 4
        df4 = pd.read_csv('table_4_extracted.csv')
        diagpv_row = df4[df4['Sous-traitant'].str.contains('DIAGPV A&F', na=False)]
        if not diagpv_row.empty:
            diagpv_count = int(diagpv_row.iloc[0]['Nb sites'])
            print(f"✅ DIAGPV A&F: {diagpv_count} sites (TABLEAU 4)")
        
    except Exception as e:
        print(f"⚠️  Erreur lecture CSV: {e}")
    
    # Calculer écarts
    print("\n🔍 ÉCARTS DÉTECTÉS:")
    ecarts = {}
    for st_name, target_count in DOC_SOURCE.items():
        current_count = current_dist.get(st_name, 0)
        ecart = target_count - current_count
        if ecart != 0:
            ecarts[st_name] = ecart
            direction = "⬆️ +" if ecart > 0 else "⬇️"
            print(f"  {st_name}: {direction}{abs(ecart)} (actuel: {current_count} → cible: {target_count})")
    
    if not ecarts:
        print("  ✅ Aucun écart - Base de données synchronisée!")
        return
    
    # Générer plan de redistribution
    print("\n📝 PLAN DE REDISTRIBUTION:")
    print("\nCentrales à RETIRER de ARTEMIS (5) et RÉATTRIBUER:")
    
    # Lister centrales ARTEMIS
    artemis_id = sous_traitants.get('ARTEMIS')
    artemis_centrales = []
    
    for centrale in centrales:
        c_id = centrale.get('id')
        om_id = centrale_to_om.get(c_id)
        if om_id and om_to_st.get(om_id) == artemis_id:
            artemis_centrales.append({
                'id': c_id,
                'nom': centrale.get('nom'),
                'dept': centrale.get('dept'),
                'om_id': om_id
            })
    
    # Trier par département
    artemis_centrales.sort(key=lambda x: x['dept'] or 'ZZ')
    
    print(f"\nCentrales ARTEMIS actuelles ({len(artemis_centrales)}):")
    for c in artemis_centrales[:20]:  # Afficher les 20 premières
        print(f"  - ID {c['id']}: {c['nom']} (Dept {c['dept']})")
    
    # Proposer redistribution
    print("\n🎯 PROPOSITION DE REDISTRIBUTION:")
    print("\nRETIRER de ARTEMIS (5 centrales) et RÉATTRIBUER:")
    
    # +2 DIAGPV A&F
    print(f"\n  → +2 vers DIAGPV - Adrien & Fabien")
    for c in artemis_centrales[:2]:
        print(f"     • ID {c['id']}: {c['nom']} (Dept {c['dept']})")
    
    # +2 CADENET
    print(f"\n  → +2 vers CADENET")
    for c in artemis_centrales[2:4]:
        print(f"     • ID {c['id']}: {c['nom']} (Dept {c['dept']})")
    
    # +1 En attente
    print(f"\n  → +1 vers En attente attribution")
    if len(artemis_centrales) > 4:
        c = artemis_centrales[4]
        print(f"     • ID {c['id']}: {c['nom']} (Dept {c['dept']})")
    
    # Générer SQL
    print("\n📄 Génération script SQL...")
    
    sql_commands = []
    sql_commands.append("-- Mise à jour attributions selon document final")
    sql_commands.append("-- Date: 28/11/2024 - Version 2.4.5")
    sql_commands.append("-- Total ajustements: 5 centrales réattribuées\n")
    
    # +2 DIAGPV A&F
    diagpv_id = sous_traitants.get('DIAGPV - Adrien & Fabien')
    for c in artemis_centrales[:2]:
        sql_commands.append(f"UPDATE ordres_mission SET sous_traitant_id = {diagpv_id} WHERE id = {c['om_id']}; -- {c['nom']}")
    
    # +2 CADENET
    cadenet_id = sous_traitants.get('CADENET')
    for c in artemis_centrales[2:4]:
        sql_commands.append(f"UPDATE ordres_mission SET sous_traitant_id = {cadenet_id} WHERE id = {c['om_id']}; -- {c['nom']}")
    
    # +1 En attente
    attente_id = sous_traitants.get('En attente attribution')
    if len(artemis_centrales) > 4:
        c = artemis_centrales[4]
        sql_commands.append(f"UPDATE ordres_mission SET sous_traitant_id = {attente_id} WHERE id = {c['om_id']}; -- {c['nom']}")
    
    sql_content = "\n".join(sql_commands)
    
    with open('sync_attributions_final.sql', 'w', encoding='utf-8') as f:
        f.write(sql_content)
    
    print("✅ Script SQL généré: sync_attributions_final.sql")
    
    # Sauvegarder JSON détaillé
    redistribution_plan = {
        'date': '2024-11-28',
        'version': '2.4.5',
        'ecarts': ecarts,
        'distribution_actuelle': dict(current_dist),
        'distribution_cible': DOC_SOURCE,
        'centrales_a_reattribuer': artemis_centrales[:5],
        'sql_commands': sql_commands
    }
    
    with open('sync_attributions_final.json', 'w', encoding='utf-8') as f:
        json.dump(redistribution_plan, f, ensure_ascii=False, indent=2)
    
    print("✅ Plan détaillé sauvegardé: sync_attributions_final.json")
    
    print("\n" + "="*70)
    print("✅ ANALYSE TERMINÉE")
    print("="*70)
    print("\n📋 Prochaines étapes:")
    print("  1. Vérifier le script SQL: sync_attributions_final.sql")
    print("  2. Exécuter avec: npx wrangler d1 execute girasole-db-production --remote --file=sync_attributions_final.sql")
    print("  3. Vérifier nouvelle distribution via API")

if __name__ == '__main__':
    main()
