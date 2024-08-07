CLASS.name = "Royal Guard"
CLASS.faction = FACTION_ROYAL_GUARD
CLASS.isDefault = true
CLASS.model = {
    "models/kir_kanos.mdl"
}
CLASS.hp = 300
CLASS.armor = 100

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

CLASS_ROYAL_GUARD = CLASS.index