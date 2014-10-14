local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Raw Mantis Foreleg";
ITEM.uniqueID = "mantis_foreleg_raw";
ITEM.model = "models/gibs/antlion_gib_medium_3.mdl";
ITEM.value = 20;
ITEM.type = "consumable";
ITEM.cost = 14;
ITEM.weight = 0.15;
ITEM.hunger = 28;
ITEM.rads = 25;
ITEM.business = true;
ITEM.access = "f";
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A raw foreleg from a mantis. Can be cooked.";

ITEM:Register();