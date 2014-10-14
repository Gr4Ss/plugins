local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Irradiated Sunset Sarsaparilla";
ITEM.uniqueID = "sunset_sarsaparilla_rad";
ITEM.model = "models/maxib123/sarsaparilla1.mdl";
ITEM.value = 39;
ITEM.type = "consumable";
ITEM.cost = 0;
ITEM.cap = true;
ITEM.weight = 1;
ITEM.thirst = 27;
ITEM.rads = 13;
ITEM.drunkTime = 0;
ITEM.junk = "empty_bottle_sunset";
ITEM.business = false;
ITEM.useText = "Drink";
ITEM.category = "Beverages";
ITEM.description = "A yellow bottle containing the usual Sarsaparilla flavour. It has an unusual smell.";

ITEM:Register();