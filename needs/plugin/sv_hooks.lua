
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

-- Called when a player's character data should be saved.
function PLUGIN:PlayerSaveCharacterData(player, data)
	if (data["hunger"]) then
		data["hunger"] = math.Round(data["hunger"], 7);
	end;
	if (data["thirst"]) then
		data["thirst"] = math.Round(data["thirst"], 7);
	end;
end;

-- Called when a player's character data should be restored.
function PLUGIN:PlayerRestoreCharacterData(player, data)
	data["hunger"] = data["hunger"] or 0;
	data["thirst"] = data["thirst"] or 0;
end;

-- Called when a player's shared variables should be set.
function PLUGIN:PlayerSetSharedVars(player, curTime)
	player:SetSharedVar("hunger", math.Round(player:GetCharacterData("hunger"), 5));
	player:SetSharedVar("thirst", math.Round(player:GetCharacterData("thirst"), 5));
end;

-- Called at an interval while a player is connected.
function PLUGIN:PlayerThink(player, curTime, infoTable)
	if (Clockwork.faction:FindByID(player:GetFaction()).noHunger or !player:Alive()) then
		return;
	end;
	
	if (!player.nextNeeds or player.nextNeeds < curTime) then
		local tickTime = 4;
		player.nextNeeds = curTime + tickTime;
		
		local rads = player:GetCharacterData("rads");
		local scale = 1;
		if (rads and rads > Clockwork.config:Get("max_rads"):Get() * 0.2) then
			scale = 2;
		end;
		
		-- Lose 60 hunger every 6 hours, 60 thirst every 4 hours
		player:SetCharacterData("hunger", math.Clamp(player:GetCharacterData("hunger") + 60 * scale * tickTime / (3600 * 6), 0, 100));
		player:SetCharacterData("thirst", math.Clamp(player:GetCharacterData("thirst") + 60 * scale * tickTime / (3600 * 4), 0, 100));
	end;
end;

function PLUGIN:PlayerShouldStaminaRegenerate(player)
	if (Clockwork.faction:FindByID(player:GetFaction()).highHungerStamina) then
		if (player:GetCharacterData("hunger") >= 100) then
			return false;
		end;
	else
		if (player:GetCharacterData("hunger") >= 90) then
			return false;
		end;
	end;
end;