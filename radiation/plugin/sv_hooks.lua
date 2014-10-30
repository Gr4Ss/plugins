
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

-- Called when Clockwork has loaded all of the entities.
function PLUGIN:ClockworkInitPostEntity() 
	self:LoadRadiationZones(); 
	self:LoadNoRadiationZones();
end;

-- Called when a player's character data should be saved.
function PLUGIN:PlayerSaveCharacterData(player, data)
	if (data["rads"]) then
		data["rads"] = math.Round(data["rads"], 8);
	else
		data["rads"] = 0;
	end;
	if (data["foodRads"]) then
		data["foodrads"] = data["foodRads"], 6;
	else
		data["foodrads"] = 0;
	end;
end;

-- Called when a player's character data should be restored.
function PLUGIN:PlayerRestoreCharacterData(player, data)
	data["rads"] = data["rads"] or 0;
	data["radiationScale"] = data["radiationScale"] or 0;
	data["radX"] = data["radX"] or 0;
	data["foodRads"] = data["foodRads"] or 0;
	data["radiationDamage"] = data["radiationDamage"] or 0;
end;

-- Called just after a player spawns.
function PLUGIN:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
	if (!lightSpawn) then
		player:SetCharacterData("radX", 0);
		
		if (!firstSpawn) then
			player:SetCharacterData("radiationScale", 0);
			player:SetCharacterData("radiationDamage", 0);
		end;
	end;
end;

-- Called when a player's shared variables should be set.
function PLUGIN:PlayerSetSharedVars(player, curTime)
	player:SetSharedVar("rads", math.Round(player:GetCharacterData("rads"), 2));
end;

function PLUGIN:PlayerThink(player, curTime, infoTable)
	local player = player;

	if ((!player.nextRadCheck or player.nextRadCheck < curTime)) then
		local radiationTickTime = Clockwork.config:Get("radiation_tick_time"):Get();
		local faction = Clockwork.faction:FindByID(player:GetFaction());
		
		player.nextRadCheck = curTime + radiationTickTime;

		-- Skip if noclipping or radiation does not have to be calculated yet
		if (Clockwork.player:IsNoClipping(player) or !player:Alive() or faction.noRadiation) then 
			return; 
		end;
		
		local Clamp = math.Clamp
		local maxRads = Clockwork.config:Get("max_rads"):Get();
		local isNotInNoRadiationZone = true;
		local radiationScale = 0;
		local playerPos = player:GetShootPos();

		-- Loop over all exclusion zones which cover most players, this avoids having to do a lot of checks to find who is in a radiation zone
		if (self.noRadiationZones) then
			for k2, noRadZone in pairs(self.noRadiationZones) do
				if (self:IsInBox(playerPos, noRadZone.minimum, noRadZone.maximum)) then
					isNotInNoRadiationZone = false;
					break;
				end;
			end;
		end;
		
		-- Check if a player is in a radiation zone if he is not in an exclusion zone
		-- As radiationZones is inversly sorted on scale, the highest scaled zone the player is in is the first that he is in
		if (isNotInNoRadiationZone) then
			for k2, radZone in ipairs(self.radiationZones) do
				if (self:IsInBox(playerPos, radZone.minimum, radZone.maximum)) then
					radiationScale = radZone.scale;
					break;
				end;
			end;
		end;
		
		local radRange = Clockwork.config:Get("talk_radius"):Get() * 1.5;
		for k2, ghoul in pairs(self.glowingGhouls) do
			local dist = playerPos:Distance(ghoul:GetShootPos())
			if (dist <= radRange) then
				radiationScale = radiationScale + 1 - (dist / radRange);
			end;
		end;
		
		-- Set Shared Var so the client knows how much radiation it is currently gaining for the geiger sound
		player:SetSharedVar("radiationScale", radiationScale);
		
		-- Update radiation level
		local newRadsLevel = player:GetCharacterData("rads");
		local radiationResistance = 0;
		
		local clothes = player:GetClothesItem();
		-- Set 70% of radiation resistance that depends on the clothing
		if (clothes) then
			if (clothes("isPA", false)) then
				radiationResistance = 1;
			else
				radiationResistance = clothes("radiationResistance", 0);
			end;
		end;
			
		radiationResistance = Clamp((radiationResistance * 0.7), 0, 0.7);
		-- Radiation increase per tick
		local radsIncrease = radiationTickTime * Clockwork.config:Get("radiation_increase"):Get();
		
		-- Do gasmask part for other 30% of radiation resistance
		if (clothes and clothes("hasRebreather", false)) then
			radiationResistance = Clamp(radiationResistance + 0.3, 0, 1);
		elseif (clothes and clothes("hasGasmask", false)) then
			local filterQuality = player:GetCharacterData("filterQuality", 0);
			local filterDecrease = 0.8 * radiationScale * radsIncrease;
			-- Enough filter left for this tick
			if (filterQuality >= filterDecrease) then
				player:SetCharacterData("filterQuality", filterQuality - filterDecrease);
				radiationResistance = Clamp(radiationResistance + 0.3, 0, 1);
				-- Filter left but not enough for this tick
			elseif (filterQuality > 0) then
				player:SetCharacterData("filterQuality", 0);
				-- Scale protection received based on how much was still left
				radiationResistance = Clamp(radiationResistance 
						- (0.3 * filterQuality) / filterDecrease, 0, 1);
				Clockwork.player:Notify(player, "Your gasmask's filter has run out!");
			end;
		end;
		-- Calculating the % of radiation that will go through the radiation resistance
		radiationResistance = 1 - radiationResistance;
		
		-- Take the amount of radiation reduction radX gives us into account on the remaining radiation
		local radX = player:GetCharacterData("radX");
		if (radX and radX > curTime) then
			-- 0.40 = 1 - Rad-X Radiation Protection
			radiationResistance = radiationResistance * (0.40);
		end;
		
		-- Increase radiation level
		newRadsLevel = Clamp(newRadsLevel 
				+ (radiationScale * radsIncrease * radiationResistance), 0, self.maxRads);
		player:SetCharacterData("rads", newRadsLevel);

		-- Set radiation resistance to the combined amount of radiation resistance
		player:SetSharedVar("radiationResistance", 1 - radiationResistance);

		-- Add radiation from food
		local foodRads = player:GetCharacterData("foodRads");
		if (foodRads and foodRads > 0) then
			-- 4 / 432 = 400 / 43200 = 400 / (hours * 3600)
			local radsIncrease = radiationTickTime * 4 / (432);
			if (foodRads > radsIncrease) then
				newRadsLevel = Clamp(newRadsLevel + radsIncrease, 0, self.maxRads);
				player:SetCharacterData("rads", newRadsLevel);
				player:SetCharacterData("foodRads", foodRads - radsIncrease);
			else
				newRadsLevel = Clamp(newRadsLevel + foodRads, 0, self.maxRads);
				player:SetCharacterData("rads", newRadsLevel);
				player:SetCharacterData("foodRads", 0);
			end;
		end;
			
		-- Not receiving any radiation, calculate radiation loss
		if (radiationScale == 0 and foodRads == 0) then
			-- Baseline value for minutes it takes to lose 1 rad
			local baseline = Clockwork.config:Get("radiation_loss_minutes"):Get();
			local minutesPerRadLoss = baseline;
			-- Decrease Scale to compensate for the tick time
			local radsDecreaseScale = radiationTickTime;

			-- Add clothing radResistance decrease
			local clothes = player:GetClothesItem();
			if (clothes) then
				local radRes = 0;
				if (clothes("isPA", false)) then
					radRes = 1;
				else
					radRes = clothes("radiationResistance", 0);
				end;

				minutesPerRadLoss = minutesPerRadLoss - baseline * 0.2 * radRes;
				
				-- Add gasmask radResistance decrease
				if (clothes("hasRebreather", false)) then
					minutesPerRadLoss = minutesPerRadLoss - baseline * 0.2;
				elseif (clothes("hasGasmask", false)) then
					local filterQuality = player:GetCharacterData("filterQuality", 0);
					local filterDecrease = radsDecreaseScale;
					if (filterQuality >= filterDecrease) then
						player:SetCharacterData("filterQuality", filterQuality - filterDecrease);
						minutesPerRadLoss = minutesPerRadLoss - baseline * 0.2;
					end;
				end;
			end;
			
			-- Add hunger decrease or boost
			local hunger = player:GetCharacterData("hunger");
			if (hunger) then
				if (hunger <= 80) then
					minutesPerRadLoss = minutesPerRadLoss - baseline * 0.1;
				elseif (hunger > 90) then
					minutesPerRadLoss = minutesPerRadLoss + baseline;
				end;
			end;
			
			-- Add thirst decrease or boost
			local thirst = player:GetCharacterData("thirst");
			if (thirst) then
				if (thirst <= 80) then
					minutesPerRadLoss = minutesPerRadLoss - baseline * 0.1;
				elseif (thirst > 90) then
					minutesPerRadLoss = minutesPerRadLoss + baseline;
				end;
			end;
			
			-- Decrease radiation level
			newRadsLevel = Clamp(newRadsLevel 
					- radsDecreaseScale / (minutesPerRadLoss * 60), 0, self.maxRads);
			player:SetCharacterData("rads", newRadsLevel);
		end;
		
		-- Calculate the radiation tier
		local radiationTier = Clamp(math.floor(newRadsLevel * 5 / self.maxRads), 0, 5);
				
		if (radiationTier > 0) then
			if (faction.radiationHeals) then
				player:SetHealth(Clamp(player:Health() + radiationTier, 0, player:GetMaxHealth()));
			elseif (!faction.radiationImmune) then
				-- Above Tier 1: Stamina is halved
				if (radiationTier >= 1) then
					local stamina = player:GetCharacterData("Stamina");
					if (stamina > 0) then
						player:SetCharacterData("Stamina", Clamp(stamina - radiationTier * 2.5, 50, 100));
					end;
				end;
				
				-- Radiation Tier 1: Player slowly heals
				if (radiationTier == 0) then
					local maxHealth = player:GetMaxHealth();
					-- 43200 = 12 * 3600
					local tickHeal = (maxHealth * radiationTickTime) / 43200;
					local damage = player:GetCharacterData("radiationDamage") - tickHeal;
					
					if (damage >= 1) then
						player:SetHealth(Clamp(player:Health() - math.ceil(damage), 0, maxHealth));
						player:SetCharacterData("radiationDamage", damage - math.ceil(damage));
					else
						player:SetCharacterData("radiationDamage", damage);
					end;
				
				-- Above Tier 2: Player slowly dies
				elseif (radiationTier >= 2) then
					local maxHealth = player:GetMaxHealth();
					local hoursToDeath = 18 * (1 - ((newRadsLevel - 0.4 * self.maxRads) / (0.6 * self.maxRads)));
					-- Player should instantly die
					if (hoursToDeath <= 0) then
						player:Kill();
						return;
					end;
					-- Calculate the damage this tick will do
					local tickDamage = (maxHealth * radiationTickTime) / (3600 * hoursToDeath);
					-- Calculate total accumelated damage
					local damage = player:GetCharacterData("radiationDamage") + tickDamage;
					
					-- If there is enough damage to remove a health point, do so
					if (damage >= 1) then
						-- Remove as many health points as possible
						player:SetHealth(Clamp(player:Health() - math.floor(damage), 0, maxHealth));
						-- Update remaining damage
						player:SetCharacterData("radiationDamage", damage - math.floor(damage));
					-- Else update remaining damage
					else
						player:SetCharacterData("radiationDamage", damage);
					end;
					
					-- If player is dead, then kill him.
					if (player:Health() == 0) then
						player:Kill();

						local playerColor = team.GetColor(player:Team());
						local listeners = {};
						for k, v in pairs(_player.GetAll()) do
							if (v:IsAdmin() or v:IsSuperAdmin() or v:IsUserGroup("operator")) then
								listeners[#listeners + 1] = v;
							end;
						end;

						local data = {playerName = player:Name(), playerColor = playerColor, attackerName = "Radiation", attackerColor = Color(255, 255, 255, 255)};
						Clockwork.chatBox:Add(listeners, nil, "deathnotification", "", data);
						return;
					end;
				end;
			end;
		end;
	end;
end;

-- Called each tick.
function PLUGIN:Tick()
	local curTime = CurTime();
	if (!self.NextRadCheck or self.NextRadCheck < curTime) then
		self.NextRadCheck = curTime + Clockwork.config:Get("radiation_tick_time"):Get();
		
		local players = _player.GetAll();
		local glowingGhoulsTemp = {};
		for k, v in pairs(players) do
			-- NOTE: still need to set correct model path
			if (v:HasInitialized() and v:GetModel() == "models/ghouls/glowing_ghould.mdl") then
				glowingGhoulsTemp[#glowingGhoulsTemp + 1] = v;
			end;
		end;

		self.glowingGhouls = glowingGhoulsTemp;
	end;
end;

function PLUGIN:PlayerShouldStaminaRegenerate(player)
	local faction = Clockwork.faction:FindByID(player:GetFaction());
	-- If player is not part of a faction that is not affected by radiation
	if (!faction.radiationHeals or !faction.radiationImmune or !faction.noRadiation) then
		local radiationTier = math.Clamp(math.floor(player:GetCharacterData("rads") * 5 / self.maxRads), 0, 5);
		-- If player's radiation tier is 1 half stamine
		if (radiationTier == 1) then
			return (player:GetCharacterData("Stamina") < 50);
		-- If player's radiation tier is at least 2 or higher, stop stamine regen entirely
		elseif (radiationTier >= 2) then
			return false;
		end;
	end;
end;