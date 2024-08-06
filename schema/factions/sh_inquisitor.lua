FACTION.name = "Inquisition"
FACTION.description = "DESCRIPTION"
FACTION.color = Color(255, 0, 0)
FACTION.faction = FACTION_IQUISITION
FACTION.isDefault = false

function FACTION:GetDefaultName(client)
end

if (SERVER) then
    function FACTION:OnCharacterCreated(client, character)
    end

    function FACTION:OnSpawn(client)
    end

    function FACTION:OnTransferred(character)
    end
end

FACTION_IQUISITION = FACTION.index