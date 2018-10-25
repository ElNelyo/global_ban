
# GLOBAL BAN 
![GitHub package version](https://img.shields.io/badge/Version-1.0-brightgreen.svg)

## Introduction
[Français](README.md) 

GLOBAL BAN is an inter-server ban script, the operation is quite simple it allows to pool
a list of ** banned ** players on the various FiveM servers.
The banned players are identified by three criteria

- IP adress
- Steam ID
- Rockstar licence
## How it works ?

The script works under a free API call.
This API is only allowed with GET request.

#### How to add a player ?
We have 3098 different identifiers registered
We do not intend to add more.
However, if you have enough evidence (screenshots, text, IP, steam ID) you can send them to my private messages.


#### I'm banned, how i can unlock my account ?

Currently it is not possible to recover your account, however you can ask the person who sentenced you to withdraw his ban request.  


#### What are the ban criteria ?
Players registered as "harmful" are categorized by level:
- Level 4: Player shows the use of hack / bug or cheat
- Level 3: Player does not have the notion of role-play
- Level 2: Toxic Player
- Level 1: Player who posts advertisements from his server.

You can choose the configuration level in the [config] file (Config.lua)

    Config                        = {}
     Config.WarningLevel           = 1
 
In this case, you deny access to level 1 only
    
    Config                        = {}
    Config.WarningLevel           = 4

In this case, you deny access to level 1,2,3 and 4 

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