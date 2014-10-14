
local COMMAND = Clockwork.command:New("ClearDecals");
COMMAND.tip = "Runs r_cleardecals on all players.";
COMMAND.access = "o";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	for k, v in pairs(_player.GetAll()) do
		v:ConCommand("r_cleardecals");
		v:CPNotify(player:Name().." has cleared all decals.", "bin");
	end;
end;

COMMAND:Register();