local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Cooked Noodles";
ITEM.uniqueID = "noodles_cooked";
ITEM.model = "models/props_junk/garbage_takeoutcarton001a.mdl";
ITEM.cost = 0;
ITEM.weight = 0.6;
ITEM.hunger = 35;
ITEM.rads = 4;
ITEM.junk = "empty_takeout";
ITEM.business = false;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A box full of yummy noodles.";

ITEM:Register();