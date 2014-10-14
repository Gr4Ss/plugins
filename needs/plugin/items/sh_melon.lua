--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("consumable_base");
	ITEM.name = "Melon";
	ITEM.uniqueID = "melon";
	ITEM.model = "models/props_junk/watermelon01.mdl";
	ITEM.cost = 25;
	ITEM.weight = 0.5;
	ITEM.hunger = 55
	ITEM.thirst = 10
	ITEM.rads = 4
	ITEM.access = "f";
	ITEM.business = true;
	ITEM.useText = "Eat";
	ITEM.useSound = "npc/barnacle/barnacle_crunch3.wav";
	ITEM.category = "Consumables"
	ITEM.description = "A green fruit, it has a hard outer shell.";

ITEM:Register();