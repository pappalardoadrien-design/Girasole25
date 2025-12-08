#!/usr/bin/env python3
"""
Script pour générer automatiquement les checklists toiture manquantes
pour les 10 missions concernées
"""

import json
import subprocess

# 10 missions sans checklist toiture
MISSIONS_SANS_CHECKLIST = [6, 8, 12, 17, 18, 21, 38, 39, 43, 47]

# Template checklist toiture (14 items)
TEMPLATE_ITEMS = [
    {
        "item_numero": 1,
        "libelle": "Démontage/remontage ~25 panneaux pertinents",
        "categorie": "AUDIT_TOITURE",
        "description": "Démontage d'au moins 25 panneaux pertinents (1er et dernier panneau d'une chaîne, etc.). Remontage sans atteinte à l'intégrité des panneaux ou de leurs supports.",
        "reference_normative": "CDC Girasole §2.2"
    },
    {
        "item_numero": 2,
        "libelle": "Conformité DTU 40.35",
        "categorie": "AUDIT_TOITURE",
        "description": "Vérification de la conformité aux règles du DTU 40.35 (couvertures par éléments métalliques en feuilles et longues feuilles en zinc).",
        "reference_normative": "DTU 40.35"
    },
    {
        "item_numero": 3,
        "libelle": "Qualité montage/serrage SI sur support",
        "categorie": "AUDIT_TOITURE",
        "description": "Contrôle de la qualité et conformité du montage et serrage des Structures d'Intégration (SI) sur leur support.",
        "reference_normative": "CDC Girasole page 8"
    },
    {
        "item_numero": 4,
        "libelle": "Qualité montage/serrage panneaux sur SI",
        "categorie": "AUDIT_TOITURE",
        "description": "Contrôle de la qualité et conformité du montage et serrage des panneaux photovoltaïques sur les structures d'intégration.",
        "reference_normative": "CDC Girasole page 8"
    },
    {
        "item_numero": 5,
        "libelle": "Fixation cheminement câbles (supports, étanchéité)",
        "categorie": "AUDIT_TOITURE",
        "description": "Contrôle de la fixation du cheminement des câbles : pertinence des supports de fixation, maintien de l'étanchéité toiture, absence de percement non maîtrisé.",
        "reference_normative": "CDC Girasole page 8"
    },
    {
        "item_numero": 6,
        "libelle": "Compatibilité/serrage/étanchéité connecteurs MC4",
        "categorie": "AUDIT_TOITURE",
        "description": "Contrôle des raccordements : compatibilité des connecteurs mâle/femelle (type PVZH202B), serrages corrects, étanchéité assurée, protection contre ruissellement.",
        "reference_normative": "CDC Girasole page 8"
    },
    {
        "item_numero": 7,
        "libelle": "Qualité cheminement câbles DC dans chemins de câbles",
        "categorie": "AUDIT_TOITURE",
        "description": "Contrôle de la qualité du cheminement des câbles DC dans les chemins de câbles : fixation adéquate, rayons de courbure respectés, absence de contraintes mécaniques.",
        "reference_normative": "CDC Girasole page 8"
    },
    {
        "item_numero": 8,
        "libelle": "Cheminement câbles (pas directement sur couverture)",
        "categorie": "AUDIT_TOITURE",
        "description": "Vérification que les câbles ne cheminent PAS directement sur la couverture. Utilisation obligatoire de supports adaptés.",
        "reference_normative": "CDC Girasole page 8"
    },
    {
        "item_numero": 9,
        "libelle": "Raccordements terres",
        "categorie": "AUDIT_TOITURE",
        "description": "Contrôle de la qualité du cheminement et du raccordement des terres : continuité électrique, serrage des connexions, utilisation de cosses adaptées.",
        "reference_normative": "CDC Girasole page 8"
    },
    {
        "item_numero": 10,
        "libelle": "Étiquettes réglementaires tension DC",
        "categorie": "AUDIT_TOITURE",
        "description": "Présence et conformité des étiquettes réglementaires indiquant la présence de tension DC dangereuse.",
        "reference_normative": "CDC Girasole page 8 + Réglementation"
    },
    {
        "item_numero": 11,
        "libelle": "Respect notices montage / Interdiction marcher sur panneaux",
        "categorie": "AUDIT_TOITURE",
        "description": "Vérification du respect des notices de montage des panneaux. Contrôle visuel qu'aucune trace de passage sur panneaux n'est visible. INTERDICTION ABSOLUE de marcher sur les panneaux pendant l'audit.",
        "reference_normative": "CDC Girasole §2.2"
    },
    {
        "item_numero": 12,
        "libelle": "Présence de film anticondensation ?",
        "categorie": "AUDIT_TOITURE",
        "description": "Vérification de la présence et de l'état du film anticondensation sous la toiture (pare-vapeur). Contrôle de son intégrité, de son étanchéité et de sa continuité.",
        "reference_normative": "DTU 40.35 + CDC Girasole"
    },
    {
        "item_numero": 13,
        "libelle": "Présence de limaille sous les modules liées au perçage du bac acier pour les supports ? ou points de rouille ou piquage visible ?",
        "categorie": "AUDIT_TOITURE",
        "description": "Contrôle de la présence de limaille métallique sous les panneaux (résidus de perçage du bac acier). Vérification de l'absence de points de rouille, de corrosion ou de piquage visible sur la couverture métallique. Ces défauts peuvent compromettre l'étanchéité et la durabilité de la toiture.",
        "reference_normative": "DTU 40.35 + Prévention corrosion"
    },
    {
        "item_numero": 14,
        "libelle": "Mesurer la distance Modules > Rives / Modules > Faitage",
        "categorie": "AUDIT_TOITURE",
        "description": "Mesure des distances de sécurité entre les modules photovoltaïques et les éléments de toiture : distance modules-rives (bords latéraux de la toiture) et distance modules-faîtage (ligne de crête). Ces distances doivent respecter les normes DTU pour garantir l'étanchéité, la ventilation et la sécurité en cas d'intervention. Mesures en mètres ou centimètres à relever sur site.",
        "reference_normative": "DTU 40.35 + Règles sécurité incendie"
    }
]

def generer_checklist_toiture(mission_id):
    """Génère tous les items de checklist toiture pour une mission"""
    
    sql_inserts = []
    
    for item in TEMPLATE_ITEMS:
        # Échapper les apostrophes pour SQL
        libelle = item['libelle'].replace("'", "''")
        
        # Créer un commentaire avec description + référence normative
        description = item['description'].replace("'", "''")
        reference = item['reference_normative'].replace("'", "''")
        commentaire = f"{description} (Ref: {reference})"
        
        sql = f"""INSERT INTO checklist_items_toiture 
            (ordre_mission_id, item_numero, libelle, categorie, statut, commentaire) 
            VALUES 
            ({mission_id}, {item['item_numero']}, '{libelle}', '{item['categorie']}', 'NON_VERIFIE', '{commentaire}');"""
        
        sql_inserts.append(sql)
    
    return sql_inserts

def main():
    print("🔧 Génération des checklists toiture manquantes...")
    print(f"📋 {len(MISSIONS_SANS_CHECKLIST)} missions à traiter\n")
    
    total_items = 0
    
    for mission_id in MISSIONS_SANS_CHECKLIST:
        print(f"Mission {mission_id}:")
        
        # Générer les inserts SQL
        sql_inserts = generer_checklist_toiture(mission_id)
        
        # Exécuter chaque insert
        for sql in sql_inserts:
            try:
                cmd = [
                    "npx", "wrangler", "d1", "execute", 
                    "girasole-db-production", 
                    "--local",
                    f"--command={sql}"
                ]
                
                result = subprocess.run(
                    cmd, 
                    capture_output=True, 
                    text=True, 
                    cwd="/home/user/webapp"
                )
                
                if result.returncode != 0:
                    print(f"  ❌ Erreur: {result.stderr}")
                    continue
                    
            except Exception as e:
                print(f"  ❌ Exception: {e}")
                continue
        
        total_items += len(sql_inserts)
        print(f"  ✅ {len(sql_inserts)} items créés\n")
    
    print(f"\n✅ TERMINÉ: {total_items} items générés pour {len(MISSIONS_SANS_CHECKLIST)} missions")
    
    # Vérification finale
    print("\n🔍 Vérification post-génération...")
    
    for mission_id in MISSIONS_SANS_CHECKLIST:
        cmd = [
            "npx", "wrangler", "d1", "execute", 
            "girasole-db-production", 
            "--local",
            f"--command=SELECT COUNT(*) as count FROM checklist_items_toiture WHERE ordre_mission_id = {mission_id};"
        ]
        
        result = subprocess.run(cmd, capture_output=True, text=True, cwd="/home/user/webapp")
        
        if result.returncode == 0:
            # Parser la sortie JSON
            try:
                output_lines = result.stdout.split('\n')
                for line in output_lines:
                    if line.strip().startswith('['):
                        data = json.loads(line)
                        count = data[0]['results'][0]['count']
                        status = "✅" if count == 14 else "❌"
                        print(f"  Mission {mission_id}: {status} {count}/14 items")
                        break
            except:
                print(f"  Mission {mission_id}: ⚠️  Impossible de vérifier")

if __name__ == "__main__":
    main()
