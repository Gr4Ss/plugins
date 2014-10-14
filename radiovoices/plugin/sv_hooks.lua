
local PLUGIN = PLUGIN;

-- Called when chat box info should be adjusted.
function PLUGIN:ChatBoxAdjustInfo(info)
	if (info.class == "radio_transmit" or info.class == "radio_eavesdrop") then
		if (IsValid(info.speaker) and info.speaker:HasInitialized()) then
			local playerIsCombine = Schema:PlayerIsCombine(info.speaker);
			
			if (playerIsCombine and Schema:IsPlayerCombineRank(info.speaker, "SCN")) then
				for k, v in pairs(Schema.voices.stored.dispatchVoices) do
					if (string.lower(info.text) == string.lower(v.command)) then
						local voice = {
							global = false,
							volume = 90,
							sound = v.sound
						};
						
						if (info.class == "radio_transmit") then
							voice.global = true;
						elseif (info.data.sayType == "whisper") then
							voice.volume = 60;
						elseif (info..data.sayType == "yell") then
							voice.volume = 100;
						end;

						info.text = "<:: "..v.phrase;
						info.voice = voice;
						
						return;
					end;
				end;
			else
				for k, v in pairs(Schema.voices.stored.normalVoices) do
					if ((v.faction == "Combine" and playerIsCombine) or (v.faction == "Human" and !playerIsCombine)) then
						if (string.lower(info.text) == string.lower(v.command)) then
							local voice = {
								global = false,
								volume = 80,
								sound = v.sound
							};
							
							if (v.female and info.speaker:QueryCharacter("gender") == GENDER_FEMALE) then
								voice.sound = string.Replace(voice.sound, "/male", "/female");
							end;
							
							if (info.class == "radio_transmit") then
								voice.global = true;
							elseif (info.data.sayType == "whisper") then
								voice.volume = 60;
							elseif (info..data.sayType == "yell") then
								voice.volume = 100;
							end;
							
							if (playerIsCombine) then
								info.text = "<:: "..v.phrase;
							else
								info.text = v.phrase;
							end;
							
							info.voice = voice;
							
							return;
						end;
					end;
				end;
			end;
			
			if (playerIsCombine) then
				if (string.sub(info.text, 1, 4) != "<:: ") then
					info.text = "<:: "..info.text;
				end;
			end;
		end;
	end;
end;