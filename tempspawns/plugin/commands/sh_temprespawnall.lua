
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("TempSpawnAll");
COMMAND.tip = "Moves all eligible players to a temporary spawnpoint.";
COMMAND.access = "a";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if (#PLUGIN.tempSpawns == 0) then
		Clockwork.player:Notify(player, "There are no temporary spawnpoints set!");
	end;

	local players = _player.GetAll();
	local amount = 0;

	for k, ply in pairs(players) do
		if (!ply:HasInitialized() or ply:IsNoClipping() or !ply:Alive()) then
			continue;
		end;

		local faction = Clockwork.player:GetFactionTable(ply);
		if (!faction.useTempSpawns) then
			continue;
		end;

		if (ply:IsRagdolled()) then
			Clockwork.player:SetRagdollState(ply, RAGDOLL_NONE);
		end;

		ply:SetPos(PLUGIN.tempSpawns[math.random(#PLUGIN.tempSpawns)]);
		amount = amount + 1;
	end;

	if (amount == 1) then
		Clockwork.player:Notify(player, "You have reswpaned 1 player.");
	else
		Clockwork.player:Notify(player, "You have respawned "..amount.." players.");
	end;
end;

COMMAND:Register();