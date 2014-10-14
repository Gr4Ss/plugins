local RECIPE = PLUGIN.recipe:New();

RECIPE.name = "Cooking: Canned Beans";
RECIPE.uniqueID = "recipe_canned_beans";
RECIPE.model = "models/bioshockinfinite/baked_beans.mdl";
RECIPE.category = "Consumables";
RECIPE.description = "Cook some canned beans on a furnace.";
RECIPE.ingredients = {["uncooked_canned_beans"] = 1};
RECIPE.result = {["canned_beans"] = 1};
RECIPE.station = "furnace";
RECIPE.hidden = false;

RECIPE:Register();