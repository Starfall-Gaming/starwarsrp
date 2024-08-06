CLASS.name = "NAME"
CLASS.faction = FACTION_NAME
CLASS.isDefault = true
CLASS.model = {
    "models/default/model.mdl"
}

function CLASS:CanSwitchTo(client)
end

if (SERVER) then
    function CLASS:OnLeave(client)
	    client:SetModel("models/default/model.mdl")
    end

    function CLASS:OnSet(client)
	    client:SetModel("models/default/model.mdl")
    end

    function CLASS:OnSpawn(client)
	    client:SetModel("models/default/model.mdl")
    end
end

CLASS_NAME = CLASS.index