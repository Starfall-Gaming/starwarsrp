CLASS.name = "Darth Vader"
CLASS.faction = FACTION_HIGH_COMMAND
CLASS.isDefault = false
CLASS.model = {
    "models/nanb_darth_vader.mdl"
}

function CLASS:CanSwitchTo(client)
end

if (SERVER) then
    function CLASS:OnLeave(client)
    end

    function CLASS:OnSet(client)
        client:SetModel("models/nanb_darth_vader.mdl")
    end

    function CLASS:OnSpawn(client)
        client:SetModel("models/nanb_darth_vader.mdl")
        client:SetModelScale(1.15)
    end
end

CLASS_DARTH_VADER = CLASS.index