PLUGIN.name = "Physgun Freeze"
PLUGIN.author = "Kieran"
PLUGIN.description = "Allows staff to freeze players by right-clicking with the physgun."

if (SERVER) then
    function PLUGIN:PhysgunPickup(player, target)
        if (target:IsPlayer() and player:IsAdmin()) then
            -- Allow physgun pickup if the player is an admin
            return true
        end
    end

    function PLUGIN:PhysgunDrop(player, target)
        if (target:IsPlayer() and player:IsAdmin() and player:KeyDown(IN_ATTACK2)) then
            if (target:IsFrozen()) then
                target:Freeze(false)
                player:Notify(target:Name() .. " has been unfrozen.")
            else
                target:Freeze(true)
                player:Notify(target:Name() .. " has been frozen.")
            end
        end
    end
end