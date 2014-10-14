local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Irradiated Potato Crisps";
ITEM.uniqueID = "potato_crisps_rad";
ITEM.model = "models/fallout 3/chips.mdl";
ITEM.value = 29;
ITEM.type = "consumable";
ITEM.cost = 10;
ITEM.weight = 0.25;
ITEM.hunger = 12;
ITEM.thirst = -17;
ITEM.rads = 10;
ITEM.junk = "empty_bag_crisps";
ITEM.business = false;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A bag full of crisps. It has a foul smell.";

ITEM:Register();