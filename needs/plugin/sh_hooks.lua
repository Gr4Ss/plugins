
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

function PLUGIN:ClockworkAddSharedVars(globalVars, playerVars)
	playerVars:Number("hunger", true);
	playerVars:Number("thirst", true);
end;