local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Iced Cold Nuka-Cola";
ITEM.uniqueID = "nukacola_cold";
ITEM.model = "models/maxib123/nukacola.mdl";
ITEM.value = 5;
ITEM.type = "consumable";
ITEM.cost = 0;
ITEM.cap = true;
ITEM.weight = 1;
ITEM.thirst = 50;
ITEM.rads = 4;
ITEM.junk = "empty_bottle_nukacola";
ITEM.business = false;
ITEM.useText = "Drink";
ITEM.category = "Beverages";
ITEM.description = "A blue bottle containing Nuka-Cola. It feels cold and fresh.";

ITEM:Register();