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

local steam = checkIdentifierBanned(GetPlayerId('steam', source),"steam")
Citizen.Wait(1000)

local license = checkIdentifierBanned(GetPlayerId('license', source),"license")
Citizen.Wait(1000)

local ip = checkIdentifierBanned(GetPlayerId('ip', source),"ip")
Citizen.Wait(1000)

if steam and license and ip then
  deferrals.done()
else
  deferrals.done("The Ban Hammer has spoken \n You're globally permanently banned from the united federation of FiveM communities")
end
end)

function GetPlayerId(type, id)
  local identifiers = GetPlayerIdentifiers(id)
  for i = 1, #identifiers do
    if string.find(identifiers[i], type, 1) ~= nil then
      return identifiers[i]
    end
  end
  return false
end
