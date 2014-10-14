local RECIPE = PLUGIN.recipe:New();

RECIPE.name = "Breakdown: Laborer Uniform";
RECIPE.uniqueID = "recipe_breakdown_laborer_uniform";
RECIPE.model = "models/betacz/group01/male_01.mdl";
RECIPE.category = "Breakdown";
RECIPE.description = "Cutting labourer uniforms, you can recover cloth parts.";
RECIPE.ingredients = {["laborer_uniform"] = 1};
RECIPE.result = {["cloth_scraps"] = {1, 1, 2}};
RECIPE.tools = {"sewing_kit"};
RECIPE.hidden = false;

RECIPE:Register();