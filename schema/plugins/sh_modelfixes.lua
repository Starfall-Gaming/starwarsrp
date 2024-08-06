PLUGIN.name = "Model Fixer"
PLUGIN.author = "Froggles"
PLUGIN.desc = "Changes the anims for certain models to use the player anims."

--ix.anim.SetModelClass("model", "player")
local models = player_manager.AllValidModels()
for _, class in pairs(ix.class.list) do
    class.model = class.model or {}
    for _, model in pairs(class.model) do
        models[#models] = model
    end
end

for _, model in pairs(models) do
    if ix.anim.GetModelClass(model) != "player" then
        ix.anim.SetModelClass(model, "player")
        print("[Model Anim Fix] " .. model)
    end
end