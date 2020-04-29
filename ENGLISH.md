
# GLOBAL BAN 
![GitHub package version](https://img.shields.io/badge/Version-.0-brightgreen.svg)

## Introduction
[Français](README.md) 

GLOBAL BAN is an inter-server ban script, the operation is quite simple it allows to pool
a list of **banned** players on the various FiveM servers.
The banned players are identified by many criterias

- IP address
- steam ID
- Rockstar License
- Windows live ID
- Xbox live ID
- Discord ID
## How it works ?

The script works under a free API call.
This API allows only to read data, you can't add any players in this API without an admin connexion

Admin documentation : 

https://globalban.family-v.fr/api/docs

#### How to add a player ?
We have 3098 different identifiers registered
We do not intend to add more.
However, if you have enough evidence (screenshots, text, IP, steam ID) you can send them to my private messages (or to an other admini)

Only admins can add a banned player

#### I'm banned, how i can unlock my account ?

Currently it is not possible to recover your account, however you can ask the person who sentenced you to withdraw his ban request.  


#### What are the ban criteria ?
Players registered as "harmful" are categorized by level:

- Niveau 1 : Player who used a cheat/hack
- Niveau 2 : Toxic player 
- Niveau 3 : Player who publish ad(s) in private message

You can change your configuration in [config.lua](Config.lua) 

## Installation
- Download from GitHub 

        git clone https://github.com/ElNelyo/global_ban.git
        
- Edit config.lua
- Add ressource in server.cfg


Be careful, the script will not work if you have multiple resources that manage connections to your FiveM server.
 

## Credits

- [Nelyo](https://github.com/ElNelyo)  - API Developpement & FiveM ressource (Nelyo#1462)
- [JägerBom](https://github.com/TanguyOrtegat) - Contribution to ban list (Jager Bom [dev]#2795)
- [DelduWaht](https://github.com/LuaDeldu) - Contribution to ban list (Delduwaht#2222)
- [Tracid](https://github.com/tracid56) - Contribution to ban list (Tracid#5857)