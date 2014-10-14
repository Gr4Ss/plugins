
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

-- Called when the local player's motion blurs should be adjusted.
function PLUGIN:PlayerAdjustMotionBlurs(motionBlurs)
	if (!IsValid(Clockwork.Client) or !Clockwork.Client:HasInitialized()) then
		return;
	end;
	-- Don't add blur in these cases
	local faction = Clockwork.faction:FindByID(Clockwork.Client:GetFaction());
	if (Clockwork.Client:IsNoClipping() or faction.radiationHeals
		or faction.radiationImmune) then
		return;
	end;
	-- Add rads motion blur
	local rads = Clockwork.Client:GetSharedVar("rads");
	local maxRads = Clockwork.config:Get("max_rads"):Get();
	if (!rads) then
		return;
	-- Set blur when reaching 4th Tier
	elseif (faction.radiationImmune) then
		rads = math.Clamp(1 - ((rads - maxRads * 0.8) / (maxRads * 0.2)), 0, 1);
		motionBlurs.blurTable["rads"] = rads;
	-- Set blur when reaching second Tier
	else
		rads = math.Clamp(1 - ((rads - maxRads * 0.4) / (maxRads * 0.2)), 0, 1);
		motionBlurs.blurTable["rads"] = rads;
	end;
end;

-- Called at an interval to play geiger counter sounds
function PLUGIN:Tick()
	if (!IsValid(Clockwork.Client) or !Clockwork.Client:HasInitialized() or Clockwork.Client:IsNoClipping()) then
		return
	end;

	local curTime = CurTime();
	if (!self.nextGeigerSound or self.nextGeigerSound < curTime) then
		local radiationScale = Clockwork.Client:GetSharedVar("radiationScale") or 0;
		-- Add some random variation to the interval
		local rand = math.random(-1, 1);
		local timeVar = rand / 10;
		if (radiationScale == 0) then
			self.nextGeigerSound = curTime + 1 + timeVar;
			return;
		elseif (radiationScale < 0.5) then
			rand = rand + 2;
			self.nextGeigerSound = curTime + 0.6 + timeVar;
		elseif (radiationScale >= 0.5 and radiationScale < 1.5) then
			rand = rand + 3;
			self.nextGeigerSound = curTime + 0.4+ timeVar;
		elseif (radiationScale >= 1.5) then
			rand = rand + 5;
			self.nextGeigerSound = curTime + 0.2 + timeVar;
		end;
		-- Play the sound to the player
		surface.PlaySound("newvegas/geiger"..math.random(1, 6)..".mp3");
	end;
end;

-- Called when the radiation bar is needed
function PLUGIN:GetBars(bars)
	local rads = Clockwork.Client:GetSharedVar("rads");
	local maxRads = Clockwork.config:Get("max_rads"):Get();
	if (!rads) then
		rads = 0;
	elseif (rads > maxRads * 0.1) then
		local radiationScale = Clockwork.Client:GetSharedVar("radiationScale");
		if (!radiationScale) then
			radiationScale = 0;
		end;
		
		if (!self.radiation) then
			self.rads = rads;
		else
			self.rads = math.Approach(self.rads, rads, maxRads / 100);
		end;
		
		local text, color = self:GetRadsText(self.rads);
		
		bars:Add("RADIATION", color, "Rad Poisoning: "..text.." ("..math.Round(self.rads, 1).." Rads)", self.rads, maxRads, radiationScale > 0);
	end;
end;