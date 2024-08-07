CLASS.name = "Crewman"
CLASS.faction = FACTION_IMPERIAL_FLEET
CLASS.isDefault = true
CLASS.model = {
    "models/nada/pms/male/black_naval_officer.mdl",
    "models/nada/pms/female/black_naval_officer.mdl"
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

CLASS_ELITE_TROOPER = CLASS.index