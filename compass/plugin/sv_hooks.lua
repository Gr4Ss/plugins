
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

function PLUGIN:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
	if (firstSpawn) then
		player:SetSharedVar("compass", player:GetData("compass", false))
	end;
end;