local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Strange meat";
ITEM.uniqueID = "strange_meat";
ITEM.model = "models/fallout 3/human_meat.mdl";
ITEM.value = 15;
ITEM.type = "consumable";
ITEM.cost = 0;
ITEM.weight = 0.35;
ITEM.hunger = 45;
ITEM.rads = 45;
ITEM.business = false;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "Meat ripped from something. It smells disgusting.";

ITEM:Register();