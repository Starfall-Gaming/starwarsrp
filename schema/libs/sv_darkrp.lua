-- table imports
ix.darkrp = ix.darkrp or {}

-- declare network strings
util.AddNetworkString("ix.darkrp.factionswitch")
util.AddNetworkString("ix.darkrp.preferredjobmodel")

-- Receives client request to change faction and class
net.Receive("ix.darkrp.factionswitch", function(len, ply)
    local newFaction = net.ReadUInt(8)
    local newClass = net.ReadUInt(8)
    ix.darkrp.FactionSwitch(ply, newFaction, newClass)
end)

-- Receives client's preferred job model
net.Receive("ix.darkrp.preferredjobmodel", function(len, ply)
    local teamNr = net.ReadUInt(8)
    local model = net.ReadString()
    ply.PreferredJobModels = ply.PreferredJobModels or {}
    ply.PreferredJobModels[teamNr - #ix.faction.indices] = model
end)

-- Changes helix faction and class
hook.Add("CanPlayerJoinClass", "ix.DarkRP.FactionSwitch", function(client, class, info)
    if client.HasWhitelist and not client:HasWhitelist(class.faction) then
        return false, "no faction whitelist"
    end

    if client.HasClassWhitelist and not client:HasClassWhitelist(class) then
        return false, "no class whitelist"
    end
end)

DarkRP = ix.darkrp