local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Brahmin Steak";
ITEM.uniqueID = "brahmin_meat_cooked";
ITEM.model = "models/fallout 3/steak.mdl";
ITEM.cost = 0;
ITEM.weight = 1.1;
ITEM.hunger = 80;
ITEM.rads = 15;
ITEM.business = false;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A cooked steak made from brahmin meat. It smells delicious.";

ITEM:Register();
