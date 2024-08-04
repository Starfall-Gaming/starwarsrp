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
function ix.darkrp.FactionSwitch(ply, newFaction, newClass)
    if not (IsValid(ply) and ply:Alive()) then return end
    local char = ply:GetCharacter()
    if not char then return end

    if char:GetFaction() == newFaction and char:GetClass() == newClass then
        ply:NotifyLocalized("FactionSwitchSameJob", newClass.name)
        return
    end

    local factionData = ix.faction.indices[newFaction]
    if not factionData then
        ply:NotifyLocalized("FactionSwitchInvalidFaction")
        return
    end

    local classData = ix.class.list[newClass]
    if not classData then
        ply:NotifyLocalized("FactionSwitchInvalidClass")
        return
    end

    if not ply:HasWhitelist(newFaction) then
        ply:NotifyLocalized("FactionSwitchNotWhitelistedFaction", factionData.name)
        return
    end

    if ply.HasClassWhitelist and not ply:HasClassWhitelist(newClass) then
        ply:NotifyLocalized("FactionSwitchNotWhitelistedClass", classData.name)
        return
    end

    char:SetFaction(newFaction)
    char:SetClass(newClass)
    ply:Spawn()
    if ply.PreferredJobModels and ply.PreferredJobModels[newFaction] then ply:SetModel(ply.PreferredJobModels[newFaction]) end
    for i, v in ipairs(player.GetAll()) do
        v:NotifyLocalized("FactionSwitchClass", ply:Nick(), classData.name)
    end
end

DarkRP = ix.darkrp