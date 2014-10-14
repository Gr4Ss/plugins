local RECIPE = PLUGIN.recipe:New();

RECIPE.name = "Crafting: UU-branded Melon Slices";
RECIPE.uniqueID = "recipe_uu_melon_slice";
RECIPE.model = "models/props_junk/watermelon01_chunk01b.mdl";
RECIPE.category = "Consumables";
RECIPE.description = "Split a uu-branded melon into several slices.";
RECIPE.ingredients = {["uu_melon"] = 1};
RECIPE.result = {["uu_melon_slice"] = 5};
RECIPE.hidden = false;

RECIPE:Register();