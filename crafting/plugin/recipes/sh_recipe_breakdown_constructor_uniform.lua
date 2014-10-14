local RECIPE = PLUGIN.recipe:New();

RECIPE.name = "Breakdown: Constructor Uniform";
RECIPE.uniqueID = "recipe_breakdown_constructor_uniform";
RECIPE.model = "models/betacz/group02/male_01.mdl";
RECIPE.category = "Breakdown";
RECIPE.description = "Cutting constructor uniforms, you can recover cloth parts.";
RECIPE.ingredients = {["constructor_uniform"] = 1};
RECIPE.result = {["cloth_scraps"] = {1, 1, 2}};
RECIPE.tools = {"sewing_kit"};
RECIPE.hidden = false;

RECIPE:Register();