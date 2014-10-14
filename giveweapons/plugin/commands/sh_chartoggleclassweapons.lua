
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("CharToggleClassWeapons");
COMMAND.tip = "Toggle if a character should receive their class/faction weapons.";
COMMAND.text = "<string Name>";
COMMAND.access = "a";
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	
	if (target) then
		local newValue = not target:GetCharacterData("class_weapons", true);
		target:SetCharacterData("class_weapons", newValue);

		if (newValue) then
			PLUGIN:GiveClassWeapons(target);
			if (target != player) then
				Clockwork.player:Notify(player, target:Name().." will receive class/faction weapons.");
				Clockwork.player:Notify(target, player:Name().." has made you receive class/faction weapons.");
			else
				Clockwork.player:Notify(player, "You will receive class/faction weapons.");
			end;
		else
			if (target != player) then
				Clockwork.player:Notify(player, target:Name().." will no longer receive class/faction weapons.");
				Clockwork.player:Notify(target, player:Name().." has made you no longer receive class/faction weapons.");
			else
				Clockwork.player:Notify(player, "You will no longer receive class/faction weapons.");
			end;
		end;
	else
		Clockwork.player:Notify(player, arguments[1].." is not a valid character!");
	end;
end;

COMMAND:Register();