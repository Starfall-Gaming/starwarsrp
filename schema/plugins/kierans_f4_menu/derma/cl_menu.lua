local PANEL = {} -- cl_menu.lua
function PANEL:Init()
    self:SetSize(800, 600)
    self:Center()
    self:MakePopup()
    self:SetTitle("Imperial RP Menu")
    self:SetupFactionsTab()
end

function PANEL:SetupFactionsTab()
    local factionPanel = self:Add("DPanel")
    factionPanel:Dock(FILL)
    local factionList = factionPanel:Add("DScrollPanel")
    factionList:Dock(FILL)
    for _, faction in pairs(ix.faction.indices) do
        if not LocalPlayer():HasWhitelist(faction.index) then continue end

        local factionTab = factionList:Add("DCollapsibleCategory")
        factionTab:Dock(TOP)
        factionTab:DockMargin(5, 5, 5, 0)
        factionTab:SetLabel(faction.name)
            for _, class in pairs(ix.class.list) do
                if class.faction ~= faction.index then continue end

                local jobButton = factionTab:Add("DButton")
                jobButton:Dock(TOP)
                jobButton:DockMargin(5, 5, 5, 5)
                jobButton:SetText(class.name)
                jobButton.DoClick = function()
                    net.Start("ixClassSwitch")
                    net.WriteUInt(faction.index, 8)
                    net.WriteUInt(class.index, 8)
                    net.SendToServer()
                    self:Close()
                end
            end
    end
end

vgui.Register("ixImperialF4Menu", PANEL, "DFrame")