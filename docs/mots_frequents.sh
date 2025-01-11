#!/bin/bash

# Vérifier si un fichier est passé en argument
if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <chemin_du_fichier> [nombre_de_mots]"
    echo "Exemple : $0 ./candide.txt 10"
    exit 1
fi

fichier="$1"
nombre_mots="${2:-25}" # Par défaut, affiche les 25 mots les plus fréquents

# Vérifier si le fichier existe
if [[ ! -f "$fichier" ]]; then
    echo "Erreur : Le fichier $fichier n'existe pas."
    exit 1
fi

# Vérifier que le nombre de mots est un entier positif
if ! [[ "$nombre_mots" =~ ^[0-9]+$ ]]; then
    echo "Erreur : Le second argument doit être un entier positif."
    exit 1
fi

# Appeler le script mot_par_ligne.sh pour traiter le fichier et obtenir les mots
mots=$(./mot_par_ligne.sh "$fichier")

if [[ $? -ne 0 ]]; then
    echo "Erreur : Impossible de traiter le fichier avec mot_par_ligne.sh."
    exit 1
fi

# Compter les mots et trier par fréquence
echo "$mots" | sort | uniq -c | sort -nr | head -n "$nombre_mots"


# Rendre le script exécutable :
# chmod +x mots_frequents.sh

# Exemple d’utilisation :
# Ce script analyse un fichier texte pour trouver les mots les plus fréquents.
# Par défaut, il affiche les 25 mots les plus fréquents.

# Lancer le script avec un fichier texte et un nombre optionnel de mots :
# Par défaut, affiche les 25 mots les plus fréquents :
# ./mots_frequents.sh ./candide.txt

# fichier = ./candide.txt
# nombre_mots = 25 (valeur par défaut)
# ________________________________________________________________________
# Pour afficher les 10 mots les plus fréquents :
# ./mots_frequents.sh ./candide.txt 10

# fichier = ./candide.txt
# nombre_mots = 10



# -------------------------------------------------------------------------

# Approche alternative :
# Ci-dessous, une autre version du script pour comparaison.
# Celle-ci vérifie directement si un second argument est fourni
# et utilise une méthode légèrement différente pour gérer les cas par défaut.

# #!/bin/bash
#
# fichier=$1
# nombre_de_mot=$2
#
# if [[ ! -f $fichier ]]; then
#     echo "Le fichier $fichier n'existe pas."
#     exit 1
# fi
#
# if [ -z "$nombre_de_mot" ]; then
#     # Si aucun second argument, affiche les 25 mots les plus fréquents
#     ./mot_par_ligne.sh "$fichier" | sort | uniq -c | sort -n | tail -n 25
# else
#     # Sinon, affiche le nombre demandé par l'utilisateur
#     ./mot_par_ligne.sh "$fichier" | sort | uniq -c | sort -n | tail -n "$nombre_de_mot"
# fi