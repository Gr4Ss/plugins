
local PLUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("WaypointUpdate");
COMMAND.tip = "Update an existing waypoint closest to where you are looking.";
COMMAND.text = "<string Text> [string Color]";
COMMAND.access = "P";
COMMAND.arguments = 1;
COMMAND.optionalArguments = 1;

function COMMAND:OnRun(player, arguments)
	local trace = player:GetEyeTraceNoCursor();

	local pos = trace.HitPos + Vector(0, 0, 30);
	local index = nil;
	local minDistanceSqr = nil;

	for k, point in pairs(PLUGIN.waypoints) do
		if (!index) then
			index = k;
			minDistanceSqr = point.pos:DistToSqr(pos);
		else
			local dist = point.pos:DistToSqr(pos);
			if (dist < minDistanceSqr) then
				index = k;
				minDistanceSqr = dist;
			end;
		end;
	end;

	if (!index) then
		Clockwork.player:Notify(player, "There are no waypoints set yet!");
		return;
	elseif (index and minDistanceSqr > 40000) then
		Clockwork.player:Notify(player, "There are no waypoints near where you are looking!");
		return;
	end;


	local text = arguments[1];
	if (#arguments > 2) then
		text = table.concat(arguments, " ", 1, #arguments - 1);
	end;
	local color = Color(255, 255, 255, 255);

	if (#arguments >= 2) then
		local colorName = string.lower(arguments[#arguments]);
		color = PLUGIN:GetWaypointColor(colorName);
		if (!color) then
			Clockwork.player:Notify(player, "'"..colorName.."' is not a valid color!");
			return;
		end;
	end;

	local waypoint = {};
	waypoint.pos = PLUGIN.waypoints[index].pos;
	waypoint.noDistance = PLUGIN.waypoints[index].noDistance;
	waypoint.text = text;
	waypoint.color = color;

	PLUGIN:UpdateWaypoint(index, waypoint);
	Clockwork.player:Notify(player, "You have updated a waypoint.");
end;

COMMAND:Register();