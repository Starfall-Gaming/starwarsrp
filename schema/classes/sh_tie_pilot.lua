CLASS.name = "Airman"
CLASS.faction = FACTION_TIE_CORPS
CLASS.isDefault = true
CLASS.model = {
    "models/stan/181st/airman.mdl"
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

CLASS_TIE_PILOT = CLASS.index