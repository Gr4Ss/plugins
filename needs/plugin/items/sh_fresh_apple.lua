local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Fresh Apple";
ITEM.uniqueID = "fresh_apple";
ITEM.model = "models/fallout 3/apple_1.mdl";
ITEM.value = 50;
ITEM.type = "consumable";
ITEM.cost = 5;
ITEM.weight = 0.2;
ITEM.hunger = 8;
ITEM.thirst = 5;
ITEM.rads = 0;
ITEM.business = true;
ITEM.access = "f";
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A red fruit. It looks fresh and healthy.";

ITEM:Register();
