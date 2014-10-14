local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Irradiated Salisbury Steak";
ITEM.uniqueID = "salisbury_steak_rad";
ITEM.model = "models/props_junk/cardboard_box004a.mdl";
ITEM.value = 34;
ITEM.type = "consumable";
ITEM.cost = 0;
ITEM.weight = 0.45;
ITEM.hunger = 39;
ITEM.rads = 31;
ITEM.business = false;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "Packed steaks with gravy. It has an awful smell.";

ITEM:Register();