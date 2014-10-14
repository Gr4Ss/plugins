local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Animal bits";
ITEM.uniqueID = "animal_bits";
ITEM.model = "models/fallout 3/animal_bits.mdl";
ITEM.value = 12;
ITEM.type = "consumable";
ITEM.cost = 10;
ITEM.weight = 0.15;
ITEM.hunger = 34;
ITEM.rads = 14;
ITEM.business = true;
ITEM.access = "f";
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "Various bits of animal on a stick. Would you eat this?";

ITEM:Register();
