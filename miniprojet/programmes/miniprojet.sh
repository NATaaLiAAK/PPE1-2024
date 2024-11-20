#!/usr/bin/env bash

# Vérifier si le fichier des URLs est fourni en argument
if [ -z "$1" ]; then
    echo "Erreur : Veuillez fournir un fichier d'URL en argument."
    exit 1
fi

# Vérifier que le fichier existe
if [ ! -f "$1" ]; then
    echo "Erreur : Le fichier '$1' n'existe pas."
    exit 1
fi

# Chemin du fichier HTML de sortie
output_file="tableaux/tableau-fr.html"
mkdir -p tableaux

# En-tête HTML avec styles CSS
echo "<!DOCTYPE html>
<html>
<head>
    <meta charset='UTF-8'> <!-- Définit l'encodage de la page en UTF-8 -->
    <title>Tableau des URLs</title>
    <style>
        /* Styles appliqués au corps de la page */
        body {
            font-family: Arial, sans-serif; /* Police claire et standard */
            margin: 20px; /* Espacement autour du contenu */
            background-color: #f9f9f9; /* Couleur de fond gris clair pour un aspect doux */
            color: #333; /* Texte en gris foncé pour un bon contraste */
        }

        /* Styles pour le titre principal (h1) */
        h1 {
            text-align: center; /* Titre centré */
            color: #ed286d; /* Couleur rose vif pour attirer l'attention */
        }

        /* Styles pour la table */
        table {
            width: 100%; /* Table sur toute la largeur */
            border-collapse: collapse; /* Fusionne les bordures adjacentes */
            margin: 20px 0; /* Espace vertical autour de la table */
            font-size: 18px; /* Taille de texte confortable */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Ajoute une ombre légère pour un effet de profondeur */
        }

        /* Styles appliqués aux cellules des en-têtes (th) et du contenu (td) */
        th, td {
            border: 1px solid #ddd; /* Bordure grise autour de chaque cellule */
            padding: 12px; /* Espacement interne pour rendre le contenu plus lisible */
            text-align: center; /* Contenu centré */
        }

        /* Styles spécifiques aux en-têtes de colonnes */
        th {
            background-color: #ed286d; /* Fond rose pour démarquer les en-têtes */
            color: white; /* Texte blanc pour contraster avec le fond */
        }

        /* Styles pour les lignes paires du tableau */
        tr:nth-child(even) {
            background-color: #f2f2f2; /* Fond gris clair pour une alternance visuelle */
        }

        /* Styles pour l'effet au survol des lignes */
        tr:hover {
            background-color: #ddd; /* Fond gris plus foncé lorsqu'une ligne est survolée pour améliorer la lisibilité et l'esthétique */
        }

        /* Styles pour les liens hypertexte dans les cellules */
        td a {
            color: #2196F3; /* Bleu standard pour les liens */
            text-decoration: none; /* Supprime le soulignement par défaut */
        }

        /* Style des liens lorsqu'ils sont survolés */
        td a:hover {
            text-decoration: underline; /* Ajoute un soulignement au survol pour indiquer une interaction */
        }
    </style>
</head>
<body>
    <!-- Titre principal de la page -->
    <h1>Tableau des données récupérées</h1>
    <!-- Début du tableau -->
    <table>
        <thead>
            <tr>
                <th>Numéro</th> <!-- Numéro de la ligne -->
                <th>Nom du Site</th> <!-- Nom extrait de l'URL -->
                <th>URL</th> <!-- Adresse URL -->
                <th>Code HTTP</th> <!-- Statut HTTP -->
                <th>Encodage</th> <!-- Type d'encodage de la page -->
                <th>Nombre de mots</th> <!-- Nombre total de mots sur la page -->
            </tr>
        </thead>
        <tbody>" > "$output_file" # Écrit la partie initiale du fichier HTML

# Lire le fichier d'URLs et extraire les données
num=1
while IFS= read -r url; do
    if [[ "$url" =~ ^https?:// ]]; then
        # Extraction du nom du site à partir de l'URL
        site_name=$(echo "$url" | awk -F[/:] '{print $4}' | sed 's/^www\.//')

        # Récupération du code HTTP
        http_code=$(curl -o /dev/null -s -w "%{http_code}" "$url" || echo "000")

        # Vérifie si l'URL est atteignable
        if [ "$http_code" -eq "000" ]; then
            echo "URL inaccessible : $url"
            encoding="N/A"
            word_count="N/A"
        else
            # Extraction de l'encodage
            encoding=$(curl -sI "$url" | grep -i "Content-Type" | grep -o "charset=[^;]*" | cut -d= -f2)
            encoding=${encoding:-"N/A"} # Valeur par défaut si l'encodage est introuvable

            # Calcul du nombre de mots dans le contenu de la page
            word_count=$(curl -s "$url" | wc -w)
        fi

        # Ajouter une ligne au tableau HTML
        echo "            <tr>
                <td>${num}</td> <!-- Numéro de la ligne -->
                <td>${site_name}</td> <!-- Nom du site -->
                <td><a href=\"$url\">$url</a></td> <!-- URL cliquable -->
                <td>${http_code}</td> <!-- Code HTTP -->
                <td>${encoding}</td> <!-- Encodage -->
                <td>${word_count}</td> <!-- Nombre de mots -->
            </tr>" >> "$output_file"
        ((num++)) # Incrémentation du numéro de ligne
    else
        echo "URL invalide ou ligne vide ignorée : $url"
    fi
done < "$1"

# Fermer le tableau HTML
echo "        </tbody>
    </table>
</body>
</html>" >> "$output_file" # Écrit la fin du fichier HTML

# Message de succès
echo "Le fichier HTML a été généré : $output_file"

