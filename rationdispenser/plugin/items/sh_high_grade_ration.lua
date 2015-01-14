--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "High Grade Ration";
ITEM.model = "models/weapons/w_package.mdl";
ITEM.weight = 2;
ITEM.uniqueID = "high_grade_ration";
ITEM.useText = "Open";
ITEM.description = "A ration package.";

-- Called when a player attempts to pick up the item.
function ITEM:CanPickup(player, quickUse, itemEntity)
	if (quickUse) then
		if (!player:CanHoldWeight(self.weight)) then
			Clockwork.player:Notify(player, "You do not have enough inventory space!");
			
			return false;
		end;
	end;
end;

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	Clockwork.player:GiveCash(player, 180, "high grade ration packet");
	
	player:GiveItem(Clockwork.item:CreateInstance("metropolice_supplements"), true);
	player:GiveItem(Clockwork.item:CreateInstance("special_breens_water"), true);
	
	Clockwork.plugin:Call("PlayerUseRation", player);
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();