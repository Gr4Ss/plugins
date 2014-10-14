
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

-- Called when a player's character data should be saved.
function PLUGIN:PlayerSaveCharacterData(player, data)
	if (data["stealthBoyTime"]) then
		data["stealthBoyTime"] = math.Round(data["stealthBoyTime"]);
	else
		data["stealthBoyTime"] = 0;
	end ;
end;

-- Called when a player's character data should be restored.
function PLUGIN:PlayerRestoreCharacterData(player, data)
	data["stealthBoyTime"] = data["stealthBoyTime"] or 0;
end;

-- Called when a player's shared variables should be set.
function PLUGIN:PlayerSetSharedVars(player, curTime)
	player:SetSharedVar("stealthBoyTime", player:GetCharacterData("stealthBoyTime"));
end;

-- Called just after a player spawns.
function PLUGIN:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
	if (!lightSpawn) then
		player.stealthBoyMode = 0;
	end;
end;

-- Called at an interval while a player is connected.
function PLUGIN:PlayerThink(player, curTime, infoTable)
	if (!player:Alive() or player:GetMoveType() == MOVETYPE_NOCLIP) then
		return;
	end;

	local stealthBoyMode = player.stealthBoyMode
	if (!stealthBoyMode) then 
		stealthBoyMode = 0; 
	end;

	local maxTime = Clockwork.config:Get("stealth_boy_max_time"):Get() or 7200;
	local stealthBoyTime = player:GetCharacterData("stealthBoyTime") or 0;
	
	-- Check if player has a stealth boy equipped, is in stealth boy mode and is not yet fatigued and if so make him invisible
	if (stealthBoyMode == 1 and !player:GetCharacterData("stealthBoyFatigued")) then
		-- Advance stealth boy time
		if (stealthBoyTime < maxTime) then
			player:SetCharacterData("stealthBoyTime", math.Clamp(stealthBoyTime + 0.1, 0, maxTime));
		-- Check if player is fatigued
		elseif (stealthBoyTime >= maxTime) then
			-- Set fatigued true and stop. Making player visible will be handled next tick
			player:SetCharacterData("stealthBoyFatigued", true);
			return;
		end;
		-- Set invisible
		player:DrawWorldModel(false);
		player:DrawShadow(false);
		player:SetNoDraw(true);
		local color = player:GetColor();
		player:SetColor(Color(color.r, color.g, color.b, 0));
	-- Check if stealth boy unequip is not already being handled, otherwise handle it
	elseif (stealthBoyMode == 2 and !player.stealthBoyReset) then
		player.stealthBoyReset = true;
		player:DrawWorldModel(true);
		player:DrawShadow(true);
		player:SetNoDraw(false);
		player:SetNotSolid(false);
		-- Reset variables
		player.stealthBoyReset = nil;
		player.stealthBoyMode = 0;
		-- Set fatigued if time > max / 2
		if (stealthBoyTime > maxTime / 2) then
			player:SetCharacterData("stealthBoyFatigued", true);
		end;
		player:EmitSound("items/nvg_off.wav");
	-- Player was not invisible or being made visible, rest him
	else
		if (stealthBoyTime > 0) then
			player:SetCharacterData("stealthBoyTime", math.Clamp(stealthBoyTime - 0.1, 0, maxTime));
		end;
		-- Reset fatigue if the player is at least rested
		if (stealthBoyTime < maxTime / 2) then
			player:SetCharacterData("stealthBoyFatigued", false);
		end;
	end;
end;