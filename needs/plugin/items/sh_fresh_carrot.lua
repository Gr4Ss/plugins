local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Fresh Carrot";
ITEM.uniqueID = "fresh_carrot";
ITEM.model = "models/fallout 3/carrot.mdl";
ITEM.value = 46;
ITEM.type = "consumable";
ITEM.cost = 4;
ITEM.weight = 0.2;
ITEM.hunger = 11;
ITEM.thirst = 5;
ITEM.rads = 1;
ITEM.business = true;
ITEM.access = "f";
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A long and narrow orange vegetable. It looks fresh.";

ITEM:Register();
