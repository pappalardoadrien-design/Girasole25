#!/usr/bin/env python3
"""
GÉNÉRATEUR 52 CHECKLISTS TERRAIN V2 INDIVIDUELLES
Mission GIRASOLE 2025 - Diagnostic Photovoltaïque

Génère 52 checklists terrain personnalisées basées sur template V2 du 18 novembre
(20 sections, 174 items, upload photos intégré)
"""

import json
from pathlib import Path
import re

def nettoyer_nom_fichier(nom):
    """Nettoie nom pour nom de fichier sécurisé"""
    nom = re.sub(r'[^\w\s-]', '', nom)
    nom = re.sub(r'[-\s]+', '_', nom)
    return nom[:100]

def generer_checklist_individuelle(template_html, centrale):
    """Personnalise template V2 pour une centrale"""
    
    html = template_html
    
    # 1. Remplacer titre page
    html = html.replace(
        '<title>Checklist Terrain Complète DiagPV</title>',
        f'<title>Checklist {centrale["id"]} - {centrale["nom"]}</title>'
    )
    
    html = html.replace(
        '<h1>📋 CHECKLIST TERRAIN COMPLÈTE</h1>',
        f'<h1>📋 CHECKLIST TERRAIN - {centrale["nom"]}</h1>'
    )
    
    # 2. Pré-remplir Section 1 - Informations Générales
    # Code site
    html = html.replace(
        '<input type="text" id="code_site" name="code_site" placeholder="Ex: 31971">',
        f'<input type="text" id="code_site" name="code_site" value="{centrale["id"]}" readonly>'
    )
    
    # Nom site
    html = html.replace(
        '<input type="text" id="nom_site" name="nom_site" placeholder="Ex: Antunez - SCI ANAUJA">',
        f'<input type="text" id="nom_site" name="nom_site" value="{centrale["nom"]}" readonly>'
    )
    
    # GPS
    gps_value = f"{centrale['latitude']}, {centrale['longitude']}" if centrale['latitude'] else ""
    html = html.replace(
        '<input type="text" id="gps" name="gps" placeholder="Ex: 43.xxx, 1.xxx">',
        f'<input type="text" id="gps" name="gps" value="{gps_value}">'
    )
    
    # Puissance
    puissance_value = f"{centrale['puissance_kwc']} kWc" if centrale['puissance_kwc'] else ""
    html = html.replace(
        '<input type="text" id="puissance_kwc" name="puissance_kwc" placeholder="Ex: 250 kWc">',
        f'<input type="text" id="puissance_kwc" name="puissance_kwc" value="{puissance_value}">'
    )
    
    # Type centrale
    type_value = centrale.get('type', '')
    if type_value:
        # Déterminer si toiture ou sol
        if 'toiture' in type_value.lower() or centrale.get('audit_toiture') == 'OUI':
            html = html.replace(
                '<option value="">Sélectionner</option>',
                '<option value="">Sélectionner</option>\n                        <option value="toiture" selected>Toiture</option>'
            )
        else:
            html = html.replace(
                '<option value="">Sélectionner</option>',
                '<option value="">Sélectionner</option>\n                        <option value="sol" selected>Sol</option>'
            )
    
    # Adresse
    adresse_value = centrale.get('adresse', '')
    if adresse_value:
        html = html.replace(
            '<textarea id="adresse" name="adresse" rows="2" placeholder="Ex: Château Lagoual, 11400 Lasbordes"></textarea>',
            f'<textarea id="adresse" name="adresse" rows="2">{adresse_value}</textarea>'
        )
    
    # Installateur
    installateur_value = centrale.get('installateur', '')
    if installateur_value:
        html = html.replace(
            '<input type="text" id="installateur" name="installateur" placeholder="Ex: Yama Energies">',
            f'<input type="text" id="installateur" name="installateur" value="{installateur_value}">'
        )
    
    return html

def main():
    """Génère 52 checklists terrain V2 individuelles"""
    
    print("🚀 GÉNÉRATEUR 52 CHECKLISTS TERRAIN V2 GIRASOLE 2025\n")
    
    # 1. Charger template V2
    template_path = Path('/home/user/TEMPLATE_CHECKLIST_TERRAIN_V2.html')
    print(f"📄 Lecture template V2: {template_path.name}")
    template_html = template_path.read_text(encoding='utf-8')
    print(f"   ✅ Template chargé: {len(template_html)} caractères\n")
    
    # 2. Charger liste 52 centrales
    centrales_path = Path('/home/user/liste_52_centrales.json')
    print(f"📊 Lecture liste centrales: {centrales_path.name}")
    with open(centrales_path, 'r', encoding='utf-8') as f:
        centrales = json.load(f)
    print(f"   ✅ {len(centrales)} centrales chargées\n")
    
    # 3. Créer dossier output
    output_dir = Path('/home/user/CHECKLISTS_TERRAIN_V2_52')
    output_dir.mkdir(exist_ok=True)
    print(f"📁 Dossier output: {output_dir.name}\n")
    
    # 4. Générer 52 checklists individuelles
    print("⚙️  Génération 52 checklists individuelles...\n")
    
    for i, centrale in enumerate(centrales, 1):
        # Personnaliser template
        html_personnalise = generer_checklist_individuelle(template_html, centrale)
        
        # Nom fichier sécurisé
        nom_propre = nettoyer_nom_fichier(centrale['nom'])
        nom_fichier = f"CHECKLIST_{centrale['id']}_{nom_propre}.html"
        
        # Sauvegarder
        output_path = output_dir / nom_fichier
        output_path.write_text(html_personnalise, encoding='utf-8')
        
        print(f"   {i:2d}. ✅ {nom_fichier}")
    
    print(f"\n✅ 52 checklists V2 individuelles générées dans: {output_dir.name}/")
    print(f"✅ Taille moyenne: ~62 KB par fichier")
    print(f"✅ Total: ~3.2 MB")

if __name__ == "__main__":
    main()
