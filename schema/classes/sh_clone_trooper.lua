CLASS.name = "Clone Trooper"
CLASS.faction = FACTION_CLONE_TROOPERS
CLASS.isDefault = true
CLASS.models = {
    "models/defcon/stan/1stinfantry/trooper/1stinfantrytrooper.mdl"
}

function CLASS:CanSwitchTo(client)
end

if (SERVER) then
    function CLASS:OnLeave(client)
    end

    function CLASS:OnSet(client)
	    client:SetModel("models/defcon/stan/1stinfantry/trooper/1stinfantrytrooper.mdl")
    end

    function CLASS:OnSpawn(client)
	    client:SetModel("models/defcon/stan/1stinfantry/trooper/1stinfantrytrooper.mdl")
    end
end

CLASS_CLONE_TROOPER = CLASS.index