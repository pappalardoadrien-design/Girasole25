#!/usr/bin/env python3
"""
Script d'import dynamique de TOUTES les centrales GIRASOLE depuis Excel vers D1
Génère un fichier SQL à exécuter avec wrangler
"""
import openpyxl
import json
import math
import sys
import re
from pathlib import Path

# Chemins fichiers
EXCEL_FILE = '/home/user/girasole_analysis/GIRASOLE25/ANNEXE 1 - Liste des installations a auditer_v1.xlsx'
OUTPUT_SQL = '/home/user/webapp/migrations/0004_import_girasole_centrales.sql'

# Coordonnées bases
TOULOUSE = {'lat': 43.6047, 'lon': 1.4442}
LYON = {'lat': 45.7640, 'lon': 4.8357}

# Coordonnées départements (centres géographiques)
DEPT_COORDS = {
    '03': {'lat': 46.5667, 'lon': 3.3333, 'nom': 'Allier'},
    '07': {'lat': 44.7333, 'lon': 4.6000, 'nom': 'Ardèche'},
    '11': {'lat': 43.2167, 'lon': 2.3500, 'nom': 'Aude'},
    '12': {'lat': 44.3500, 'lon': 2.5750, 'nom': 'Aveyron'},
    '15': {'lat': 45.0333, 'lon': 2.4500, 'nom': 'Cantal'},
    '17': {'lat': 45.7500, 'lon': -0.6333, 'nom': 'Charente-Maritime'},
    '19': {'lat': 45.2667, 'lon': 1.7667, 'nom': 'Corrèze'},
    '23': {'lat': 46.1667, 'lon': 1.8667, 'nom': 'Creuse'},
    '26': {'lat': 44.9333, 'lon': 5.0500, 'nom': 'Drôme'},
    '31': {'lat': 43.6047, 'lon': 1.4442, 'nom': 'Haute-Garonne (Toulouse)'},
    '32': {'lat': 43.6500, 'lon': 0.5833, 'nom': 'Gers'},
    '34': {'lat': 43.6108, 'lon': 3.8767, 'nom': 'Hérault'},
    '37': {'lat': 47.3900, 'lon': 0.6889, 'nom': 'Indre-et-Loire'},
    '38': {'lat': 45.1885, 'lon': 5.7245, 'nom': 'Isère'},
    '42': {'lat': 45.4397, 'lon': 4.3872, 'nom': 'Loire'},
    '44': {'lat': 47.2184, 'lon': -1.5536, 'nom': 'Loire-Atlantique'},
    '46': {'lat': 44.4500, 'lon': 1.4400, 'nom': 'Lot'},
    '47': {'lat': 44.2000, 'lon': 0.6167, 'nom': 'Lot-et-Garonne'},
    '71': {'lat': 46.6667, 'lon': 4.5500, 'nom': 'Saône-et-Loire'},
    '79': {'lat': 46.3239, 'lon': -0.4642, 'nom': 'Deux-Sèvres'},
    '89': {'lat': 47.7975, 'lon': 3.5672, 'nom': 'Yonne'}
}

def haversine_distance(lat1, lon1, lat2, lon2):
    """Calcule distance en km entre 2 points GPS (formule Haversine)"""
    R = 6371  # Rayon Terre en km
    lat1, lon1, lat2, lon2 = map(math.radians, [lat1, lon1, lat2, lon2])
    dlat = lat2 - lat1
    dlon = lon2 - lon1
    a = math.sin(dlat/2)**2 + math.cos(lat1) * math.cos(lat2) * math.sin(dlon/2)**2
    c = 2 * math.asin(math.sqrt(a))
    return R * c

def extract_dept_from_address(address):
    """Extrait département depuis adresse (code postal)"""
    if not address:
        return '00'
    # Cherche code postal 5 chiffres
    match = re.search(r'\b(\d{2})\d{3}\b', str(address))
    if match:
        return match.group(1)
    return '00'

def get_dept_coords(dept_code):
    """Récupère coordonnées GPS d'un département"""
    return DEPT_COORDS.get(dept_code, {'lat': 45.0, 'lon': 2.0, 'nom': 'Inconnu'})

def calculate_distances(dept_code):
    """Calcule distances depuis Toulouse ET Lyon"""
    dept_loc = get_dept_coords(dept_code)
    
    dist_toulouse = haversine_distance(
        TOULOUSE['lat'], TOULOUSE['lon'],
        dept_loc['lat'], dept_loc['lon']
    )
    
    dist_lyon = haversine_distance(
        LYON['lat'], LYON['lon'],
        dept_loc['lat'], dept_loc['lon']
    )
    
    # Retourne distance minimale et base proche
    if dist_toulouse < dist_lyon:
        return {
            'distance_km': round(dist_toulouse, 1),
            'base_proche': 'Toulouse',
            'distance_toulouse': round(dist_toulouse, 1),
            'distance_lyon': round(dist_lyon, 1)
        }
    else:
        return {
            'distance_km': round(dist_lyon, 1),
            'base_proche': 'Lyon',
            'distance_toulouse': round(dist_toulouse, 1),
            'distance_lyon': round(dist_lyon, 1)
        }

def escape_sql(value):
    """Échappe une valeur pour SQL"""
    if value is None:
        return 'NULL'
    return "'" + str(value).replace("'", "''") + "'"

def load_centrales_from_excel():
    """Charge toutes les centrales depuis Excel ANNEXE 1"""
    print(f"📂 Lecture fichier Excel : {EXCEL_FILE}")
    
    wb = openpyxl.load_workbook(EXCEL_FILE, data_only=True)
    ws = wb.active
    
    centrales = []
    
    # Parcourir lignes (skip header rows 1 & 2)
    for row_idx, row in enumerate(ws.iter_rows(min_row=3, values_only=True), start=3):
        # Skip empty rows
        if not row[0] and not row[1]:
            continue
        
        # Structure Excel (row 2 = headers):
        # Col 1: ID référent
        # Col 2: Nom des projets
        # Col 3: Puissance EXE
        # Col 4: SPV
        # Col 5: Latitude
        # Col 6: Longitude
        # Col 7: Adresse
        # Col 8: Dept
        # Col 9: Type de centrale
        
        # Extraire latitude/longitude réelles
        latitude = float(row[4]) if row[4] and isinstance(row[4], (int, float)) else None
        longitude = float(row[5]) if row[5] and isinstance(row[5], (int, float)) else None
        
        # Extraire département
        dept = str(row[7]).zfill(2) if row[7] else extract_dept_from_address(row[6] if row[6] else '')
        
        centrale = {
            'id_ref': str(row[0]) if row[0] else f"AUTO_{row_idx}",
            'nom': str(row[1]) if row[1] else f"Centrale {row_idx}",
            'puissance_kwc': float(row[2]) if row[2] and isinstance(row[2], (int, float)) else 100.0,
            'adresse': str(row[6]) if row[6] else '',
            'type': 'TOITURE' if row[8] and 'toiture' in str(row[8]).lower() else 'SOL',
            'dept': dept,
            'latitude': latitude,
            'longitude': longitude
        }
        
        # Calculer distances depuis Toulouse/Lyon
        if latitude and longitude:
            # Utiliser GPS réels
            dist_toulouse = haversine_distance(TOULOUSE['lat'], TOULOUSE['lon'], latitude, longitude)
            dist_lyon = haversine_distance(LYON['lat'], LYON['lon'], latitude, longitude)
            
            if dist_toulouse < dist_lyon:
                centrale['distance_km'] = round(dist_toulouse, 1)
                centrale['base_proche'] = 'Toulouse'
                centrale['distance_toulouse'] = round(dist_toulouse, 1)
                centrale['distance_lyon'] = round(dist_lyon, 1)
            else:
                centrale['distance_km'] = round(dist_lyon, 1)
                centrale['base_proche'] = 'Lyon'
                centrale['distance_toulouse'] = round(dist_toulouse, 1)
                centrale['distance_lyon'] = round(dist_lyon, 1)
        else:
            # Fallback: utiliser coordonnées département
            distances = calculate_distances(centrale['dept'])
            centrale.update(distances)
            dept_loc = get_dept_coords(centrale['dept'])
            centrale['latitude'] = dept_loc['lat']
            centrale['longitude'] = dept_loc['lon']
        
        # Nom département
        dept_loc = get_dept_coords(centrale['dept'])
        centrale['dept_nom'] = dept_loc['nom']
        
        centrales.append(centrale)
    
    print(f"✅ {len(centrales)} centrales chargées depuis Excel")
    return centrales

def generate_sql_migration(centrales):
    """Génère fichier SQL de migration avec toutes centrales"""
    
    sql_lines = [
        "-- Migration 0004: Import de toutes les centrales GIRASOLE depuis Excel",
        f"-- Date: 2025-11-21",
        f"-- Total centrales: {len(centrales)}",
        "",
        "-- Ajout colonnes GPS et métadonnées",
        "ALTER TABLE centrales ADD COLUMN IF NOT EXISTS latitude REAL;",
        "ALTER TABLE centrales ADD COLUMN IF NOT EXISTS longitude REAL;",
        "ALTER TABLE centrales ADD COLUMN IF NOT EXISTS distance_toulouse_km REAL;",
        "ALTER TABLE centrales ADD COLUMN IF NOT EXISTS distance_lyon_km REAL;",
        "ALTER TABLE centrales ADD COLUMN IF NOT EXISTS base_proche TEXT;",
        "ALTER TABLE centrales ADD COLUMN IF NOT EXISTS dept TEXT;",
        "ALTER TABLE centrales ADD COLUMN IF NOT EXISTS id_ref TEXT;",
        "",
        "-- Import des centrales GIRASOLE",
    ]
    
    for centrale in centrales:
        insert_sql = f"""INSERT INTO centrales (
  id_ref, nom, type, puissance_kwc, localisation, statut,
  latitude, longitude, distance_toulouse_km, distance_lyon_km, base_proche, dept
) VALUES (
  {escape_sql(centrale['id_ref'])},
  {escape_sql(centrale['nom'])},
  {escape_sql(centrale['type'])},
  {centrale['puissance_kwc']},
  {escape_sql(centrale['adresse'])},
  'A_AUDITER',
  {centrale['latitude']},
  {centrale['longitude']},
  {centrale['distance_toulouse']},
  {centrale['distance_lyon']},
  {escape_sql(centrale['base_proche'])},
  {escape_sql(centrale['dept'])}
) ON CONFLICT(nom) DO UPDATE SET
  puissance_kwc = excluded.puissance_kwc,
  localisation = excluded.localisation,
  latitude = excluded.latitude,
  longitude = excluded.longitude,
  distance_toulouse_km = excluded.distance_toulouse_km,
  distance_lyon_km = excluded.distance_lyon_km,
  base_proche = excluded.base_proche,
  dept = excluded.dept,
  id_ref = excluded.id_ref;"""
        
        sql_lines.append(insert_sql)
    
    return '\n'.join(sql_lines)

def main():
    """Fonction principale"""
    print("=" * 70)
    print("🚀 IMPORT DYNAMIQUE - TOUTES LES CENTRALES GIRASOLE")
    print("=" * 70)
    
    try:
        # Charger centrales depuis Excel
        centrales = load_centrales_from_excel()
        
        # Statistiques
        toulouse_count = sum(1 for c in centrales if c['base_proche'] == 'Toulouse')
        lyon_count = sum(1 for c in centrales if c['base_proche'] == 'Lyon')
        puissance_totale = sum(c['puissance_kwc'] for c in centrales)
        
        print(f"\n📊 Statistiques:")
        print(f"  • Total centrales: {len(centrales)}")
        print(f"  • Base Toulouse: {toulouse_count} centrales")
        print(f"  • Base Lyon: {lyon_count} centrales")
        print(f"  • Puissance totale: {puissance_totale:.2f} kWc")
        
        # Trier par distance (Top 25)
        centrales_sorted = sorted(centrales, key=lambda c: c['distance_km'])
        top25 = centrales_sorted[:25]
        
        print(f"\n🎯 Top 25 centrales les plus proches:")
        for i, c in enumerate(top25[:5], 1):
            print(f"  {i}. {c['nom'][:40]} - {c['distance_km']} km ({c['base_proche']})")
        print(f"  ... {len(top25)-5} autres")
        
        # Générer SQL
        print(f"\n📝 Génération SQL migration...")
        sql_content = generate_sql_migration(centrales)
        
        # Écrire fichier
        Path(OUTPUT_SQL).parent.mkdir(parents=True, exist_ok=True)
        with open(OUTPUT_SQL, 'w', encoding='utf-8') as f:
            f.write(sql_content)
        
        print(f"✅ Fichier SQL généré: {OUTPUT_SQL}")
        print(f"📦 Taille: {len(sql_content)} caractères")
        
        # Sauvegarder JSON des Top 25 pour référence
        top25_json = {
            'date_generation': '2025-11-21',
            'total_centrales': len(centrales),
            'top25': top25
        }
        
        json_file = '/home/user/webapp/data/girasole_top25_dynamic.json'
        Path(json_file).parent.mkdir(parents=True, exist_ok=True)
        with open(json_file, 'w', encoding='utf-8') as f:
            json.dump(top25_json, f, indent=2, ensure_ascii=False)
        
        print(f"✅ JSON Top 25 sauvegardé: {json_file}")
        
        print("\n" + "=" * 70)
        print("✅ IMPORT TERMINÉ AVEC SUCCÈS")
        print("=" * 70)
        print("\n📌 Prochaine étape:")
        print(f"   cd /home/user/webapp")
        print(f"   npx wrangler d1 migrations apply girasole-db-production --local")
        
        return 0
        
    except Exception as e:
        print(f"\n❌ ERREUR: {e}")
        import traceback
        traceback.print_exc()
        return 1

if __name__ == '__main__':
    sys.exit(main())
