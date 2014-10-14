local RECIPE = PLUGIN.recipe:New();

RECIPE.name = "Crafting: Cheese Wedges";
RECIPE.uniqueID = "recipe_cheese_wedge";
RECIPE.model = "models/bioshockinfinite/round_cheese.mdl";
RECIPE.category = "Consumables";
RECIPE.description = "Split a cheese wheel into delicious cheese wedges.";
RECIPE.ingredients = {["cheese_wheel"] = 1};
RECIPE.result = {["cheese_wedge"] = 5};
RECIPE.hidden = false;

RECIPE:Register();