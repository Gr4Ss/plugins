
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

function PLUGIN:ClockworkConfigChanged(key, data, oldValue, newValue)
	if (key == "give_weapons" and oldValue != newValue) then
		local players = player.GetAll();
		-- give_weapons is now true so give weapons
		if (newValue) then
			for _k, player in pairs(players) do
				player:GiveWeapons();
			end;
		-- give_weapmons is false so strip weapons
		else
			for _k, player in pairs(players) do
				-- Holster all weapons
				Clockwork.player:HolsterAll(player);
				-- Strip all weapons that are not spawn weapons
				local weapons = player:GetWeapons();
				for _k, weapon in pairs(weapons) do
					local class = weapon:GetClass();
					if (class != "cw_hands" and !player.cwSpawnWeps[class]) then
						player:StripWeapon(class);
					end;
				end;
			end;
		end;
	end;
end;

function PLUGIN:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
	if (firstSpawn and Clockwork.config:Get("give_weapons"):Get() != true) then
		Clockwork.player:Notify(player, "Weapons are currently turned off.");
	end;

	if (!firstSpawn and !lightSpawn) then
		player:GiveDefaultAmmo();
	end;
end;

function PLUGIN:PlayerApproved(player)
	if (Clockwork.config:Get("give_weapons"):Get() != true) then
		return;
	else
		player:GiveWeapons();
		player:GiveDefaultAmmo();
	end;
end;

function PLUGIN:PlayerGiveWeapons(player)
	if (Clockwork.config:Get("give_weapons"):Get() != true) then
		return;
	else
		player:GiveWeapons();
	end;
end;