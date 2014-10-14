
local RECIPE = PLUGIN.recipe:New();

RECIPE.name = "Crafting: Zip Tie";
RECIPE.uniqueID = "recipe_zip_tie";
RECIPE.model = "models/Items/CrossbowRounds.mdl";
RECIPE.category = "Crafting";
RECIPE.description = "Being careful and cunning, you can create a zip tie from cables.";
RECIPE.ingredients = {["cables"] = 1};
RECIPE.result = {["zip_tie"] = 1};
RECIPE.flag = "A";

RECIPE:Register();