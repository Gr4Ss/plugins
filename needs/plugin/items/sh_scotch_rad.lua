local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Irradiated Scotch";
ITEM.uniqueID = "scotch_rad";
ITEM.model = "models/maxib123/whiskey.mdl";
ITEM.value = 36;
ITEM.type = "consumable";
ITEM.cost = 0;
ITEM.weight = 1.2;
ITEM.thirst = 24;
ITEM.rads = 11;
ITEM.drunkTime = 200;
ITEM.junk = "empty_bottle_scotch";
ITEM.business = false;
ITEM.useText = "Drink";
ITEM.category = "Consumables";
ITEM.description = "A bottle containing liquid with a strange glow.";

ITEM:Register();