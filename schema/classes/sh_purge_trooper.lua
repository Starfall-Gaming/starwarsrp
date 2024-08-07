CLASS.name = "Trooper"
CLASS.faction = FACTION_PURGE_DIVISION
CLASS.isDefault = true
CLASS.model = {
    "models/nada/purgetrooperelectrobaton.mdl"
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

CLASS_PURGE_TROOPER = CLASS.index