
local Clockwork = Clockwork;
local PLUGIN = PLUGIN;

Clockwork.config:AddToSystem("Stealth Boy Maximum Time", "stealth_boy_max_time", "The maximum time someone can use a stealth boy", 0, 14400);

-- Called when the text and color for fatigue is needed
function PLUGIN:GetFatigueText(fatigue)
	local maxTime = Clockwork.config:Get("stealth_boy_max_time"):Get();
	local colorScale = 255 - (fatigue * 255 / maxTime);
	local color = Color(colorScale, colorScale, colorScale, 255);
	
	if (fatigue <= maxTime * 0.3) then
		return "Well Rested", color;
	elseif (fatigue <= maxTime * 0.5) then
		return "Rested", color;
	elseif (fatigue <= maxTime * 0.75) then
		return "Tired", color;
	elseif (fatigue <= maxTime * 0.95) then
		return "Very Tired", color;
	elseif (fatigue <= maxTime) then
		return "Exhausted", color;
	end;

	return "Unknown", Color(255, 255, 255, 255);
end;