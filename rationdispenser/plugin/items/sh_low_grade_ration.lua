--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Low Grade Ration";
ITEM.model = "models/weapons/w_package.mdl";
ITEM.weight = 2;
ITEM.uniqueID = "low_grade_ration";
ITEM.useText = "Open";
ITEM.description = "A ration package.";

ITEM.food = {"uu_apple", "uu_banana", "uu_melon_slice", "uu_orange", "uu_pear",
				"uu_chips", "uu_peanuts", "uu_chocolate",
				"uu_milk_carton", "uu_soda", "uu_beer"};
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
	Clockwork.player:GiveCash(player, 60, "low grade ration packet");
	
	player:GiveItem(Clockwork.item:CreateInstance("citizen_supplements"), true);
	player:GiveItem(Clockwork.item:CreateInstance("breens_water"), true);
	
	-- Give random items if lucky.
	if (math.random(1,5) == 5) then
		local item = Clockwork.item:CreateInstance(self.food[math.random(1, #self.food)]);
		player:GiveItem(item, true);
	elseif (math.random(1,10) == 8) then
		local item = Clockwork.item:CreateInstance(self.book[math.random(1, #self.book)]);
		player:GiveItem(item, true);
	elseif (math.random(1,20) == 5) then
		local item = Clockwork.item:CreateInstance(self.misc[math.random(1, #self.misc)]);
		player:GiveItem(item, true);
	elseif (math.random(1,20) == 12) then
		player:GiveItem(Clockwork.item:CreateInstance("ration_token"), true);
	end
	
	Clockwork.plugin:Call("PlayerUseRation", player);
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();