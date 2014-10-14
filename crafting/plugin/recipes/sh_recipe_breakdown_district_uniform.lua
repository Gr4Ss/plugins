local RECIPE = PLUGIN.recipe:New();

RECIPE.name = "Breakdown: District Uniform";
RECIPE.uniqueID = "recipe_breakdown_district_uniform";
RECIPE.model = "models/humans/orange1/male_01.mdl";
RECIPE.category = "Breakdown";
RECIPE.description = "Cutting district uniforms, you can acquire some cloth.";
RECIPE.ingredients = {["district_uniform"] = 1};
RECIPE.result = {["cloth_scraps"] = {1, 1, 2}};
RECIPE.tools = {"sewing_kit"};
RECIPE.hidden = false;

RECIPE:Register();