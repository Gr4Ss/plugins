
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

function PLUGIN:AdjustRadioTransmit(info)
	if (info.data.Mobcomm) then
		info.name = "MOBCOMM";
	end;
end;