local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Nuka-Cola";
ITEM.uniqueID = "nukacola";
ITEM.model = "models/maxib123/nukacola.mdl";
ITEM.value = 10;
ITEM.type = "consumable";
ITEM.cost = 25;
ITEM.cap = true;
ITEM.weight = 1;
ITEM.hunger = 0;
ITEM.thirst = 40;
ITEM.rads = 7;
ITEM.junk = "empty_bottle_nukacola";
ITEM.business = true
ITEM.access = "d";
ITEM.useText = "Drink";
ITEM.category = "Beverages";
ITEM.description = "A blue bottle containing the famous Nuka-Cola beverage.";

ITEM:Register();