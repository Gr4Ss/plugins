
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

function PLUGIN:OnNPCKilled(npc, attacker, inflictor)
	local weapon = npc:GetActiveWeapon()
	if (IsValid(weapon)) then
		weapon:Remove();
	end;
end;