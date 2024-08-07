PLUGIN.name = "Model Fixer"
PLUGIN.author = "Froggles"
PLUGIN.desc = "Changes the anims for certain models to use the player anims."

--ix.anim.SetModelClass("model", "player")
local models = player_manager.AllValidModels()
for _, class in pairs(ix.class.list) do
    class.model = class.model or ""
    if type(class.model) == "string" then
            models[#models] = class.model
    elseif type(class.model) == "table" then
        for _, model in pairs(class.model) do
            models[#models] = model
        end
    end
end

for _, model in pairs(models) do
    if ix.anim.GetModelClass(model) != "player" then
        ix.anim.SetModelClass(model, "player")
        -- if SERVER then print("[Model Anim Fix] " .. model) end
    end
end

ix.anim.SetModelClass("models/defcon/stan/1stinfantry/trooper/1stinfantrytrooper.mdl", "player")
