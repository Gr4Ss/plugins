
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

--[[
	© Songbird aka Alko -  do not re-distribute without permission of its author (ael9000 gmail.com).
--]]
-- A function to draw the background blurs.
function Clockwork.kernel:DrawBackgroundBlurs()
	local scrH, scrW = ScrH(), ScrW();
	local sysTime = SysTime();
	
	for k, v in pairs(Clockwork.BackgroundBlurs) do
		if (type(k) == "string" or (IsValid(k) and k:IsVisible())) then
			local fraction = math.Clamp((sysTime - v) / 1, 0, 1);
			local x, y = 0, 0;
			
			surface.SetMaterial(Clockwork.ScreenBlur);
			surface.SetDrawColor(255, 255, 255, 0);
			
			for i = 0.33, 1, 0.33 do
				Clockwork.ScreenBlur:SetFloat("$blur", fraction * 5 * i);
				if (render) then render.UpdateScreenEffectTexture();end;
				
				surface.DrawTexturedRect(x, y, scrW, scrH);
			end;
			
			surface.SetDrawColor(10, 10, 30, 150 * fraction)
			surface.DrawRect(x, y, scrW, scrH);
		end;
	end;
end;