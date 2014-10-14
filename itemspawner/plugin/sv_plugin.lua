
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

Clockwork.config:Add("item_spawn_interval", 720, false);
Clockwork.config:Add("items_per_player", 1, false);
Clockwork.config:Add("items_per_interval", 0.2, false);
Clockwork.config:Add("items_min", 10, false);
Clockwork.config:Add("items_max", 60, false);

-- A function to load the item spawns.
function PLUGIN:LoadItemSpawns()
	self.itemSpawns = Clockwork.kernel:RestoreSchemaData( "plugins/itemspawns/"..game.GetMap());
	
	if (!self.itemSpawns) then
		self.itemSpawns = {};
	end;
end;

-- A function to save the item spawns.
function PLUGIN:SaveItemSpawns()
	Clockwork.kernel:SaveSchemaData("plugins/itemspawns/"..game.GetMap(), self.itemSpawns);
end;

-- A function to get a random item spawn.
function PLUGIN:GetRandomItemSpawn(itemSpawns, players)
	-- Get a random position
	local position = itemSpawns[math.random(1, #itemSpawns)];
	-- Return if no position was found
	if (!position) then return end;

	-- If a player is too close to the item spawn, it will select a different item spawn.
	for k, player in pairs(players) do
		if (player:HasInitialized() and player:GetPos():Distance(position) <= 512 and !player:IsNoClipping()) then
			return nil;
		end;
	end;
	-- return position plus a random offset
	return (position + Vector(math.random(256), math.random(256), 0));
end;

-- A function to get a random item.
function PLUGIN:GetRandomItem(tbl)
	local table = tbl;
	-- Get a random list
	local itemList = PLUGIN:FindRandomInTable(table);
	-- Get random item from that list
	local item = PLUGIN:FindRandomInTable(itemList);
	-- Return random item
	return item;
end;

function PLUGIN:FindRandomInTable(tbl)
	local table = tbl;
	-- Check if the table is valid
	if (!table or type(table) != "table") then
		return nil;
	end;
	-- Get count and random field
	local count = table.maxKey;
	local rand = math.random(count);
	-- Return the field if it is not a number
	if (type(table[rand]) != "number") then
		return table[rand];
	-- Else return the field that is where the current field points
	else
		return table[table[rand]];
	end;
end;

function PLUGIN:GetSpawnList()
	-- Spawn chance for each item type
	local typeValues = {
		["misc"] = 10,
		["consumable"] = 40,
		["crafting"] = 30,
		["medical"] = 10,
		["junk"] = 10
	}
	-- Create empty tables
	local itemsLists = {};
	local rareItems = {};
	-- Start making the tables with all items
	for k, v in pairs(Clockwork.item:GetAll()) do
		-- Grab value from the item
		local itemValue = v("value");
		if (itemValue) then
			-- Grab isRare and type of the item
			local rareItem = v("isRare");
			local itemType = v("type");
			-- If the item is rare
			if (rareItem) then
				-- Get the latest key
				local key = rareItems.maxKey or 0;
				key = key + 1;
				-- Add in item
				rareItems[key] = tostring(v("index"));
				rareItems.maxKey = key;
			-- Else if the item has a valid category
			elseif (itemType and typeValues[itemType]) then
				-- Ensure itemValue is at least 1
				itemValue = math.max(math.Round(itemValue), 1);
				-- Set up the table to the previous one or a new one if it doesn't exist yet
				itemsLists[itemType] = itemsLists[itemType] or {};
				-- Get the latest key
				local amount = itemsLists[itemType].maxKey or 0;
				-- Set next position
				local nxt = amount + itemValue;
				-- Fill the fields between the previous and current item
				for i = amount + 1, nxt - 1 do
					itemsLists[itemType][i] = nxt;
				end;
				-- Add in current item
				itemsLists[itemType][nxt] = tostring(v.index);
				-- Set latest key
				itemsLists[itemType].maxKey = nxt;
			end;
		end;
	end;

	-- Setup table with the itemsLists
	local items = {};
	for type, itemList in pairs(itemsLists) do
		-- Grab value of the type
		local value = typeValues[type];
		-- If the type has a value, it's an existing type
		if (value) then
			-- Ensure the value is at least 1
			value = math.max(math.Round(value), 1);
			-- If there is no items in the table, don't bother adding it and continue
			if (table.Count(itemList) == 0) then
				continue;
			end;
			-- Get the latest key
			local amount = items.maxKey or 0;
			-- Set next position
			local nxt = amount + value;
			-- Fill the fields between the previous and current item
			for i = amount + 1, nxt - 1 do
				items[i] = nxt;
			end;
			-- Add in current item
			items[nxt] = itemList;
			-- Set latest key
			items.maxKey = nxt;
		-- Else it doesn't exist, throw an error
		else
			ErrorNoHalt("[Itemspawner] Item exists with unexisting type "..type..".\n");
		end;
	end;
	return items, rareItems;
end;