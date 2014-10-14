
local PLUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("AdminHelp");
COMMAND.tip = "Asks admins for help.";
COMMAND.text = "<string Text>";
COMMAND.flag = CMD_DEFAULT;
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if (player:IsAdmin() or player:IsSuperAdmin() or player:IsUserGroup("operator")) then
		player:CPNotify("You are an admin, use admin chat instead.", Clockwork.option:GetKey("cannot_do_icon"));
		return;
	end;
	
	local curTime = CurTime();
	if (player.nextAdminHelp and player.nextAdminHelp > curTime) then
		player:CPNotify("Please wait another "..math.ceil(player.nextAdminHelp - curTime).." seconds before using /AdminHelp again.", Clockwork.option:GetKey("wait_icon"));
		return;
	end;

	player.nextAdminHelp = curTime + Clockwork.config:Get("admin_help_interval"):Get();

	local adminOnline = PLUGIN:IsAdminOnline();
	if (!adminOnline) then
		player:CPNotify("No admins are currently online, please wait until one gets on.", "award_star_delete");
	end;

	local players = _player.GetAll();
	local listeners = {player};
	for k, v in pairs(players) do
		if (v:IsAdmin() or v:IsSuperAdmin() or v:IsUserGroup("operator")) then
			listeners[#listeners + 1] = v;
		end;
	end;

	Clockwork.chatBox:Add(listeners, player, "cp_adminhelp", table.concat(arguments, " "));
end;

COMMAND:Register();