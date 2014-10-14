local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Prickly Pear Fruit";
ITEM.uniqueID = "prickly_pear";
ITEM.model = "models/fallout 3/pear.mdl";
ITEM.value = 50;
ITEM.type = "consumable";
ITEM.cost = 0;
ITEM.weight = 0.20;
ITEM.hunger = 20;
ITEM.thirst = 10;
ITEM.business = false;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A prickled fruit that has the looks of a pear. It looks fresh.";

ITEM:Register();