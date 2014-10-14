
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("CharTogglePersonalWeapon");
COMMAND.tip = "Toggles if a character should receive a personal weapon.";
COMMAND.text = "<string Name> <string WeaponClass>";
COMMAND.access = "a";
COMMAND.arguments = 2;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	
	if (target) then
		local personalWeapons = target:GetCharacterData("personal_weapons", {});
		local class = arguments[2];

		if (!personalWeapons[class]) then
			personalWeapons[class] = true;
			
			if (target != player) then
				Clockwork.player:Notify(player, target:Name().." will receive a "..class..".");
				Clockwork.player:Notify(target, player:Name().." has made you receive a "..class..".");
			else
				Clockwork.player:Notify(player, "You will receive a "..class..".");
			end;

			if (Clockwork.config:Get("give_weapons"):Get() == true) then
				target:Give(class);
			end;
		else
			personalWeapons[class] = nil;
			
			if (target != player) then
				Clockwork.player:Notify(player, target:Name().." will no longer receive a "..class..".");
				Clockwork.player:Notify(target, player:Name().." has made you no longer receive a "..class..".");
			else
				Clockwork.player:Notify(player, "You will no longer receive a "..class..".");
			end;
		end;

		target:SetCharacterData("personal_weapons", personalWeapons);
	else
		Clockwork.player:Notify(player, arguments[1].." is not a valid character!");
	end;
end;

COMMAND:Register();