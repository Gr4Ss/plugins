local RECIPE = PLUGIN.recipe:New();

RECIPE.name = "Cooking: Chinese Takeout";
RECIPE.uniqueID = "recipe_chinese_takeout";
RECIPE.model = "models/props_junk/garbage_takeoutcarton001a.mdl";
RECIPE.category = "Consumables";
RECIPE.description = "Fry delicious noodles on a pan.";
RECIPE.ingredients = {["uncooked_chinese_takeout"] = 1};
RECIPE.result = {["chinese_takeout"] = 1};
RECIPE.station = "furnace";
RECIPE.hidden = false;

RECIPE:Register();