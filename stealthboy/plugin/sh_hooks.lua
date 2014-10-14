
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

-- Called when shared variables have to be added
function PLUGIN:ClockworkAddSharedVars(globalVars, playerVars)
	playerVars:Number("stealthBoyTime", true);
end;