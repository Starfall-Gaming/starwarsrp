FACTION.name = "Imperial Fleet"
FACTION.description = "DESCRIPTION"
FACTION.color = Color(3, 64, 97)
FACTION.faction = FACTION_IMPERIAL_FLEET
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

FACTION_IMPERIAL_FLEET = FACTION.index