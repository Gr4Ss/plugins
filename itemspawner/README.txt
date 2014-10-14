Commands for adding in itemspawns are as you expect: itemspawnadd, itemspawnremove and itemspawnremoveall

Max/min amount of items to spawn, items per player, how many to spawn each cycle, how often to spawn items
can all be edited in-game through the config.

There's a minimum amount and maximum amount of items it will have spawned on the map.
This is equal to the items per player times the amount of players online, clamped between the absolute min and max.

There are five categories items can fall under:
	local typeValues = {
		["misc"] = 10,
		["consumable"] = 40,
		["crafting"] = 30,
		["medical"] = 10,
		["junk"] = 10
	}
These can be editted in the sv_plugin to change their spawn chance, add/remove some, etc.
Note: spawnchance of a category = category's spawn chance / sum of all category spawn chances

Items need a ITEM.value = <int> and either a ITEM.isRare = true;
or ITEM.type = <string> (with string one of the categories specified in typeValues)

The algorithm will first select a category, then pick an item from that category.
There is a 1% chance it will use the rare table.

For regular items, spawn values must be integers, cannot be lower than 1 but can be as big as you want them to be.

Rare items use a fraction between 0 and 1 for their spawn chance. Once the rare table is selected, a random rare item is picked.
Then a roll is done. If the role is lower than the value, the item will be spawned.
Even with a value of 1, rare items will still be rare, anything lower and they will be very rare.
This is because for a rare item to spawn, first it has to select the rare table, then the rare item, then meet the roll)
That is three checks which all must be passed, and if one fails it won't spawn anything as opposed to regular items which guarantee something will spawn.