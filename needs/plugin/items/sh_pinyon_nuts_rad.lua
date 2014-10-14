local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Irradiated Pinyon Nuts";
ITEM.uniqueID = "pinyon_nuts_rad";
ITEM.model = "models/props_junk/cardboard_box004a.mdl";
ITEM.value = 6;
ITEM.type = "consumable";
ITEM.cost = 0;
ITEM.weight = 0.15;
ITEM.hunger = 15;
ITEM.rads = 12;
ITEM.business = false;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A humid, small box containing pinyon nuts. It has a foul scent.";

ITEM:Register();