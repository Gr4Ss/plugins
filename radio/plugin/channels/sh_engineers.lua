
local CHANNEL = Clockwork.radio:New();
CHANNEL.name = "engineers";
CHANNEL.uniqueID = "mi_engineers";
CHANNEL.subChannels = 1;
CHANNEL.global = false;
CHANNEL.defaultPriority = 1;
CHANNEL.color = Color(67, 142, 192, 255);

CHANNEL:Register();