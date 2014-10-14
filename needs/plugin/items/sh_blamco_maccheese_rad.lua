local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Irradiated Mac & Cheese";
ITEM.uniqueID = "blamco_maccheese_rad";
ITEM.model = "models/props_junk/garbage_bag001a.mdl";
ITEM.value = 28;
ITEM.type = "consumable";
ITEM.cost = 0;
ITEM.weight = 0.3;
ITEM.hunger = 21;
ITEM.rads = 23;
ITEM.business = false;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "Packed food containing macaroni & cheese. It has a foul stench.";

ITEM:Register();
