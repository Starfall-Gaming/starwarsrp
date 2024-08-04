FACTION.name = "Inner Circle"
FACTION.description = "DESCRIPTION"
FACTION.color = Color(255, 255, 255, 255)
FACTION.faction = FACTION_INNER_CIRCLE
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

FACTION_INNER_CIRCLE = FACTION.index