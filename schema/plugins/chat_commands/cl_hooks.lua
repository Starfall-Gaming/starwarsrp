-- cl_hooks.lua

hook.Add("OnPlayerChat", "CustomCommsChat", function(player, text, team, dead)
    if (string.sub(text, 1, 6) == "/comms") then
        local message = string.sub(text, 8)
        local faction = ix.faction.indices[player:Team()]
        local factionName = faction and faction.name or "Unknown"
        local factionColor = faction and faction.color or Color(255, 255, 255)

        chat.AddText(factionColor, factionName, Color(255, 255, 255), " ", player:Name(), Color(0, 0, 139), " [COMMS]: ", Color(169, 169, 169), message)
        return true
    elseif (string.sub(text, 1, 7) == "/advert") then
        local message = string.sub(text, 9)
        chat.AddText(Color(255, 255, 0), player:Name(), Color(255, 255, 255), " [ADVERT]: ", message)
        return true
    end
end)