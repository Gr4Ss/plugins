
local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("CharSetRads");
COMMAND.tip = "Set a player's radiation level.";
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
		amount = math.Clamp(tonumber(amount), 0, Clockwork.config:Get("max_rads"):Get());
	end;
	
	if (target) then
		target:SetCharacterData("rads", amount);
		target:SetSharedVar("rads", amount);
		if (player != target)	then
			Clockwork.player:Notify(target, player:Name().." has set your radiation level to "..amount..".");
			Clockwork.player:Notify(player, "You have set "..target:Name().."'s radiation level to "..amount..".");
		else
			Clockwork.player:Notify(player, "You have set your own radiation level to "..amount..".");
		end;
	else
		Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();