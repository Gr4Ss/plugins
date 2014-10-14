
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

-- Called when the local player's crosshair should be drawn.
function PLUGIN:DrawPlayerCrosshair(x, y, color)
	if (Clockwork.Client:GetNWInt("thirdperson") != 0) then
		return false;
	end;

	if (Clockwork.config:Get("enable_crosshair"):Get()) then
		local weapon = Clockwork.Client:GetActiveWeapon();
		if (!weapon or (weapon:GetClass() != "cw_hands" and weapon:GetClass() != "cw_keys")) then
			surface.SetDrawColor(color.r, color.g, color.b, color.a);
			surface.DrawRect(x, y, 2, 2);
			surface.DrawRect(x, y + 9, 2, 2);
			surface.DrawRect(x, y - 9, 2, 2);
			surface.DrawRect(x + 9, y, 2, 2);
			surface.DrawRect(x - 9, y, 2, 2);
			
			return true;
		else
			return false;
		end;
	end;
end;