
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("ItemSpawnerForceAmount");
COMMAND.tip = "Makes the item spawner try to spawn the given amount of items.";
COMMAND.text = "[int Amount|Default: 1]";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "s";
COMMAND.arguments = 0;
COMMAND.optionalArguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local amount = arguments[1];
	if (!tonumber(amount)) then
		amount = 1;
	else
		amount = math.max(math.Round(tonumber(amount)), 1);
	end;

	local count = PLUGIN:GetSpawnedItemsCount();

	PLUGIN:SpawnItems(amount);

	local newCount = PLUGIN:GetSpawnedItemsCount();

	Clockwork.player:Notify(player, "Attempted to spawn items "..amount.." times. Spawned "..newCount - count.." items.");
end;

COMMAND:Register();