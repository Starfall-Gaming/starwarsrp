local PLAYER = FindMetaTable("Player")

function PLAYER:IsPolice()
	return self:Team() == FACTION_POLICE
end

function PLAYER:isMayor()
    return false
end

function PLAYER:getDarkRPVar(var)
    local char = self:GetCharacter()
    if not char then return end
    if var == "money" then
        return char.vars.money or 0
    elseif var == "job" then
        local class = char.vars.class
        if class then return ix.darkrp.GetJob(class).name end
    end
end

function PLAYER:getJobTable()
    local job = {
        model = self:GetModel() -- defaults to current model
    }

    if self.GetCharacter then
        local char = self:GetCharacter()
        if char then
            local class = char.vars.class
            if class then return ix.darkrp.GetJob(class) end
        end
    end
    return job
end

ALWAYS_RAISED = ALWAYS_RAISED or {}
ALWAYS_RAISED["weapon_lightsaber_personal"] = true
ALWAYS_RAISED["weapon_lightasber_wos_warrior"] = true
