# Journal de bord du projet encadré
## Git : mise en pratique

### Exercices 2.a.2 et 2.a.3
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
>       + Si le dossier `plurital` n'existe pas déjà, `mkdir -p` le créera automatiquement avant de créer le dossier `PPE1-2024`.
>       + Si `plurital` existe déjà, `mkdir -p` créera simplement `PPE1-2024` à l'intérieur sans afficher d'erreur.
Cette commande a créé un dossier `plurital` supplémentaire contenant un dossier `PPE1-2024`. J'ai dû corriger cette erreur avec la commande suivante :

  #### SOLUTION :
```
(myPy) (base) nataliakulikova@MacBook-Pro-de-Natalia plurital % rm -rf plurital
```
> **Note** : L'option `-rf` dans la commande `rm` signifie :
>       + `-r` : récursif (pour "recursive") — Supprime le dossier et tout son contenu, y compris les sous-dossiers et fichiers qu’il contient.
>       + `-f` : forcé (pour "force") — Force la suppression sans demander de confirmation, même si les fichiers sont protégés en écriture.

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

### Exercice 2.d
**5.** Ajout de `.DS_Store` à `.gitignore` :
```
(myPy) (base) nataliakulikova@MacBook-Pro-de-Natalia plurital % echo ".DS_Store" >> .gitignore
```
Cela ajoutera `.DS_Store` au fichier `.gitignore` de manière à ignorer ces fichiers dans tout le projet, y compris dans les sous-dossiers comme `PPE1-2024`.

> **Note** :
>                + `echo` est une commande qui affiche du texte dans le terminal.
>                + Ici, elle affiche la chaîne de texte `.DS_Store`.
>                + Le texte `.DS_Store` est le nom du fichier que je souhaite ignorer. Sur macOS, `.DS_Store` est un fichier système caché que     >                   macOS crée automatiquement dans chaque dossier pour stocker des informations de mise en page.
>                + `>>` est un opérateur de redirection utilisé pour ajouter (ou "append") du texte à la fin d'un fichier sans écraser son contenu >                   existant.
>                + Dans ce cas, `.gitignore` est le fichier dans lequel j'ajoute la ligne `.DS_Store`.
>                + Si `.gitignore` n'existe pas, cette commande va le créer automatiquement à cet emplacement et y ajouter `.DS_Store` comme première ligne.

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
- Cette commande récupère les commits et modifications qui se trouvent sur la branche `main` du dépôt distant (ici, `origin`) et les fusionne dans ma branche locale `main`.
- Cela me permet de mettre à jour mon dépôt local avec les modifications effectuées directement sur GitHub. 

**13.**
```
git pull --no-rebase origin main
```
- Cette commande est une variante de la précédente, mais sans la réorganisation (rebase) des commits locaux par rapport aux commits distants.
- Utiliser `--no-rebase` garantit que les commits distants sont simplement fusionnés dans mon historique local tel quel, sans modifier l’ordre ou l’historique des commits. Cela peut être utile pour éviter les conflits ou réorganisations inattendues.

**14.**
```
git push origin main
```
- Une fois que les commits distants ont été récupérés et fusionnés dans ma branche locale, cette commande renvoie maintenant tous les nouveaux commits (ceux faits localement et après la fusion des commits distants) vers le dépôt distant.
- Cette étape devrait fonctionner sans problème maintenant, car mon dépôt local est synchronisé avec le dépôt distant.

**15.**
```
git status
```
- Cette commande permet de vérifier l'état actuel de la branche. Le message de sortie confirme que ma branche locale `main` est maintenant à jour avec `origin/main` et qu'il n'y a rien à valider.

Voici le message attendu pour l'exercice 2 :
```
Sur la branche main
Votre branche est à jour avec 'origin/main'.

rien à valider, la copie de travail est propre
```

____________________________________________________________________
J'ai également effectué d'autres modifications prévues pour être supprimées ultérieurement :

**1.**
```
mv journal.md PPE1-2024/
```
+ Cette commande déplace le fichier `journal.md` depuis son emplacement actuel vers le dossier `PPE1-2024/`.
+ Cette opération est effectuée en dehors de Git pour déplacer physiquement le fichier dans le système de fichiers.

**2.**
```
git add PPE1-2024/journal.md
```
+ En ajoutant le fichier déplacé avec `git add`, j’indique à Git de suivre le nouveau chemin (`PPE1-2024/journal.md`).
+ Cela prépare le fichier pour le prochain commit avec son nouvel emplacement.

**3.** 
```
git rm --cached journal.md
```
+ Cette commande supprime le fichier `journal.md` de l'index Git (la zone de staging), mais sans le supprimer physiquement du système de fichiers car il a été déplacé.
+ Cela indique à Git que `journal.md` n'existe plus à son ancien emplacement (à la racine) et que le nouveau chemin est dans `PPE1-2024/`.

**4.** 
```
git commit -m "Déplacement de journal.md dans le dossier PPE1-2024"
```
+ Ce commit enregistre le déplacement du fichier avec un message explicatif.
+ Le message "Déplacement de journal.md dans le dossier PPE1-2024" décrit l'action effectuée, et Git enregistre le déplacement comme une modification.

Résultat du commit :
```
[main 61d02d6] Déplacement de journal.md dans le dossier PPE1-2024
1 file changed, 0 insertions(+), 0 deletions(-)
rename journal.md => PPE1-2024/journal.md (100%)
```
+ Git indique que le fichier `journal.md` a été déplacé avec succès (le "rename" de `journal.md` vers `PPE1-2024/journal.md` est noté avec un taux de similarité de 100 %).
+ Il n'y a aucune modification du contenu du fichier, seulement un changement de chemin.

**5.** 
```
git push origin main
```
+ Cette commande envoie le commit contenant le déplacement du fichier vers le dépôt distant sur la branche `main`.
+ Les messages de progression indiquent que l’opération s’est bien déroulée, que les objets sont bien compressés et envoyés sans erreur vers GitHub.

Résultat :
```
To github.com:NATaaLiAAK/PPE1-2024.git
8f0d77f..61d02d6  main -> main
```
+ Le commit local 61d02d6 a été poussé sur la branche main du dépôt distant, mettant à jour l'état de la branche distante avec les nouvelles modifications.

**6.**
```
git status
```
+ Enfin, cette commande vérifie l’état actuel du dépôt.
+ Le message de retour confirme que ma branche locale main est bien synchronisée avec origin/main et qu'il n'y a plus de modifications en attente.

En résumé, j’ai déplacé `journal.md` dans le dossier `PPE1-2024/`, mis à jour Git pour qu'il suive ce nouveau chemin, validé la modification et synchronisé le dépôt local avec le dépôt distant. Tout est propre et synchronisé !

____________________________________________________________________
Ensuite, j'ai décidé de tout déplacer vers la racine du projet :

**1.**
```
mv PPE1-2024/license .
```
+ Cette commande déplace le fichier `license` depuis le dossier `PPE1-2024` vers la racine du projet (`.`).

**2.**
```
mv PPE1-2024/readme.md .
```
+ Le fichier `readme.md` est déplacé de `PPE1-2024` vers la racine du projet.

**3.**
```
mv PPE1-2024/journal.md .
```
+ Le fichier `journal.md` est aussi déplacé de `PPE1-2024` vers la racine.
+ Tous les fichiers principaux sont désormais à la racine du projet.

**4.**
```
git add LICENSE README.md journal.md
```
+ Cette commande ajoute les fichiers déplacés à la zone de staging de Git en utilisant leurs nouveaux emplacements (la racine).
+ En ajoutant ces fichiers, Git est préparé pour les inclure dans le prochain commit en tenant compte de leurs nouveaux chemins.

**5.**
```
git rm PPE1-2024/license PPE1-2024/readme.md PPE1-2024/journal.md
```
+ Cette commande indique à Git de supprimer les fichiers `license`, `readme.md`, et `journal.md` de leurs anciens emplacements dans `PPE1-2024`.
+ Git enregistre la suppression des anciennes versions de ces fichiers pour refléter le changement de leur emplacement.

Résultat :
```
rm 'PPE1-2024/journal.md'
rm 'PPE1-2024/license'
rm 'PPE1-2024/readme.md'
```
+ Git confirme la suppression des fichiers de leurs anciens emplacements.

**6.**
```
git commit -m "Déplacement des fichiers LICENSE, README.md, et journal.md à la racine du projet"
```
+ Cette commande crée un commit avec le message "Déplacement des fichiers LICENSE, README.md, et journal.md à la racine du projet".
+ Le commit enregistre le déplacement des fichiers pour que l’historique Git reflète ce changement.

Résultat du commit :
```
[main e90f900] Déplacement des fichiers LICENSE, README.md, et journal.md à la racine du projet
3 files changed, 203 deletions(-)
delete mode 100644 PPE1-2024/license
delete mode 100644 PPE1-2024/readme.md
rename PPE1-2024/journal.md => journal.md (100%)
```
+ Git confirme que les fichiers ont été déplacés avec succès.
+ La suppression de 203 lignes correspond au contenu des fichiers supprimés de `PPE1-2024`.

**7.**
```
git push origin main
```
+ Cette commande envoie le commit vers le dépôt distant sur la branche `main`.
+ Cela synchronise le dépôt distant avec les nouvelles modifications, y compris le déplacement des fichiers.

Résultat :
```
To github.com:NATaaLiAAK/PPE1-2024.git
61d02d6..e90f900  main -> main
```
+ Le commit `e90f900` a été poussé avec succès, et le dépôt distant est maintenant à jour.

***Résumé*** :
Ces commandes déplacent les fichiers `LICENSE`, `README.md`, et `journal.md` du dossier `PPE1-2024` vers la racine du projet, puis enregistrent et synchronisent ces modifications avec le dépôt distant sur GitHub.


### Exercices 2.b et 2.c

**1.** Pour vérifier si mon dépôt local est en retard par rapport à la version en ligne sur GitHub, j'ai utilisé la commande suivante :
```
git fetch
```
+ `git fetch` : Cette commande récupère les informations les plus récentes du dépôt distant (GitHub) sans les fusionner dans ma branche locale. Cela met à jour l’état de la branche distante.

**2.**
```
git status
```
+ `git status` : Après `git fetch`, cette commande me dira si ma branche locale est "en retard" par rapport à `origin/main` (ou une autre branche distante) et indiquera le nombre de commits de différence.

Résultat :
```
Sur la branche main
Votre branche est en retard sur 'origin/main' de 4 commits, et peut être mise à jour en avance rapide.
  (utilisez "git pull" pour mettre à jour votre branche locale)

rien à valider, la copie de travail est propre
```
+ Git m'indique que la mise à jour peut se faire en avance rapide (fast-forward), ce qui signifie qu’il n’y a pas de conflit ni de fusion complexe. Ma branche locale va simplement avancer de 4 commits pour se synchroniser avec origin/main.

Il suffit d’utiliser la commande simple :
**3.**
```
git pull
```

**4.**
```
git log
```
+ Je lance la commande `git log` pour voir mon dernier commit :
```
commit ab1d65a80de39d227475ff784190f6c4e134b20b
```

**5.**
```
git status
```
+ Pour confirmer l’état actuel, j'ai utilisé `git status`.
+ `git status` affiche "Votre branche est à jour avec 'origin/main'", ce qui confirme que ma branche locale est bien synchronisée.

____________________________________________________________________

+ Après avoir modifié le fichier `journal.md` sur ma machine (localement), je relance la commande `git status` pour m'assurer que git détecte bien les modifications. Je dois maintenant utiliser les commandes suivantes pour ajouter mes modifications à mon dépôt Git :
**1.** Ajouter les modifications à l’index de Git :
```
git add journal.md
```

**2.** Créer un commit pour enregistrer les modifications :
```
git commit -m "Mise à jour de journal.md avec les dernières modifications"
```

**3.** Envoyer le commit vers le dépôt distant (GitHub) :
```
git push origin main
```

### Exercice 3
#### Création d'un tag sur mon dernier commit

J'ai créé un tag nommé "séance2", que j'ai ensuite poussé avec le message "version finie séance 2".

**1.**
```
git tag -a séance2 -m "version finie séance 2"
```

**2.** Vérifier que le tag a été créé :
```
git tag -l
```

**3.** Pousser le tag vers le dépôt distant :
```
git push origin séance2
```


## Miniprojet
### Exercices 1 et 2

**1.** Pourquoi ne pas utiliser `cat` ?

Utiliser `cat` pour lire un fichier ligne par ligne est moins optimal dans ce cas. En utilisant `while read -r line; do ... done < "fichier"`, on lit le fichier ligne par ligne sans lancer de sous-processus supplémentaire. Cela rend le script plus performant et réduit l'usage de mémoire par rapport à `cat`, car on n'a pas besoin de lire tout le fichier dans un flux unique.

**2.** Comment transformer `"urls/fr.txt"` en paramètre du script ?

Pour transformer `"urls/fr.txt"` en paramètre, il suffit de passer le nom du fichier comme argument au script, et de le récupérer dans une variable.

+ `if [ "$#" -ne 1 ];` : On vérifie si le nombre d'arguments (`$#`) est égal à 1. Sinon, un message d'erreur s'affiche et le script s'arrête avec `exit 1`.
+ `fichier="$1"` : `$1` contient le premier argument passé au script. Ici, c'est le fichier d'URLs.
+ **Compteur de ligne** : La variable `ligne_num` commence à 1 et s'incrémente de 1 à chaque ligne pour afficher le numéro de ligne.
+ `-e` dans `echo` : Cela permet de traiter `\t` comme une tabulation.

**3.** Comment afficher le numéro de ligne avant chaque URL (sur la même ligne) avec des tabulations ?

Le script `miniprojet.sh` affiche le numéro de ligne avant chaque URL, séparé par une tabulation (`\t`). Cette fonctionnalité est réalisée en utilisant la commande `echo -e "${ligne_num}\t${line}"`. L'utilisation de la tabulation garantit que les différentes colonnes (numéro de ligne et URL) seront bien séparées lorsque le résultat est affiché.

Pour rendre le script exécutable, je lui ai donné les bonnes permissions d'exécution avec :
```
chmod +x programmes/miniprojet.sh
```

On peut exécuter le script en passant le fichier d'URLs en argument, comme suit :
```
bash miniprojet.sh urls/fr.txt
```
Sinon, on peut aussi exécuter le script en utilisant le chemin relatif depuis le répertoire `miniprojet` :
```
bash programmes/miniprojet.sh urls/fr.txt
```
+ Cela suppose qu'on se trouve déjà dans le répertoire où se trouve le script, c'est-à-dire dans le dossier `miniprojet`.


J'ai exécuté mon script en utilisant la commande suivante :
```
./programmes/miniprojet.sh urls/fr.txt
```
+ J'ai spécifié le chemin relatif vers mon script `miniprojet.sh`, situé dans le dossier `programmes` de mon `miniprojet`.
+ Les deux approches sont valides, l'une utilisant `bash` et l'autre l'exécution directe du script avec `./` (le point indique le répertoire actuel).

#### Résumé des fonctionnalités
Ce script :

+ Accepte un fichier d'URLs en argument.
+ Valide la présence de cet argument.
+ Affiche chaque URL avec son numéro de ligne, séparées par une tabulation.



