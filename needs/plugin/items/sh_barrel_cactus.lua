local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Barrel Cactus Fruit";
ITEM.uniqueID = "barrel_cactus";
ITEM.model = "models/props_lab/cactus.mdl";
ITEM.value = 36;
ITEM.type = "consumable";
ITEM.cost = 0;
ITEM.weight = 0.15;
ITEM.hunger = 10;
ITEM.thirst = 15;
ITEM.business = false;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A fruit harvested from barrel cacti. It feels fresh.";

ITEM:Register();
