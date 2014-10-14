local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Whiskey";
ITEM.uniqueID = "whiskey";
ITEM.model = "models/maxib123/whiskey.mdl";
ITEM.value = 11;
ITEM.type = "consumable";
ITEM.cost = 20;
ITEM.weight = 1.5;
ITEM.thirst = 20;
ITEM.drunkTime = 180;
ITEM.junk = "empty_bottle_whiskey";
ITEM.business = true;
ITEM.access = "D";
ITEM.useText = "Drink";
ITEM.category = "Consumables";
ITEM.description = "A large bottle of whiskey. It has a good smell.";

ITEM:Register();