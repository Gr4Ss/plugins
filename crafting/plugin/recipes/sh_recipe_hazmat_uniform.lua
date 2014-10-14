local RECIPE = PLUGIN.recipe:New();

RECIPE.name = "Sewing: Hazmat Uniform";
RECIPE.uniqueID = "recipe_hazmat_uniform";
RECIPE.model = "models/humans/airex/airex_male.mdl";
RECIPE.category = "Sewing";
RECIPE.description = "With your knowledge, you are able to create a lightweight and armored outfit with a re-breather.";
RECIPE.ingredients = {["industrial_uniform"] = 1, ["chunk_of_plastic"] = 2, ["armor_scraps"] = 3, ["charcoal_filter"] = 1, ["box_screws"] = 1, ["cloth_scraps"] = 3};
RECIPE.result = {["hazmat_uniform"] = 1};
RECIPE.tools = {"sewing_kit"};
RECIPE.hidden = false;
RECIPE.flag = "S";

RECIPE:Register();