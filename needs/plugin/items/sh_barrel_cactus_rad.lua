local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Irradiated Barrel Cactus";
ITEM.uniqueID = "barrel_cactus_rad";
ITEM.model = "models/props_lab/cactus.mdl";
ITEM.value = 12;
ITEM.type = "consumable";
ITEM.cost = 0;
ITEM.weight = 0.15;
ITEM.hunger = 9;
ITEM.thirst = 11;
ITEM.rads = 10;
ITEM.business = false;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A fruit harvested from barrel cacti. It is foul and dirty.";

ITEM:Register();
