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

- **1.** Après avoir créé mon dépôt avec un dossier `plurital` à la racine du projet, je me suis occupée de l'organisation des fichiers pour donner au projet la structure souhaitée.
        #### PROBLÈME :
        - J'ai voulu créer un dossier PPE1-2024 dans le dossier `plurital`, mais je ne me trouvais pas au bon endroit :
```
(myPy) (base) nataliakulikova@MacBook-Pro-de-Natalia plurital % mkdir -p plurital/PPE1-2024
```
> **Note** : L'option `-p` dans la commande `mkdir` signifie "parents". Elle permet de créer toute une structure de dossiers, y compris les dossiers parents manquants, sans générer d'erreur si certains dossiers existent déjà.
        - Si le dossier `plurital` n'existe pas déjà, `mkdir -p` le créera automatiquement avant de créer le dossier `PPE1-2024`.
        - Si `plurital` existe déjà, `mkdir -p` créera simplement `PPE1-2024` à l'intérieur sans afficher d'erreur.
Cette commande a créé un dossier `plurital` supplémentaire avec un dossier `PPE1-2024` comme contenu, l'erreur que j'ai dû corriger avec la commande suivante :
        #### SOLUTION :
```
(myPy) (base) nataliakulikova@MacBook-Pro-de-Natalia plurital % rm -rf plurital
```
> **Note** : L'option `-rf` dans la commande `rm` signifie :
        - `-r` : récursif (pour "recursive") — Supprime le dossier et tout son contenu, y compris les sous-dossiers et fichiers qu’il contient.
        - `-f` : forcé (pour "force") — Force la suppression sans demander de confirmation, même si les fichiers sont protégés en écriture.

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

  
- **2.** 
- **3.** 
