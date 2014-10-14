local RECIPE = PLUGIN.recipe:New();

RECIPE.name = "Brewing: Beer";
RECIPE.uniqueID = "recipe_beer";
RECIPE.model = "models/bioshockinfinite/loot_bottle_lager.mdl";
RECIPE.category = "Consumables";
RECIPE.description = "Using yeast and hops, you can create some decent beer.";
RECIPE.ingredients = {["yeast"] = 1, ["hops"] = 1, ["water_bottle"] = 1};
RECIPE.result = {["beer"] = {3, 3, 4, 5}};
RECIPE.station = "water_filter";
RECIPE.hidden = false;

RECIPE:Register();