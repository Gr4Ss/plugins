local ITEM = Clockwork.item:New();
ITEM.name = "Crude Hammer";
ITEM.uniqueID = "hammer";
ITEM.model = "models/weapons/w_hammert.mdl";
ITEM.weight = 1;
ITEM.category = "Tools";
ITEM.business = false;
ITEM.description = "A crude metal hammer.";

function ITEM:OnDrop(player, position) end;

ITEM:Register();