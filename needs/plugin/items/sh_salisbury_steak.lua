local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Salisbury Steak";
ITEM.uniqueID = "salisbury_steak";
ITEM.model = "models/props_junk/cardboard_box004a.mdl";
ITEM.value = 26;
ITEM.type = "consumable";
ITEM.cost = 15;
ITEM.weight = 0.50;
ITEM.hunger = 25;
ITEM.thirst = -3;
ITEM.rads = 9;
ITEM.business = true;
ITEM.access = "f";
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "Packed steaks with gravy. It smells delicious.";

ITEM:Register();