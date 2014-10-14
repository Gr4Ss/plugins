local RECIPE = PLUGIN.recipe:New();

RECIPE.name = "UU-branded Cheese Wedges";
RECIPE.uniqueID = "recipe_uu_cheese_wedge";
RECIPE.model = "models/bioshockinfinite/round_cheese.mdl";
RECIPE.category = "Consumables";
RECIPE.description = "Using a UU-branded cheese wheel, you can split it into cheese wedges.";
RECIPE.ingredients = {["uu_cheese_wheel"] = 1};
RECIPE.result = {["uu_cheese_wedge"] = 5};
RECIPE.hidden = false;

RECIPE:Register();