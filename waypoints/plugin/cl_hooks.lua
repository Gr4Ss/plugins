
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

PLUGIN.waypoints = {};
PLUGIN.displayWaypoints = {};

Clockwork.datastream:Hook("SetupWaypoints", function(data)
	PLUGIN.waypoints = data;
end);

Clockwork.datastream:Hook("UpdateWaypoint", function(data)
	PLUGIN.waypoints[data[1]] = data[2];
end);

function PLUGIN:HUDPaint()
	local screenPos = nil;
	local color = Color(0, 0, 0, 0);
	local text = "";
	local x, y = 0, 0;
	local height = draw.GetFontHeight("BudgetLabel");
	local clientPos = Clockwork.Client:GetPos() + Vector(0, 0, 30);

	for k, waypoint in pairs(self.waypoints) do
		screenPos = waypoint.pos:ToScreen();
		color = waypoint.color;
		text = waypoint.text;
		x, y = screenPos.x, screenPos.y;

		surface.SetDrawColor(color);
		surface.DrawLine(x + 15, y, x - 15, y);
		surface.DrawLine(x, y + 15, x, y - 15);
		surface.DrawOutlinedRect(x - 8, y - 8, 17, 17);

		surface.SetFont("BudgetLabel");
		surface.SetTextColor(color);
		local width = surface.GetTextSize(text);
		surface.SetTextPos(x - width / 2, y + 17);
		surface.DrawText(text);

		if (!waypoint.noDistance) then
			local distanceText = tostring(math.Round(clientPos:Distance(waypoint.pos) * 0.01905, 2)).."m";
			width = surface.GetTextSize(distanceText);
			surface.SetTextPos(x - width / 2, y - (15 + height));
			surface.DrawText(distanceText);
		end;
	end;
end;