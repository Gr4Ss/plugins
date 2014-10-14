local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Iguana on a stick";
ITEM.uniqueID = "iguana_stick";
ITEM.model = "models/clutter/iguanaonastick.mdl";
ITEM.value = 8;
ITEM.type = "consumable";
ITEM.cost = 9;
ITEM.weight = 0.15;
ITEM.hunger = 30;
ITEM.rads = 8;
ITEM.business = true;
ITEM.access = "f";
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "Some sort of animal cooked and put on a stick. It smells delicious.";

ITEM:Register();