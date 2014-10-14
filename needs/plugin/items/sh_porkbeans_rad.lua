local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Irradiated Pork n' Beans";
ITEM.uniqueID = "porkbeans_rad";
ITEM.model = "models/fallout 3/beans.mdl";
ITEM.value = 35;
ITEM.type = "consumable";
ITEM.cost = 0;
ITEM.weight = 0.4;
ITEM.hunger = 33;
ITEM.thirst = -6;
ITEM.rads = 40;
ITEM.junk = "tin_can";
ITEM.business = false;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "Canned food containing pork and beans. It has a foul smell and scent.";

ITEM:Register();