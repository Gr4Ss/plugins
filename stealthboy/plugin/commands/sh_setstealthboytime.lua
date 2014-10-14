
local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("CharSetStealthBoyTime");
COMMAND.tip = "Set a player's Stealth Boy time.";
COMMAND.text = "<string Name> [number Amount]";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "s";
COMMAND.arguments = 1;
COMMAND.optionalArguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	local amount = arguments[2]
	
	if (!amount) then
		amount = 0;
	else
		amount = math.max(tonumber(amount), 0);
	end;
	
	if (target) then
		target:SetCharacterData("stealthBoyTime", amount);
		target:SetSharedVar("stealthBoyTime", amount);
		if (player != target)	then
			Clockwork.player:Notify(target, player:Name().." has set your Stealth Boy Time level to "..amount..".");
			Clockwork.player:Notify(player, "You have set "..target:Name().."'s Stealth Boy time to "..amount..".");
		else
			Clockwork.player:Notify(player, "You have set your own Stealth Boy time to "..amount..".");
		end;
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();