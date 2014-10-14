
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

-- Called when Clockwork has loaded all of the entities.
function PLUGIN:ClockworkInitPostEntity() 
	self:LoadGasZones(); 
	self:LoadNoGasZones();
end;

function PLUGIN:PlayerThink(player, curTime, infoTable)
	local player = player;

	if ((!player.nextGasCheck or player.nextGasCheck < curTime)) then
		local faction = Clockwork.player:GetFactionTable(player);
		
		player.nextGasCheck = curTime + self.gasTickTime;

		-- Skip if noclipping or gas does not have to be calculated yet
		if (Clockwork.player:IsNoClipping(player) or !player:Alive() or faction.noGas) then 
			return; 
		end;
		
		local Clamp = math.Clamp;

		local gasScale = 0;
		local playerPos = player:GetShootPos();
		local isNotInNoGasZone = true;
		-- Check if the player is in the gasArea, if not he cannot be in a gaszone!
		if (!self.gasArea or !self:IsInBox(playerPos, self.gasArea.minimum, self.gasArea.maximum)) then
			-- Loop over all exclusion zones which cover most players, this avoids having to do a lot of checks to find who is in a gas zone
			if (self.noGasZones) then
				for k2, noGasZone in pairs(self.noGasZones) do
					if (self:IsInBox(playerPos, noGasZone.minimum, noGasZone.maximum)) then
						isNotInNoGasZone = false;
						break;
					end;
				end;
			end;
		else
			isNotInNoGasZone = true;
		end;
		-- Check if a player is in a gas zone if he is not in an exclusion zone
		-- As gasZones is inversly sorted on scale, the highest scaled zone the player is in is the first that he is in
		if (isNotInNoGasZone) then
			for k2, gasZone in ipairs(self.gasZones) do
				if (self:IsInBox(playerPos, gasZone.minimum, gasZone.maximum)) then
					gasScale = gasZone.scale;
					break;
				end;
			end;
		end;
		-- Set gasScale for screen blur
		player:SetSharedVar("gas_scale", gasScale);

		-- Player is in a gas zone
		if (gasScale > 0) then
			local playerGasDamageScale = 1;
			local clothes = player:GetClothesItem();
			-- Check for a gasmask
			if (clothes and clothes("hasRebreather")) then
				playerGasDamageScale = 0;
			elseif ((clothes and clothes("hasGasmask")) or player:GetFaction() == FACTION_OTA) then
				local filterQuality = player:GetCharacterData("filterQuality", 0);
				local filterScale = Clockwork.config:Get("gas_filter_scale"):Get();
				local filterDecrease = gasScale * self.gasTickTime * filterScale;
				-- Enough filter left for this tick
				if (filterQuality >= filterDecrease) then
					player:SetCharacterData("filterQuality", filterQuality - filterDecrease);
					playerGasDamageScale = 0;
					-- Filter left but not enough for this tick
				elseif (filterQuality > 0) then
					player:SetCharacterData("filterQuality", 0);
					-- Scale protection received based on how much was still left
					playerGasDamageScale = Clamp(filterQuality / filterDecrease, 0, 1);
					Clockwork.player:Notify(player, "Your gasmask's filter has run out!");
				end;
			end;

			if (playerGasDamageScale > 0) then
				local damage = playerGasDamageScale * gasScale * self.gasTickTime * Clockwork.config:Get("gas_damage"):Get();
				player:SetHealth(math.max(player:Health() - damage, 0));

				if (player:Health() == 0) then
					player:Kill();

					local playerColor = team.GetColor(player:Team())
					local listeners = {};
					for k, v in pairs(_player.GetAll()) do
						if (v:IsAdmin() or v:IsSuperAdmin() or v:IsUserGroup("operator")) then
							listeners[#listeners + 1] = v;
						end;
					end;

					local data = {playerName = player:Name(), playerColor = playerColor, attackerName = "A gaszone", attackerColor = Color(255, 255, 255, 255)};
					Clockwork.chatBox:Add(listeners, nil, "deathnotification", "", data);
				end;
			end;
		end;
	end;
end;

-- Called each tick.
function PLUGIN:Tick()
	local curTime = CurTime();
	if (!self.nextGasCheck or self.nextGasCheck < curTime) then
		local gasTime = Clockwork.config:Get("gas_tick_time"):Get();
		self.nextGasCheck = curTime + gasTime * 10;

		local playerCount = table.Count(player.GetAll());
		-- Scale the tick time based on the amount of players online, running twice as often with 0 players
		-- while running at it's specified config tickTime at 60 players or more
		self.gasTickTime = gasTime / 2 + gasTime * math.Clamp(playerCount / 60, 0, 1) / 2;
	end;
end;