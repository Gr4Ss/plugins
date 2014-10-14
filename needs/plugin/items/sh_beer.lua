local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Beer";
ITEM.uniqueID = "beer";
ITEM.model = "models/fallout 3/beer.mdl";
ITEM.value = 18;
ITEM.type = "consumable";
ITEM.cost = 10;
ITEM.weight = 0.75;
ITEM.thirst = 22;
ITEM.drunkTime = 90;
ITEM.junk = "empty_bottle_beer";
ITEM.business = true;
ITEM.access = "D";
ITEM.useText = "Drink";
ITEM.category = "Consumables";
ITEM.description = "A bottle containing brown liquid. The smell is funny."

ITEM:Register();
