local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Raw Mole Rat Meat";
ITEM.uniqueID = "mole_rat_meat_raw";
ITEM.model = "models/fallout 3/mole_meat.mdl";
ITEM.value = 26;
ITEM.type = "consumable";
ITEM.cost = 22;
ITEM.weight = 0.25;
ITEM.hunger = 40;
ITEM.rads = 31;
ITEM.business = true;
ITEM.access = "f";
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A haunch of meat ripped from a mole rat. It smells awful.";

ITEM:Register();