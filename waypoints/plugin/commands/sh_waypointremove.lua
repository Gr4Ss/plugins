
local PLUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("WaypointRemove");
COMMAND.tip = "Remove an existing waypoint closest to where you are looking.";
COMMAND.access = "P";

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

	PLUGIN:UpdateWaypoint(index, nil);
	Clockwork.player:Notify(player, "You have removed a waypoint.");
end;

COMMAND:Register();