PLUGIN = PLUGIN or {}

PLUGIN.Name = "Branch Ranking System"
PLUGIN.Author = "Theodor"
PLUGIN.Description = "Adds a branch ranking system to the server."

-- Faction specific ranking system. Can be configured however you want. However, I remember it not handling faction swaps well. You also need to set their initial rank when the character is created. And most likely works. Not too sure about the non admin promotion commands though. 
-- Use with caution.
-- Also uses 3 chardata variables: rank, rank_short and rank_number. There's probably a way better way to do this. You could most likely just use one variable and split the string into 3.
-- But too lazy to fix now. 

local rankSystem = {
    ["Army"] = {
        enlisted = {
            { rank = "Private", short = "PVT", number = "E-1" },
            { rank = "Private First Class", short = "PFC", number = "E-2" },
            { rank = "Lance Corporal", short = "LCPL", number = "E-3" },
            { rank = "Corporal", short = "CPL", number = "E-4" },
        },
        nco = {
            { rank = "Sergeant", short = "SGT", number = "N-1" },
            { rank = "Staff Sergeant", short = "SSG", number = "N-2" },
            { rank = "Sergeant First Class", short = "SFC", number = "N-3" },
            { rank = "Master Sergeant", short = "MSG", number = "N-4" },
            { rank = "First Sergeant", short = "1SG", number = "N-5" },
            { rank = "Sergeant Major", short = "SGM", number = "N-6" },
        },
        co = {
            { rank = "Second Lieutenant", short = "2LT", number = "O-1" },
            { rank = "First Lieutenant", short = "LT", number = "O-2" },
            { rank = "Captain", short = "CPT", number = "O-3" },
            { rank = "Major", short = "MAJ", number = "O-4" },
            { rank = "Lieutenant Colonel", short = "LTC", number = "O-5" },
            { rank = "Colonel", short = "COL", number = "O-6" },
        },
        staff = {
            { rank = "Vice Commander", short = "VC", number = "CO-1" },
            { rank = "Commander", short = "CDR", number = "CO-2" },
        },
    },
    ["Navy"] = {
        enlisted = {
            { rank = "Junior Crewman", short = "JCM", number = "E-1" },
            { rank = "Crewman", short = "CWM", number = "E-2" },
            { rank = "Senior Crewman", short = "SCM", number = "E-3" },
            { rank = "Lead Crewman", short = "LCM", number = "E-4" },
        },
        nco = {
            { rank = "Petty Officer", short = "PO", number = "N-1" },
            { rank = "Chief Petty Officer", short = "CPO", number = "N-2" },
            { rank = "Senior Chief Petty Officer", short = "SCPO", number = "N-3" },
            { rank = "Master Chief Petty Officer", short = "MCPO", number = "N-4" },
            { rank = "Midshipman", short = "MSM", number = "N-5" },
            { rank = "Ensign", short = "ESN", number = "N-6" },
        },
        co = {
            { rank = "Lieutenant Junior Grade", short = "LTJG", number = "O-1" },
            { rank = "Lieutenant", short = "LT", number = "O-2" },
            { rank = "Senior Lieutenant", short = "SLT", number = "O-3" },
            { rank = "Lieutenant Commander", short = "LTCDR", number = "O-4" },
            { rank = "Commander", short = "CDR", number = "O-5" },
            { rank = "Captain", short = "CPT", number = "O-6" },
        },
        staff = {
            { rank = "Commodore", short = "COM", number = "CO-1" },
            { rank = "Rear Admiral", short = "RADM", number = "CO-2" },
        },
    },
    ["TIE"] = {
        enlisted = {
            { rank = "Junior Pilot", short = "JPT", number = "E-1" },
            { rank = "Pilot", short = "PLT", number = "E-2" },
            { rank = "Senior Pilot", short = "SPT", number = "E-3" },
            { rank = "Lead Pilot", short = "LPT", number = "E-4" },
        },
        nco = {
            { rank = "Flight Sergeant", short = "FSG", number = "N-1" },
            { rank = "Flight Chief", short = "FCF", number = "N-2" },
            { rank = "Senior Flight Chief", short = "SFC", number = "N-3" },
            { rank = "Master Flight Chief", short = "MFC", number = "N-4" },
            { rank = "Warrant Officer", short = "WO", number = "N-5" },
            { rank = "Chief Warrant Officer", short = "CWO", number = "N-6" },
        },
        co = {
            { rank = "Flight Officer", short = "FO", number = "O-1" },
            { rank = "Flight Lieutenant", short = "FLT", number = "O-2" },
            { rank = "Flight Captain", short = "FCPT", number = "O-3" },
            { rank = "Squadron Leader", short = "SQLD", number = "O-4" },
            { rank = "Wing Commander", short = "WCDR", number = "O-5" },
            { rank = "Group Captain", short = "GCPT", number = "O-6" },
        },
        staff = {
            { rank = "Flight Commodore", short = "FCM", number = "CO-1" },
            { rank = "Air Marshal", short = "AML", number = "CO-2" },
        },
    },
    ["Inquisitor"] = {
        enlisted = {
            { rank = "Minion", short = "MN", number = "E-1" },
            { rank = "Hopeful", short = "HP", number = "E-2" },
            { rank = "Neophyte", short = "NPT", number = "E-3" },
            { rank = "Acolyte", short = "ACT", number = "E-4" },
        },
        nco = {
            { rank = "Initiate", short = "INT", number = "N-2" },
            { rank = "Adept", short = "APT", number = "N-4" },
            { rank = "Apprentice", short = "APP", number = "N-6" },
        },
        co = {
            { rank = "Warrior", short = "WAR", number = "O-2" },
            { rank = "Marauder", short = "MAR", number = "O-3" },
            { rank = "Prophet", short = "PRT", number = "O-4" },
            { rank = "Lord", short = "LRD", number = "O-5" },
            { rank = "Overseer", short = "OVS", number = "O-6" },
        },
        staff = {
            { rank = "Named Inquisitor", short = "IQ", number = "CO-1" },
            { rank = "Second Sister", short = "2nd", number = "CO-2" },
        },
    },
    ["Guardsmen"] = {
        enlisted = {
            { rank = "Trainee", short = "TRNE", number = "E-1" },
            { rank = "Guard", short = "GRD", number = "E-4" },
        },
        nco = {
            { rank = "Senior Guard", short = "SGD", number = "N-5" },
        },
        co = {
            { rank = "Elite Guard", short = "EGD", number = "O-3" },
            { rank = "Sergeant", short = "SGT", number = "O-6" },
        },
        staff = {
            { rank = "Lieutenant", short = "LT", number = "CO-1" },
            { rank = "Captain", short = "CPT", number = "CO-4" },
        },
    },
    -- Additional branches if needed
}


local branchFactionMap = {
    Army = {FACTION_501ST_LEGION,FACTION_SHOCK_SECURITY,FACTION_STORMTROOPER,FACTION_PURGE_DIVISION}, -- Replace with actual faction IDs for the Army
    Navy = {FACTION_IMPERIAL_FLEET}, -- Replace with actual faction IDs for the Navy
    TIE = {FACTION_TIE_CORPS},
    Inquisitor = {FACTION_INQUISITION},
    Guardsmen = {FACTION_ROYAL_GUARD},
    Admin = {FACTION_HIGH_COMMAND},
}

function GetPlayerBranch(char)
    local factionID = char:GetFaction()

    for branch, factions in pairs(branchFactionMap) do
        if table.HasValue(factions, factionID) then
            return branch
        end
    end

    return nil -- or a default value if you prefer
end

function TranslateRank(char, newBranch)
    local currentRankNumber = char:GetData("rankNumber")
    if not currentRankNumber then
        return nil -- No current rank number found
    end

    -- Finding the category (enlisted, nco, etc.) in the new branch that contains the rank number
    for category, ranks in pairs(rankSystem[newBranch]) do
        for _, rankInfo in ipairs(ranks) do
            if rankInfo.number == currentRankNumber then
                -- Set the new rank in the character data
                char:SetData("rank", rankInfo.rank)
                char:SetData("rankShort", rankInfo.short)
                char:SetData("rankNumber", rankInfo.number)
                return rankInfo
            end
        end
    end

    return nil -- No corresponding rank found in the new branch
end



function GetRankIndex(ranks, rankIdentifier)
    -- Convert the input rank identifier to lower case for case-insensitive comparison
    local lowerRankIdentifier = string.lower(rankIdentifier)
    
    for index, rankInfo in ipairs(ranks) do
        -- Convert the rank identifiers to lower case before comparison
        if string.lower(rankInfo.rank) == lowerRankIdentifier or 
           string.lower(rankInfo.short) == lowerRankIdentifier or 
           rankInfo.number == rankIdentifier then
            return index
        end
    end
    return nil
end

function rankSortingValue(rankInfo)
    local prefixOrder = {E = 0, N = 1, O = 2, CO = 3}
    local prefix = rankInfo.number:sub(1, 1) -- Extract the prefix (E, N, O)
    local num = tonumber(rankInfo.number:sub(3)) -- Extract the numeric part

    -- Calculate a sorting value based on prefix and numeric part
    return (prefixOrder[prefix] or 0) * 1000 + num
end

function GetRanksInBranch(branch)
    --print("GetRanksInBranch called with branch:", branch)
    local branchRanks = rankSystem[branch]
    if not branchRanks then
        print("No ranks found for branch:", branch)
        return {}
    end

    local sortedRanks = {}
    for category, rankList in pairs(branchRanks) do
        for _, rankInfo in ipairs(rankList) do
            table.insert(sortedRanks, rankInfo)
        end
    end

    -- Sort the ranks based on the calculated sorting value
    table.sort(sortedRanks, function(a, b) return rankSortingValue(a) < rankSortingValue(b) end)

    --print("Sorted ranks in branch:", branch)
    --PrintTable(sortedRanks) -- Assuming PrintTable is a function to print the table contents
    return sortedRanks
end

function ValidateRank(branch, rankIdentifier)
    local ranks = GetRanksInBranch(branch)
    for _, rankInfo in ipairs(ranks) do
        if rankInfo.rank == rankIdentifier or rankInfo.short == rankIdentifier or rankInfo.number == rankIdentifier then
            return rankInfo
        end
    end
    return nil
end

function CanPlayerPromote(promoterChar, targetChar)
    -- Check if the promoter is an admin
    if promoterChar:GetPlayer():IsAdmin() then
        return true
    end

    local promoterBranch = GetPlayerBranch(promoterChar)
    local targetBranch = GetPlayerBranch(targetChar)

    -- Ensure promoter and target are in the same branch
    -- if promoterBranch ~= targetBranch then
    --     return false, "You can only promote members within your own branch."
    -- end

    -- Check if the promoter is at least a CO in their branch
    local promoterRankNumber = promoterChar:GetData("rankNumber")
    for category, ranks in pairs(rankSystem[promoterBranch]) do
        if category == "co" or category == "staff" then
            for _, rankInfo in ipairs(ranks) do
                if rankInfo.number == promoterRankNumber then
                    return true
                end
            end
        end
    end

    return false, "You must be at least a Commissioned Officer or higher to promote someone."
end

function FindNextRank(branch, currentRankNumber)
    local ranks = GetRanksInBranch(branch)
    local currentRankIndex = GetRankIndex(ranks, currentRankNumber)

    if currentRankIndex and ranks[currentRankIndex + 1] then
        return ranks[currentRankIndex + 1]
    end

    return nil
end

-- hook and broadcast func to update player rank cache.
if SERVER then
    util.AddNetworkString("UpdatePlayerRank")
    PLUGIN.lastBroadcastedRanks = PLUGIN.lastBroadcastedRanks or {}

    function BroadcastPlayerRank(char)
        local client = char:GetPlayer()
        local rank = char:GetData("rank", "Unknown")
        local rankNumber = char:GetData("rankNumber", "N/A")

        net.Start("UpdatePlayerRank")
            net.WriteEntity(client)
            net.WriteString(rank)
            net.WriteString(rankNumber)
        net.Broadcast()
    end


    function PLUGIN:PlayerLoadedChar(client, char, lastChar)
        timer.Simple(0.1, function()
            BroadcastPlayerRank(char)
        end)
    end

    

    function PLUGIN:UpdateNewPlayerWithRanks(newClient)
        for _, player in ipairs(player.GetAll()) do
            local char = player:GetCharacter()
            if char then
                BroadcastPlayerRank(char, newClient)
            end
        end
    end

function PLUGIN:PlayerSpawn(client)
    local char = client:GetCharacter()
    if char then
        local currentRank = char:GetData("rank")
        local currentRankNumber = char:GetData("rankNumber")
        local lastKnownRank = self.lastBroadcastedRanks[client:SteamID()] or {}

        -- Check if the rank has changed or if it's the player's first spawn
        if lastKnownRank.rank ~= currentRank or lastKnownRank.rankNumber ~= currentRankNumber or not lastKnownRank.initialized then
            BroadcastPlayerRank(char)

            -- Update the last known rank
            self.lastBroadcastedRanks[client:SteamID()] = {
                rank = currentRank,
                rankNumber = currentRankNumber,
                initialized = true
            }
        end
    end
end


function PLUGIN:PostPlayerLoadout(client)
    local char = client:GetCharacter()
    if char then
        local currentRank = char:GetData("rank")
        local currentRankNumber = char:GetData("rankNumber")
        local lastKnownRank = self.lastBroadcastedRanks[client:SteamID()] or {}

        -- Check if the rank has changed or if it's the player's first spawn
        if lastKnownRank.rank ~= currentRank or lastKnownRank.rankNumber ~= currentRankNumber or not lastKnownRank.initialized then
            BroadcastPlayerRank(char)

            -- Update the last known rank
            self.lastBroadcastedRanks[client:SteamID()] = {
                rank = currentRank,
                rankNumber = currentRankNumber,
                initialized = true
            }
        end
    end
end


function PLUGIN:PlayerLoadedCharacter(client, character, currentChar)
    self:UpdateNewPlayerWithRanks(client)
    -- Always clear or update the rank cache when a character is loaded
    local steamID = client:SteamID()
    local currentRank = character:GetData("rank", "Unknown")
    local currentRankNumber = character:GetData("rankNumber", "N/A") -- Default to "N/A" if no rank number is set

    -- Check if this is a new character load or a switch to a different character
    if not currentChar or (currentChar and currentChar:GetID() ~= character:GetID()) then
        -- If switching characters or loading for the first time, broadcast the rank
        BroadcastPlayerRank(character)

        -- Update the last known rank and character ID in the cache
        self.lastBroadcastedRanks[steamID] = {
            charID = character:GetID(),
            rank = currentRank,
            rankNumber = currentRankNumber,
            initialized = true
        }
    end
end

end





function PromotePlayer(targetChar, promoterChar)
    local targetBranch = GetPlayerBranch(targetChar)
    local isPromoterAdmin = promoterChar:GetPlayer():IsAdmin()
    local targetRankNumber = targetChar:GetData("rankNumber")

    -- Admins can promote to any rank directly
    if isPromoterAdmin then
        local nextRank = FindNextRank(targetBranch, targetRankNumber)
        if nextRank then
            targetChar:SetData("rank", nextRank.rank)
            targetChar:SetData("rankShort", nextRank.short)
            targetChar:SetData("rankNumber", nextRank.number)
            BroadcastPlayerRank(targetChar)
            return true
        else
            return false, "No higher rank available for promotion."
        end
    end

    -- Non-admin promotion logic
    local canPromote, reason = CanPlayerPromote(promoterChar, targetChar)
    if not canPromote then
        return false, reason
    end

    local nextRank = FindNextRank(targetBranch, targetRankNumber)
    if nextRank then
        targetChar:SetData("rank", nextRank.rank)
        targetChar:SetData("rankShort", nextRank.short)
        targetChar:SetData("rankNumber", nextRank.number)
        BroadcastPlayerRank(targetChar)
        return true
    else
        return false, "No higher rank available for promotion."
    end
end


function FindPreviousRank(branch, currentRankNumber)
    local ranks = GetRanksInBranch(branch)
    local currentRankIndex = GetRankIndex(ranks, currentRankNumber)

    if currentRankIndex and currentRankIndex > 1 then
        return ranks[currentRankIndex - 1]
    end

    return nil
end

function DemotePlayer(targetChar, demoterChar)
    local targetBranch = GetPlayerBranch(targetChar)
    local isDemoterAdmin = demoterChar:GetPlayer():IsAdmin()
    local targetRankNumber = targetChar:GetData("rankNumber")

    -- Admins can demote without restriction
    if isDemoterAdmin then
        local previousRank = FindPreviousRank(targetBranch, targetRankNumber)
        if previousRank then
            targetChar:SetData("rank", previousRank.rank)
            targetChar:SetData("rankShort", previousRank.short)
            targetChar:SetData("rankNumber", previousRank.number)
            BroadcastPlayerRank(targetChar)
            return true
        else
            return false, "No lower rank available for demotion."
        end
    end

    -- Non-admin demotion logic
    local canDemote, reason = CanPlayerPromote(demoterChar, targetChar) -- Reusing the CanPlayerPromote function
    if not canDemote then
        return false, reason
    end

    local previousRank = FindPreviousRank(targetBranch, targetRankNumber)
    if previousRank then
        targetChar:SetData("rank", previousRank.rank)
        targetChar:SetData("rankShort", previousRank.short)
        targetChar:SetData("rankNumber", previousRank.number)
        BroadcastPlayerRank(targetChar)
        return true
    else
        return false, "No lower rank available for demotion."
    end
end

ix.command.Add("Promote", {
    description = "Promotes a player to the next rank.",
    adminOnly = false,
    arguments = {
        ix.type.character -- The character to be promoted.
    },
    OnRun = function(self, client, targetChar)
        local promoterChar = client:GetCharacter()

        if not promoterChar then
            return "You do not have a character."
        end

        local success, msg = PromotePlayer(targetChar, promoterChar)
        return msg or (success and "Player has been promoted." or "Failed to promote the player.")
    end
})

ix.command.Add("Demote", {
    description = "Demotes a player to the previous rank.",
    adminOnly = false,
    arguments = {
        ix.type.character -- The character to be demoted.
    },
    OnRun = function(self, client, targetChar)
        local demoterChar = client:GetCharacter()

        if not demoterChar then
            return "You do not have a character."
        end

        local success, msg = DemotePlayer(targetChar, demoterChar)
        return msg or (success and "Player has been demoted." or "Failed to demote the player.")
    end
})

ix.command.Add("SetRank", {
    description = "Sets the rank of a player.",
    adminOnly = true,
    arguments = {
        ix.type.character, -- The character whose rank is to be set.
        ix.type.string -- The new rank identifier (name, short name, or number).
    },
    OnRun = function(self, client, targetChar, rankIdentifier)
        -- Convert rankIdentifier to lower case for case-insensitive comparison
        local lowerRankIdentifier = string.lower(rankIdentifier)

        -- Get the branch of the target character
        local targetBranch = GetPlayerBranch(targetChar)
        if not targetBranch then
            return "Target character does not belong to any branch."
        end

        -- Try to get the rank by name, short name, or number (case-insensitive)
        local newRank = nil
        local ranks = GetRanksInBranch(targetBranch)

        for _, rankInfo in ipairs(ranks) do
            if string.lower(rankInfo.rank) == lowerRankIdentifier or 
               string.lower(rankInfo.short) == lowerRankIdentifier or 
               string.lower(rankInfo.number) == lowerRankIdentifier then
                newRank = rankInfo
                break
            end
        end

        if not newRank then
            return "Invalid rank identifier for the target's branch."
        end

        -- Set the new rank to the target character
        targetChar:SetData("rank", newRank.rank)
        targetChar:SetData("rankShort", newRank.short)
        targetChar:SetData("rankNumber", newRank.number)
        BroadcastPlayerRank(targetChar)

        return "Rank of " .. targetChar:GetName() .. " set to " .. newRank.rank .. " (" .. newRank.number .. ")"
    end
})
function PLUGIN:OnCharacterCreated(client, character)

    local defaultRank = {
        rank = "Cadet",
        short = "CDT",
        number = "E0"
    }

    character:SetData("rank", defaultRank.rank)
    character:SetData("rankShort", defaultRank.short)
    character:SetData("rankNumber", defaultRank.number)

end





if CLIENT then
    playerRanks = {}

    net.Receive("UpdatePlayerRank", function()
        local player = net.ReadEntity()
        local rank = net.ReadString()
        local rankNumber = net.ReadString()

        if IsValid(player) then
            playerRanks[player:SteamID64()] = { rank = rank, number = rankNumber }
        end
    end)


    -- Add initial rank setup to character creation
    function PLUGIN:OnCharacterCreated(client, character)
        PLUGIN:SetInitialRank(character)
    end


    function PLUGIN:PopulateCharacterInfo(client, character, tooltip)
    local rankData = playerRanks[client:SteamID64()] or { rank = "Cadet", number = "N/A" }
        local rankText = "Rank: " .. rankData.rank .. " (" .. rankData.number .. ")"

            local rankRow = tooltip:AddRow("rank")
            rankRow:SetText(rankText)
            rankRow:SizeToContents()
            rankRow:SetBackgroundColor(Color(0, 97, 117))

    end
end