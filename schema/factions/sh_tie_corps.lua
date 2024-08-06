FACTION.name = "Starfighter Corps"
FACTION.description = "DESCRIPTION"
FACTION.color = Color(104, 104, 104)
FACTION.faction = FACTION_TIE_CORPS
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

FACTION_TIE_CORPS = FACTION.index