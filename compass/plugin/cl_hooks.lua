
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

surface.CreateFont("CompassFont", {
    font    = "BudgetLabel",
    size    = 25,
    weight  = 1000,
    antialias = true,
    shadow = false,
	outline = true
});

PLUGIN.compassText = {};
PLUGIN.compassText[0] 		= "N";
PLUGIN.compassText[45] 		= "NW";
PLUGIN.compassText[90] 		= "W";
PLUGIN.compassText[135] 	= "SW";
PLUGIN.compassText[180] 	= "S";
PLUGIN.compassText[-180] 	= "S";
PLUGIN.compassText[-135] 	= "SE";
PLUGIN.compassText[-90] 	= "E";
PLUGIN.compassText[-45] 	= "NE";

function PLUGIN:HUDPaint()
	if (Clockwork.Client:GetSharedVar("compass") != true) then
		return;
	end;

	local width = ScrW() / 2.5;
	local height = 30;
	draw.RoundedBox(8, (ScrW() / 2) - (width / 2), 100, width, height, Color(0, 0, 0, 180));	
	
	local finalText = "";
	local yaw = math.floor(Clockwork.Client:GetAngles().y);

	for i = yaw - 50, yaw + 50 do
		local y = i;
		if i > 180 then
			y = -360 + i;
		elseif i < -180 then
			y = 360 + i;
		end;

		if (self.compassText[y]) then
			finalText = self.compassText[y]..finalText;
		else
			finalText = " "..finalText;
		end;
	end;

	draw.DrawText(finalText, "CompassFont", ScrW() / 2, 100 + 2, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER);
end;