
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

Clockwork.config:Add("gas_tick_time", 4); -- How often the PLUGIN tick function should run
Clockwork.config:Add("gas_damage", 5); -- The amount of gas gained every second
Clockwork.config:Add("gas_filter_scale", 1) -- How fast filters drain, 1 = 30 minutes

Clockwork.hint:Add("Gas", "Some areas contain a lethal gas! Better watch out where you go.");
Clockwork.hint:Add("Gasmask", "A gasmask with a filter will keep the gass out.");

-- A function to load the gas zones
function PLUGIN:LoadGasZones()
	self.gasZones = Clockwork.kernel:RestoreSchemaData("plugins/gaszones/"..game.GetMap(), {});
	table.sort(self.gasZones, function(a, b) return a.scale > b.scale end);

	if (#self.gasZones > 0) then
		local min = {}; local max = {}
		for k, v in pairs(self.gasZones) do
			if (!min.x or v.minimum.x < min.x) then min.x = v.minimum.x end;
			if (!min.y or v.minimum.y < min.y) then min.y = v.minimum.y end;
			if (!min.z or v.minimum.z < min.z) then min.z = v.minimum.z end;
			if (!max.x or v.maximum.x > max.x) then max.x = v.maximum.x end;
			if (!max.y or v.maximum.y > max.y) then max.y = v.maximum.y end;
			if (!max.z or v.maximum.z > max.z) then max.z = v.maximum.z end;
		end;

		self.gasArea = {minimum = min, maximum = max};
	end;
end;

-- A function to load the no-gas zones
function PLUGIN:LoadNoGasZones()
	self.noGasZones = Clockwork.kernel:RestoreSchemaData("plugins/nogaszones/"..game.GetMap(), {});
end;

-- A function to save the gas zones
function PLUGIN:SaveGasZones()
	Clockwork.kernel:SaveSchemaData("plugins/gaszones/"..game.GetMap(), self.gasZones);
end;

-- A function to save the no-gas zones
function PLUGIN:SaveNoGasZones()
	Clockwork.kernel:SaveSchemaData("plugins/nogaszones/"..game.GetMap(), self.noGasZones);
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