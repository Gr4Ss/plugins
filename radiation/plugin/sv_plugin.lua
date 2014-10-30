
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

Clockwork.config:Add("radiation_tick_time", 4); -- How often the PLUGIN tick function should run
Clockwork.config:Add("radiation_increase", 10); -- The amount of radiation gained every second
Clockwork.config:Add("radiation_loss_minutes", 3); -- The amount of minutes it takes to lose one rad
Clockwork.config:Add("max_rads", 1000, true, nil, nil, nil, true); -- The maximum amount of radiation someone can have

Clockwork.hint:Add("Radiation", "Watch out for radiation! It's a slow, merciless killer.");
Clockwork.hint:Add("Poisoning", "There are five tiers of rad-poisoning, each more nasty than the previous.");
Clockwork.hint:Add("FoodRads", "Some food may be radiated too. Best watch what you eat.");
Clockwork.hint:Add("RadDecrease", "Your rads will slowly decrease. If you aren't gaining any, that is.");
Clockwork.hint:Add("RadDecreaseSpeed", "Some things will speed up your rad decrease, such as eating/drinking regularly.");
Clockwork.hint:Add("RadAway", "Got a bit too many rads? Try some RadAway today to get rid of some!");

-- A function to load the radiation zones
function PLUGIN:LoadRadiationZones()
	self.radiationZones = Clockwork.kernel:RestoreSchemaData("plugins/radiationzones/"..game.GetMap(), {});
	table.sort(self.radiationZones, function(a, b) return tonumber(a.scale) > tonumber(b.scale) end);
end;

-- A function to load the no-radiation zones
function PLUGIN:LoadNoRadiationZones()
	self.noRadiationZones = Clockwork.kernel:RestoreSchemaData("plugins/noradiationzones/"..game.GetMap(), {});
end;

-- A function to save the radiation zones
function PLUGIN:SaveRadiationZones()
	Clockwork.kernel:SaveSchemaData("plugins/radiationzones/"..game.GetMap(), self.radiationZones);
end;

-- A function to save the no-radiation zones
function PLUGIN:SaveNoRadiationZones()
	Clockwork.kernel:SaveSchemaData("plugins/noradiationzones/"..game.GetMap(), self.noRadiationZones);
end;

-- A function to efficiently detect if a vector is in a box
-- Minimum already has all the minimum co-ordinates, maximum already has all the maximum co-ordinates
function PLUGIN:IsInBox(position, minimum, maximum)
	if ((position.x >= minimum.x and position.x <= maximum.x)
	and (position.y >= minimum.y and position.y <= maximum.y)
	and (position.z >= minimum.z and position.z <= maximum.z)) then
		return true;
	else
		return false;
	end;
end;