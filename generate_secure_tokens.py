#!/usr/bin/env python3
"""
GIRASOLE - Génération tokens d'accès sécurisés
Version: 2.5.0
Date: 28/11/2024
"""

import secrets
import json
from datetime import datetime

def generate_secure_token(length=32):
    """Génère un token sécurisé de 32 caractères aléatoires"""
    return secrets.token_urlsafe(length)[:length]

def create_access_tokens():
    """Crée 8 tokens sécurisés (1 admin + 7 sous-traitants)"""
    
    tokens = []
    
    # 1. Token ADMIN (Adrien)
    admin_token = {
        'id': 1,
        'token': generate_secure_token(),
        'nom': 'Adrien PAPPALARDO',
        'role': 'ADMIN',
        'sous_traitant_id': None,
        'description': 'Accès complet - Toutes centrales - Gestion sous-traitants'
    }
    tokens.append(admin_token)
    
    # 2. Tokens SOUS-TRAITANTS (7 réels)
    sous_traitants = [
        {'id': 3, 'nom': 'ARTEMIS', 'contact': 'LOIC'},
        {'id': 4, 'nom': 'CADENET', 'contact': 'Départements 26,7,3,71'},
        {'id': 7, 'nom': 'COURTIADE DISTRIB', 'contact': 'Gascogne Nouvelles Energies'},
        {'id': 5, 'nom': 'DIAGPV - Adrien & Fabien', 'contact': 'Adrien'},
        {'id': 8, 'nom': 'DRONE AVEYRON SERVICE', 'contact': 'Dept 12'},
        {'id': 6, 'nom': 'EDOUARD - Martial', 'contact': 'Martial Edouard'},
        {'id': 9, 'nom': 'En attente attribution', 'contact': 'Dept 23 (Creuse)'}
    ]
    
    for idx, st in enumerate(sous_traitants, start=2):
        token_st = {
            'id': idx,
            'token': generate_secure_token(),
            'nom': st['nom'],
            'role': 'SOUS_TRAITANT',
            'sous_traitant_id': st['id'],
            'description': f"Accès restreint - Uniquement centrales attribuées à {st['nom']}"
        }
        tokens.append(token_st)
    
    return tokens

def generate_sql_script(tokens):
    """Génère le script SQL d'insertion"""
    
    sql_lines = [
        "-- GIRASOLE - Régénération tokens sécurisés",
        "-- Version: 2.5.0",
        f"-- Date: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}",
        "",
        "-- Suppression tokens non sécurisés",
        "DELETE FROM access_tokens;",
        "",
        "-- Insertion nouveaux tokens sécurisés",
    ]
    
    for token in tokens:
        st_id = token['sous_traitant_id']
        st_id_sql = f"'{st_id}'" if st_id else "NULL"
        
        sql = f"""INSERT INTO access_tokens (id, token, nom, role, sous_traitant_id, statut, date_creation)
VALUES ({token['id']}, '{token['token']}', '{token['nom']}', '{token['role']}', {st_id_sql}, 'ACTIF', CURRENT_TIMESTAMP);"""
        sql_lines.append(sql)
    
    return "\n".join(sql_lines)

def generate_urls_document(tokens):
    """Génère le document des URLs pour Adrien"""
    
    base_url = "https://girasole-diagpv.pages.dev/s"
    
    doc_lines = [
        "# 🔐 GIRASOLE - URLs d'accès sécurisées",
        "",
        f"**Date de génération :** {datetime.now().strftime('%d/%m/%Y %H:%M')}",
        "**Version :** 2.5.0",
        "",
        "---",
        "",
        "## 🔑 URL ADMIN (Adrien PAPPALARDO)",
        "",
    ]
    
    # URL Admin
    admin = tokens[0]
    doc_lines.append(f"**Accès complet (toutes centrales + gestion) :**")
    doc_lines.append(f"```")
    doc_lines.append(f"{base_url}/{admin['token']}")
    doc_lines.append(f"```")
    doc_lines.append("")
    doc_lines.append("---")
    doc_lines.append("")
    doc_lines.append("## 👷 URLs SOUS-TRAITANTS (accès restreint)")
    doc_lines.append("")
    
    # URLs Sous-traitants
    for token in tokens[1:]:
        doc_lines.append(f"### {token['nom']}")
        doc_lines.append(f"**Accès uniquement aux centrales attribuées :**")
        doc_lines.append(f"```")
        doc_lines.append(f"{base_url}/{token['token']}")
        doc_lines.append(f"```")
        doc_lines.append("")
    
    doc_lines.append("---")
    doc_lines.append("")
    doc_lines.append("## ⚠️ Consignes de sécurité")
    doc_lines.append("")
    doc_lines.append("1. **Ne JAMAIS partager l'URL ADMIN** (réservée à Adrien)")
    doc_lines.append("2. **1 URL = 1 sous-traitant** (envoyer uniquement par email sécurisé)")
    doc_lines.append("3. **URLs valides indéfiniment** (pas d'expiration)")
    doc_lines.append("4. **Révocation possible** (si URL compromise → me contacter)")
    doc_lines.append("5. **Accès lecture seule** pour ST (pas de suppression)")
    doc_lines.append("")
    doc_lines.append("## 🔒 Sécurité")
    doc_lines.append("")
    doc_lines.append("- **Tokens :** 32 caractères aléatoires (impossible à deviner)")
    doc_lines.append("- **Isolation :** Chaque ST voit uniquement ses centrales")
    doc_lines.append("- **Traçabilité :** Toutes les actions sont loggées")
    doc_lines.append("- **Protection :** Impossible de modifier les centrales d'un autre ST")
    doc_lines.append("")
    
    return "\n".join(doc_lines)

# Exécution
if __name__ == "__main__":
    print("🔐 Génération tokens sécurisés GIRASOLE...")
    
    # Générer tokens
    tokens = create_access_tokens()
    
    # Sauvegarder JSON
    with open('tokens_generated.json', 'w', encoding='utf-8') as f:
        json.dump(tokens, f, indent=2, ensure_ascii=False)
    print(f"✅ tokens_generated.json créé ({len(tokens)} tokens)")
    
    # Générer SQL
    sql_script = generate_sql_script(tokens)
    with open('insert_secure_tokens.sql', 'w', encoding='utf-8') as f:
        f.write(sql_script)
    print("✅ insert_secure_tokens.sql créé")
    
    # Générer document URLs
    urls_doc = generate_urls_document(tokens)
    with open('URLS_ACCES_SECURISES.md', 'w', encoding='utf-8') as f:
        f.write(urls_doc)
    print("✅ URLS_ACCES_SECURISES.md créé")
    
    print("\n" + "="*60)
    print("📊 RÉSUMÉ")
    print("="*60)
    print(f"Total tokens générés : {len(tokens)}")
    print(f"  - ADMIN          : 1")
    print(f"  - SOUS_TRAITANTS : 7")
    print("\n🔐 Longueur tokens : 32 caractères (cryptographiquement sécurisés)")
    print("\n📁 Fichiers créés :")
    print("  1. tokens_generated.json      (données complètes)")
    print("  2. insert_secure_tokens.sql   (script base de données)")
    print("  3. URLS_ACCES_SECURISES.md    (document URLs pour Adrien)")
    print("\n✅ Prêt pour application en base de données !")
