# BE_IHM_fusion

Fonctionnement des applications :
----
L'application palette fonctionne en collaboration avec 2 autres application :
 - sra5 qui récupère une entrée audio provenant de l'utilisateur
 - le programme Gestuelle qui récupère les dessins de l'utilisateur 

De son coté, l'application palette s'occupe de l'affichage des formes à l'écran ainsi que de récupérer les clics souris sur cet écran.

----

Application Palette
----
L'application fonctionne avec une machine à état composé de 4 états : 

  INITIAL - AFFICHER_FORMES - ATTENTE_PAROLE - ATTENTE_CLIC

> Etat INITIAL

L'état INITIAL n'est présent qu'au début de l'application, il va de lui même vers le prochain état AFFICHER_FORMES.

> Etat AFFICHER_FORMES

AFFICHER_FORMES est l'état dans lequell l'application affiche les formes est rest en attente des interractions avec l'utilisateur.

Depuis l'état AFFICHER_FORMES il est possible de rejoindre les états suivants : 
 - ATTENTE_PAROLE (après un clic souris)
 - ATTENTE_CLIC (après réception d'un message gestuel depuis Ivy)

> Etat ATTENTE_PAROLE

ATTENTE_PAROLE est l'état dans lequel l'application a recu un ou plusieurs clics souris et attends donc la commande de l'utilisateur qui va déclancher l'action en question. 

Dans cet état il est possible de transitionner vers l'état suivant :
 - AFFICHER_FORMES (après un délai de quelques secondes) : Ici on considère que l'utilisateur a seulement cliqué sur l'écran sans réelles intentions, cela peut être une erreur donc on revient dans l'état principal.

> Etat ATTENTE_CLIC

ATTENTE_CLIC est l'état dans lequel l'application a recu un geste depuis Ivy et attends l'emplacement ou devra aller la forme reconnue 

Dans cet état il est possible de transitionner vers l'état suivant :
 - AFFICHER_FORMES (après un délai de quelques secondes) : Ici on considère que l'utilisateur a seulement effectué un geste sans intentions, cela peut être une erreur donc on revient dans l'état principal.


> Conclusion 

Finalement, ce mode de fonctionnement permet à l'utilisateur un certain nombre d'interractions :
 - Créer des formes avec la voix, selectionner leur emplacement avec un clic 
 - Déplacer une forme avec un clic sur la forme à déplacer puis un second clic vers la destination suivi de la commande "déplacer"
 - Des interractions spécifiques à une pièce :  agrandir, rétrécir, changer de couleur.
 - L'application permet aussi de dessiner une forme sur l'application gestuelle puis de selectionner l'emplacement de celle-ci sur la palette pour la faire apparaitre.


Application Palette
----
L'application gestuelle permet de reconnaitre un geste effectué par l'utilisateur (ici un stroke sur un canvas). 
Les differents geste que l'utilisateur peut effectuer sont les suivants :
 - un carré 
 - un cercle
 - un J (Pour Jacqueline)
 - un triangle
