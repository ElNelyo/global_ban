local ban = {}
function checkIdentifierBanned(identifiers,name, pos)
  if pos ~= nil then
    local IDENTIFIER = identifiers[pos]
    if IDENTIFIER ~= nil then
      PerformHttpRequest("https://global-ban.family-v.com/bans/search.php?id="..IDENTIFIER.."&warning="..Config.WarningLevel,
      function(err, rText, headers)
        if err == 200 then
          print("Player ["..IDENTIFIER.."] attempt to connect but he is banned.")
          TriggerEvent('global_ban:banned', true,name)
        else
          checkIdentifierBanned(identifiers, pos + 1)
        end
        end, "GET", "", {["Content-Type"] = "application/json"});
      end
    end
  end

  AddEventHandler("playerConnecting", function(name, setCallback, deferrals)
  local playerId = source
  ban[name] = false
  deferrals.defer()
  deferrals.update('Making sure you are not globally banned')
  local identifiers = GetPlayerIdentifiers(playerId)
  checkIdentifierBanned(identifiers,name, 1)
  Citizen.Wait(1000)
  if not ban[name] then
    deferrals.done()
  else
    deferrals.done("The Ban Hammer has spoken \n You're globally permanently banned from the united federation of FiveM communities")
  end
  end)

  RegisterNetEvent('global_ban:banned')
  AddEventHandler('global_ban:banned', function(bool,name)
  local playerId = source
  ban[name] = bool
  end)
