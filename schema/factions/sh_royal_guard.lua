FACTION.name = "Emperor's Guard"
FACTION.description = "DESCRIPTION"
FACTION.color = Color(255, 0, 0)
FACTION.faction = FACTION_ROYAL_GUARD
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

FACTION_ROYAL_GUARD = FACTION.index