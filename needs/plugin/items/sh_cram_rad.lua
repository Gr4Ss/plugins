local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Irradiated Cram";
ITEM.uniqueID = "cram_rad";
ITEM.model = "models/fallout 3/cram.mdl";
ITEM.value = 29;
ITEM.type = "consumable";
ITEM.cost = 0;
ITEM.weight = 0.4;
ITEM.hunger = 35;
ITEM.rads = 33;
ITEM.business = false;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "Packed food containing processed meat. It smells awful.";

ITEM:Register();
