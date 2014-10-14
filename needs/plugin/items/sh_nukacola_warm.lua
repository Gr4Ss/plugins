local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Warm Nuka-Cola";
ITEM.uniqueID = "nukacola_warm";
ITEM.model = "models/maxib123/nukacola.mdl";
ITEM.value = 18;
ITEM.type = "consumable";
ITEM.cost = 0;
ITEM.cap = true;
ITEM.weight = 1;
ITEM.hunger = 0;
ITEM.thirst = 31;
ITEM.rads = 16;
ITEM.junk = "empty_bottle_nukacola";
ITEM.business = false;
ITEM.useText = "Drink";
ITEM.category = "Beverages";
ITEM.description = "A warm Nuka-Cola. Yuck!";

ITEM:Register();