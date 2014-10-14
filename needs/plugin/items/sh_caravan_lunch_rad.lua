local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Irradiated Caravan Lunch";
ITEM.uniqueID = "caravan_lunch_rad";
ITEM.model = "models/maxib123/lunchbox.mdl";
ITEM.value = 4;
ITEM.type = "consumable";
ITEM.cost = 0;
ITEM.weight = 2.5;
ITEM.hunger = 70;
ITEM.rads = 60;
ITEM.junk = "lunchbox";
ITEM.business = false;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A dirty lunchbox packed with food ready to eat and enjoy. It has a filthy smell.";

ITEM:Register();