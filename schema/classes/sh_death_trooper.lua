CLASS.name = "Trooper"
CLASS.faction = FACTION_DEATH_TROOPER
CLASS.isDefault = true
CLASS.model = {
    "models/nada/deathtrooperscaled.mdl"
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

CLASS_DEATH_TROOPER = CLASS.index