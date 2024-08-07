CLASS.name = "Trooper"
CLASS.faction = FACTION_SHOCK_SECURITY
CLASS.isDefault = true
CLASS.model = {
    "models/player/bunny/imperial_shock/shock_trooper.mdl"
}
CLASS.hp = 100
CLASS.armor = 50

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

CLASS_SHOCK_TROOPER = CLASS.index