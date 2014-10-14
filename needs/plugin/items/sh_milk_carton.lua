--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("consumable_base");
	ITEM.name = "Milk Carton";
	ITEM.uniqueID = "milk_carton";
	ITEM.cost = 8;
	ITEM.model = "models/props_junk/garbage_milkcarton002a.mdl";
	ITEM.junk = "empty_milk_carton";
	ITEM.value = 15;
	ITEM.type = "consumable";
	ITEM.weight = 0.25;
	ITEM.hunger = 7;
	ITEM.thirst = 25;
	ITEM.rads = 5;
	ITEM.access = "d";
	ITEM.business = true;
	ITEM.useText = "Drink";
	ITEM.category = "Consumables";
	ITEM.useSound = {"npc/barnacle/barnacle_gulp1.wav", "npc/barnacle/barnacle_gulp2.wav"};
	ITEM.description = "A carton filled with delicious milk.";
	
	ITEM:Register();