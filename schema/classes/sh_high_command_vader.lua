CLASS.name = "Darth Vader"
CLASS.faction = FACTION_HIGH_COMMAND
CLASS.isDefault = false
CLASS.model = {
    "models/nanb_darth_vader.mdl"
}
CLASS.weapons = {
    "weapon_lightsaber_vader"
}
CLASS.hp = 1200
CLASS.armor = 500

function CLASS:CanSwitchTo(client)
end

if (SERVER) then
    function CLASS:OnLeave(client)
    end

    function CLASS:OnSet(client)
    end

    function CLASS:OnSpawn(client)
        client:SetModelScale(1.15)
    end
end

CLASS_DARTH_VADER = CLASS.index