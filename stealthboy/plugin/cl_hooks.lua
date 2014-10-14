local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

-- Called when the local player's motion blurs should be adjusted.
function PLUGIN:PlayerAdjustMotionBlurs(motionBlurs)
	if (!IsValid(Clockwork.Client) or !Clockwork.Client:HasInitialized() or Clockwork.Client:IsNoClipping()) then
		return;
	end;

	local fatigue = Clockwork.Client:GetSharedVar("stealthBoyTime");
	local maxTime = Clockwork.config:Get("stealth_boy_max_time"):Get();
	local data = math.max(fatigue - maxTime * 0.5, 0);
	
	if (data > 0) then
		motionBlurs.blurTable["fatigue"] = (1 - (data * 0.9 * 2 / maxTime));
	end;
end;

-- Called when the bars are needed.
function PLUGIN:GetBars(bars)
	-- Add fatigue bar
	local fatigue = Clockwork.Client:GetSharedVar("stealthBoyTime");
	if (!self.fatigue) then
		self.fatigue = fatigue;
	else
		self.fatigue = math.Approach(self.fatigue, fatigue, 1);
	end;
	
	local maxTime = Clockwork.config:Get("stealth_boy_max_time"):Get();
	if (fatigue >= maxTime * 0.5) then
		local text, color = self:GetFatigueText(self.fatigue);
		
		bars:Add("FATIGUE", color, "Fatigue: "..text.." ("..math.Round(self.fatigue * 100 / maxTime).."%)", 
					self.fatigue, maxTime, ((maxTime * 0.75) < self.fatigue), 0);
	end;
end;

-- Called when the F1 Text is needed.
function PLUGIN:GetPlayerInfoText(playerInfoText)
	-- Add fatigue info
	local fatigue = Clockwork.Client:GetSharedVar("stealthBoyTime");
	if (!self.fatigue) then
		self.fatigue = fatigue;
	else
		self.fatigue = math.Approach(self.fatigue, fatigue, Clockwork.config:Get("stealth_boy_max_time"):Get() / 100);
	end;
	
	local text = self:GetFatigueText(self.fatigue);
	if (text) then
		playerInfoText:Add("FATIGUE", "Fatigue Level: "..text.." ("..math.Round(self.fatigue)..")");
	end;
end;