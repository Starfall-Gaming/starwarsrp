CLASS.name = "212th Trooper"
CLASS.faction = FACTION_212TH_ATTACK
CLASS.isDefault = true
CLASS.models = {
    "models/mayfield/212/trooper.mdl"
}

function CLASS:CanSwitchTo(client)
end

if (SERVER) then
    function CLASS:OnLeave(client)
    end

    function CLASS:OnSet(client)
	    client:SetModel("models/mayfield/212/trooper.mdl")
    end

    function CLASS:OnSpawn(client)
	    client:SetModel("models/mayfield/212/trooper.mdl")
        client:SetHealth(400)
        client:SetMaxHealth(400)
        client:SetArmor(100)
        client:SetMaxArmor(100)
    end
end

CLASS_212TH_TROOPER = CLASS.index