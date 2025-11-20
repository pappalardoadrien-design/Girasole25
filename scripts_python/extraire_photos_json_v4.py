#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
📸 EXTRACTEUR PHOTOS JSON V4 - GIRASOLE 2025
Diagnostic Photovoltaïque

Extrait toutes les photos depuis JSON V4 et les organise par catégorie
Input : JSON V4 avec photos Base64
Output : Dossier photos organisé par catégorie (DOC, ELEC, TRANCHEES, MP, TOIT, BP, GEN, TOITURE_DETAIL)

Auteur : DiagPV Assistant Pro
Date : 20 janvier 2025
Version : 1.0
"""

import json
import base64
from pathlib import Path
from datetime import datetime


def charger_json(chemin: Path) -> dict:
    """Charge un fichier JSON"""
    try:
        with open(chemin, 'r', encoding='utf-8') as f:
            return json.load(f)
    except Exception as e:
        print(f"   ❌ Erreur lecture {chemin.name}: {e}")
        return {}


def decoder_photo_base64(photo_data: str) -> bytes:
    """Décode photo Base64"""
    try:
        # Format : "data:image/jpeg;base64,/9j/4AAQ..."
        if ',' in photo_data:
            photo_data = photo_data.split(',')[1]
        return base64.b64decode(photo_data)
    except Exception as e:
        print(f"   ⚠️  Erreur décodage Base64: {e}")
        return b''


def extraire_photos_centrale(json_path: Path, output_dir: Path):
    """
    Extrait toutes les photos d'une centrale depuis JSON V4
    
    Args:
        json_path: Chemin JSON V4
        output_dir: Dossier sortie photos
    
    Returns:
        Tuple (nb_photos_extraites, centrale_id, centrale_nom)
    """
    
    # Charger JSON
    data = charger_json(json_path)
    
    if not data:
        return (0, 'UNKNOWN', 'N/A')
    
    # Vérifier version
    version = data.get('metadata', {}).get('version', '3.0')
    if version < '4.0':
        print(f"   ⚠️  JSON V3 détecté : {json_path.name}")
        return (0, 'UNKNOWN', 'N/A')
    
    # Extraire infos centrale
    centrale = data.get('centrale', {})
    centrale_id = centrale.get('id', 'UNKNOWN')
    centrale_nom = centrale.get('nom', 'N/A')
    photos = data.get('photos', {})
    
    # Créer dossier centrale
    centrale_dir = output_dir / f"{centrale_id}_{centrale_nom.replace(' ', '_').replace('/', '_')}"
    centrale_dir.mkdir(parents=True, exist_ok=True)
    
    nb_photos_total = 0
    
    # Catégories photos V4
    categories = ['DOC', 'ELEC', 'TRANCHEES', 'MP', 'TOIT', 'BP', 'GEN', 'TOITURE_DETAIL']
    
    for categorie in categories:
        photos_cat = photos.get(categorie, [])
        
        if not photos_cat:
            continue
        
        # Créer sous-dossier catégorie
        cat_dir = centrale_dir / categorie
        cat_dir.mkdir(exist_ok=True)
        
        for i, photo_obj in enumerate(photos_cat, 1):
            try:
                # Extraire données photo
                nom_photo = photo_obj.get('nom', f'{categorie}_{i}.jpg')
                photo_data = photo_obj.get('data', '')
                
                if not photo_data:
                    continue
                
                # Décoder Base64
                img_bytes = decoder_photo_base64(photo_data)
                
                if not img_bytes:
                    continue
                
                # Sauvegarder photo
                photo_path = cat_dir / nom_photo
                with open(photo_path, 'wb') as f:
                    f.write(img_bytes)
                
                nb_photos_total += 1
            
            except Exception as e:
                print(f"   ⚠️  Erreur extraction photo {categorie} {i}: {e}")
    
    return (nb_photos_total, centrale_id, centrale_nom)


def main():
    """Extrait photos depuis tous les JSON V4 disponibles"""
    
    print("="*100)
    print("📸 EXTRACTEUR PHOTOS JSON V4 - GIRASOLE 2025")
    print("="*100)
    print()
    
    # Chemins
    base_dir = Path(__file__).parent.parent
    exports_dir = base_dir / 'exports_json'
    output_dir = base_dir / 'outputs_photos_extraites'
    output_dir.mkdir(exist_ok=True)
    
    if not exports_dir.exists():
        print(f"❌ Dossier exports JSON introuvable : {exports_dir}")
        return
    
    # Lister JSON V4
    json_files = list(exports_dir.glob("AUDIT_*.json"))
    
    if not json_files:
        print(f"❌ Aucun fichier JSON V4 trouvé dans {exports_dir}")
        return
    
    print(f"📊 {len(json_files)} fichiers JSON V4 détectés\n")
    print("⚙️  Extraction photos en cours...\n")
    
    # Statistiques
    nb_centrales_ok = 0
    nb_photos_total = 0
    nb_skip = 0
    
    for i, json_path in enumerate(json_files, 1):
        nb_photos, centrale_id, centrale_nom = extraire_photos_centrale(json_path, output_dir)
        
        if nb_photos > 0:
            print(f"   {i:2d}. ✅ {centrale_id} - {centrale_nom} ({nb_photos} photos)")
            nb_centrales_ok += 1
            nb_photos_total += nb_photos
        else:
            print(f"   {i:2d}. ⚠️  SKIP {json_path.name} (0 photos ou JSON V3)")
            nb_skip += 1
    
    # Statistiques finales
    print()
    print("="*100)
    print("📊 STATISTIQUES EXTRACTION")
    print("="*100)
    print(f"✅ Centrales traitées : {nb_centrales_ok}/{len(json_files)}")
    print(f"📸 Photos extraites : {nb_photos_total}")
    print(f"⚠️  JSON skippés : {nb_skip}")
    print(f"📁 Dossier sortie : {output_dir}")
    print("="*100)
    print()
    print("💡 ORGANISATION PHOTOS:")
    print(f"   {output_dir}/")
    print(f"   ├── [ID]_[NOM_CENTRALE]/")
    print(f"   │   ├── DOC/          (Documents GIRASOLE)")
    print(f"   │   ├── ELEC/         (Électrique détaillé)")
    print(f"   │   ├── TRANCHEES/    (Tranchées AC)")
    print(f"   │   ├── MP/           (Modules PV)")
    print(f"   │   ├── TOIT/         (Structure support)")
    print(f"   │   ├── BP/           (Boîtes protection)")
    print(f"   │   ├── GEN/          (Vues générales)")
    print(f"   │   └── TOITURE_DETAIL/ (Audit toiture - si applicable)")
    print()


if __name__ == "__main__":
    main()
