util.AddNetworkString("ixJobSwitch")
net.Receive("ixJobSwitch", function(len, ply)
    local num = net.ReadUInt(8)
    local class = ix.class.list[num]

    if (ply:GetCharacter():GetClass() == class.index) then
        return ply:Notify("same class request")
    end

    if (class.limit > 0) then
        if (#ix.class.GetPlayers(class.index) >= class.limit) then
            return ply:Notify("class is full")
        end
    end
    
    if not ply:HasWhitelist(class.faction) then
        return ply:Notify("missing faction whitelist")
    end

    if ply.HasClassWhitelist and not ply:HasClassWhitelist(class) then
        return ply:Notify("missing class whitelist")
    end

    local char = ply:GetCharacter()
    char:SetFaction(class.faction)
    char:SetClass(num)
    ply:Spawn()

    for i, v in ipairs( player.GetAll() ) do
        v:Notify(char:GetData("rank") .. " " .. ply:Nick() .. " has become a " .. faction.name .. ": " .. class.name)
    end
end)