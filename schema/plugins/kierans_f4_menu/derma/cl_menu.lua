-- cl_menu.lua

local PANEL = {}

function PANEL:Init()
    self:SetSize(800, 600)
    self:Center()
    self:MakePopup()
    self:SetTitle("Imperial RP Menu")

    self.tabs = self:Add("DPropertySheet")
    self.tabs:Dock(FILL)

    self:SetupJobsTab()
    self:SetupWhitelistsTab()
end

function PANEL:SetupJobsTab()
    local jobPanel = vgui.Create("DPanel", self.tabs)
    jobPanel:Dock(FILL)
    
    local jobList = jobPanel:Add("DScrollPanel")
    jobList:Dock(FILL)

    for _, faction in pairs(ix.faction.indices) do
        if (LocalPlayer():Team() == faction.index) then
            for _, class in pairs(faction.classes) do
                if (!class.isDefault) then
                    continue
                end
                
                local jobButton = jobList:Add("DButton")
                jobButton:Dock(TOP)
                jobButton:DockMargin(0, 0, 0, 5)
                jobButton:SetText(class.name)
                
                jobButton.DoClick = function()
                    net.Start("ixClassSwitch")
                    net.WriteUInt(class.index, 8)
                    net.SendToServer()
                end
            end
        end
    end

    self.tabs:AddSheet("Jobs", jobPanel, "icon16/group.png")
end

function PANEL:SetupWhitelistsTab()
    local whitelistPanel = vgui.Create("DPanel", self.tabs)
    whitelistPanel:Dock(FILL)
    
    local whitelistList = whitelistPanel:Add("DScrollPanel")
    whitelistList:Dock(FILL)

    for _, faction in pairs(ix.faction.indices) do
        if (LocalPlayer():IsWhitelisted(faction.index)) then
            local whitelistLabel = whitelistList:Add("DLabel")
            whitelistLabel:Dock(TOP)
            whitelistLabel:DockMargin(0, 0, 0, 5)
            whitelistLabel:SetText(faction.name)
        end
    end

    self.tabs:AddSheet("Whitelists", whitelistPanel, "icon16/key.png")
end

vgui.Register("ixImperialF4Menu", PANEL, "DFrame")