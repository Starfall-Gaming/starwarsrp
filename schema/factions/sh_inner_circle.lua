FACTION.name = "Inner Circle"
FACTION.description = "DESCRIPTION"
FACTION.color = Color(71, 23, 23)
FACTION.faction = FACTION_INNER_CIRCLE
FACTION.isDefault = false
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

FACTION_INNER_CIRCLE = FACTION.index