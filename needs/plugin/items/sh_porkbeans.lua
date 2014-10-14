local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Pork n' Beans";
ITEM.uniqueID = "porkbeans";
ITEM.model = "models/fallout 3/beans.mdl";
ITEM.value = 24;
ITEM.type = "consumable";
ITEM.cost = 18;
ITEM.weight = 0.5;
ITEM.hunger = 30;
ITEM.thirst = -5;
ITEM.rads = 16;
ITEM.junk = "tin_can";
ITEM.business = true;
ITEM.access = "f";
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "Canned food containing pork and beans. It smells decent.";

ITEM:Register();