local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Irradiated Absinthe";
ITEM.uniqueID = "absinthe_rad";
ITEM.model = "models/props_junk/glassjug01.mdl";
ITEM.value = 14;
ITEM.type = "consumable";
ITEM.cost = 0;
ITEM.weight = 1.5;
ITEM.thirst = 15;
ITEM.rads = 18;
ITEM.drunkTime = 325;
ITEM.junk = "empty_bottle_absinthe";
ITEM.business = false;
ITEM.useText = "Drink";
ITEM.category = "Consumables";
ITEM.description = "A fancy-shaped bottle. It has a foul scent, a funny smell and a high alcohol count.";

ITEM:Register();
