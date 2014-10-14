--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("consumable_base");
	ITEM.name = "Milk Jug";
	ITEM.uniqueID = "milk_jug"
	ITEM.model = "models/props_junk/garbage_milkcarton001a.mdl";
	ITEM.junk = "empty_milk_jug";
	ITEM.cost = 13;
	ITEM.value = 12;
	ITEM.type = "consumable";
	ITEM.weight = 0.35;
	ITEM.hunger = 15;
	ITEM.thirst = 30;
	ITEM.rads = 8;
	ITEM.access = "d";
	ITEM.business = true;
	ITEM.useText = "Drink";
	ITEM.useSound = {"npc/barnacle/barnacle_gulp1.wav", "npc/barnacle/barnacle_gulp2.wav"};
	ITEM.category = "Consumables";
	ITEM.description = "A jug filled with delicious milk.";
	
	ITEM:Register();