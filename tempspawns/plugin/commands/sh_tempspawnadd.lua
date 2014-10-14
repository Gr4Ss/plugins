
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("TempSpawnAdd");
COMMAND.tip = "Adds a temporary spawnpoint where you are aiming.";
COMMAND.access = "a";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local position = player:GetEyeTraceNoCursor().HitPos + Vector(0, 0, 8);

	PLUGIN.tempSpawns[#PLUGIN.tempSpawns + 1] = position;

	Clockwork.player:Notify(player, "You have added a temporary spawnpoint.");
end;

COMMAND:Register();