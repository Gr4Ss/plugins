
local RECIPE = PLUGIN.recipe:New();

RECIPE.name = "Sewing: Pouch";
RECIPE.uniqueID = "recipe_pouch";
RECIPE.model = "models/props_junk/garbage_bag001a.mdl";
RECIPE.category = "Sewing";
RECIPE.description = "Knit a small pouch together to hold some extra items.";
RECIPE.ingredients = {["cloth_scraps"] = 1};
RECIPE.tools = {"sewing_kit"};
RECIPE.result = {["pouch"] = 1};

RECIPE:Register();