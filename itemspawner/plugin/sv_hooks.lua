
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

PLUGIN.itemSpawns = {};
PLUGIN.itemCount = 0;

-- Called when Clockwork has loaded all of the entities.
function PLUGIN:ClockworkInitPostEntity()
	local count = 0;
	local time = os.time();
	local allItems = ents.FindByClass("cw_item");
	
	for k, item in pairs(allItems) do
		local itemTable = item:GetItemTable();
		local spawned = itemTable:GetData("spawned");
		if (spawned and (spawned + 2 * 24 * 3600 > time)) then
			count = count + 1;
		end;
	end;

	PLUGIN.itemCount = count;
	
	PLUGIN:LoadItemSpawns();
end;

-- Called just after data should be saved.
function PLUGIN:PostSaveData()
	self:SaveItemSpawns();
end;

-- Called each tick.
function PLUGIN:Tick()
	local curTime = CurTime();
	-- Check if interval is reached
	if (!self.nextItemSpawn) then
		self.nextItemSpawn = curTime + 60 -- Clockwork.config:Get("item_spawn_interval"):Get();
	elseif (curTime >= self.nextItemSpawn) then
		-- Get spawn interval, randomize it by +-20% and set next spawn time
		local spawnInterval = Clockwork.config:Get("item_spawn_interval"):Get();
		spawnInterval = spawnInterval + ((2 * math.random() - 1) * 0.2 * spawnInterval);
		self.nextItemSpawn = curTime + spawnInterval;
		-- Check if there is an itemsList already, and make one if not
		if (!self.itemsList) then
			self.itemsList, self.rareItemsList = self:GetSpawnList();
		end;
		-- Check if our itemsList has anything on it
		if (self.itemsList.maxKey == 0) then
			return;
		end;
		
		local players = player.GetAll();
		-- Get the item count
		local count = self.itemCount;
		-- Get the maximum amount of items we should spawn based on the playercount
		local maxSpawn = math.Clamp(table.Count(players) * Clockwork.config:Get("items_per_player"):Get(), 
				Clockwork.config:Get("items_min"):Get(), Clockwork.config:Get("items_max"):Get());
		-- Spawn items if there are less than the maximum amount
		if (count < maxSpawn) then
			-- Spawn the needed amount to reach the maximum or else 20% of the maximum
			for i = 1, math.min(maxSpawn - count, Clockwork.config:Get("items_per_interval"):Get() * maxSpawn) do
				-- Get random position
				local randomPos = self:GetRandomItemSpawn(self.itemSpawns, players);
				-- Check if we got a position
				if (!randomPos) then
					continue;
				end
				-- Get random item
				local randomItem;
				-- Check if we need to get an item from the rare item list
				if (math.random() > 0.01) then
					randomItem = self:GetRandomItem(self.itemsList);
				else
					randomItem = self:FindRandomInTable(self.rareItemsList)
				end;
				-- Check if we got an item
				if (!randomItem) then
					continue;
				-- Make an instance if we did
				else
					randomItem = Clockwork.item:CreateInstance(tonumber(randomItem));
					-- Rare item check spawn chance check
					if (randomItem("isRare") and math.random() > randomItem("value")) then
						continue;
					end;
				end;
				
				-- Spawn the item
				local entity = Clockwork.entity:CreateItem(nil, randomItem, randomPos);
				-- If we spawned an item, add the os.time onto a data field
				if (entity) then
					entity:GetItemTable():AddData("spawned", os.time());
					self.itemCount = self.itemCount + 1;
				end;
			end
		end;
	end;
end;

function PLUGIN:EntityRemoved(entity)
	if (entity:GetClass() == "cw_item") then
		local itemTable = entity:GetItemTable();
		local spawned = itemTable:GetData("spawned");
		if (spawned) then
			self.itemCount = self.itemCount - 1;
			itemTable:RemoveData("spawned");
		end;
	end;
end