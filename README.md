# BE_IHM_fusion

## Auteurs : Bastian MURATORY - Clément PAGES - Antoine PAULUS

## Installation et lancement du projet

### Pré-requis

Processing doit avoir été installé sur la machine où le projet est exécuté, de préférence sous Windows

### Installation 

Télécharger l'archive du projet ou exécuter la commande suivante :
```
git clone https://github.com/clement-pages/BE_IHM_fusion.git
```

### Lancement de l'application

Pour pouvoir lancer la palette, lancer les différents agent ainsi que le bus IVY :
1. Lancer le bus IVY en exécutant le fichier `./visionneur_1_2/visonneur.bat`
2. Lancer la reconnaissance vocale en exécutant l'agent `sra5` : lancer le fichier `./Grammaire/sra5_on.bat`
3. Lancer la reconnaissance de geste en ouvrant le fichier `./Gestuelle/Gestuelle.pde` puis en exécutant ce programme
4. Finalement lancer la palette en ouvrant le fichier `./Palette/Palerre.pde` puis en exécutant le programme
5. L'application est prête à être utilisée !


### Exemple de commandes pouvant être utilisées

Création de forme
> Créer cette forme (dessiner la forme sur l'interface de reconnaissance de geste) ici (cliquer)
> Créer un carré rouge là (cliquer)

Suppression de forme
> Supprimer cette forme (cliquer sur la forme)

Agrandir / Rétrécir une forme
> Agrandir cette forme là (cliquer sur la forme à agrandir)
> Réduire cette forme (cliquer sur la forme à réduire)

Changer de couleur une forme
> Mettre cette forme (cliquer sur la forme) en bleu
> Changer la couleur de cette forme (cliquer sur la forme)
> Mettre cette forme (cliquer sur la forme) de cette couleur (cliquer sur une forme pour que la première forme cliquée ait la même couleur que la seconde)
