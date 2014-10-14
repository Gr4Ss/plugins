local RECIPE = PLUGIN.recipe:New();

RECIPE.name = "Sewing: Gas mask Uniform";
RECIPE.uniqueID = "recipe_gasmask_uniform";
RECIPE.model = "models/lambdamovement.mdl";
RECIPE.category = "Sewing";
RECIPE.description = "Using your knowledge, you can stitch together armored clothing with a gas mask!";
RECIPE.ingredients = {["cloth_scraps"] = 4, ["chunk_of_plastic"] = 2, ["kevlar_vest"] = 1, ["armor_scraps"] = 1};
RECIPE.result = {["gasmask_uniform"] = 1};
RECIPE.tools = {"sewing_kit"};
RECIPE.hidden = false;
RECIPE.flag = "S";

RECIPE:Register();