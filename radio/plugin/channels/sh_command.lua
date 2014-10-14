
local CHANNEL = Clockwork.radio:New();
CHANNEL.name = "command";
CHANNEL.uniqueID = "mi_command";
CHANNEL.subChannels = 1;
CHANNEL.global = false;
CHANNEL.defaultPriority = 5;
CHANNEL.color = Color(119, 84, 154, 255);

CHANNEL:Register();