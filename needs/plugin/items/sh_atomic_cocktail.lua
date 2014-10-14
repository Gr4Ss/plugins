local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Atomic Cocktail";
ITEM.uniqueID = "atomic_cocktail";
ITEM.model = "models/weapons/w_missile_closed.mdl";
ITEM.value = 5;
ITEM.type = "consumable";
ITEM.cost = 0;
ITEM.weight = 1.2;
ITEM.hunger = 15;
ITEM.thirst = 40;
ITEM.rads = 25;
ITEM.drunkTime = 120;
ITEM.business = false;
ITEM.useText = "Drink";
ITEM.category = "Consumables";
ITEM.description = "A cocktail shaped into a rocket souvenir. It has a strong smell.";

ITEM:Register();