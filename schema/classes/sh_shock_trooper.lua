CLASS.name = "Shock Trooper"
CLASS.faction = FACTION_SHOCK_SECURITY
CLASS.isDefault = true
CLASS.model = {
    "models/defcon/stallion/shock/trooper.mdl"
}

function CLASS:CanSwitchTo(client)
end

if (SERVER) then
    function CLASS:OnLeave(client)
    end

    function CLASS:OnSet(client)
	    client:SetModel("models/defcon/stallion/shock/trooper.mdl")
    end

    function CLASS:OnSpawn(client)
	    client:SetModel("models/defcon/stallion/shock/trooper.mdl")
    end
end

CLASS_SHOCK_TROOPER = CLASS.index