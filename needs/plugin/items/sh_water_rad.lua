local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Irradiated Water";
ITEM.uniqueID = "water_rad";
ITEM.model = "models/fallout 3/water.mdl";
ITEM.value = 35;
ITEM.type = "consumable";
ITEM.skin = 1;
ITEM.cost = 0;
ITEM.weight = 0.5;
ITEM.thirst = 50;
ITEM.rads = 35;
ITEM.junk = "empty_bottle_water";
ITEM.business = false;
ITEM.useText = "Drink";
ITEM.category = "Water";
ITEM.description = "A bottle containing water. The liquid inside looks foul.";

ITEM:Register();