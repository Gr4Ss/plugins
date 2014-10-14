local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Nuka-Cola Victory";
ITEM.uniqueID = "nukacola_victory";
ITEM.model = "models/maxib123/nukavictory.mdl";
ITEM.value = 1;
ITEM.type = "consumable";
ITEM.cost = 0;
ITEM.cap = true;
ITEM.weight = 1;
ITEM.hunger = 0;
ITEM.thirst = 90;
ITEM.rads = 20;
ITEM.junk = "empty_bottle_nukacola";
ITEM.business = false;
ITEM.useText = "Drink";
ITEM.category = "Beverages";
ITEM.description = "A blue bottle with an extreme red glowing liquid inside. It smells awesome.";

ITEM:Register();