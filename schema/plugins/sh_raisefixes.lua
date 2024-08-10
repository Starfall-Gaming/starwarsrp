local PLUGIN = PLUGIN

PLUGIN.name = "Weapon Raise Fixes"
PLUGIN.description = "Automatically adds weapons to be always raised"
PLUGIN.author = "Froggles"
PLUGIN.schema = "Any"

ALWAYS_RAISED = ALWAYS_RAISED or {}

local weaponPrefixes = {
    "weapon_lightsaber_",
    "rw_sw_",
    "deathtrooper",
    "dt_",
    "smooley_royalstaff",
    "sfw_",
    "pack_swswep_",
    "seal6-tac-insert",
}

local weapons = weapons.GetList()
for _, wep in pairs(weapons) do
    local class = wep.ClassName
    for _, prefix in pairs(weaponPrefixes) do
        if string.StartWith(class, prefix) then ALWAYS_RAISED[class] = true end
    end
end
