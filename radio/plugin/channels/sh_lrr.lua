
local CHANNEL = Clockwork.radio:New();
CHANNEL.name = "long-range radio";
CHANNEL.uniqueID = "lrr";
CHANNEL.subChannels = 1;
CHANNEL.global = false;
CHANNEL.color = Color(100, 46, 154, 255);
CHANNEL.defaultPriority = 0;

CHANNEL:Register();