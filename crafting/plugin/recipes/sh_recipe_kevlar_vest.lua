local RECIPE = PLUGIN.recipe:New();

RECIPE.name = "Crafting: Kevlar Vest";
RECIPE.uniqueID = "recipe_kevlar_vest";
RECIPE.model = "models/kevlarvest/kevlarlite.mdl";
RECIPE.category = "Crafting";
RECIPE.description = "Using your past knowledge, you able to fabricate an armored vest from scraps.";
RECIPE.ingredients = {["cloth_scraps"] = 2, ["armor_scraps"] = 1};
RECIPE.result = {["kevlar_vest"] = 1};
RECIPE.hidden = false;
RECIPE.flag = "A";

RECIPE:Register();