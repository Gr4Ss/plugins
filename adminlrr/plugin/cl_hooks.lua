
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

function PLUGIN:AdjustRadioTransmit(info)
	if (info.data.forceName) then
		info.name = info.data.forceName;
	end;
end;