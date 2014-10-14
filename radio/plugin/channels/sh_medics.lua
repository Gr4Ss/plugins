
local CHANNEL = Clockwork.radio:New();
CHANNEL.name = "medics";
CHANNEL.uniqueID = "mi_medics";
CHANNEL.subChannels = 1;
CHANNEL.global = false;
CHANNEL.defaultPriority = 1;
CHANNEL.color = Color(67, 142, 192, 255);

CHANNEL:Register();