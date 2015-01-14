--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Medium Grade Ration";
ITEM.model = "models/weapons/w_package.mdl";
ITEM.weight = 2;
ITEM.uniqueID = "medium_grade_ration";
ITEM.useText = "Open";
ITEM.description = "A ration package.";

ITEM.food = {"uu_apple", "uu_banana", "uu_melon_slice", "uu_orange", "uu_pear",
				"uu_chips", "uu_peanuts",
				"uu_milk_jug", "uu_soda", "uu_beer", "uu_gin"};
ITEM.book = {"book_c", "book_zotu", "book_tsod"};
ITEM.misc = {"uu_bandage", "request_device", "boxed_bag"};

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
	Clockwork.player:GiveCash(player, 120, "medium grade ration packet");
	
	player:GiveItem(Clockwork.item:CreateInstance("loyal_supplements"), true);
	player:GiveItem(Clockwork.item:CreateInstance("smooth_breens_water"), true);
	player:GiveItem(Clockwork.item:CreateInstance("uu_chocolate"), true);
	
	-- Give random items if lucky.
	if (math.random(1,4) == 2) then
		local item = Clockwork.item:CreateInstance(self.food[math.random(1, #self.food)]);
		player:GiveItem(item, true);
	elseif (math.random(1,10) == 2) then
		local item = Clockwork.item:CreateInstance(self.book[math.random(1, #self.book)]);
		player:GiveItem(item, true);
	elseif (math.random(1,20) == 2) then
		local item = Clockwork.item:CreateInstance(self.misc[math.random(1, #self.misc)]);
		player:GiveItem(item, true);
	elseif (math.random(1,20) == 2) then
		player:GiveItem(Clockwork.item:CreateInstance("ration_token"), true);
	end
	
	Clockwork.plugin:Call("PlayerUseRation", player);
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();