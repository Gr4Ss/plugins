local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Fresh Pear";
ITEM.uniqueID = "fresh_pear";
ITEM.model = "models/fallout 3/pear.mdl";
ITEM.value = 43;
ITEM.type = "consumable";
ITEM.cost = 5;
ITEM.weight = 0.2;
ITEM.hunger = 7;
ITEM.thirst = 6;
ITEM.rads = 1;
ITEM.business = true;
ITEM.access = "f";
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A green fruit that looks like a pear. It feels fresh.";

ITEM:Register();
