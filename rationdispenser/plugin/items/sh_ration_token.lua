--[[
	� 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Ration Coupon";
ITEM.uniqueID = "ration_token";
ITEM.model = "models/bioshockinfinite/loot_coin.mdl";
ITEM.weight = 0.2;
ITEM.business = false;
ITEM.access = "i";
ITEM.cost = 70;
ITEM.description = "A small coin, insert it into a ration machine for an extra ration.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

-- Called when the item entity has spawned. This is used to set the material.
function ITEM:OnEntitySpawned(entity)
	entity:SetMaterial("phoenix_storms/bluemetal");
end;

ITEM:Register();