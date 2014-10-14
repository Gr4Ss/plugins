
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("ToggleWeapons");
COMMAND.tip = "Toggle if weapons are enabled.";
COMMAND.text = "[bool GiveAmmo]"
COMMAND.access = "a";
COMMAND.optionalArguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local giveWeapons = Clockwork.config:Get("give_weapons");

	giveWeapons:Set(!giveWeapons:Get());

	if (giveWeapons:Get()) then
		Clockwork.player:NotifyAll(player:Name().." has turned weapons on!");
		if (arguments[1] and
			((tonumber(arguments[1]) and tonumber(arguments[1]) != 0) or 
			arguments[1] == "true" or arguments[1] == true)) then

			for k, v in pairs(_player.GetAll()) do
				v:GiveDefaultAmmo();
			end;
			Clockwork.player:Notify(player, "You have given everyone ammo.");
		end;
	else
		Clockwork.player:NotifyAll(player:Name().." has turned weapons off!");
	end;
end;

COMMAND:Register();