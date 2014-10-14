local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Caravan Lunch";
ITEM.uniqueID = "caravan_lunch";
ITEM.model = "models/maxib123/lunchbox.mdl";
ITEM.value = 1
ITEM.type = "consumable";
ITEM.cost = 0;
ITEM.weight = 2;
ITEM.hunger = 90;
ITEM.rads = 10;
ITEM.junk = "lunchbox";
ITEM.business = false;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A lunchbox packed with food ready to eat and enjoy. It looks clean.";

ITEM:Register();