FACTION.name = "Cadet Corps"
FACTION.description = "DESCRIPTION"
FACTION.color = Color(140, 140, 140)
FACTION.faction = FACTION_CADET
FACTION.isDefault = true

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

FACTION_CADET = FACTION.index