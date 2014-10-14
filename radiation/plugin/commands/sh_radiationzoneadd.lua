
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("RadiationZoneAdd");
COMMAND.tip = "Add a radiation area that will make the player gain radiation.";
COMMAND.text = "[number Scale]";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "s";
COMMAND.optionalArguments = 1;

function COMMAND:OnRun(player, arguments)
	local areaPointData = player.areaPointData;
	local trace = player:GetEyeTraceNoCursor();
	
	if (!areaPointData) then
		player.areaPointData = {
			first = trace.HitPos
		};

		Clockwork.player:Notify(player, "You have added point A of the radiation area, now add point B.");
	else
		if (!arguments[1] or !tonumber(arguments[1])) then
			arguments[1] = 1;
		end;
		
		local first = areaPointData.first;
		local second = trace.HitPos;
		
		local data = {
			minimum = Vector(math.min(first.x, second.x), math.min(first.y, second.y), math.min(first.z, second.z)),
			maximum = Vector(math.max(first.x, second.x), math.max(first.y, second.y), math.max(first.z, second.z)),
			scale = tonumber(arguments[1])
		};

		local radiationArea = PLUGIN.radiationArea;
		if (radiationArea) then
			local min = radiationArea.minimum; local max = radiationArea.maximum;
			if (!min.x or data.minimum.x < min.x) then min.x = data.minimum.x end;
			if (!min.y or data.minimum.y < min.y) then min.y = data.minimum.y end;
			if (!min.z or data.minimum.z < min.z) then min.z = data.minimum.z end;
			if (!max.x or data.maximum.x > max.x) then max.x = data.maximum.x end;
			if (!max.y or data.maximum.y > max.y) then max.y = data.maximum.y end;
			if (!max.z or data.maximum.z > max.z) then max.z = data.maximum.z end;
			PLUGIN.radiationArea = {minimum = min, maximum = max};
		else
			PLUGIN.radiationArea = {minimum = data.minimum, maximum = data.maximum};
		end;
		
		PLUGIN.radiationZones[#PLUGIN.radiationZones + 1] = data;
		PLUGIN:SaveRadiationZones();
		
		Clockwork.player:Notify(player, "You have added a radiation zone.");
		
		player.areaPointData = nil;
		table.sort(PLUGIN.radiationZones, function(a, b) return a.scale > b.scale end);
	end;
end;

COMMAND:Register();