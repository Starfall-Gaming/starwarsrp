CLASS.name = "Second Sister"
CLASS.faction = FACTION_INQUISITION
CLASS.isDefault = true
CLASS.model = "models/player/bb_second_sister.mdl"
CLASS.weapons = {
    "weapon_lightsaber_inquisitorius"
}

function CLASS:CanSwitchTo(client)
end

if (SERVER) then
    function CLASS:OnLeave(client)
    end

    function CLASS:OnSet(client)
    end

    function CLASS:OnSpawn(client)
    end
end

CLASS_NAME = CLASS.index