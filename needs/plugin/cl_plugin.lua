
local Clockwork = Clockwork;
local PLUGIN = PLUGIN;

Clockwork.flag:Add("f", "Food", "Access to food items on the business menu.");
Clockwork.flag:Add("d", "Light Drinks", "Access to light drinks on the business menu.");
Clockwork.flag:Add("D", "Heavy Drinks", "Access to heavy drinks on the business menu.");

function PLUGIN:GetHungerText(hunger)
	if (hunger <= 50) then
		return "Well Fed", Color(34, 139, 34, 255); -- green
	elseif (hunger <= 60) then
		return "Satisfied", Color(102, 255, 51, 255); -- lime green
	elseif (hunger <= 80) then
		return "Hungry", Color(255, 255, 0, 255); -- yellow
	elseif (hunger <= 90) then
		return "Very Hungry", Color(255, 140, 0, 255); -- orange
	elseif (hunger <= 100) then
		return "Starving", Color(255, 0, 0, 255); -- red
	end;

	return "Unknown", Color(255, 255, 255, 255);
end;

function PLUGIN:GetThirstText(thirst)
	if (thirst <= 50) then
		return "Hydrated", Color(34, 139, 34, 255); -- green
	elseif (thirst <= 60) then
		return "Satisfied", Color(102, 255, 51, 255); -- lime green
	elseif (thirst <= 80) then
		return "Thirsty", Color(255, 255, 0, 255); -- yellow
	elseif (thirst <= 90) then
		return "Very Thirsty", Color(255, 140, 0, 255); -- orange
	elseif (thirst <= 100) then
		return "Dehydrated", Color(255, 0, 0, 255); -- red
	end;

	return "Unknown", Color(255, 255, 255, 255);
end;