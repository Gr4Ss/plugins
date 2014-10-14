
local PLUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("WaypointRemoveAll");
COMMAND.tip = "Remove all current waypoints.";
COMMAND.access = "P";

function COMMAND:OnRun(player, arguments)
	if (table.Count(PLUGIN.waypoints) > 0) then
		PLUGIN:RemoveWaypoints();
		Clockwork.player:Notify(player, "You have removed all waypoints.");
	else
		Clockwork.player:Notify(player, "There are no waypoints set.");
	end;
end;

COMMAND:Register();