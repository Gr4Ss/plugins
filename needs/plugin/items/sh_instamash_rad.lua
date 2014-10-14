local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Irradiated Instamash";
ITEM.uniqueID = "instamash_rad";
ITEM.model = "models/fallout 3/insta_mash.mdl";
ITEM.value = 14;
ITEM.type = "consumable";
ITEM.cost = 0;
ITEM.weight = 0.3;
ITEM.hunger = 32;
ITEM.rads = 28;
ITEM.business = false;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A box full of powdered food. It has a foul stench.";

ITEM:Register();