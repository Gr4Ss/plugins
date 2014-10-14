local RECIPE = PLUGIN.recipe:New();

RECIPE.name = "Sewing: Industrial Uniform";
RECIPE.uniqueID = "recipe_industrial_uniform";
RECIPE.model = "models/citizen_17.mdl";
RECIPE.category = "Sewing";
RECIPE.description = "Sewing together tough cloth, plastic and some armored scraps, you can fabricate an Industrial Uniform that holds a gas mask.";
RECIPE.ingredients = {["cloth_scraps"] = 4, ["chunk_of_plastic"] = 2, ["armor_scraps"] = 1};
RECIPE.result = {["industrial_uniform"] = 1};
RECIPE.tools = {"sewing_kit"};
RECIPE.hidden = false;
RECIPE.flag = "A";

RECIPE:Register();