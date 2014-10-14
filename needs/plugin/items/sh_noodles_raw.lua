local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Uncooked Noodles";
ITEM.uniqueID = "noodles_raw";
ITEM.model = "models/props_junk/garbage_takeoutcarton001a.mdl";
ITEM.value = 42;
ITEM.type = "consumable";
ITEM.cost = 9;
ITEM.weight = 0.6;
ITEM.hunger = 18;
ITEM.rads = 12;
ITEM.junk = "empty_takeout";
ITEM.business = true;
ITEM.access = "f";
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A box full of cold and uncooked noodles.";

ITEM:Register();