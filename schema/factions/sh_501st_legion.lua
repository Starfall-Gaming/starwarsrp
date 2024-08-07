FACTION.name = "501st Legion"
FACTION.description = "DESCRIPTION"
FACTION.color = Color(29, 68, 242)
FACTION.faction = FACTION_501ST_LEGION
FACTION.isDefault = false

function FACTION:GetDefaultName(client)
end

if (SERVER) then
    function FACTION:OnCharacterCreated(client, character)
    end

    function FACTION:OnSpawn(client)
    end

    function FACTION:OnTransferred(character)
    end
end

FACTION_501ST_LEGION = FACTION.index