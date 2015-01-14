
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("ItemSpawnerAdd");
COMMAND.tip = "Add an item spawn at your target position.";
COMMAND.text = "[int RadiusX|Default: 64] [int RadiusY|Default: 64]";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "s";
COMMAND.arguments = 0;
COMMAND.optionalArguments = 2;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local position = player:GetEyeTraceNoCursor().HitPos + Vector(0, 0, 32);
	local radiusX = 64;
	local radiusY = 64;

	if (arguments[1] and tonumber(arguments[1])) then
		radiusX = math.max(math.Round(tonumber(arguments[1])), 0);
	end;
	if (arguments[2] and tonumber(arguments[2])) then
		radiusY = math.max(math.Round(tonumber(arguments[2])), 0);
	end;

	PLUGIN.itemSpawns = PLUGIN.itemSpawns or {};
	PLUGIN.itemSpawns[#PLUGIN.itemSpawns + 1] = {pos = position, radiusX = radiusX, radiusY = radiusY};
	PLUGIN:UpdateItemSpawnESP();
	PLUGIN:SaveItemSpawns();
	
	Clockwork.player:Notify(player, "You have added an item spawn with size "..radiusX.."x"..radiusY..".");
end;

COMMAND:Register();