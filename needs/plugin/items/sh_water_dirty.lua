local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Dirty Water";
ITEM.uniqueID = "water_dirty";
ITEM.model = "models/fallout 3/water.mdl";
ITEM.value = 28;
ITEM.type = "consumable";
ITEM.skin = 1;
ITEM.cost = 10;
ITEM.weight = 0.5;
ITEM.thirst = 56;
ITEM.rads = 25;
ITEM.junk = "empty_bottle_water";
ITEM.business = true;
ITEM.access = "d";
ITEM.useText = "Drink";
ITEM.category = "Water";
ITEM.description = "A bottle containing water. The liquid looks dirty.";

ITEM:Register();