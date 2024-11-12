#!/usr/bin/env bash

# Vérification de l'argument
if [ "$#" -ne 1 ]; then
    echo "Erreur : Veuillez fournir le chemin du fichier d'URLs en argument."
    exit 1
fi

# Fichier d'URLs
fichier="$1"

# Vérifier si le fichier existe et est lisible
if [ ! -f "$fichier" ] || [ ! -r "$fichier" ]; then
    echo "Erreur : Le fichier $fichier n'existe pas ou n'est pas lisible."
    exit 1
fi

# Dossier de sortie
dossier_sortie="tableaux"

# Créer le dossier "tableaux" s'il n'existe pas
mkdir -p "$dossier_sortie"

# Fichier de sortie dans le dossier "tableaux"
output="${dossier_sortie}/tableau-fr.tsv"

# Écrire l'en-tête dans le fichier de sortie
echo -e "Numéro de ligne\tURL\tCode HTTP\tEncodage\tNombre de mots\tTexte" > "$output"

# Lecture ligne par ligne du fichier d'URLs
ligne_num=1
while read -r url; do
    # Vérifier si l'URL commence par "http" pour s'assurer de sa validité
    if [[ "$url" =~ ^http ]]; then
        # Récupération du code HTTP et encodage avec `curl`
        http_code=$(curl -o /dev/null -s -w "%{http_code}" "$url")
        encodage=$(curl -sI "$url" | grep -i "Content-Type" | grep -o "charset=[^;]*" | cut -d= -f2)

        # Vérification du succès de la requête HTTP (code 200)
        if [ "$http_code" -eq 200 ]; then
            # Récupération du contenu de la page pour l'analyse
            contenu=$(curl -s "$url")

            # Extraction du nombre de mots dans la page
            nombre_mots=$(echo "$contenu" | wc -w)

            # Si l'encodage est UTF-8, extraire le texte de la page
            if [ "$encodage" == "utf-8" ] || [ "$encodage" == "UTF-8" ]; then
                # Extraction du texte HTML avec python3 et html2text
                texte=$(echo "$contenu" | python3 -c "import html2text, sys; print(html2text.html2text(sys.stdin.read()))")
                echo -e "${ligne_num}\t${url}\t${http_code}\t${encodage}\t${nombre_mots}\t${texte}" >> "$output"
            else
                echo -e "${ligne_num}\t${url}\t${http_code}\t${encodage}\t${nombre_mots}\tEncodage différent de UTF-8" >> "$output"
            fi
        else
            echo -e "${ligne_num}\t${url}\t${http_code}\tErreur lors de la récupération" >> "$output"
        fi
    else
        echo -e "${ligne_num}\t${url}\tURL non valide" >> "$output"
    fi
    ligne_num=$((ligne_num + 1))
done < "$fichier"
