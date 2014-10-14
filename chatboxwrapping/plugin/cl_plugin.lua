
local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

Clockwork.option:SetKey("next_space_characters", 5);
Clockwork.option:SetKey("previous_space_characters", 8);
Clockwork.option:SetKey("chatbox_width", 0.5);

-- A function to add and wrap text to a message.
function Clockwork.chatBox:WrappedText(newLine, message, color, text, OnHover)
	if (!message.width) then
		message.width = 20; -- Set starting width to 20 to compensate for the icon.
	end;

	local chatBoxTextFont = Clockwork.option:GetFont("chat_box_text");
	local textWidth, height = Clockwork.kernel:GetTextSize(chatBoxTextFont, text);
	-- Set width to the total width
	local width = textWidth + message.width
	local maximumWidth = ScrW() * Clockwork.option:GetKey("chatbox_width");
	
	-- If width < 0 then this is the recursive call from firstText which is already the correct length.
	-- But as we allow it to look ahead for a space character, this might be actually longer than maximum width.
	-- So this ensures we don't end up in an infinite recursive loop
	if (message.width >= 0 and width > maximumWidth) then
		local currentWidth = message.width;
		local lastSpace = 0;
		local firstText = nil;
		local secondText = nil;
		-- Loop through all characters
		for i = 0, #text do
			local currentCharacter = string.sub(text, i, i);
			-- Keep track of the last space character
			if (string.find(currentCharacter, "%s")) then
				lastSpace = i;
			end;
			-- Check if we're past the maximum width
			local currentSingleWidth = Clockwork.kernel:GetTextSize(chatBoxTextFont, currentCharacter);
			if ((currentWidth + currentSingleWidth) >= maximumWidth) then
				-- Find the next space
				local nextSpace = string.find(text, "%s", i);
				local prevDiff = i - lastSpace;
				-- If we found a next space and it's closer than the previous space and is within range
				if (nextSpace and (nextSpace - i < prevDiff) and (nextSpace - i < Clockwork.option:GetKey("next_space_characters"))) then
					secondText = string.sub(text, nextSpace + 1);
					firstText = string.sub(text, 0, (nextSpace));
				-- Else check for the previous space if it is in range
				elseif (prevDiff <= Clockwork.option:GetKey("previous_space_characters")) then
					secondText = string.sub(text, lastSpace + 1);
					firstText = string.sub(text, 0, (lastSpace));
				-- Else cut on the spot
				else
					secondText = string.sub(text, i);
					firstText = string.sub(text, 0, (i - 1));
				end;
				-- Break for loop so we can do recursive calls on first and second text.
				break;
			else
				currentWidth = currentWidth + currentSingleWidth;
			end;
		end;
		
		-- First piece of text, is the correct length so set width to -1.
		if (firstText and firstText != "") then
			message.width = -1;
			Clockwork.chatBox:WrappedText(true, message, color, firstText, OnHover);
		end;
		-- Second piece of text still has to be checked for its length so width back to 0
		-- as we're starting on a new line
		if (secondText and secondText != "") then
			message.width = 0;
			Clockwork.chatBox:WrappedText(nil, message, color, secondText, OnHover);
		end;
	else
		-- Else the message fits on the screen so saves all it's info
		message.text[#message.text + 1] = {
			newLine = newLine,
			OnHover = OnHover,
			height = height,
			width = textWidth,
			color = color,
			text = text
		};
		-- update the current total width
		message.width = width;	
		
		if (newLine) then
			message.lines = message.lines + 1;
		end;
	end;
end;