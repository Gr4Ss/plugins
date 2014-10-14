local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Raw Ant Meat";
ITEM.uniqueID = "raw_ant_meat";
ITEM.model = "models/fallout 3/ant_meat.mdl";
ITEM.value = 20;
ITEM.type = "consumable";
ITEM.cost = 20;
ITEM.weight = 0.8;
ITEM.hunger = 45;
ITEM.rads = 34;
ITEM.business = true;
ITEM.access = "f";
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "Meat ripped from an ant. It smells disgusting. Needs to be cooked.";

ITEM:Register();
