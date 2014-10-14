local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Broc Flowers";
ITEM.uniqueID = "broc_flowers";
ITEM.model = "models/props_lab/box01a.mdl";
ITEM.value = 49;
ITEM.type = "consumable";
ITEM.cost = 0;
ITEM.weight = 0.1;
ITEM.hunger = 10;
ITEM.business = false;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A box full of flowers gathered from broc plants. They look good.";

ITEM:Register();
