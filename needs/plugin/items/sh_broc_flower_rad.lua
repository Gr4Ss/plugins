local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Irradiated Broc Flowers";
ITEM.uniqueID = "broc_flower_rad";
ITEM.model = "models/props_lab/box01a.mdl";
ITEM.value = 9;
ITEM.type = "consumable";
ITEM.cost = 0;
ITEM.weight = 0.1;
ITEM.hunger = 9;
ITEM.rads = 8;
ITEM.business = false;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A foul box full of flowers harvested from broc plants. It has a weird stench.";

ITEM:Register();
