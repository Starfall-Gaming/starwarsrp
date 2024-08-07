CLASS.name = "Cadet"
CLASS.faction = FACTION_CADET
CLASS.isDefault = true
CLASS.model = {
    "models/nada/imperialcadet_male.mdl",
    "models/nada/imperialcadet_female.mdl"
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

CLASS_CADET = CLASS.index