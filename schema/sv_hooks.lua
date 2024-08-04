
-- Here is where all of your serverside hooks should go.

-- Change death sounds of people in the police faction to the metropolice death sound.
function Schema:GetPlayerDeathSound(client)
	local character = client:GetCharacter()

	if (character and character:IsPolice()) then
		return "NPC_MetroPolice.Die"
	end
end

function GM:KeyPress(client, key)
	-- if (key == IN_RELOAD) then
	-- 	timer.Create("ixToggleRaise"..client:SteamID(), ix.config.Get("weaponRaiseTime"), 1, function()
	-- 		if (IsValid(client)) then
	-- 			client:ToggleWepRaised()
	-- 		end
	-- 	end)
	-- else
	if (key == IN_USE) then
		local data = {}
			data.start = client:GetShootPos()
			data.endpos = data.start + client:GetAimVector() * 96
			data.filter = client
		local entity = util.TraceLine(data).Entity

		if (IsValid(entity) and hook.Run("PlayerUse", client, entity)) then
			if (entity:IsDoor()) then
				local result = hook.Run("CanPlayerUseDoor", client, entity)

				if (result != false) then
					hook.Run("PlayerUseDoor", client, entity)
				end
			end
		end
	end
end