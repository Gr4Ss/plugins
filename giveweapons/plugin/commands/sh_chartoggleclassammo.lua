
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("CharToggleClassAmmo");
COMMAND.tip = "Toggle if a character should receive their class/faction ammo.";
COMMAND.text = "<string Name>";
COMMAND.access = "a";
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	
	if (target) then
		local newValue = not target:GetCharacterData("class_ammo", true);
		target:SetCharacterData("class_ammo", newValue);

		if (newValue) then
			PLUGIN:GiveClassAmmo(target);
			if (target != player) then
				Clockwork.player:Notify(player, target:Name().." will receive class/faction ammo.");
				Clockwork.player:Notify(target, player:Name().." has made you receive class/faction ammo.");
			else
				Clockwork.player:Notify(player, "You will receive class/faction ammo.");
			end;
		else
			if (target != player) then
				Clockwork.player:Notify(player, target:Name().." will no longer receive class/faction ammo.");
				Clockwork.player:Notify(target, player:Name().." has made you no longer receive class/faction ammo.");
			else
				Clockwork.player:Notify(player, "You will no longer receive class/faction ammo.");
			end;
		end;
	else
		Clockwork.player:Notify(player, arguments[1].." is not a valid character!");
	end;
end;

COMMAND:Register();