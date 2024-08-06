CLASS.name = "104th Trooper"
CLASS.faction = FACTION_TIE_CORPS
CLASS.isDefault = true
CLASS.model = {
    "models/memeious/104/trooper.mdl"
}

function CLASS:CanSwitchTo(client)
end


if (SERVER) then
    function CLASS:OnLeave(client)
    end

    function CLASS:OnSet(client)
	    client:SetModel("models/memeious/104/trooper.mdl")
    end

    function CLASS:OnSpawn(client)
	    client:SetModel("models/memeious/104/trooper.mdl")
        client:SetHealth(400)
        client:SetMaxHealth(400)
        client:SetArmor(100)
        client:SetMaxArmor(100)
    end
end

CLASS_104TH_TROOPER = CLASS.index