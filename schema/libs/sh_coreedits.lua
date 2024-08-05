-- Add character config to change jump power, default = 200
ix.config.Add("jumpPower", 200, "How high a player normally jumps.", function(oldValue, newValue)
	for _, v in player.Iterator()	do
		v:SetJumpPower(newValue)
	end
end, {
	data = {min = 200, max = 500},
	category = "characters"
})

-- Add faction.classes table
for _, class in ipairs(ix.class.list) do
    ix.faction.indices[class.faction] = ix.faction.indices[class.faction] or {}
    table.insert(ix.faction.indices[class.faction], nil, class)
end