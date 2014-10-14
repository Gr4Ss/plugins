
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("ItemSpawnAdd");
COMMAND.tip = "Add an item spawn at your target position.";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "s";
COMMAND.arguments = 0;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local position = player:GetEyeTraceNoCursor().HitPos + Vector(0, 0, 32);
	
	if (PLUGIN.itemSpawns) then
		PLUGIN.itemSpawns[#PLUGIN.itemSpawns + 1] = position;
	else
		PLUGIN.itemSpawns = {};
		PLUGIN.itemSpawns[1] = position;
	end;
	PLUGIN:SaveItemSpawns();
	
	Clockwork.player:Notify(player, "You have added an item spawn.");
end;

COMMAND:Register();