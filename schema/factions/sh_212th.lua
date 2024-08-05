FACTION.name = "212th Attack Battalion"
FACTION.description = "DESCRIPTION"
FACTION.color = Color(214, 138, 45)
FACTION.faction = FACTION_212TH_ATTACK
FACTION.isDefault = false
FACTION.models = {
    "models/mayfield/212/trooper.mdl"
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

FACTION_212TH_ATTACK = FACTION.index