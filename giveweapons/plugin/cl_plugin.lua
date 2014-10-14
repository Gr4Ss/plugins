
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

Clockwork.config:AddToSystem("Give Weapons", "give_weapons", "Sets if players should be given weapons.", 0, 1, 0);

Clockwork.datastream:Hook("get_weapons_list", function(data)
	for name, tbl in pairs(data) do
		-- Print player name
		MsgC(Color(255, 0, 0), name..": ");
		-- Print weapons list and newline
		Msg(table.concat(tbl, "; ").."\n");
	end;
end);