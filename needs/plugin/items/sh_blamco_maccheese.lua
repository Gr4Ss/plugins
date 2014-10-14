local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "BlamCo Mac & Cheese";
ITEM.uniqueID = "blamco_maccheese";
ITEM.model = "models/props_junk/garbage_bag001a.mdl";
ITEM.value = 14;
ITEM.type = "consumable";
ITEM.cost = 12;
ITEM.weight = 0.4;
ITEM.hunger = 20;
ITEM.rads = 6;
ITEM.business = true;
ITEM.access = "f";
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "Packed food containing macaroni & cheese. It looks good.";

ITEM:Register();
