local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("charSetNeeds");
COMMAND.tip = "Set a player's Hunger and Thirst level (default: 0).";
COMMAND.text = "<string Name> [number Amount]";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "s";
COMMAND.arguments = 1;
COMMAND.optionalArguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	
	if (target) then
		local amount = arguments[2];
		if (!amount) then
			amount = 0;
		else
			amount = math.Clamp(tonumber(amount), 0, 100);
		end;

		target:SetCharacterData("hunger", amount);
		target:SetCharacterData("thirst", amount);

		if (player != target)	then
			Clockwork.player:Notify(target, player:Name().." has set your needs to "..amount..".");
			Clockwork.player:Notify(player, "You have set "..target:Name().."'s needs to "..amount..".");
		else
			Clockwork.player:Notify(player, "You have set your own needs to "..amount..".");
		end;
	else
		Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();