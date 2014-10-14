local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Instamash";
ITEM.uniqueID = "instamash";
ITEM.model = "models/fallout 3/insta_mash.mdl";
ITEM.value = 21;
ITEM.type = "consumable";
ITEM.cost = 12;
ITEM.weight = 0.5;
ITEM.hunger = 25;
ITEM.rads = 7;
ITEM.business = true;
ITEM.access = "f";
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A box full of powdered food. It has a decent smell.";

ITEM:Register();