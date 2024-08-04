CLASS.name = "Senate Commando Trooper"
CLASS.faction = FACTION_SENATE_COMMANDO
CLASS.isDefault = true
CLASS.models = {
    "models/player/valley/lgn/jocasta/jocasta.mdl"
}

function CLASS:CanSwitchTo(client)
end

if (SERVER) then
    function CLASS:OnLeave(client)
    end

    function CLASS:OnSet(client)
	    client:SetModel("models/player/valley/lgn/jocasta/jocasta.mdl")
    end

    function CLASS:OnSpawn(client)
	    client:SetModel("models/player/valley/lgn/jocasta/jocasta.mdl")
    end
end

CLASS_SENATE_COMMANDO_TROOPER = CLASS.index