
-- Here is where all of your serverside hooks should go.

-- Adds whitelists checks
function Schema:CanPlayerJoinClass(client, class, info)
    if not client:HasWhitelist(info.faction) then
        return false, "missing faction whitelist"
    end

    if client.HasClassWhitelist and not client:HasClassWhitelist(class) then
        return false, "missing class whitelist"
    end
end

function LoadClasses(client)
    if not file.Exists("ix_classes", "DATA") then file.CreateDir("ix_classes") end
    local data = file.Read("ix_classes/" .. client:SteamID64() .. ".txt", "DATA")
    if data then
        client.classes = util.JSONToTable(file.Read("ix_classes/" .. client:SteamID64() .. ".txt", "DATA"))
    else
        client.classes = {}
    end
end

function Schema:PlayerJoinedClass(client, class)
    if not client.classes then LoadClasses(client) end
    
    client.classes[client:GetCharacter().id] = class
    file.Write("ix_classes/" .. client:SteamID64() .. ".txt", util.TableToJSON(client.classes, true))
end

function Schema:PlayerLoadedCharacter(client, curChar, prevChar)
    if not client.classes then LoadClasses(client) end

    if not curChar:GetClass() then curChar:SetClass(client.classes[curChar.id] or CLASS_CADET) end
end