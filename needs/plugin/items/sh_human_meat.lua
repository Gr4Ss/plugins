--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("consumable_base");
	ITEM.name = "Human Meat";
	ITEM.uniqueID = "human_meat";
	ITEM.model = "models/Gibs/Antlion_gib_small_2.mdl";
	ITEM.weight = 0.35;
	ITEM.hunger = 35;
	ITEM.rads = 15;
	ITEM.plural = "Human Meat Pieces";
	ITEM.useText = "Eat";
	ITEM.useSound = "npc/barnacle/barnacle_crunch3.wav";
	ITEM.category = "Consumables";
	ITEM.description = "Meat ripped from the body of a human, it smells disgusting.";

	-- Called when the item entity has spawned.
	function ITEM:OnEntitySpawned(entity)
		entity:SetMaterial("models/flesh");
	end;
ITEM:Register();