local RECIPE = PLUGIN.recipe:New() ;

RECIPE.name = "Brewing: Moonshine";
RECIPE.uniqueID = "recipe_moonshine";
RECIPE.model = "models/props_junk/glassjug01.mdl";
RECIPE.category = "Consumables";
RECIPE.description = "Using your distillation knowledge, you are able to brew some potent, home-made liquor";
RECIPE.ingredients = {["yeast"] = 1, ["water_bottle"] = 1, ["spices"] = 1};
RECIPE.result = {["moonshine"] = 1};
RECIPE.station = "water_filter";
RECIPE.hidden = false;
RECIPE.flag = "A";

RECIPE:Register();
