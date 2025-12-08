#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import json
import csv
import sys

# Lire le JSON
with open('/tmp/centrales_complete.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

# Extraire les résultats
centrales = data[0]['results']

# En-têtes CSV
headers = [
    'ID',
    'Nom centrale',
    'Sous-traitant',
    'Type',
    'Puissance (kWc)',
    'Département',
    'Localisation',
    'Adresse complète',
    'ID Référent',
    'SPV',
    'Latitude',
    'Longitude',
    'Type centrale',
    'Installateur',
    'Date MES',
    'SI',
    'Panneaux',
    'Contact Exploitation',
    'Tel Exploitation',
    'Contact Gestion',
    'Tel Gestion',
    'Audit toiture',
    'Audit hors toiture',
    'Ratio PR',
    'Date prév audit',
    'Mission ID',
    'Statut mission',
    'Date mission'
]

# Créer CSV complet
with open('/home/user/webapp/public/documents/csv/ANNEXE1_COMPLETE_ATTRIBUTIONS.csv', 'w', newline='', encoding='utf-8-sig') as f:
    writer = csv.writer(f, delimiter=';')
    writer.writerow(headers)
    
    for c in centrales:
        row = [
            c.get('id', ''),
            c.get('nom', ''),
            c.get('sous_traitant', ''),
            c.get('type', ''),
            c.get('puissance_kwc', ''),
            c.get('dept', ''),
            c.get('localisation', ''),
            c.get('adresse', ''),
            c.get('id_ref', ''),
            c.get('spv', ''),
            c.get('latitude', ''),
            c.get('longitude', ''),
            c.get('type_centrale', ''),
            c.get('installateur', ''),
            c.get('date_mes', ''),
            c.get('si', ''),
            c.get('panneaux', ''),
            c.get('contact_exploitation', ''),
            c.get('tel_exploitation', ''),
            c.get('contact_gestion', ''),
            c.get('tel_gestion', ''),
            c.get('audit_toiture', ''),
            c.get('audit_hors_toiture', ''),
            c.get('ratio_pr', ''),
            c.get('date_prev_audit', ''),
            c.get('mission_id', ''),
            c.get('mission_statut', ''),
            c.get('date_mission', '')
        ]
        writer.writerow(row)

print(f"✅ Fichier CSV complet créé: {len(centrales)} centrales")

# Créer un fichier par sous-traitant
sous_traitants = {}
for c in centrales:
    st = c.get('sous_traitant', 'NON_ATTRIBUE')
    if st not in sous_traitants:
        sous_traitants[st] = []
    sous_traitants[st].append(c)

for st_nom, st_centrales in sous_traitants.items():
    # Nettoyer le nom pour le fichier
    filename = st_nom.replace(' ', '_').replace('-', '_').replace('/', '_')
    filepath = f'/home/user/webapp/public/documents/csv/ATTRIBUTION_{filename}.csv'
    
    with open(filepath, 'w', newline='', encoding='utf-8-sig') as f:
        writer = csv.writer(f, delimiter=';')
        writer.writerow(headers)
        
        for c in st_centrales:
            row = [
                c.get('id', ''),
                c.get('nom', ''),
                c.get('sous_traitant', ''),
                c.get('type', ''),
                c.get('puissance_kwc', ''),
                c.get('dept', ''),
                c.get('localisation', ''),
                c.get('adresse', ''),
                c.get('id_ref', ''),
                c.get('spv', ''),
                c.get('latitude', ''),
                c.get('longitude', ''),
                c.get('type_centrale', ''),
                c.get('installateur', ''),
                c.get('date_mes', ''),
                c.get('si', ''),
                c.get('panneaux', ''),
                c.get('contact_exploitation', ''),
                c.get('tel_exploitation', ''),
                c.get('contact_gestion', ''),
                c.get('tel_gestion', ''),
                c.get('audit_toiture', ''),
                c.get('audit_hors_toiture', ''),
                c.get('ratio_pr', ''),
                c.get('date_prev_audit', ''),
                c.get('mission_id', ''),
                c.get('mission_statut', ''),
                c.get('date_mission', '')
            ]
            writer.writerow(row)
    
    print(f"✅ {st_nom}: {len(st_centrales)} centrales → {filepath}")

print("\n🎉 Tous les fichiers CSV créés avec succès!")
