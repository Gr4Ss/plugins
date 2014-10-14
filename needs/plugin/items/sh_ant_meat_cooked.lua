local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Ant Fricassée";
ITEM.uniqueID = "ant_meat_cooked";
ITEM.model = "models/fallout 3/ant_meat.mdl";
ITEM.cost = 0;
ITEM.weight = 0.8;
ITEM.hunger = 65;
ITEM.rads = 14;
ITEM.business = false;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A delicious ant fricassée. It has a spicy smell.";

ITEM:Register();
