local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Vodka";
ITEM.uniqueID = "vodka";
ITEM.model = "models/fallout 3/vodka.mdl";
ITEM.value = 17;
ITEM.type = "consumable";
ITEM.cost = 35;
ITEM.weight = 1.6;
ITEM.thirst = 20;
ITEM.rads = -25;
ITEM.drunkTime = 250;
ITEM.junk = "empty_bottle_vodka";
ITEM.business = true;
ITEM.access = "D";
ITEM.useText = "Drink";
ITEM.category = "Consumables";
ITEM.description = "A bottle containing liquid. The liquid inside smells weird.";

ITEM:Register();