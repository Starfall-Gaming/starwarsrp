local PLUGIN = PLUGIN

PLUGIN.name = "Binds"
PLUGIN.description = "Makes it easier to bind keys to commands forcefully for players."
PLUGIN.author = "Riggs"
PLUGIN.schema = "Any"
PLUGIN.license = [[
Copyright 2024 Riggs

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]
PLUGIN.readme = [[
This plugin allows you to bind keys to commands forcefully for players.

To bind a key to a command, you can use many different methods. Here are some examples:

Here is an example of binding the F1 key to the command "ix_togglethirdperson" as a function:
```lua
PLUGIN.binds[KEY_F1] = function(ply, bind, pressed)
    RunConsoleCommand("ix_togglethirdperson")
end
```

Or you can bind the F2 key to the command "ix_togglethirdperson" as a string:
```lua
PLUGIN.binds[KEY_F2] = "ix_togglethirdperson"
```

Along with that, you can bind the F3 key to the command "ix_togglethirdperson" and "say Hello, world!" as a table which must take strings:
```lua
PLUGIN.binds[KEY_F3] = {"ix_togglethirdperson", "say Hello, world!"}
```
]]

if ( SERVER ) then return end

PLUGIN.binds = PLUGIN.binds or {}
PLUGIN.antispam_time = 0.1 -- Seconds

PLUGIN.binds[KEY_F2] = "ix_togglethirdperson"
PLUGIN.binds[KEY_F4] = function() hook.Run("ShowSpare2") end

hook.Add("PlayerButtonDown", "CustomThirdPersonBind", function(ply, button)
    if !PLUGIN.binds[button] or not IsFirstTimePredicted() then return end

    ply.AntiSpamBinds = ply.AntiSpamBinds or {}
    ply.AntiSpamBinds[button] = ply.AntiSpamBinds[button] or CurTime()
    local timeRemaining = ply.AntiSpamBinds[button] - CurTime()
    if ply.AntiSpamBinds[button] > CurTime() then return end
    ply.AntiSpamBinds[button] = CurTime() + PLUGIN.antispam_time

    local data = PLUGIN.binds[button]
    if ( data ) then
        // comment: the power of yandere dev else if statements
        if ( type(data) == "function" ) then
            return data()
        elseif ( type(data) == "string" ) then
            LocalPlayer():ConCommand(data)
        elseif ( type(data) == "table" ) then
            for k, v in ipairs(data) do
                LocalPlayer():ConCommand(v)
            end
        else
            LocalPlayer():ConCommand(data)
        end
    end
end)