local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Pinyon Nuts";
ITEM.uniqueID = "pinyon_nuts";
ITEM.model = "models/props_junk/cardboard_box004a.mdl";
ITEM.value = 40;
ITEM.type = "consumable";
ITEM.cost = 0;
ITEM.weight = 0.15;
ITEM.hunger = 15;
ITEM.business = false;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A box containing various pinyon nuts. They look healthy.";

ITEM:Register();