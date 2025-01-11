#!/bin/bash

# Vérifier si un fichier est passé en argument
if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <chemin_du_fichier> [nombre_de_bigrammes]"
    echo "Exemple : $0 ./candide.txt 10"
    exit 1
fi

fichier="$1"
nombre_bigrammes="${2:-25}" # Par défaut, affiche les 25 bigrammes les plus fréquents

# Vérifier si le fichier existe
if [[ ! -f "$fichier" ]]; then
    echo "Erreur : Le fichier $fichier n'existe pas."
    exit 1
fi

# Vérifier que le nombre de bigrammes est un entier positif
if ! [[ "$nombre_bigrammes" =~ ^[0-9]+$ ]]; then
    echo "Erreur : Le second argument doit être un entier positif."
    exit 1
fi

# Nettoyer le texte et obtenir une liste de mots (via le script mot_par_ligne.sh)
mots=$(./mot_par_ligne.sh "$fichier")

if [[ $? -ne 0 ]]; then
    echo "Erreur : Impossible de traiter le fichier avec mot_par_ligne.sh."
    exit 1
fi

# Générer les bigrammes à partir de la liste de mots
# 1. Créer deux colonnes décalées contenant les mots consécutifs.
#    - La commande `paste -d ' ' - -` prend deux flux d'entrée (la liste de mots dans ce cas)
#      et les combine par paire en une seule ligne, séparée par un espace.
#    - Le `-` indique que les colonnes viennent du même flux d'entrée, mais elles sont décalées.
# 2. Coller les colonnes pour obtenir les bigrammes
bigrammes=$(echo "$mots" | paste -d ' ' - -)

# Compter les bigrammes et trier par fréquence
# 1. `sort` : Trie les bigrammes par ordre alphabétique.
# 2. `uniq -c` : Compte les occurrences de chaque bigramme unique.
#    - Chaque ligne contient maintenant un nombre suivi du bigramme correspondant.
# 3. `sort -nr` : Trie les lignes par fréquence (numérique) dans l'ordre décroissant.
# 4. `head -n "$nombre_bigrammes"` : Affiche uniquement les n premiers résultats,
#    où n est spécifié par l'utilisateur ou défini par défaut à 25.
echo "$bigrammes" | sort | uniq -c | sort -nr | head -n "$nombre_bigrammes"


# Rendre le script exécutable :
# chmod +x bigrammes_frequents.sh

# Exemple d’utilisation :
# ./bigrammes_frequents.sh ./candide.txt
# Par défaut, affiche les 25 bigrammes les plus fréquents.

# Pour afficher les 10 bigrammes les plus fréquents :
# ./bigrammes_frequents.sh ./candide.txt 10
