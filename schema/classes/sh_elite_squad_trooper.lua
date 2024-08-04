CLASS.name = "Elite Squad Trooper"
CLASS.faction = FACTION_ELITE_SQUAD
CLASS.isDefault = true
CLASS.models = {
    "models/nada/elitesquadtrooper.mdl"
}

function CLASS:CanSwitchTo(client)
end

if (SERVER) then
    function CLASS:OnLeave(client)
    end

    function CLASS:OnSet(client)
	    client:SetModel("models/nada/elitesquadtrooper.mdl")
    end

    function CLASS:OnSpawn(client)
	    client:SetModel("models/nada/elitesquadtrooper.mdl")
    end
end

CLASS_ELITE_TROOPER = CLASS.index