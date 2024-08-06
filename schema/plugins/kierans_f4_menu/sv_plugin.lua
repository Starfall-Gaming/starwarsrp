local PLUGIN = PLUGIN

util.AddNetworkString("ixClassSwitch")
util.AddNetworkString("ixFactionSwitch")

net.Receive("ixClassSwitch", function(len, ply)
    local factionIndex = net.ReadUInt(8)
    local classIndex = net.ReadUInt(8)

    local faction = ix.faction.indices[factionIndex]
    local class = ix.class.list[classIndex]
    local char = ply:GetCharacter()

	char.vars.faction = faction.uniqueID
    char:SetFaction(faction.index)

    if (faction.OnTransferred) then
        faction:OnTransferred(char)
    end

    char:SetClass(class.index)
    if (class.OnSet) then
        class:OnSet(char)
    end
    
    ply:Spawn()
    if (class.OnSpawn) then
        class:OnSpawn(char)
    end
end)