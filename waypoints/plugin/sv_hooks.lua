
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

PLUGIN.waypoints = {};

function PLUGIN:PlayerSendDataStreamInfo(player)
	Clockwork.datastream:Start(player, "SetupWaypoints", self.waypoints);
end;

function PLUGIN:RemoveWaypoints()
	self.waypoints = {};
	Clockwork.datastream:Start(nil, "SetupWaypoints", {});
end;

function PLUGIN:UpdateWaypoint(index, newValue)
	self.waypoints[index] = newValue;

	Clockwork.datastream:Start(nil, "UpdateWaypoint", {index, newValue});
end;

function PLUGIN:AddWaypoint(waypoint)
	local index = table.insert(self.waypoints, waypoint);

	Clockwork.datastream:Start(nil, "UpdateWaypoint", {index, waypoint});
end;

function PLUGIN:GetWaypointColor(colorName)
	if (colorName == "white") then
		return Color(255, 255, 255, 255);
	elseif (colorName == "blue") then
		return Color(0, 114, 188, 255);
	elseif (colorName == "purple") then
		return Color(102, 51, 153, 255);
	elseif (colorName == "red") then
		return Color(255, 0, 0, 255);
	elseif (colorName == "maroon") then
		return Color(103, 0, 42, 255);
	elseif (colorName == "orange") then
		return Color(255, 122, 0, 255);
	elseif (colorName == "yellow") then
		return Color(255, 222, 0, 255);
	elseif (colorName == "green") then
		return Color(38, 106, 46, 255);
	elseif (colorName == "black") then
		return Color(0, 0, 0, 255);
	elseif (colorName == "grey" or colorName == "gray") then
		return Color(81, 81, 81, 255);
	else
		return nil;
	end;
end;