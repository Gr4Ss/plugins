local RECIPE = PLUGIN.recipe:New();

RECIPE.name = "Breakdown: Breen's Water Cans (No Furnace)";
RECIPE.uniqueID = "recipe_breakdown_breens_water_nofurnace";
RECIPE.model = "models/props_junk/PopCan01a.mdl";
RECIPE.category = "Breakdown";
RECIPE.description = "By breaking some cans, you can create pieces of metal used for things.";
RECIPE.ingredients = {["empty_can"] = 5};
RECIPE.result = {["piece_of_metal"] = {1, 1, 2}};
RECIPE.hidden = false;

RECIPE:Register();