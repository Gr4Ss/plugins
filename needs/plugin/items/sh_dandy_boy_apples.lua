local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Dandy Boy Apples";
ITEM.uniqueID = "dandy_boy_apples";
ITEM.model = "models/fallout 3/dandy_apples.mdl";
ITEM.value = 25;
ITEM.type = "consumable";
ITEM.cost = 9;
ITEM.weight = 0.25;
ITEM.hunger = 25;
ITEM.rads = 6;
ITEM.business = true;
ITEM.access = "f";
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "Packed food containing small apples. They smell good.";

ITEM:Register();
