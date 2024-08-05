FACTION.name = "Event Characters"
FACTION.description = "Classes used by gamemasters"
FACTION.color = Color(169, 0, 255)
FACTION.faction = FACTION_NAME
FACTION.isDefault = true
FACTION.models = {
    "models/player/kurier/fleet/admiral.mdl",
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