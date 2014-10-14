local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Cram";
ITEM.uniqueID = "cram";
ITEM.model = "models/fallout 3/cram.mdl";
ITEM.value = 18;
ITEM.type = "consumable";
ITEM.cost = 16;
ITEM.weight = 0.45;
ITEM.hunger = 20;
ITEM.rads = 8;
ITEM.business = true;
ITEM.access = "f";
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "Packed food containing processed meat. It looks edible.";

ITEM:Register();
