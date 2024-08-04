TOOL.Category = "Utility"
TOOL.Name = "Tooltip Tool"
TOOL.Command = nil
TOOL.ConfigName = ""

if CLIENT then
    language.Add("tool.tooltip.name", "Tooltip Tool")
    language.Add("tool.tooltip.desc", "Add tooltips to map entities")
    language.Add("tool.tooltip.0", "Left-click to set a tooltip. Right-click to remove a tooltip.")
end

if SERVER then
    util.AddNetworkString("TooltipTool_SetTooltip")
    util.AddNetworkString("TooltipTool_RemoveTooltip")
end

-- Left-click to set a tooltip
function TOOL:LeftClick(trace)
    if not trace.Entity or not trace.Entity:IsValid() then return false end
    if CLIENT then return true end

    local ply = self:GetOwner()
    local tooltipText = ply:GetInfo("tooltip_tool_text")

    net.Start("TooltipTool_SetTooltip")
    net.WriteEntity(trace.Entity)
    net.WriteString(tooltipText)
    net.Broadcast()

    trace.Entity:SetNWString("TooltipText", tooltipText)

    return true
end

-- Right-click to remove a tooltip
function TOOL:RightClick(trace)
    if not trace.Entity or not trace.Entity:IsValid() then return false end
    if CLIENT then return true end

    net.Start("TooltipTool_RemoveTooltip")
    net.WriteEntity(trace.Entity)
    net.Broadcast()

    trace.Entity:SetNWString("TooltipText", "")

    return true
end

-- Adding the text box in the tool menu
function TOOL.BuildCPanel(CPanel)
    CPanel:AddControl("Header", {Text = "Tooltip Tool", Description = "Add tooltips to map entities"})
    CPanel:AddControl("TextBox", {Label = "Tooltip Text", Command = "tooltip_tool_text", MaxLength = "100"})
end

if CLIENT then
    net.Receive("TooltipTool_SetTooltip", function()
        local ent = net.ReadEntity()
        local tooltipText = net.ReadString()

        if IsValid(ent) then
            ent:SetNWString("TooltipText", tooltipText)
        end
    end)

    net.Receive("TooltipTool_RemoveTooltip", function()
        local ent = net.ReadEntity()

        if IsValid(ent) then
            ent:SetNWString("TooltipText", "")
        end
    end)

    -- Displaying tooltips
    hook.Add("HUDPaint", "DrawTooltips", function()
        local ply = LocalPlayer()
        local tr = ply:GetEyeTrace()
        if tr.Entity and tr.Entity:IsValid() and tr.Entity:GetNWString("TooltipText") ~= "" then
            local tooltipText = tr.Entity:GetNWString("TooltipText")
            local scrPos = (tr.Entity:GetPos() + tr.Entity:OBBCenter()):ToScreen()
            draw.SimpleText(tooltipText, "Trebuchet24", scrPos.x, scrPos.y, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    end)
end