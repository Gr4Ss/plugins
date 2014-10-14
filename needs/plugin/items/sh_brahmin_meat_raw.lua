local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Raw Brahmin Meat";
ITEM.uniqueID = "brahmin_meat";
ITEM.model = "models/fallout 3/meat.mdl";
ITEM.value = 13;
ITEM.type = "consumable";
ITEM.cost = 25;
ITEM.weight = 0.75;
ITEM.hunger = 50;
ITEM.rads = 46;
ITEM.business = true;
ITEM.access = "f";
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A large haunch of meat ripped from a brahmin. It could use some cooking.";

ITEM:Register();
