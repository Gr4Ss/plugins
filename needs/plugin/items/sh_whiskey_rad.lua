local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Irradiated Whiskey";
ITEM.uniqueID = "whiskey_rad";
ITEM.model = "models/maxib123/whiskey.mdl";
ITEM.value = 20;
ITEM.type = "consumable";
ITEM.cost = 0;
ITEM.weight = 1.2;
ITEM.thirst = 17;
ITEM.rads = 11;
ITEM.drunkTime = 240;
ITEM.junk = "empty_bottle_whiskey";
ITEM.business = false;
ITEM.useText = "Drink";
ITEM.category = "Consumables";
ITEM.description = "A round-shaped bottle containing a strange liquid. It has a strange color and scent.";

ITEM:Register();