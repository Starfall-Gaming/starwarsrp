-- table imports
ix.darkrp = ix.darkrp or {}

function ix.darkrp.FactionSwitch(ply, newFaction, newClass)
    net.Start("ix.darkrp.factionswitch")
        net.WriteUInt(newFaction, 8)
        net.WriteUInt(newClass, 8)
    net.SendToServer()
end

function ix.darkrp.setPreferredJobModel(teamNr, model)
    net.Start("ix.darkrp.preferredjobmodel")
        net.WriteUInt(teamNr, 8)
        net.WriteString(model)
    net.SendToServer()
end


DarkRP = ix.darkrp