local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Grilled Mantis Foreleg";
ITEM.uniqueID = "mantis_foreleg_cooked";
ITEM.model = "models/maxib123/grilledmantisleg.mdl";
ITEM.cost = 0;
ITEM.weight = 0.15;
ITEM.hunger = 50;
ITEM.business = false;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A grilled foreleg of a mantis. It smells delicious.";

ITEM:Register();