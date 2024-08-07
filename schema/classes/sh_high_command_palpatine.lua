CLASS.name = "Emperor Palpatine"
CLASS.faction = FACTION_HIGH_COMMAND
CLASS.isDefault = false
CLASS.model = {
    "models/player/emperor_palpatine.mdl"
}
CLASS.weapons = {
    "weapon_lightsaber_palpatine"
}
CLASS.hp = 1500
CLASS.armor = 500
CLASS.limit = 1

if (SERVER) then
    function CLASS:OnLeave(client)
    end

    function CLASS:OnSet(client)
    end

    function CLASS:OnSpawn(client)
    end
end

CLASS_EMPEROR_PALPATINE = CLASS.index