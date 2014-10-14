local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Squirrel on a stick";
ITEM.uniqueID = "squirrel_stick";
ITEM.model = "models/clutter/squirrelonastick.mdl";
ITEM.value = 6;
ITEM.type = "consumable";
ITEM.cost = 8;
ITEM.weight = 0.15;
ITEM.hunger = 36;
ITEM.rads = 9;
ITEM.business = true;
ITEM.access = "f";
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "Some sort of animal cooked and put on a stick. It smells delicious.";

ITEM:Register();