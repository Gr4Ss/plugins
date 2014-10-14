
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

-- Called when the local player's motion blurs should be adjusted.
function PLUGIN:PlayerAdjustMotionBlurs(motionBlurs)
	if (Clockwork.Client:HasInitialized()) then
		scale = Clockwork.Client:GetSharedVar("gasScale");

		if (!self.scale) then
			self.scale = scale;
		else
			self.scale = math.Approach(self.scale, scale, 0.01);
		end;

		math.Clamp(self.scale, 0, 1);
		
		if (self.scale > 0) then
			motionBlurs.blurTable["gas"] = 1 - self.scale;
		end;
	end;
end;
