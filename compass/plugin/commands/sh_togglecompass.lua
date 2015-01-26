
local COMMAND = Clockwork.command:New("ToggleCompass");
COMMAND.tip = "Toggles your HUD compass on and off.";
COMMAND.flags = CMD_DEFAULT;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local compass = !player:GetSharedVar("compass");
	player:SetData("compass", compass);
	player:SetSharedVar("compass", compass);

	if (compass == false) then
		Clockwork.player:Notify(player, "You have turned your compass off.");
	else
		Clockwork.player:Notify(player, "You have turned your compass on.");
	end;
end;

COMMAND:Register();

if (CLIENT) then
	Clockwork.quickmenu:AddCallback("Toggle Compass", nil, function()
		local commandTable = Clockwork.command:FindByID("ToggleCompass");
		
		if (commandTable) then
			return {
				toolTip = commandTable.tip,
				Callback = function(option)
					Clockwork.kernel:RunCommand("ToggleCompass");
				end
			};
		else
			return false;
		end;
	end);
end;