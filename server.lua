
local autorized = true

function ban_request( info,type)

    PerformHttpRequest("https://www.family-v.fr/global_ban_api/bans/search.php/?id="..info.."&warning="..Config.WarningLevel, function(err, rText, headers)
            if(err==200)then
                    autorized= false
                    print("--[GLOBAL BAN] We got him boys ("..type..")")
                end
            end, "GET", "", {["Content-Type"] = "application/json"});


end

AddEventHandler("playerConnecting", function(name, setCallback, deferrals)

    local _source = source
    deferrals.defer()

    Wait(1500)
    ban_request(GetPlayerIdentifiers(_source)[1],"steam")
    deferrals.update(': Checking your data step 1 . . .')

    Wait(1500)
    ban_request(GetPlayerIdentifiers(_source)[2],"licence")
    deferrals.update(': Checking your data step 2 . . .')

    Wait(1500)
    ban_request(GetPlayerIdentifiers(_source)[3],"ip")
    deferrals.update(': Checking your data step 3 . . .')

    Wait(1500)
    if(autorized)then
        deferrals.done()
        else
        deferrals.done("Sorry you aren't allowed to join us :)")
    end
    autorized = true

    end)
