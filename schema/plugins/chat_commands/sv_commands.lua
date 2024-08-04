-- sv_commands.lua

ix.command.Add("comms", {
    description = "Send a message to all players in a special comms format.",
    arguments = ix.type.text,
    OnRun = function(self, client, message)
        local faction = ix.faction.indices[client:Team()]
        local name = client:Name()
        local factionName = faction and faction.name or "Unknown"
        local factionColor = faction and faction.color or Color(255, 255, 255)
        
        for _, v in ipairs(player.GetAll()) do
            v:ChatPrint(factionName .. " " .. name .. ": " .. message)
        end

        MsgC(factionColor, factionName, Color(255, 255, 255), " ", name, Color(0, 0, 139), " [COMMS]: ", Color(169, 169, 169), message .. "\n")
    end
})

ix.command.Add("advert", {
    description = "Advertise a message to all players.",
    arguments = ix.type.text,
    OnRun = function(self, client, message)
        local name = client:Name()
        
        for _, v in ipairs(player.GetAll()) do
            v:ChatPrint(name .. " [ADVERT]: " .. message)
        end

        MsgC(Color(255, 255, 0), name, Color(255, 255, 255), " [ADVERT]: ", message .. "\n")
    end
})