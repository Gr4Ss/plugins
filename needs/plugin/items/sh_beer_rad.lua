local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Irradiated Beer";
ITEM.uniqueID = "beer_rad";
ITEM.model = "models/fallout 3/beer.mdl";
ITEM.value = 30;
ITEM.type = "consumable";
ITEM.cost = 0;
ITEM.weight = 0.75;
ITEM.thirst = 16;
ITEM.rads = 11;
ITEM.drunkTime = 90;
ITEM.junk = "empty_bottle_beer";
ITEM.business = false;
ITEM.useText = "Drink";
ITEM.category = "Consumables";
ITEM.description = "A bottle containing brown liquid. It has a foul stench.";

ITEM:Register();
