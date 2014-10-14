
local ITEM = Clockwork.item:New("radio_base");
ITEM.name = "Handheld Radio";
ITEM.uniqueID = "handh_radio";
ITEM.model = "models/deadbodies/dead_male_civilian_radio.mdl";
ITEM.weight = 1;
ITEM.category = "Communication";
ITEM.business = false;
ITEM.description = "A handheld radio with multiple channels.";

ITEM:Register();