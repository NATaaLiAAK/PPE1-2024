#!/bin/bash

# Vérifier si un fichier est passé en argument
if [[ $# -eq 0 ]]; then
    echo "Usage: $0 <chemin_du_fichier>"
    echo "Exemple : $0 ./candide.txt"
    exit 1
fi

fichier="$1"

# Vérifier si le fichier existe
if [[ ! -f "$fichier" ]]; then
    echo "Erreur : Le fichier $fichier n'existe pas."
    exit 1
fi

# Approche 1 : Méthode 1
# Utilisation de cat, tr et grep pour traiter le fichier
#cat "$fichier" \
#    | tr -d '[:punct:]' \
#    | tr '[:upper:]' '[:lower:]' \
#    | grep -oE '\w+'

# Approche 2 : Méthode alternative
# Utilisation de awk, tr et grep pour une variation
awk '{ print tolower($0) }' "$fichier" \
    | tr -d '[:punct:]' \
    | tr ' ' '\n' \
    | grep -v '^$'

# Remarque :
# - Approche 1 utilise `grep -oE` pour isoler les mots.
# - Approche 2 utilise `awk` pour gérer la conversion en minuscules et `tr` pour découper les mots.


# Rendre le script exécutable :
# chmod +x mot_par_ligne.sh

# Lancer le script Bash :
# ./mot_par_ligne.sh ./candide.txt