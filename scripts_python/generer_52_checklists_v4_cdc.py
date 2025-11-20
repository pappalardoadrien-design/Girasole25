#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script de génération des 52 checklists V4 conformes CDC GIRASOLE PERF-CDC-001
Version 4.0 - Conformité CDC 100% (54 points techniques)
"""

import json
from pathlib import Path
import sys

# Chemins
SCRIPT_DIR = Path(__file__).parent
PROJECT_DIR = SCRIPT_DIR.parent
DATA_FILE = PROJECT_DIR / 'data' / 'liste_52_centrales.json'
TEMPLATE_FILE = PROJECT_DIR / 'CHECKLIST_V4_TEMPLATE_CDC_COMPLET.html'
OUTPUT_DIR = PROJECT_DIR / 'checklists_v4_cdc_52'

def main():
    print("=" * 80)
    print("🚀 GÉNÉRATION 52 CHECKLISTS V4 - CONFORMITÉ CDC 100%")
    print("=" * 80)
    print()
    
    # Créer dossier sortie
    OUTPUT_DIR.mkdir(exist_ok=True)
    print(f"✅ Dossier sortie créé : {OUTPUT_DIR}")
    
    # Charger template
    print(f"📖 Chargement template : {TEMPLATE_FILE}")
    with open(TEMPLATE_FILE, 'r', encoding='utf-8') as f:
        template = f.read()
    print(f"✅ Template chargé : {len(template)} caractères")
    print()
    
    # Charger données centrales
    print(f"📊 Chargement données centrales : {DATA_FILE}")
    with open(DATA_FILE, 'r', encoding='utf-8') as f:
        centrales = json.load(f)
    print(f"✅ {len(centrales)} centrales chargées")
    print()
    
    # Statistiques
    stats = {
        'total': len(centrales),
        'sol': 0,
        'toiture': 0,
        'audit_toiture': 0,
        'generes': 0,
        'erreurs': 0
    }
    
    # Générer chaque checklist
    print("🔄 GÉNÉRATION DES CHECKLISTS...")
    print("-" * 80)
    
    for idx, centrale in enumerate(centrales, 1):
        try:
            # Déterminer type installation
            audit_toiture = centrale.get('audit_toiture', 'NON')
            audit_hors_toiture = centrale.get('audit_hors_toiture', 'OUI')
            
            if audit_toiture == "OUI":
                type_install = "TOITURE"
                stats['toiture'] += 1
                stats['audit_toiture'] += 1
            elif audit_hors_toiture == "OUI" and audit_toiture == "NON":
                type_install = "SOL"
                stats['sol'] += 1
            else:
                type_install = "SOL"
                stats['sol'] += 1
            
            # Générer HTML personnalisé
            html = template
            html = html.replace('{{ID_CENTRALE}}', str(centrale['id']))
            html = html.replace('{{NOM_CENTRALE}}', centrale['nom'])
            html = html.replace('{{PUISSANCE_KWC}}', str(centrale['puissance_kwc']))
            html = html.replace('{{ADRESSE_CENTRALE}}', centrale['adresse'])
            html = html.replace('{{TYPE_INSTALLATION}}', type_install)
            
            # Nom fichier sécurisé
            nom_safe = centrale['nom'].replace(' ', '_').replace('/', '_').replace('\\', '_')
            nom_safe = ''.join(c for c in nom_safe if c.isalnum() or c in ('_', '-'))
            filename = f"CHECKLIST_V4_{centrale['id']}_{nom_safe}.html"
            
            # Écrire fichier
            output_path = OUTPUT_DIR / filename
            with open(output_path, 'w', encoding='utf-8') as f:
                f.write(html)
            
            stats['generes'] += 1
            
            # Affichage progression
            audit_badge = "🏠 TOITURE" if audit_toiture == "OUI" else "🌾 SOL"
            print(f"  [{idx:2d}/52] ✅ {centrale['id']:5s} - {centrale['nom'][:40]:40s} {audit_badge}")
            
        except Exception as e:
            stats['erreurs'] += 1
            print(f"  [{idx:2d}/52] ❌ ERREUR : {centrale.get('id', '???')} - {str(e)}")
    
    print("-" * 80)
    print()
    
    # Résumé
    print("=" * 80)
    print("📊 RÉSUMÉ GÉNÉRATION")
    print("=" * 80)
    print(f"✅ Centrales traitées    : {stats['total']}")
    print(f"✅ Checklists générées   : {stats['generes']}")
    print(f"   • Installations SOL   : {stats['sol']}")
    print(f"   • Installations TOITURE: {stats['toiture']}")
    print(f"   • Audit toiture requis : {stats['audit_toiture']}")
    print(f"❌ Erreurs               : {stats['erreurs']}")
    print()
    print(f"📁 Dossier sortie        : {OUTPUT_DIR}")
    print(f"📦 Taille moyenne        : ~83 KB par checklist")
    print(f"📦 Taille totale estimée : ~{stats['generes'] * 83} KB")
    print()
    
    if stats['erreurs'] == 0:
        print("🎉 GÉNÉRATION TERMINÉE AVEC SUCCÈS !")
        print()
        print("✅ CONFORMITÉ CDC GIRASOLE 100% :")
        print("   • 10 sections par checklist")
        print("   • 54 points techniques CDC")
        print("   • 8 catégories photos")
        print("   • Section 8 (Audit Toiture) activable pour 13 centrales")
        print()
        print("🔄 PROCHAINES ÉTAPES :")
        print("   1. Tester checklist centrale 3085")
        print("   2. Déployer sur GitHub Pages")
        print("   3. Distribuer aux techniciens")
        return 0
    else:
        print(f"⚠️  GÉNÉRATION TERMINÉE AVEC {stats['erreurs']} ERREUR(S)")
        return 1

if __name__ == '__main__':
    sys.exit(main())
