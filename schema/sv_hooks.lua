
-- Here is where all of your serverside hooks should go.

-- Change death sounds of people in the police faction to the metropolice death sound.
function Schema:GetPlayerDeathSound(client)
	local character = client:GetCharacter()

	if (character and character:IsPolice()) then
		return "NPC_MetroPolice.Die"
	end
end

-- Adds whitelists checks
function Schema:CanPlayerJoinClass(client, class, info)
	PrintTable(info)
    if client ply:HasWhitelist(info.faction) then
        -- ply:NotifyLocalized("FactionSwitchNotWhitelistedFaction", factionData.name)
        return false, "missing faction whitelist"
    end

    if client.HasClassWhitelist and not client:HasClassWhitelist(class) then
        -- ply:NotifyLocalized("FactionSwitchNotWhitelistedClass", classData.name)
        return false, "missing class whitelist"
    end
end