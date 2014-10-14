local RECIPE = PLUGIN.recipe:New();

RECIPE.name = "Crafting: Melon Slices";
RECIPE.uniqueID = "recipe_melon_slice";
RECIPE.model = "models/props_junk/watermelon01_chunk01b.mdl";
RECIPE.category = "Consumables";
RECIPE.description = "Split a melon into slices of delicious melon.";
RECIPE.ingredients = {["melon"] = 1};
RECIPE.result = {["melon_slice"] = 5};
RECIPE.hidden = false;

RECIPE:Register();