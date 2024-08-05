FACTION.name = "Reg Guard"
FACTION.description = "DESCRIPTION"
FACTION.color = Color(255, 0, 0)
FACTION.faction = FACTION_RED_GUARD
FACTION.isDefault = false
FACTION.models = {
    "models/defcon/stallion/shock/redguard.mdl"
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

FACTION_RED_GUARD = FACTION.index