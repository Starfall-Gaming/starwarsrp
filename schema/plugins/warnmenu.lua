local PLUGIN = PLUGIN

-- Metadata
PLUGIN.name = "Helix Warning System"
PLUGIN.description = "A user warning and punishment system with persistent storage and admin panel."
PLUGIN.author = "Your Name"
PLUGIN.version = "1.0"

-- Configurations
PLUGIN.config = {
    warningLimit = 3, -- Number of warnings before punishment
    punishments = {
        ["kick"] = {type = "kick", message = "You have been kicked due to excessive warnings."},
        ["ban"] = {type = "ban", duration = 60, message = "Exceeded warning limit"},
        ["mute"] = {type = "mute", duration = 60, message = "Exceeded warning limit"}
    }
}

-- Initialize the plugin
function PLUGIN:Initialize()
    self:LoadWarnings()
end

-- Persistent Storage: Load warnings from database
function PLUGIN:LoadWarnings()
    self.warnings = {}

    local query = sql.Query("CREATE TABLE IF NOT EXISTS ix_warnings (steamid TEXT, reason TEXT, admin TEXT, time INTEGER)")
    if not query then
        ErrorNoHalt("Failed to create warnings table: " .. sql.LastError())
    end

    local data = sql.Query("SELECT * FROM ix_warnings")
    if data then
        for _, row in ipairs(data) do
            local steamid = row["steamid"]
            if not self.warnings[steamid] then
                self.warnings[steamid] = {}
            end

            table.insert(self.warnings[steamid], {
                reason = row["reason"],
                admin = row["admin"],
                time = tonumber(row["time"])
            })
        end
    end
end

-- Persistent Storage: Save warning to database
function PLUGIN:SaveWarning(steamid, reason, admin)
    sql.Query("INSERT INTO ix_warnings (steamid, reason, admin, time) VALUES (" .. sql.SQLStr(steamid) .. ", " .. sql.SQLStr(reason) .. ", " .. sql.SQLStr(admin) .. ", " .. os.time() .. ")")
end

-- Function to add a warning
function PLUGIN:AddWarning(target, reason, admin)
    local steamid = target:SteamID()

    if not self.warnings[steamid] then
        self.warnings[steamid] = {}
    end
    
    table.insert(self.warnings[steamid], {
        reason = reason,
        admin = admin:Nick(),
        time = os.time()
    })

    self:SaveWarning(steamid, reason, admin:Nick())
    self:NotifyPlayer(target, "This " .. target:Nick() .. " has been warned by " .. admin:Nick() .. " for: " .. reason)
    self:NotifyPlayer(admin, "You have warned " .. target:Nick() .. " for: " .. reason)

    self:CheckPunishment(target)
    
    -- Update admin panel if open
    if CLIENT and IsValid(ix.adminPanel) then
        PLUGIN:UpdateAdminPanel()
    end
end

-- Function to check and apply punishment
function PLUGIN:CheckPunishment(target)
    local steamid = target:SteamID()
    local warnings = self.warnings[steamid]
    
    if #warnings >= self.config.warningLimit then
        local punishmentConfig = self.config.punishments["ban"] -- Default punishment

        -- Apply the punishment
        if punishmentConfig.type == "kick" then
            target:Kick(punishmentConfig.message)
        elseif punishmentConfig.type == "ban" then
            RunConsoleCommand("sam", "ban", steamid, punishmentConfig.duration, punishmentConfig.message)
        elseif punishmentConfig.type == "mute" then
            RunConsoleCommand("sam", "mute", steamid, punishmentConfig.duration, punishmentConfig.message)
        end

        self:NotifyPlayer(target, punishmentConfig.message)
        self.warnings[steamid] = nil
        sql.Query("DELETE FROM ix_warnings WHERE steamid = " .. sql.SQLStr(steamid))
    end
end

-- Function to notify a player
function PLUGIN:NotifyPlayer(player, message)
    player:ChatPrint(message)
end

-- Command to warn a player
ix.command.Add("Warn", {
    description = "Warn a player",
    adminOnly = true,
    arguments = {
        ix.type.player,
        ix.type.text
    },
    OnRun = function(self, client, target, reason)
        PLUGIN:AddWarning(target, reason, client)
    end
})

-- Command to check a player's warnings
ix.command.Add("CheckWarnings", {
    description = "Check a player's warnings",
    adminOnly = true,
    arguments = {
        ix.type.text
    },
    OnRun = function(self, client, target)
        local steamid = target
        local targetPlayer = player.GetBySteamID(steamid)
        
        if not targetPlayer then
            for _, ply in ipairs(player.GetAll()) do
                if string.find(string.lower(ply:Nick()), string.lower(target), 1, true) then
                    targetPlayer = ply
                    steamid = ply:SteamID()
                    break
                end
            end
        else
            steamid = targetPlayer:SteamID()
        end
        
        if not steamid then
            client:Notify("Player not found.")
            return
        end
        
        local warnings = PLUGIN.warnings[steamid] or {}
        client:Notify((targetPlayer and targetPlayer:Nick() or steamid) .. " has " .. #warnings .. " warnings.")
        
        for _, warning in ipairs(warnings) do
            client:ChatPrint("Reason: " .. warning.reason .. " | Admin: " .. warning.admin .. " | Time: " .. os.date("%c", warning.time))
        end
    end
})

-- Admin Panel
if CLIENT then
    function PLUGIN:OpenAdminPanel()
        local frame = vgui.Create("DFrame")
        frame:SetTitle("Admin Panel")
        frame:SetSize(800, 600)
        frame:Center()
        frame:MakePopup()

        ix.adminPanel = frame

        local sheet = vgui.Create("DPropertySheet", frame)
        sheet:Dock(FILL)

        -- Warnings Panel
        local warningsPanel = vgui.Create("DPanel", sheet)
        warningsPanel:Dock(FILL)

        local warningList = vgui.Create("DListView", warningsPanel)
        warningList:Dock(FILL)
        warningList:AddColumn("Player")
        warningList:AddColumn("Reason")
        warningList:AddColumn("Admin")
        warningList:AddColumn("Time")

        PLUGIN.warningList = warningList

        -- Punishments Panel
        local punishmentsPanel = vgui.Create("DPanel", sheet)
        punishmentsPanel:Dock(FILL)

        local punishmentList = vgui.Create("DListView", punishmentsPanel)
        punishmentList:Dock(FILL)
        punishmentList:AddColumn("Player")
        punishmentList:AddColumn("Punishment")
        punishmentList:AddColumn("Reason")
        punishmentList:AddColumn("Time")

        PLUGIN.punishmentList = punishmentList

        sheet:AddSheet("Warnings", warningsPanel, "icon16/exclamation.png")
        sheet:AddSheet("Punishments", punishmentsPanel, "icon16/shield.png")

        PLUGIN:UpdateAdminPanel()
    end

    function PLUGIN:UpdateAdminPanel()
        if not IsValid(PLUGIN.warningList) or not IsValid(PLUGIN.punishmentList) then return end

        -- Initialize warnings table if not already initialized
        if not PLUGIN.warnings then
            PLUGIN.warnings = {}
        end

        PLUGIN.warningList:Clear()
        PLUGIN.punishmentList:Clear()

        for steamid, warnings in pairs(PLUGIN.warnings) do
            for _, warning in ipairs(warnings) do
                PLUGIN.warningList:AddLine(steamid, warning.reason, warning.admin, os.date("%c", warning.time))
            end
        end

        -- Example punishment data, replace this with actual punishment logic
        for _, ply in ipairs(player.GetAll()) do
            if ply:IsAdmin() then
                PLUGIN.punishmentList:AddLine(ply:Nick(), "Ban", "Exceeded warning limit", os.date("%c", os.time()))
            end
        end
    end

    function PLUGIN:RemovePunishment(ply, line)
        local selectedLine = line:GetValue(1) -- Assuming punishmentList has columns (Player, Punishment, Reason, Time)
        if selectedLine then
            -- Here you would handle the removal logic; for simplicity, this just prints to console
            print("Removing punishment for: " .. selectedLine)
        end
    end

    concommand.Add("ix_adminpanel", function()
        PLUGIN:OpenAdminPanel()
    end)

    -- Context Menu for Removing Punishments
    local function OnPunishmentListRightClick(ply, line)
        local menu = DermaMenu()
        menu:AddOption("Remove Punishment", function() PLUGIN:RemovePunishment(ply, line) end)
        menu:Open()
    end

    hook.Add("OnContextMenuOpen", "OpenContextMenu", function()
        if IsValid(PLUGIN.punishmentList) then
            PLUGIN.punishmentList.OnRowRightClick = OnPunishmentListRightClick
        end
    end)
end