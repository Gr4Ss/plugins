
local ITEM = Clockwork.item:New("equipable");
ITEM.name = "Stealth Boy";
ITEM.uniqueID = "stealth_boy";
ITEM.model = "models/gibs/hgibs.mdl";
ITEM.weight = 0.5;
ITEM.useText = "Turn On";
ITEM.useSound = "items/nvg_on.wav";
ITEM.category = "Stealth Boy";
ITEM.description = "A stealth boy that seems to be in a decent condition.";
ITEM.isAttachment = false;

-- Called when a player wears the accessory.
function ITEM:OnWearItem(player, bIsWearing)
	if (bIsWearing) then
		player.stealthBoyMode = 1;
	else
		player.stealthBoyMode = 2;
	end;
end;

-- Called when the player tries to wear the item
function ITEM:CanPlayerWear(player, entity)
	if (self:GetData("equipped") == true) then
		Clockwork.playery:Notify(player, "You are already wearing this!");
		return false;
	end;

	if (player:GetCharacterData("stealthBoyFatigued") == true) then
		Clockwork.player:Notify(player, "You are too tired to do this!");
		return false;
	end;

	return true;
end;

Clockwork.item:Register(ITEM);