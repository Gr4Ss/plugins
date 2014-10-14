local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Absinthe";
ITEM.uniqueID = "absinthe";
ITEM.model = "models/props_junk/glassjug01.mdl";
ITEM.value = 8;
ITEM.type = "consumable";
ITEM.cost = 20;
ITEM.weight = 1.35;
ITEM.thirst = 15;
ITEM.drunkTime = 300;
ITEM.junk = "empty_bottle_absinthe";
ITEM.business = true;
ITEM.access = "D";
ITEM.useText = "Drink";
ITEM.category = "Consumables";
ITEM.description = "A fancy-shaped bottle. It has a funny smell and the alcohol count is high.";

ITEM:Register();