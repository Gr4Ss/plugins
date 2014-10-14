
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("RadiationZoneRemove");
COMMAND.tip = "Remove the highest scale radiation zone you currently are in.";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "s";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	
	local pos = player:GetShootPos();
	for k, v in pairs(PLUGIN.radiationZones) do
		if (PLUGIN:IsInBox(pos, v.minimum, v.maximum)) then
			Clockwork.player:Notify(player, "You removed a radiation zone with scale "..v.scale..".");
			PLUGIN.radationZones[k] = nil;
			PLUGIN:SaveRadiationZones();
			return;
		end;
	end;
	
	Clockwork.player:Notify(player, "There were no radiation zones near your position.");
end;

COMMAND:Register();