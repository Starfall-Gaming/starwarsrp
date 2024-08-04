CLASS.name = "Navy Crewman"
CLASS.faction = FACTION_REPUBLIC_NAVY
CLASS.isDefault = true
CLASS.models = {
    "models/gonzo/navyvariants/green/green.mdl"
}

function CLASS:CanSwitchTo(client)
end

if (SERVER) then
    function CLASS:OnLeave(client)
    end

    function CLASS:OnSet(client)
	    client:SetModel("models/gonzo/navyvariants/green/green.mdl")
    end

    function CLASS:OnSpawn(client)
	    client:SetModel("models/gonzo/navyvariants/green/green.mdl")
    end
end

CLASS_ELITE_TROOPER = CLASS.index