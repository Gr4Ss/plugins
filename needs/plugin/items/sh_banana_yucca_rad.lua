local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Irradiated Banana Yucca";
ITEM.uniqueID = "banana_yucca_rad";
ITEM.model = "models/props/cs_italy/bananna.mdl";
ITEM.value = 4;
ITEM.type = "consumable";
ITEM.cost = 0;
ITEM.weight = 0.1;
ITEM.hunger = 9;
ITEM.thirst = 15;
ITEM.rads = 8;
ITEM.business = false;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A fruit harvested from banana yucca plants. It doesn't look right.";

ITEM:Register();
