-- Add character config to change jump power, default = 200
ix.config.Add("jumpPower", 200, "How high a player normally jumps.", function(oldValue, newValue)
	for _, v in player.Iterator()	do
		v:SetJumpPower(newValue)
	end
end, {
	data = {min = 200, max = 500},
	category = "characters"
})

-- Remove cmd not exist message in chat
function ix.command.Parse(client, text, realCommand, arguments)
    if (realCommand or text:utf8sub(1, 1) == COMMAND_PREFIX) then
        -- See if the string contains a command.
        local match = realCommand or text:utf8lower():match(COMMAND_PREFIX.."([_%w]+)")

        -- is it unicode text?
        if (!match) then
            local post = string.Explode(" ", text)
            local len = string.len(post[1])

            match = post[1]:utf8sub(2, len)
        end

        match = match:utf8lower()

        local command = ix.command.list[match]
        -- We have a valid, registered command.
        if (command) then
            -- Get the arguments like a console command.
            if (!arguments) then
                arguments = ix.command.ExtractArgs(text:utf8sub(match:utf8len() + 3))
            end

            -- Runs the actual command.
            ix.command.Run(client, match, arguments)
        else
            -- if (IsValid(client)) then
            -- 	client:NotifyLocalized("cmdNoExist")
            -- else
            --  print("Sorry, that command does not exist.")
            -- end
        end

        return true
    end

    return false
end

-- Add faction.classes table
for _, class in ipairs(ix.class.list) do
    ix.faction.indices[class.faction] = ix.faction.indices[class.faction] or {}
    table.insert(ix.faction.indices[class.faction], nil, class)
end