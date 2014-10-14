local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Irradiated Dandy Boy Apples";
ITEM.uniqueID = "dandy_boy_apples_rad";
ITEM.model = "models/fallout 3/dandy_apples.mdl";
ITEM.value = 37;
ITEM.type = "consumable";
ITEM.cost = 0;
ITEM.weight = 0.25;
ITEM.hunger = 22;
ITEM.rads = 18;
ITEM.business = false;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "Packed food containing small apples. The contents look malformed and bad.";

ITEM:Register();