local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Nuka-Cola Quantum";
ITEM.uniqueID = "nukacola_quantum";
ITEM.model = "models/nukacola/nukaq2.mdl";
ITEM.value = 1;
ITEM.type = "consumable";
ITEM.cost = 10;
ITEM.cap = true;
ITEM.weight = 1;
ITEM.thirst = 55;
ITEM.rads = 9;
ITEM.junk = "empty_bottle_nukacola";
ITEM.business = false;
ITEM.useText = "Drink";
ITEM.category = "Beverages";
ITEM.description = "A blue bottle containing a blue liquid. It has a strange smell.";

ITEM:Register();