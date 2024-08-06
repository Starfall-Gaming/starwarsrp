-- table imports
ix.darkrp = ix.darkrp or {}
ix.darkrp.categories = ix.darkrp.categories or {}
ix.darkrp.jobs = ix.darkrp.jobs or {}
ix.darkrp.disabledDefaults = ix.darkrp.disabledDefaults or {}
ix.darkrp.rpteams = ix.darkrp.rpteams or {}

function ix.darkrp.GetCategory(id)
    if ix.darkrp.categories[id] then return ix.darkrp.categories[id] end
    local faction = ix.faction.indices[id]
    local category = {
        canSee = true,
        categorises = "jobs",
        color = faction.color,
        members = {},
        name = faction.name,
        startExpanded = true,
    }

    ix.darkrp.categories[id] = category
    return category
end

function ix.darkrp.GetJob(id)
    if ix.darkrp.jobs[id] then return ix.darkrp.jobs[id] end
    local class = ix.class.list[id]
    local job = {
        canDemote = false,
        candemote = false,
        category = ix.faction.indices[class.faction].name or "",
        color = ix.faction.indices[class.faction].color or Color(255, 255, 255, 255),
        command = class.uniqueID or "",
        description = class.description or "",
        hasLicense = false,
        max = class.limit or 0,
        model = CLASS.model or "models/player/Group01/male_01.mdl",
        name = class.name or "",
        salary = 0,
        sortOrder = id,
        vote = false,
        weapons = class.weapons or {},
        customCheck = function (ply)
            if class.CanSwitchTo then
                return class.CanSwitchTo(ply, class)
            else
                return false
            end
        end,
        canSee = true,
        team = #ix.faction.indices + id,
        PlayerSpawn = function(ply) end,
        admin = 0,
    }

    ix.darkrp.jobs[id] = job
    return job
end

function ix.darkrp.getCategories()
    local categories = {
        ["jobs"] = {},
        ["weapons"] = {},
        ["shipments"] = {},
        ["ammo"] = {},
        ["entities"] = {},
        ["vehicles"] = {},
    }

    for id, faction in pairs(ix.faction.indices) do
        -- disallow duplicates
        if categories.jobs[id] then continue end

        local category = ix.darkrp.GetCategory(id)
        categories.jobs[id] = category
    end

    for id, class in pairs(ix.class.list) do
        categories.jobs[class.faction].members = categories.jobs[class.faction].members or {}
        -- disallow duplicates

        local job = ix.darkrp.GetJob(id)
        categories.jobs[class.faction].members[class.uniqueID] = job
    end

    return categories
end

function ix.darkrp.getLaws()
    return {}
end

function ix.darkrp.getPhrase(key, parameters)
    return key
end

function ix.darkrp.formatMoney(money)
    return "$" .. (money or 0)
end

-- Replaces darkrp console command
local function ConCommand(ply, _, args)
    if not args[1] then return end
    local cmd = string.lower(args[1])
    for id, class in pairs(ix.class.list) do
        if cmd == class.uniqueID then ix.darkrp.FactionSwitch(ply, class.faction, id) end
    end
end
concommand.Add("darkrp", ConCommand)

-- Set up class teams
do
    for id, class in pairs(ix.class.list) do
        -- class team id = class id + number of factions
        team.SetUp(#ix.faction.indices + id, class.name or "Unknown", ix.faction.indices[class.faction].color or Color(125, 125, 125))

        ix.darkrp.rpteams[id] = ix.darkrp.GetJob(id)
    end
end

DarkRP = ix.darkrp
RPExtraTeams = ix.darkrp.rpteams