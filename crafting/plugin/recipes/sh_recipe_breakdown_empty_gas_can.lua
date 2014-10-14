local RECIPE = PLUGIN.recipe:New();

RECIPE.name = "Breakdown: Empty Gas Can";
RECIPE.uniqueID = "recipe_breakdown_empty_gas_can";
RECIPE.model = "models/props_junk/metalgascan.mdl";
RECIPE.category = "Breakdown";
RECIPE.description = "Destroy a gas can to acquire usable metal parts.";
RECIPE.ingredients = {["empty_gas_can"] = 1};
RECIPE.result = {["metal_parts"] = 1, ["piece_of_metal"] = 1};
RECIPE.station = "furnace";
RECIPE.hidden = false;

RECIPE:Register();