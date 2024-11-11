# Journal de bord du projet encadré
## Git : mise en pratique

### Exercice 2.a.2 et 2.a.3
J'ai obtenu le message attendu après avoir exécuté la commande _**git status**_ :

```
Sur la branche main
Votre branche est à jour avec 'origin/main'.

rien à valider, la copie de travail est propre
```

> **Note** : Au moment de cet exercice, un fichier journal.md était déjà présent dans mon dépôt Git pour suivre les étapes et observations du projet.

**1.** Après avoir créé mon dépôt avec un dossier `plurital` à la racine du projet, je me suis occupée de l'organisation des fichiers pour donner au projet la structure souhaitée.

  #### PROBLÈME :
        J'ai voulu créer un dossier PPE1-2024 dans le dossier `plurital`, mais je n’étais pas dans le bon répertoire :
```
(myPy) (base) nataliakulikova@MacBook-Pro-de-Natalia plurital % mkdir -p plurital/PPE1-2024
```
> **Note** : L'option `-p` dans la commande `mkdir` signifie "parents". Elle permet de créer toute une structure de dossiers, y compris
> les dossiers parents manquants, sans générer d'erreur si certains dossiers existent déjà.
>       - Si le dossier `plurital` n'existe pas déjà, `mkdir -p` le créera automatiquement avant de créer le dossier `PPE1-2024`.
>       - Si `plurital` existe déjà, `mkdir -p` créera simplement `PPE1-2024` à l'intérieur sans afficher d'erreur.
Cette commande a créé un dossier `plurital` supplémentaire contenant un dossier `PPE1-2024`. J'ai dû corriger cette erreur avec la commande suivante :

  #### SOLUTION :
```
(myPy) (base) nataliakulikova@MacBook-Pro-de-Natalia plurital % rm -rf plurital
```
> **Note** : L'option `-rf` dans la commande `rm` signifie :
>       - `-r` : récursif (pour "recursive") — Supprime le dossier et tout son contenu, y compris les sous-dossiers et fichiers qu’il contient.
>       - `-f` : forcé (pour "force") — Force la suppression sans demander de confirmation, même si les fichiers sont protégés en écriture.

Ensuite, j'ai créé le dossier `PPE1-2024` directement dans le dossier `plurital` qui est devenue ma copie locale du dépôt git en ligne :
```
mkdir PPE1-2024
```
Puis, j'ai déplacé les fichiers clonés vers `PPE1-2024` :
```
mv license readme.md PPE1-2024/
```
Puis, j'ai exécuté les commandes suivantes :
```
cd PPE1-2024
```
et
```
git status
```
  #### PROBLÈME :
J'ai vu un message qui signifie que certains fichiers ont été supprimés (../LICENSE et ../README.md) et qu’un fichier .DS_Store (généré par macOS) est non suivi.

  #### SOLUTION :
Pour que `git status` affiche "nothing to commit, working tree clean", j'ai suivi ces étapes :

**1.** Supprimer les fichiers de leur emplacement d'origine en utilisant `git rm` pour que Git enregistre leur suppression :
```
(myPy) (base) nataliakulikova@MacBook-Pro-de-Natalia PPE1-2024 % git rm ../LICENSE ../README.md
```
- Les deux points (..) dans `git rm ../LICENSE ../README.md` indiquent que les fichiers LICENSE et README.md sont situés dans le dossier parent du répertoire actuel. Si ma structure de dossiers est la suivante :
```
projet/
├── plurital/
│   └── PPE1-2024/
│       ├── LICENSE
│       └── README.md
└── LICENSE
└── README.md
```

**2.** Revenir au dossier parent et vérifier son contenu pour m’assurer que les fichiers sont bien supprimés :
```
cd ..
```
```
(myPy) (base) nataliakulikova@MacBook-Pro-de-Natalia plurital % ls PPE1-2024
```

**3.** Ajouter les fichiers à leur nouvel emplacement dans le dossier `PPE1-2024` :
```
git add PPE1-2024/LICENSE PPE1-2024/README.md
```

**4.** Faire un commit pour enregistrer ces changements dans Git :
```
git commit -m "Déplacement des fichiers LICENSE et README.md dans le dossier PPE1-2024"
```

**5.** Ajout de `.DS_Store` à `.gitignore` :
```
(myPy) (base) nataliakulikova@MacBook-Pro-de-Natalia plurital % echo ".DS_Store" >> .gitignore
```
Cela ajoutera `.DS_Store` au fichier `.gitignore` de manière à ignorer ces fichiers dans tout le projet, y compris dans les sous-dossiers comme `PPE1-2024`.

> **Note** :
>                - `echo` est une commande qui affiche du texte dans le terminal.
>                - Ici, elle affiche la chaîne de texte `.DS_Store`.
>                - Le texte `.DS_Store` est le nom du fichier que je souhaite ignorer. Sur macOS, `.DS_Store` est un fichier système caché que     >                   macOS crée automatiquement dans chaque dossier pour stocker des informations de mise en page.
>                - `>>` est un opérateur de redirection utilisé pour ajouter (ou "append") du texte à la fin d'un fichier sans écraser son contenu >                   existant.
>                - Dans ce cas, `.gitignore` est le fichier dans lequel j'ajoute la ligne `.DS_Store`.
>                - Si `.gitignore` n'existe pas, cette commande va le créer automatiquement à cet emplacement et y ajouter `.DS_Store` comme      >                  première ligne.

**6.** Ajout du fichier `.gitignore` à l'index de Git :
```
git add .gitignore
```

**7.** Commit du changement :
```
git commit -m "Ajout de .DS_Store à .gitignore"
```

**8.** Vérification de l'état de Git :
```
git status
```
- Résultat de `git status` :
  ```
  Sur la branche main
  Votre branche est en avance sur 'origin/main' de 2 commits.
  (utilisez "git push" pour publier vos commits locaux)
  ```
- Cela signifie que ma branche locale contient deux commits qui n'ont pas encore été poussés sur le dépôt distant (origin/main).

- Fichiers non suivis :
  ```
  Fichiers non suivis:
  (utilisez "git add <fichier>..." pour inclure dans ce qui sera validé)
          PPE1-2024/
  ```
  
**9.** Ajouter le dossier `PPE1-2024/` au suivi de Git.
La ligne indiquant qu'il y a des "fichiers non suivis" signifie que j'ai un répertoire appelé PPE1-2024/ qui n'est pas encore ajouté au suivi de Git. Pour suivre ce dossier, j'ai utilisé la commande suivante :
```
(myPy) (base) nataliakulikova@MacBook-Pro-de-Natalia plurital % git add PPE1-2024/
```

**10.** Valider le changement :
```
git commit -m "Ajout des fichiers dans le dossier PPE1-2024"
```

**11.** Envoyer tous les nouveaux commits :
```
git push
```
- J'ai reçu un message d’erreur qui indique que le dépôt distant contient des commits que je n’ai pas encore récupérés localement, ce qui empêche mon `git push` de réussir. Cela s'est produit parce que j'ai effectué des changements sur GitHub directement (modification du journal.md).


**12.**
```
git pull origin main
```

**13.**
```
git pull --no-rebase origin main
```

**14.**
```
git push origin main
```

**15.**
```
git status
```
```
Sur la branche main
Votre branche est à jour avec 'origin/main'.

rien à valider, la copie de travail est propre
```








