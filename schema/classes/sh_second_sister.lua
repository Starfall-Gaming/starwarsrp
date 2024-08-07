CLASS.name = "Second Sister"
CLASS.faction = FACTION_INQUISITION
CLASS.isDefault = false
CLASS.model = "models/player/bb_second_sister.mdl"
CLASS.weapons = {
    "weapon_lightsaber_inquisitorius"
}
CLASS.hp = 1000
CLASS.armor = 200

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

CLASS_SECOND_SISTER = CLASS.index