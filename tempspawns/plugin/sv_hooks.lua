
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

PLUGIN.tempSpawns = {};

function PLUGIN:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
	if (!player:HasInitialized()) then
		return;
	end;

	if (!lightSpawn) then
		if (Clockwork.player:GetFactionTable(player).useTempSpawns) then
			local amount = table.Count(self.tempSpawns);
			if (amount > 0) then
				position = self.tempSpawns[math.random(amount)];
				player:SetPos(position);
			end;
		end;
	end;
end;

function PLUGIN:GetSpawnpointESPInfo(spawnpoints)
	for k, spawn in pairs(self.tempSpawns) do
		spawnpoints[#spawnpoints + 1] = {name = "TempSpawn", position = spawn};
	end;
end;