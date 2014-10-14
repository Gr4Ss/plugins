local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

Clockwork.config:AddToSystem("Minimum Items Spawned", "items_min", "The minimum amount of items that can be spawned at one time.", 0, 128, 0);
Clockwork.config:AddToSystem("Maximum Items Spawned", "items_max", "The maximum amount of items that can be spawned at one time.", 0, 256, 0);
Clockwork.config:AddToSystem("Items per Player", "items_per_player", "The amount of items to spawn per player online, between min and max amount.", 0, 10, 1);
Clockwork.config:AddToSystem("Item Spawn Interval", "item_spawn_interval", "The interval between spawning items, with a random 20% deviation.", 0, 7200, 0);
Clockwork.config:AddToSystem("Items per Interval", "items_per_interval", "The maximum amount of items to spawn per interval, as a fraction of the maximum amount of items.", 0, 1);