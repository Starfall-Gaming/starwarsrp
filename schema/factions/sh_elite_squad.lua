FACTION.name = "Elite Squad"
FACTION.description = "DESCRIPTION"
FACTION.color = Color(25, 56, 31)
FACTION.faction = FACTION_ELITE_SQUAD
FACTION.isDefault = false
FACTION.models = {
    "models/nada/elitesquadtrooper.mdl"
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

FACTION_ELITE_SQUAD = FACTION.index