local RECIPE = PLUGIN.recipe:New();

RECIPE.name = "Cooking: UU-Branded Chinese Takeout";
RECIPE.uniqueID = "recipe_uu_chinese_takeout";
RECIPE.model = "models/props_junk/garbage_takeoutcarton001a.mdl";
RECIPE.category = "Consumables";
RECIPE.description = "Fry those delicious noodles on a pan.";
RECIPE.ingredients = {["uncooked_uu_chinese_takeout"] = 1};
RECIPE.result = {["uu_chinese_takeout"] = 1};
RECIPE.station = "furnace";
RECIPE.hidden = false;

RECIPE:Register();