local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Nuka-Cola Quartz";
ITEM.uniqueID = "nukacola_quartz";
ITEM.model = "models/maxib123/nukaquartz.mdl";
ITEM.value = 1;
ITEM.type = "consumable";
ITEM.cost = 0;
ITEM.cap = true;
ITEM.weight = 1;
ITEM.thirst = 70;
ITEM.rads = 12;
ITEM.junk = "empty_bottle_nukacola";
ITEM.business = false;
ITEM.useText = "Drink";
ITEM.category = "Beverages";
ITEM.description = "A blue bottle containing a yellow liquid. It has an unusual smell.";

ITEM:Register();