CLASS.name = "501st Trooper"
CLASS.faction = FACTION_501ST_LEGION
CLASS.isDefault = true
CLASS.model = {
    "models/defcon/loudmantis/501/trooper.mdl"
}

function CLASS:CanSwitchTo(client)
end

if (SERVER) then
    function CLASS:OnLeave(client)
    end

    function CLASS:OnSet(client)
	    client:SetModel("models/defcon/loudmantis/501/trooper.mdl")
    end

    function CLASS:OnSpawn(client)
	    client:SetModel("models/defcon/loudmantis/501/trooper.mdl")
    end
end

CLASS_501ST_TROOPER = CLASS.index