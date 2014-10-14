
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("CharSetPersonalAmmo");
COMMAND.tip = "Set if a character should receive a personal ammo and how much.";
COMMAND.text = "<string Name> <string AmmoType> [number Amount|Defualt: 0]";
COMMAND.access = "a";
COMMAND.arguments = 2;
COMMAND.optionalArguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	
	if (target) then
		local personalAmmo = target:GetCharacterData("personal_ammo", {});
		local ammoType = arguments[2];
		local amount = tonumber(arguments[3]);
		if (amount == 0) then
			amount = nil;
		end;

		if (amount) then
			personalAmmo[ammoType] = amount;
			if (target != player) then
				Clockwork.player:Notify(player, target:Name().." will receive "..tostring(amount).." "..ammoType..".");
				Clockwork.player:Notify(target, player:Name().." has made you receive "..tostring(amount).." "..ammoType..".");
			else
				Clockwork.player:Notify(player, "You will now receive "..tostring(amount).." "..ammoType..".");
			end;
			if (target:GetAmmoCount(ammoType) < amount) then
				target:SetAmmo(amount, ammoType)
			end;
		else
			if (personalAmmo[ammoType]) then
				personalAmmo[ammoType] = nil;
				if (target != player) then
					Clockwork.player:Notify(player, target:Name().." will no longer receive "..ammoType.." ammo.");
					Clockwork.player:Notify(target, player:Name().." has made you no longer receive "..ammoType.." ammo.");
				else
					Clockwork.player:Notify(player, "You will no longer receive "..ammoType.." ammo.");
				end;
			else
				if (target != player) then
					Clockwork.player:Notify(player, target:Name().." does not have any "..ammoType.." ammo.");
				else
					Clockwork.player:Notify(player, "You do not have any "..ammoType.." ammo.");
				end;
			end;
		end;
		
		target:SetCharacterData("personal_ammo", personalAmmo);
	else
		Clockwork.player:Notify(player, arguments[1].." is not a valid character!");
	end;
end;

COMMAND:Register();