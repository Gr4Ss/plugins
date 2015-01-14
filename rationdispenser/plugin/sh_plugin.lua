
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

Clockwork.kernel:IncludePrefixed("cl_plugin.lua");
Clockwork.kernel:IncludePrefixed("sv_plugin.lua");

--Clockwork.flag:Add("i", "Ration Token", "Access to the ration token on the business menu.");

--[[
README:
-Add 'FACTION.canGetRations = true;' to the faction file to allow a faction to get rations.
-Add 'FACTION.noIDCard = true;' to the faction to allow that faction to get a ration without an id card.
-Add 'FACTION.canUseRationToken = true;' to the faction to allow that faction to use ration tokens.
-Add 'FACTION.rationUniqueID = "<insert ration item uniqueID here>";' to change what ration a faction gets.

Ration Interval config will change the interval for a player to get rations. This is in minutes!
]]