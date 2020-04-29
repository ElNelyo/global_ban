
# GLOBAL BAN 
![GitHub package version](https://img.shields.io/badge/Version-2.0-brightgreen.svg)

## Introduction
[Anglais](ENGLISH.md) 

GLOBAL BAN est un script de ban inter-serveur, le fonctionnement est assez simple il permet de mettre en commun
une liste de joueurs **bannis** sur les différents serveurs FiveM. 
Les joueurs bannis sont identifiés par plusieurs critères :

- L'adresse IP
- Le steam ID
- La license Rockstar
- L'identifiant windows live
- L'identifiant xbox live
- L'identifiant discord

## Fonctionnement
Le script fonctionne sous appel d'un API libre.
Cette API autorise uniquement la lecture et non l'insertion de données. (Sauf pour les administrateurs).

Documentation pour les administrateurs : 

https://globalban.family-v.fr/api/docs

#### Comment ajouter un joueur à bannir ?
Nous avons 3098 identifiants différents d'enregistrés.
Nous ne comptons pas en rajouter plus. 
Cependant si vous avez suffisamment de preuves ( captures d'écrans, texte , IP, steam ID) et me les faire parvenir via messages privés ou aux différents administrateurs.

Seul les administrateurs peuvent rajouter des utilisateurs bannis.




#### Je suis banni, comment faire pour récupérer mon compte ?
Actuellement il n'est pas possible de récupérer votre compte, vous pouvez cependant demander la personne qui vous condamnée de retirer sa demande de bannissement.  


#### Quels sont les critères de bannissement ?
Les joueurs enregistrés comme "nuisibles" sont catégorisés par niveau :
- Niveau 1 : Joueur aillant fait preuve d'utilisation de hack/bug ou cheat
- Niveau 2 : Joueur toxique 
- Niveau 3 : Joueur qui poste des publicités de son serveur.

Vous pouvez choisir le niveau de configuration dans le fichier [config](Config.lua) 

## Installation
- Téléchargez depuis GitHub 

        git clone https://github.com/ElNelyo/global_ban.git
- Editez le fichier config.lua
- Ajoutez la ressource au server.cfg

Attention, le script de fonctionnera pas si vous avez plusieurs ressources qui gèrent  les connexions à votre serveur FiveM.
 

## Credits

- [Nelyo](https://github.com/ElNelyo)  - API Developpement & FiveM ressource (Nelyo#1462)
- [JägerBom](https://github.com/TanguyOrtegat) - Contribution  à la liste de ban (Jager Bom [dev]#2795)
- [DelduWaht](https://github.com/LuaDeldu) - Contribution à la liste de ban (Delduwaht#2222)
- [Tracid](https://github.com/tracid56) - Contribution à la liste de ban (Tracid#5857)