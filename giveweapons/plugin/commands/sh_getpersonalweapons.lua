
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("GetPersonalWeapons");
COMMAND.tip = "Prints a list of all personal weapons and ammo players receive in console.";
COMMAND.access = "a";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local players = _player.GetAll();
	local list = {};

	for _k, player in pairs(players) do
		local personalWeapons = player:GetCharacterData("personal_weapons");
		local personalAmmo = player:GetCharacterData("personal_ammo");
		local name = player:Name();
		
		if ((!personalWeapons or table.Count(personalWeapons) == 0) and (!personalAmmo or table.Count(personalAmmo) == 0)) then
			continue;
		else
			list[name] = {};
		end;
		
		if (personalWeapons and table.Count(personalWeapons) > 0) then
			for class, _v in pairs(personalWeapons) do
				table.insert(list[name], class);
			end;
		end;
		if (personalAmmo and table.Count(personalAmmo) > 0) then
			for type, amount in pairs(personalAmmo) do
				table.insert(list[name], type.." ("..amount..")");
			end;
		end;
	end;
	
	if (table.Count(list) > 0) then
		Clockwork.datastream:Start(player, "get_weapons_list", list);
	end;

	Clockwork.player:Notify(player, "The list has been printed in your console.");
end;

COMMAND:Register();