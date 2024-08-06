FACTION.name = "NAME"
FACTION.description = "DESCRIPTION"
FACTION.color = Color(255, 255, 255, 255)
FACTION.faction = FACTION_NAME
FACTION.isDefault = true
FACTION.weapons = {
    "WEAPON",
}

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

FACTION_NAME = FACTION.index