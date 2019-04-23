function checkIdentifierBanned( info,type)
  PerformHttpRequest("https://global-ban.family-v.com/bans/search.php?id="..info.."&warning="..Config.WarningLevel, function(err, rText, headers)
  if(err==200)then
    return false
  else
    return true
  end
  end, "GET", "", {["Content-Type"] = "application/json"});

end

AddEventHandler("playerConnecting", function(name, setCallback, deferrals)
local playerId = source
deferrals.defer()
deferrals.update(': Making sure you are not globally banned')

Citizen.Wait(1000)

local identifiers = GetPlayerIdentifiers(playerId)

local steam = checkIdentifierBanned(identifiers[1],"steam")
Citizen.Wait(1000)

local license = checkIdentifierBanned(identifiers[2],"license")
Citizen.Wait(1000)

local ip = checkIdentifierBanned(identifiers[3],"ip")
Citizen.Wait(1000)

if steam and license and ip then
  deferrals.done()
else
  deferrals.done("The Ban Hammer has spoken \n You're globally permanently banned from the united federation of FiveM communities")
end
end)
