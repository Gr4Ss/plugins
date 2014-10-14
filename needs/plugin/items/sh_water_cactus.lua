local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Cactus Water";
ITEM.uniqueID = "water_cactus";
ITEM.model = "models/fallout 3/water.mdl";
ITEM.value = 1;
ITEM.type = "consumable";
ITEM.skin = 0;
ITEM.cost = 0;
ITEM.weight = 0.5;
ITEM.hunger = 5;
ITEM.thirst = 75;
ITEM.rads = 1;
ITEM.junk = "empty_bottle_water";
ITEM.business = false;
ITEM.useText = "Drink";
ITEM.category = "Water";
ITEM.description = "A bottle containing water. The liquid inside looks green and clean.";

ITEM:Register();