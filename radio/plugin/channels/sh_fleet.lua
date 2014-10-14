
local CHANNEL = Clockwork.radio:New();
CHANNEL.name = "fleet";
CHANNEL.uniqueID = "fleet_main";
CHANNEL.subChannels = 1;
CHANNEL.global = false;
CHANNEL.defaultPriority = 8;
CHANNEL.color = Color(67, 142, 192, 255);

CHANNEL:Register();