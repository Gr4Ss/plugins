
local Clockwork = Clockwork;
local PLUGIN = PLUGIN;

-- Called when the Clockwork shared variables are added.
function PLUGIN:ClockworkAddSharedVars(globalVars, playerVars)
	playerVars:Number("rads");
	playerVars:Number("radiationScale");
	playerVars:Number("radiationResistance");
	playerVars:Number("filterQuality");
	playerVars:Bool("hasGasmask");
end;

-- Called when Clockwork has initizialized
function PLUGIN:ClockworkInitialized()
	PLUGIN.maxRads = Clockwork.config:Get("max_rads"):Get();
end