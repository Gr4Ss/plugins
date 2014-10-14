local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Fresh Potato";
ITEM.uniqueID = "fresh_potato";
ITEM.model = "models/fallout 3/potato.mdl";
ITEM.value = 45;
ITEM.type = "consumable";
ITEM.cost = 4;
ITEM.weight = 0.2;
ITEM.hunger = 8;
ITEM.thirst = 5;
ITEM.rads = 1;
ITEM.business = true;
ITEM.access = "f";
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A yellow vegetable. It looks healthy and good.";

ITEM:Register();
