
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("GiveAmmo");
COMMAND.tip = "Gives everyone their default ammo if they have less ammo than that.";
COMMAND.access = "a";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	for k, v in pairs(_player.GetAll()) do
		v:GiveDefaultAmmo();
	end;
	Clockwork.player:Notify(player, "You have given everyone ammo.");
end;

COMMAND:Register();