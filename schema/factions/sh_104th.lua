FACTION.name = "104th Battalion"
FACTION.description = "DESCRIPTION"
FACTION.color = Color(200, 200, 200, 255)
FACTION.faction = FACTION_104TH_BATTALION
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

FACTION_104TH_BATTALION = FACTION.index