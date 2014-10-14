local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Potato Crisps";
ITEM.uniqueID = "potato_crisps";
ITEM.model = "models/fallout 3/chips.mdl";
ITEM.value = 21;
ITEM.type = "consumable";
ITEM.cost = 8;
ITEM.weight = 0.25;
ITEM.hunger = 16;
ITEM.thirst = -12;
ITEM.rads = 6;
ITEM.junk = "empty_bag_crisps";
ITEM.business = true;
ITEM.access = "f";
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A bag of potato crisps. It smells good.";

ITEM:Register();