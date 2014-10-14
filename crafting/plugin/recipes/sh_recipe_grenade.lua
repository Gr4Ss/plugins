local RECIPE = PLUGIN.recipe:New();

RECIPE.name = "Crafting: Frag Grenade";
RECIPE.uniqueID = "recipe_grenade";
RECIPE.model = "models/Items/grenadeAmmo.mdl";
RECIPE.category = "Weapons";
RECIPE.description = "With your knowledge, you can create a grenade by using gunpowder.";
RECIPE.ingredients = {["empty_grenade"] = 1, ["gunpowder"] = 2};
RECIPE.result = {["weapon_frag"] = 1};
RECIPE.hidden = false;
RECIPE.flag = "A";

RECIPE:Register();