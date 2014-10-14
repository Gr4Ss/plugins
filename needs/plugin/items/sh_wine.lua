local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Wine";
ITEM.uniqueID = "wine";
ITEM.model = "models/fallout 3/wine.mdl";
ITEM.value = 11;
ITEM.type = "consumable";
ITEM.cost = 25;
ITEM.weight = 1.2;
ITEM.thirst = 25;
ITEM.drunkTime = 70;
ITEM.junk = "empty_bottle_wine";
ITEM.business = true;
ITEM.access = "D";
ITEM.useText = "Drink";
ITEM.category = "Consumables";
ITEM.description = "A large bottle containing vine. The liquid inside looks dark red.";

ITEM:Register();