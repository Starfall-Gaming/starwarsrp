FACTION.name = "Death Trooper Division"
FACTION.description = "DESCRIPTION"
FACTION.color = Color(25, 56, 31)
FACTION.faction = FACTION_DEATH_TROOPER
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

FACTION_DEATH_TROOPER = FACTION.index