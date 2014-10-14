local RECIPE = PLUGIN.recipe:New();

RECIPE.name = "Crafting: Crossbow";
RECIPE.uniqueID = "recipe_crossbow";
RECIPE.model = "models/weapons/w_crossbow.mdl";
RECIPE.category = "Weapons";
RECIPE.description = "With your superior knowledge, you can create a makeshift crossbow that fires powerful bolts heated by a large battery.";
RECIPE.ingredients = {["rusty_crossbow"] = 1, ["wooden_parts"] = 3, ["piece_of_metal"] = 4, ["metal_bar"] = 1, ["chunk_of_plastic"] = 2, ["cloth_scraps"] = 1, ["battery"] = 2, ["box_screws"] = 1};
RECIPE.result = {["weapon_crossbow"] = 1};
RECIPE.tools = {"allen_driver", "wrench", "hammer"};
RECIPE.hidden = false;
RECIPE.flag = "E";

RECIPE:Register();