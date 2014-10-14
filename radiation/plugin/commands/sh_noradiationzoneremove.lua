
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("NoRadiationZoneRemove");
COMMAND.tip = "Remove a no-radiation zone that you are in.";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "s";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	
	local pos = player:GetShootPos();
	for k, v in pairs(PLUGIN.noRadiationZones) do
		if (PLUGIN:IsInBox(pos, v.minimum, v.maximum)) then
			Clockwork.player:Notify(player, "You removed a no-radiation zone.");
			PLUGIN.noRadationZones[k] = nil;
			PLUGIN:SaveNoRadiationZones();
			return;
		end;
	end;
	
	Clockwork.player:Notify(player, "There were no no-radiation zones near your position.");
end;

COMMAND:Register();