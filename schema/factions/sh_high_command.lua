FACTION.name = "High Command"
FACTION.description = "DESCRIPTION"
FACTION.color = Color(71, 23, 23)
FACTION.faction = FACTION_HIGH_COMMAND
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

FACTION_HIGH_COMMAND = FACTION.index