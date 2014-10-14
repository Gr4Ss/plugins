
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

-- Called when the local player's motion blurs should be adjusted.
function PLUGIN:PlayerAdjustMotionBlurs(motionBlurs)
	if (!IsValid(Clockwork.Client) or !Clockwork.Client:HasInitialized() or Clockwork.Client:IsNoClipping()) then
		return;
	end;

	local hunger = Clockwork.Client:GetSharedVar("hunger");
	local data = math.max(hunger - 90, 0);
	
	if (data > 0) then
		motionBlurs.blurTable["needs"] = (1 - (data * 0.25 / 10));
	end;
end;

-- Called when the bars are needed.
function PLUGIN:GetBars(bars)
	-- Add hunger bar
	local hunger = Clockwork.Client:GetSharedVar("hunger");
	if (!self.hunger) then
		self.hunger = hunger;
	else
		self.hunger = math.Approach(self.hunger, hunger, 1);
	end;
		
	if (hunger >= 50) then
		local text, color = self:GetHungerText(self.hunger);
		
		bars:Add("HUNGER", color, "Hunger: "..text.." ("..math.Round(self.hunger).."%)", 
					self.hunger, 100, (60 < self.hunger) and (self.hunger < 80), 0);
	end;
	
	--Add thirst bar
	local thirst = Clockwork.Client:GetSharedVar("thirst");
	if (!self.thirst) then
		self.thirst = thirst;
	else
		self.thirst = math.Approach(self.thirst, thirst, 1);
	end;
	
	if (thirst >= 50) then
		local text, color = self:GetThirstText(self.thirst);
		
		bars:Add("THIRST", color, "Thirst: "..text.." ("..math.Round(self.thirst).."%)", 
					self.thirst, 100, (60 < self.thirst) and (self.thirst < 80), 0);
	end;
end;

-- Called when the F1 Text is needed.
function PLUGIN:GetPlayerInfoText(playerInfoText)
	-- Add hunger info
	local hunger = Clockwork.Client:GetSharedVar("hunger");
	if (!self.hunger) then
		self.hunger = hunger;
	else
		self.hunger = math.Approach(self.hunger, hunger, 1);
	end;
	
	local text = self:GetHungerText(self.hunger);
	
	if (text) then
		playerInfoText:Add("HUNGER", "Hunger Level: "..text.." ("..math.Round(self.hunger)..")");
	end;
	
	-- Add thirst info
	local thirst = Clockwork.Client:GetSharedVar("thirst");
	if (!self.thirst) then
		self.thirst = thirst;
	else
		self.thirst = math.Approach(self.thirst, thirst, 1);
	end;

	local text = self:GetThirstText(self.thirst);
	
	if (text) then
		playerInfoText:Add("THIRST", "Thirst Level: "..text.." ("..math.Round(self.thirst)..")");
	end;
end;
