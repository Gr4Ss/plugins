
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;
local playerMeta = FindMetaTable("Player");

Clockwork.config:Add("give_weapons", true);

-- Gives a player all his class/faction ammo and weapons and his personal ammo and weapons
function playerMeta:GiveWeapons()
	-- Player is not admin approved yet so don't give any weapons
	if (Clockwork.config:Get("use_admin_approve"):Get() and !self:GetData("admin_approved", false)) then
		return;
	end;

	local class = Clockwork.class:FindByID(self:Team());
	local faction = Clockwork.player:GetFactionTable(self);
	-- Give class weapons
	PLUGIN:GiveClassWeapons(self, class, faction);
	-- Give personal weapons
	PLUGIN:GivePersonalWeapons(self);
end;

function playerMeta:GiveDefaultAmmo()
	-- Player is not admin approved yet so don't give any weapons
	if (Clockwork.config:Get("use_admin_approve"):Get() and !self:GetData("admin_approved", false)) then
		return;
	end;

	local class = Clockwork.class:FindByID(self:Team());
	local faction = Clockwork.player:GetFactionTable(self);
	-- Give class ammo
	PLUGIN:GiveClassAmmo(self, class, faction);
	-- Give personal ammo
	PLUGIN:GivePersonalAmmo(self);
end;

-- A function to give a player his class weapons, or his faction weapons if his class has no weaponsList
function PLUGIN:GiveClassWeapons(player, class, faction)
	-- If player should get class/faction weapons then
	if (player:GetCharacterData("class_weapons", true)) then
		-- Check if a valid class has been given
		if (!class or type(class) != "table") then
			class = Clockwork.class:FindByID(player:Team());
		end;
		-- Check if a valid faction has been given
		if (!faction or type(faction) != "table") then
			faction = Clockwork.player:GetFactionTable(player);
		end;
		local weaponsList = {};
		-- Get class weapons
		if (class and class.weaponsList) then
			weaponsList = class.weaponsList;
		-- Else get faction weapons
		elseif (faction and faction.weaponsList) then
			weaponsList = faction.weaponsList;
		end;
		-- Give weapons
		for wepClass, _v in pairs(weaponsList) do
			player:Give(wepClass);
		end;
	end;
end;

function PLUGIN:GivePersonalWeapons(player)
	local personalWeapons = player:GetCharacterData("personal_weapons", nil);
	if (personalWeapons and type(personalWeapons) == "table") then
		for wepClass, _v in pairs(personalWeapons) do
			player:Give(wepClass);
		end;
	end;
end;

-- A function to give a player his class ammo, or his faction ammo if his class has no ammoList
function PLUGIN:GiveClassAmmo(player, class, faction)
	if (player:GetCharacterData("class_ammo", true)) then
		if (!class or type(class) != "table") then
			class = Clockwork.class:FindByID(player:Team());
		end;
		if (!faction or type(faction) != "table") then
			faction = Clockwork.faction:FindByID(player:GetFaction());
		end;

		local ammoList = {};
		-- Get class ammo
		if (class and class.ammoList) then
			ammoList = class.ammoList;
		-- Else get faction ammo
		elseif (faction and faction.ammoList) then
			ammoList = faction.ammoList;
		end;
		-- Set ammo if player has lower ammo count
		-- This ensures the player always has at least the given amount
		-- But it won't give any more in case the player already has more ammo
		for type, amount in pairs(ammoList) do
			if (player:GetAmmoCount(type) < amount) then
				player:SetAmmo(amount, type);
			end;
		end;
	end;
end;

function PLUGIN:GivePersonalAmmo(player)
	local personalAmmo = player:GetCharacterData("personal_ammo", nil);
	if (personalAmmo and type(personalAmmo) == "table") then
		for type, amount in pairs(personalAmmo) do
			if (player:GetAmmoCount(type) < amount) then
				player:SetAmmo(amount, type);
			end;
		end;
	end;
end;
