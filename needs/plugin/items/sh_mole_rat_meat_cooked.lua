local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Cooked Mole Rat Meat";
ITEM.uniqueID = "mole_rat_meat_cooked";
ITEM.model = "models/fallout 3/steak.mdl";
ITEM.cost = 0;
ITEM.weight = 0.3;
ITEM.hunger = 60;
ITEM.rads = 12;
ITEM.business = false;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A cooked piece of meat from a mole rat. It smells delicious.";

ITEM:Register();