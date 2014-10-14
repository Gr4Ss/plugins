local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Banana Yucca Fruit";
ITEM.uniqueID = "banana_yucca";
ITEM.model = "models/props/cs_italy/bananna.mdl";
ITEM.value = 48;
ITEM.type = "consumable";
ITEM.cost = 0;
ITEM.weight = 0.1;
ITEM.hunger = 12;
ITEM.thirst = 18;
ITEM.rads = 0;
ITEM.business = false;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A fruit harvested from banana yucca plants.";

ITEM:Register();
