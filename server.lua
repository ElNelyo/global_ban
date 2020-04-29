local auth_token = ""
local apiBlocked = false;
local username = ""
local password = ""
local jsonTable = ""
local jsonString = ""

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    username = Config.username
    password = Config.password
    jsonTable = { username = username, password = password}
    jsonString = json.encode(jsonTable)
    GetToken();
end)

function GetToken()
    PerformHttpRequest(Config.url.."login_check", function (errorCode, resultData, resultHeaders)
        if(errorCode == 200) then
            auth_token_json = json.decode(resultData)
            auth_token = auth_token_json["token"];
        else
            apiBlocked = true;
            print("[GB] API is probably down : code error ".. errorCode)
        end
    end, "POST", jsonString, {["Content-Type"] = 'application/json'})
end


function checkIdentifierBanned(identifiers)
    GetToken()
    Wait(1000)
    isBanned = false
    url = Config.ssl .."://".. Config.url.."api/players/search"
    count = 0;
    for i=1, #identifiers, 1 do
        if(count ==0)then
            url = url .."?" ;
        else
            url = url .."&" ;
        end

            local separated = split(identifiers[i],":")

            if separated[1] == "steam" then
                url = url.."steam="..separated[2]
            end

            if separated[1] == "xbl" then
                url = url.."xboxlive="..separated[2]
            end

            if separated[1] == "ip" then
                url = url.."ip="..separated[2]
            end

            if separated[1] == "live" then
                url = url.."live="..separated[2]
            end

            if separated[1] == "license" then
                url = url.."licenseFiveM="..separated[2]
            end

        
            if separated[1] == "discord" then
                url = url.."discord="..separated[2]
            end
            count = count + 1;

    end  

    url = url .."&".. Config.level

    if( apiBlocked == false) then
        print("[GB] Call API "..url);
        PerformHttpRequest(url, function (errorCode, resultData, resultHeaders)   
            if(errorCode == 200) then
                isBanned = resultData
            else
                print("[GB] Error server side code "..errorCode);
                isBanned = false
            end
        end, "GET", jsonString, {["Content-Type"] = 'application/json', Authorization = "Bearer " .. auth_token})
    else
        return false
    end

    Wait(1000)
    
    return isBanned
end

AddEventHandler("playerConnecting", function(name, setCallback, deferrals)
    local playerId = source
    local identifiers = GetPlayerIdentifiers(playerId)
    deferrals.defer()
    deferrals.update('We\'re checking your '..#identifiers..' identifier(s)')    
    local banChecker = checkIdentifierBanned(identifiers)
    if banChecker == "true" then
        deferrals.done("You're in our BanList. Sorry.")
    else
        deferrals.done()
    end
        
end)

function print_table(node)
    local cache, stack, output = {},{},{}
    local depth = 1
    local output_str = "{\n"

    while true do
        local size = 0
        for k,v in pairs(node) do
            size = size + 1
        end

        local cur_index = 1
        for k,v in pairs(node) do
            if (cache[node] == nil) or (cur_index >= cache[node]) then

                if (string.find(output_str,"}",output_str:len())) then
                    output_str = output_str .. ",\n"
                elseif not (string.find(output_str,"\n",output_str:len())) then
                    output_str = output_str .. "\n"
                end

                -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
                table.insert(output,output_str)
                output_str = ""

                local key
                if (type(k) == "number" or type(k) == "boolean") then
                    key = "["..tostring(k).."]"
                else
                    key = "['"..tostring(k).."']"
                end

                if (type(v) == "number" or type(v) == "boolean") then
                    output_str = output_str .. string.rep('\t',depth) .. key .. " = "..tostring(v)
                elseif (type(v) == "table") then
                    output_str = output_str .. string.rep('\t',depth) .. key .. " = {\n"
                    table.insert(stack,node)
                    table.insert(stack,v)
                    cache[node] = cur_index+1
                    break
                else
                    output_str = output_str .. string.rep('\t',depth) .. key .. " = '"..tostring(v).."'"
                end

                if (cur_index == size) then
                    output_str = output_str .. "\n" .. string.rep('\t',depth-1) .. "}"
                else
                    output_str = output_str .. ","
                end
            else
                -- close the table
                if (cur_index == size) then
                    output_str = output_str .. "\n" .. string.rep('\t',depth-1) .. "}"
                end
            end

            cur_index = cur_index + 1
        end

        if (size == 0) then
            output_str = output_str .. "\n" .. string.rep('\t',depth-1) .. "}"
        end

        if (#stack > 0) then
            node = stack[#stack]
            stack[#stack] = nil
            depth = cache[node] == nil and depth + 1 or depth - 1
        else
            break
        end
    end

    -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
    table.insert(output,output_str)
    output_str = table.concat(output)

    print(output_str)
end


    function split (inputstr, sep)
    if sep == nil then
            sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, str)
    end
    return t
end