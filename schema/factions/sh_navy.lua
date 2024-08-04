FACTION.name = "Republic Navy"
FACTION.description = "DESCRIPTION"
FACTION.color = Color(200, 200, 200, 255)
FACTION.faction = FACTION_REPUBLIC_NAVY
FACTION.isDefault = false
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