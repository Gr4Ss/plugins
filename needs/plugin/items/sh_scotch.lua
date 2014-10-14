local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Scotch";
ITEM.uniqueID = "scotch";
ITEM.model = "models/maxib123/whiskey.mdl";
ITEM.value = 24;
ITEM.type = "consumable";
ITEM.cost = 16;
ITEM.weight = 1.2;
ITEM.thirst = 26;
ITEM.drunkTime = 200;
ITEM.junk = "empty_bottle_scotch";
ITEM.business = true;
ITEM.access = "D";
ITEM.useText = "Drink";
ITEM.category = "Consumables";
ITEM.description = "A bottle containing liquid. It has a strong smell.";

ITEM:Register();