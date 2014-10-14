
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("TempSpawnRemoveAll");
COMMAND.tip = "Removes all temporary spawnpoints.";
COMMAND.access = "a";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if (#PLUGIN.tempSpawns == 0) then
		Clockwork.player:Notify(player, "There are no temporary spawnpoints.");
		return;
	elseif (#PLUGIN.tempSpawns == 1) then
		Clockwork.player:Notify(player, "You have removed one temporary spawnpoint.");
	else
		Clockwork.player:Notify(player, "You have removed all "..#PLUGIN.tempSpawns.." temporary spawnpoints.");
	end;

	PLUGIN.tempSpawns = {};
end;

COMMAND:Register();