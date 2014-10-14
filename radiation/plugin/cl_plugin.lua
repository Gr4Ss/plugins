
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

Clockwork.config:AddToSystem("Maximum Rads", "max_rads", "The maximum amount of rads a player can have.", 0, 2000, 0);
Clockwork.config:AddToSystem("Radiation Tick Time", "radiation_tick_time", "The amount of time in seconds between each tick of the radiation plugin.", 0, 10, 1);
Clockwork.config:AddToSystem("Radiation Loss Minutes","radiation_loss_minutes", "The amount of time in minutes it should take to lose one rad when no rads are being gained.", 0, 60, 1);
Clockwork.config:AddToSystem("Radiation Gain Per Second", "radiation_increase", "The amount of rads gained per second in a default irradiated zone.", 0, 10, 2);

Clockwork.chatBox:RegisterClass("deathnotification", nil, function(info)
	Clockwork.chatBox:Add(info.filtered, "icon16/error.png", info.data.attackerColor, info.data.attackerName, " has killed ", info.data.playerColor, info.data.playerName, "!");
end);

-- Called when the text and color for radiation are needed.
function PLUGIN:GetRadsText(rads)
	local maxRads = Clockwork.config:Get("max_rads"):Get();
	if (rads < maxRads * 0.2) then
		return "Tier 0", Color(34, 139, 34, 255); -- green
	elseif (rads < maxRads * 0.4) then
		return "Tier 1", Color(102, 255, 51, 255); -- lime green
	elseif (rads < maxRads * 0.6) then
		return "Tier 2", Color(255, 255, 0, 255); -- yellow
	elseif (rads < maxRads * 0.8) then
		return "Tier 3", Color(255, 140, 0, 255); -- orange
	elseif (rads < maxRads) then
		return "Tier 4", Color(255, 0, 0, 255); -- red
	end;

	return "Unknown", Color(255, 255, 255, 255);
end;