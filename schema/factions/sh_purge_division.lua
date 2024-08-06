FACTION.name = "Purge Trooper Division"
FACTION.description = "DESCRIPTION"
FACTION.color = Color(214, 138, 45)
FACTION.faction = FACTION_PURGE_DIVISION
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

FACTION_PURGE_DIVISION = FACTION.index