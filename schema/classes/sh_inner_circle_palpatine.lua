CLASS.name = "Galactic Emperor"
CLASS.faction = FACTION_HIGH_COMMAND
CLASS.isDefault = false
CLASS.model = {
    "models/player/emperor_palpatine.mdl"
}

function CLASS:CanSwitchTo(client)
end

if (SERVER) then
    function CLASS:OnLeave(client)
    end

    function CLASS:OnSet(client)
        client:SetModel("models/player/emperor_palpatine.mdl")
    end

    function CLASS:OnSpawn(client)
        client:SetModel("models/player/emperor_palpatine.mdl")
    end
end

CLASS_EMPEROR_PALPATINE = CLASS.index