
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

Clockwork.kernel:IncludePrefixed("cl_hooks.lua");
Clockwork.kernel:IncludePrefixed("sv_hooks.lua");

Clockwork.flag:Add("P", "Waypoints", "Access to all the /Waypoint commands.");