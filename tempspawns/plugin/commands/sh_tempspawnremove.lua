
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("TempSpawnRemove");
COMMAND.tip = "Removes all temporary spawnpoints within the given distance.";
COMMAND.text = "[number Distance|Default: 128]";
COMMAND.access = "a";
COMMAND.optionalArguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local position = player:GetEyeTraceNoCursor().HitPos + Vector(0, 0, 8);
	local amount = 0;

	local distance = tonumber(arguments[1]);
	if (!distance) then
		distance = 128;
	end;

	for k, spawn in pairs(PLUGIN.tempSpawns) do
		if (position:Distance(spawn) < distance) then
			PLUGIN.tempSpawns[k] = nil;
			amount = amount + 1;
		end;
	end;

	if (amount == 1) then
		Clockwork.player:Notify(player, "You have removed 1 temporary spawn.");
	else
		Clockwork.player:Notify(player, "You have removed "..amount.." temporary spawns.");
	end;
end;

COMMAND:Register();