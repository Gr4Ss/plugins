local ITEM = Clockwork.item:New("consumable_base");
ITEM.name = "Sunset Sarsaparilla";
ITEM.uniqueID = "sunset_sarsaparilla";
ITEM.model = "models/maxib123/sarsaparilla1.mdl";
ITEM.value = 30;
ITEM.type = "consumable";
ITEM.cost = 15;
ITEM.cap = true;
ITEM.weight = 1;
ITEM.thirst = 35;
ITEM.junk = "empty_bottle_sunset";
ITEM.business = true;
ITEM.access = "d";
ITEM.useText = "Drink";
ITEM.category = "Beverages";
ITEM.description = "A yellow bottle containing the usual Sarsaparilla flavour. It smells refreshing.";

ITEM:Register();