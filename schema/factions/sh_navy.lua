FACTION.name = "Republic Navy"
FACTION.description = "DESCRIPTION"
FACTION.color = Color(3, 64, 97)
FACTION.faction = FACTION_REPUBLIC_NAVY
FACTION.isDefault = false
FACTION.models = {
    "models/player/kurier/fleet/lightgrey.mdl",
}
FACTION.weapons = {
    "rw_sw_dc15a"
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

FACTION_REPUBLIC_NAVY = FACTION.index