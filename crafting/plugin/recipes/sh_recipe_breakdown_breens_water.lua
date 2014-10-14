local RECIPE = PLUGIN.recipe:New();

RECIPE.name = "Breakdown: Breen's Water Cans";
RECIPE.uniqueID = "recipe_breakdown_breens_water";
RECIPE.model = "models/props_junk/PopCan01a.mdl";
RECIPE.category = "Breakdown";
RECIPE.description = "By smelting some cans, you can create pieces of metal used for things.";
RECIPE.ingredients = {["empty_can"] = 3};
RECIPE.result = {["piece_of_metal"] = {1, 1, 2}};
RECIPE.station = "furnace";
RECIPE.hidden = false;

RECIPE:Register();