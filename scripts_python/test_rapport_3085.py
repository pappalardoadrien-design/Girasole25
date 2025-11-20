#!/usr/bin/env python3
"""
TEST RAPPORT PDF - CENTRALE 3085
Test de génération du rapport DiagPV pour la centrale pilote
"""

from pathlib import Path
import json
import sys

# Import script génération
sys.path.insert(0, str(Path(__file__).parent))

try:
    from generer_rapports_diagpv_girasole_COMPLET import (
        generer_rapport_pdf,
        charger_json,
        DIAGPV_CONFIG,
        SIGNATAIRE
    )
    
    print("=" * 80)
    print("📄 TEST GÉNÉRATION RAPPORT PDF - CENTRALE 3085")
    print("=" * 80)
    print()
    
    base_dir = Path('/home/user/girasole_mission_2025')
    
    # Chemins fichiers test
    json_terrain_path = base_dir / 'exports_json' / '3085_terrain.json'
    json_be_path = base_dir / 'exports_json' / '3085_be.json'
    photos_zip_path = base_dir / 'photos_zip' / '3085_photos.zip'
    
    # Vérifier existence
    print("📁 Vérification fichiers source...")
    for path in [json_terrain_path, json_be_path, photos_zip_path]:
        if path.exists():
            print(f"   ✅ {path.name}")
        else:
            print(f"   ❌ MANQUANT: {path.name}")
            sys.exit(1)
    
    print()
    
    # Charger info centrale depuis liste
    centrales_path = base_dir / 'data' / 'liste_52_centrales.json'
    with open(centrales_path, 'r', encoding='utf-8') as f:
        centrales = json.load(f)
    
    centrale_3085 = next(c for c in centrales if c['id'] == '3085')
    
    print("🏭 Centrale pilote:")
    print(f"   ID:        {centrale_3085['id']}")
    print(f"   Nom:       {centrale_3085['nom']}")
    print(f"   Type:      {centrale_3085['type']}")
    print(f"   Puissance: {centrale_3085['puissance_kwc']} kWc")
    print(f"   Dept:      {centrale_3085['dept']}")
    print()
    
    # Créer répertoire outputs
    output_dir = base_dir / 'outputs_rapports'
    output_dir.mkdir(exist_ok=True)
    
    print("⚙️  Génération rapport PDF...")
    print(f"   Config DiagPV: {DIAGPV_CONFIG['nom']}")
    print(f"   Signataire:    {SIGNATAIRE['nom']} - {SIGNATAIRE['fonction']}")
    print()
    
    # Générer rapport
    try:
        output_path = generer_rapport_pdf(
            centrale_id='3085',
            json_terrain_path=json_terrain_path,
            json_be_path=json_be_path,
            photos_zip_path=photos_zip_path,
            centrale_info=centrale_3085,
            output_dir=output_dir
        )
        
        print("=" * 80)
        print("✅ RAPPORT GÉNÉRÉ AVEC SUCCÈS!")
        print("=" * 80)
        print()
        print(f"📁 Fichier:  {output_path}")
        print(f"📊 Taille:   {output_path.stat().st_size / 1024:.1f} KB")
        print()
        print("💡 RAPPORT WORD CRÉÉ - Prêt pour révision et conversion PDF")
        print()
        print("🔄 Pour convertir en PDF:")
        print("   - Option 1: Ouvrir dans Word et 'Enregistrer sous' → PDF")
        print("   - Option 2: LibreOffice headless:")
        print(f"     libreoffice --headless --convert-to pdf {output_path}")
        print()
        
    except Exception as e:
        print("=" * 80)
        print("❌ ERREUR GÉNÉRATION RAPPORT")
        print("=" * 80)
        print(f"Erreur: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)
        
except ImportError as e:
    print(f"❌ Erreur import: {e}")
    print("Vérifier que generer_rapports_diagpv_girasole_COMPLET.py existe")
    sys.exit(1)
