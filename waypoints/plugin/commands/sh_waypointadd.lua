
local PLUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("WaypointAdd");
COMMAND.tip = "Add a waypoint where you are looking.";
COMMAND.text = "<string Text> [string Color]";
COMMAND.access = "P";
COMMAND.arguments = 1;
COMMAND.optionalArguments = 1;

function COMMAND:OnRun(player, arguments)
	local trace = player:GetEyeTraceNoCursor();

	local pos = trace.HitPos + Vector(0, 0, 30);
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
	waypoint.pos = pos;
	waypoint.text = text;
	waypoint.color = color;

	PLUGIN:AddWaypoint(waypoint);
	Clockwork.player:Notify(player, "You have added a waypoint.");
end;

COMMAND:Register();