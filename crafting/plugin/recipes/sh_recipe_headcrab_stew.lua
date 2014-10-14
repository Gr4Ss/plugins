local RECIPE = PLUGIN.recipe:New();

RECIPE.name = "Cooking: Headcrab Stew";
RECIPE.uniqueID = "recipe_headcrab_stew";
RECIPE.model = "models/bioshockinfinite/canned_soup.mdl";
RECIPE.category = "Consumables";
RECIPE.description = "Create some delicious stew based on headcrabs.";
RECIPE.ingredients = {["uncooked_headcrab_stew"] = 1};
RECIPE.result = {["headcrab_stew"] = 1};
RECIPE.station = "furnace";
RECIPE.hidden = false;

RECIPE:Register();