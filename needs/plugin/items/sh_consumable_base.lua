
local ITEM = Clockwork.item:New(nil, true);
ITEM.name = "Consumable Base";
ITEM.uniqueID = "consumable_base";
ITEM.model = "models/props_junk/garbage_takeoutcarton001a.mdl";
ITEM.cost = 10;
ITEM.weight = 1;
ITEM.hunger = 0;
ITEM.thirst = 0;
ITEM.rads = 0; -- Should be 2 rads per hunger-point or 1 rad per thirst point.
ITEM.drunkTime = 0;
ITEM.junk = nil;
ITEM.business = false;
ITEM.category = "Consumables";
ITEM.description = "A box full of yummies!";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	if (self("thirst") > 0) then
		player:SetCharacterData("thirst", math.Clamp(player:GetCharacterData("thirst", 0) - self("thirst"), 0, 100));
	end;
	if (self("hunger") > 0) then
		player:SetCharacterData("hunger", math.Clamp(player:GetCharacterData("hunger", 0) - self("hunger"), 0, 100));
	end;
	if (self("rads") > 0) then
		player:SetCharacterData("foodRads", player:GetCharacterData("foodRads", 0) + self("rads"));
	end;
	
	if (self("drunkTime") and self("drunkTime") > 0) then
		local drunk = Clockwork.player:GetDrunk(player);
		local curTime = CurTime();
		-- Check if player is drunk already or if drunk time has expired already
		if (!drunk or drunk < curTime) then
			drunk = curTime;
		end;
		-- Set player drunk for his remaining time plus the additional time
		Clockwork.player:SetDrunk(player, drunk + self("drunkTime"));
	end;
	
	if (self("junk") and type(self("junk")) == "string") then
		local item = Clockwork.item:CreateInstance(self("junk"))
		if (item) then
			player:GiveItem(item, true);
		else
			ErrorNoHalt("[Error] Consumable "..self("name").." attempted to give unexisting junk item "..self("junk")..".");
		end;
	end;
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();