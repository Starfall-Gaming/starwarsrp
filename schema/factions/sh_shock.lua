FACTION.name = "Shock Security Force"
FACTION.description = "DESCRIPTION"
FACTION.color = Color(51, 9, 9)
FACTION.faction = FACTION_SHOCK_SECURITY
FACTION.isDefault = false
FACTION.models = {
    "models/defcon/stallion/shock/trooper.mdl"
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

FACTION_SHOCK_SECURITY = FACTION.index