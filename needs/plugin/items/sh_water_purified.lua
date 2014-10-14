local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Purified Water";
ITEM.uniqueID = "water_purified";
ITEM.model = "models/fallout 3/water.mdl";
ITEM.value = 18;
ITEM.type = "consumable";
ITEM.skin = 0;
ITEM.cost = 35;
ITEM.weight = 0.5;
ITEM.thirst = 60;
ITEM.junk = "empty_bottle_water";
ITEM.business = true;
ITEM.access = "d";
ITEM.useText = "Drink";
ITEM.category = "Water";
ITEM.description = "A bottle full of water. The liquid looks clean.";

ITEM:Register();