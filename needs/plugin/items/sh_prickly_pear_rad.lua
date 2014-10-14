local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Irradiated Prickly Pear Fruit";
ITEM.uniqueID = "prickly_pear_rad";
ITEM.model = "models/fallout 3/pear.mdl";
ITEM.value = 10;
ITEM.type = "consumable";
ITEM.cost = 0;
ITEM.weight = 0.20;
ITEM.hunger = 18;
ITEM.thirst = 3;
ITEM.rads = 16;
ITEM.business = false;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A prickled fruit that has the looks of a pear. It has a foul scent.";

ITEM:Register();