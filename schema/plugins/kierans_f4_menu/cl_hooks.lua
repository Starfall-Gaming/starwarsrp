-- cl_hooks.lua

hook.Add("PlayerButtonDown", "OpenImperialF4Menu", function(ply, button)
    if (button == KEY_F4 and IsFirstTimePredicted()) then
        vgui.Create("ixImperialF4Menu")
    end
end)
