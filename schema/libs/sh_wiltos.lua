hook.Add("wOS.ALCS.Skill.CanViewTree", "HelixSkillTrees", function(ply, treeName, treeData)
    local char = ply:GetCharacter()
    if treeData.FactionRestricted then
        table.HasValue(treeData.FactionRestricted, char:GetFaction())
    elseif treeData.ClassRestricted then
        table.HasValue(treeData.ClassRestricted, char:GetClass())
    end
end)