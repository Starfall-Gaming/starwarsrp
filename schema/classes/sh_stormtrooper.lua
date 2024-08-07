CLASS.name = "Trooper"
CLASS.faction = FACTION_STORMTROOPER
CLASS.isDefault = true
CLASS.model = {
    "models/bunny/stormtrooper_revamp/stormtrooper_trooper.mdl"
}
CLASS.hp = 100
CLASS.armor = 0

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

CLASS_STORMTROOPER = CLASS.index