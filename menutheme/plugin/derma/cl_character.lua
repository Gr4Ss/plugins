--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]
--[[
	© Songbird aka Alko -  do not re-distribute without permission of its author (ael9000 gmail.com).
--]]

local Clockwork = Clockwork;
local pairs = pairs;
local RunConsoleCommand = RunConsoleCommand;
local SysTime = SysTime;
local ScrH = ScrH;
local ScrW = ScrW;
local table = table;
local string = string;
local vgui = vgui;
local math = math;

local PANEL = {};

local forumLink = "http://www.zetacommunity.com";
local forumText = "Forum";

local steamGroupLink = "http://steamcommunity.com/groups/ZetaCommunity";
local steamGroupText = "Steam Group";

local contentLink = "http://www.zetacommunity.com/forums/index.php?/portal/"
local contentText = "Server Content";

local imageLink = "http://i.imgur.com/HJV9Opd.png";

-- Called when the panel is initialized.
function PANEL:Init()
	if (!Clockwork.theme:Call("PreCharacterMenuInit", self)) then
		local smallTextFont = Clockwork.option:GetFont("menu_text_small");
		local tinyTextFont = Clockwork.option:GetFont("menu_text_tiny");
		local hugeTextFont = Clockwork.option:GetFont("menu_text_huge");
		local scrH = ScrH();
		local scrW = ScrW();
		
		self:SetPos(0, 0);
		self:SetSize(scrW, scrH);
		self:SetDrawOnTop(false);
		self:SetPaintBackground(false);
		self:SetMouseInputEnabled(true);

		self.titleImage = vgui.Create("HTML", self);
		self.titleImage:SetSize(620, 414);
		self.titleImage:SetPos((scrW / 2) - (self.titleImage:GetWide() / 2), scrH * 0.1);
		self.titleImage:OpenURL(imageLink);
		
		self.subLabel = vgui.Create("cwLabelButton", self);
		self.subLabel:SetDisabled(true);
		self.subLabel:SetFont(smallTextFont);
		self.subLabel:SetText(Schema:GetDescription());
		self.subLabel:SizeToContents();
		
		self.subLabel:SetPos((scrW / 2) - (self.subLabel:GetWide() / 2), self.titleImage.y + self.titleImage:GetTall() + 8);
		
		self.authorLabel = vgui.Create("cwLabelButton", self);
		self.authorLabel:SetDisabled(true);
		self.authorLabel:SetFont(tinyTextFont);
		self.authorLabel:SetText("Developed by "..Schema:GetAuthor());
		self.authorLabel:SizeToContents();
		self.authorLabel:SetPos(self.subLabel.x + (self.subLabel:GetWide() - self.authorLabel:GetWide()), self.subLabel.y + self.subLabel:GetTall() + 4);

		self.forumButton = vgui.Create("cwLabelButton", self);
		self.forumButton:SetFont(smallTextFont);
		self.forumButton:SetText(forumText);
		self.forumButton:SetAlpha(0);
		self.forumButton:FadeIn(1);
		self.forumButton:SetCallback(function(panel)
		 gui.OpenURL(forumLink)
		end);
		self.forumButton:SizeToContents();
		self.forumButton:SetMouseInputEnabled(true);
		self.forumButton:SetPos((ScrW() * 0.85) - self.forumButton:GetWide(), ScrH() * 0.6);

		self.steamGroupButton = vgui.Create("cwLabelButton", self);
		self.steamGroupButton:SetFont(smallTextFont);
		self.steamGroupButton:SetText(steamGroupText);
		self.steamGroupButton:SetAlpha(0);
		self.steamGroupButton:FadeIn(1);
		self.steamGroupButton:SetCallback(function(panel)
		 gui.OpenURL(steamGroupLink)
		end);
		self.steamGroupButton:SizeToContents();
		self.steamGroupButton:SetMouseInputEnabled(true);
		self.steamGroupButton:SetPos((ScrW() * 0.85) - self.steamGroupButton:GetWide(), ScrH() * 0.65);

		self.contentButton = vgui.Create("cwLabelButton", self);
		self.contentButton:SetFont(smallTextFont);
		self.contentButton:SetText(contentText);
		self.contentButton:SetAlpha(0);
		self.contentButton:FadeIn(1);
		self.contentButton:SetCallback(function(panel)
		 gui.OpenURL(contentLink)
		end);
		self.contentButton:SizeToContents();
		self.contentButton:SetMouseInputEnabled(true);
		self.contentButton:SetPos((ScrW() * 0.85) - self.contentButton:GetWide(), ScrH() * 0.7);

		self.createButton = vgui.Create("cwLabelButton", self);
		self.createButton:SetFont(smallTextFont);
		self.createButton:SetText("Create Character");
		self.createButton:FadeIn(0.5);
		self.createButton:SetCallback(function(panel)
			if (table.Count(Clockwork.character:GetAll()) >= Clockwork.player:GetMaximumCharacters()) then
				return Clockwork.character:SetFault("You cannot create any more characters!");
			end;
			
			Clockwork.character:ResetCreationInfo();
			Clockwork.character:OpenNextCreationPanel();
		end);
		self.createButton:SizeToContents();
		self.createButton:SetMouseInputEnabled(true);
		self.createButton:SetPos(ScrW() * 0.15, ScrH() * 0.6);
		
		self.loadButton = vgui.Create("cwLabelButton", self);
		self.loadButton:SetFont(smallTextFont);
		self.loadButton:SetText("Load Character");
		self.loadButton:FadeIn(0.5);
		self.loadButton:SetCallback(function(panel)
			self:OpenPanel("cwCharacterList", nil, function(panel)
				Clockwork.character:RefreshPanelList();
			end);
		end);
		self.loadButton:SizeToContents();
		self.loadButton:SetMouseInputEnabled(true);
		self.loadButton:SetPos(ScrW() * 0.15, ScrH() * 0.65);
		
		self.disconnectButton = vgui.Create("cwLabelButton", self);
		self.disconnectButton:SetFont(smallTextFont);
		self.disconnectButton:SetText("Disconnect");
		self.disconnectButton:FadeIn(0.5);
		self.disconnectButton:SetCallback(function(panel)
			if (Clockwork.Client:HasInitialized() and !Clockwork.character:IsMenuReset()) then
				Clockwork.character:SetPanelMainMenu();
				Clockwork.character:SetPanelOpen(false);
			else
				RunConsoleCommand("disconnect");
			end;
		end);
		self.disconnectButton:SizeToContents();
		self.disconnectButton:SetPos(ScrW() * 0.15, ScrH() * 0.7);
		self.disconnectButton:SetMouseInputEnabled(true);
		
		self.previousButton = vgui.Create("cwLabelButton", self);
		self.previousButton:SetFont(tinyTextFont);
		self.previousButton:SetText("PREVIOUS");
		self.previousButton:SetCallback(function(panel)
			if (!Clockwork.character:IsCreationProcessActive()) then
				local activePanel = Clockwork.character:GetActivePanel();
				
				if (activePanel and activePanel.OnPrevious) then
					activePanel:OnPrevious();
				end;
			else
				Clockwork.character:OpenPreviousCreationPanel()
			end;
		end);
		self.previousButton:SizeToContents();
		self.previousButton:SetMouseInputEnabled(true);
		self.previousButton:SetPos((scrW * 0.2) - (self.previousButton:GetWide() / 2), scrH * 0.9);
		
		self.nextButton = vgui.Create("cwLabelButton", self);
		self.nextButton:SetFont(tinyTextFont);
		self.nextButton:SetText("NEXT");
		self.nextButton:SetCallback(function(panel)
			if (!Clockwork.character:IsCreationProcessActive()) then
				local activePanel = Clockwork.character:GetActivePanel();
				
				if (activePanel and activePanel.OnNext) then
					activePanel:OnNext();
				end;
			else
				Clockwork.character:OpenNextCreationPanel()
			end;
		end);
		self.nextButton:SizeToContents();
		self.nextButton:SetMouseInputEnabled(true);
		self.nextButton:SetPos((scrW * 0.8) - (self.nextButton:GetWide() / 2), scrH * 0.9);
		
		self.cancelButton = vgui.Create("cwLabelButton", self);
		self.cancelButton:SetFont(tinyTextFont);
		self.cancelButton:SetText("CANCEL");
		self.cancelButton:SetCallback(function(panel)
			self:ReturnToMainMenu();
		end);
		self.cancelButton:SizeToContents();
		self.cancelButton:SetMouseInputEnabled(true);
		self.cancelButton:SetPos((scrW * 0.5) - (self.cancelButton:GetWide() / 2), scrH * 0.9);
		
		self.characterModel = vgui.Create("cwCharacterModel", self);
		self.characterModel:SetSize(512, 512);
		self.characterModel:SetAlpha(0);
		self.characterModel:SetModel("models/error.mdl");
		self.createTime = SysTime();
		
		Clockwork.theme:Call("PostCharacterMenuInit", self)
	end;
end;

-- A function to fade in the model panel.
function PANEL:FadeInModelPanel(model)
	if (ScrH() < 768) then
		return true;
	end;

	local panel = Clockwork.character:GetActivePanel();
	local x, y = ScrW() - self.characterModel:GetWide() - 8, 16;
	
	if (panel) then
		x, y = panel.x + panel:GetWide() - 16, panel.y - 80;
	end;
	
	self.characterModel:SetPos(x, y);
	
	if (self.characterModel:FadeIn(0.5)) then
		self:SetModelPanelModel(model);
		return true;
	else
		return false;
	end;
end;

-- A function to fade out the model panel.
function PANEL:FadeOutModelPanel()
	self.characterModel:FadeOut(0.5);
end;

-- A function to set the model panel's model.
function PANEL:SetModelPanelModel(model)
	if (self.characterModel.currentModel != model) then
		self.characterModel.currentModel = model;
		self.characterModel:SetModel(model);
	end;
	
	local modelPanel = self.characterModel:GetModelPanel();
	local weaponModel = Clockwork.plugin:Call(
		"GetModelSelectWeaponModel", model
	);
	local sequence = Clockwork.plugin:Call(
		"GetModelSelectSequence", modelPanel.Entity, model
	);
	
	if (weaponModel) then
		self.characterModel:SetWeaponModel(weaponModel);
	else
		self.characterModel:SetWeaponModel(false);
	end;
	
	if (sequence) then
		modelPanel.Entity:ResetSequence(sequence);
	end;
end;

-- A function to return to the main menu.
function PANEL:ReturnToMainMenu()
	local panel = Clockwork.character:GetActivePanel();
	
	if (panel) then
		panel:FadeOut(0.5, function()
			Clockwork.character.activePanel = nil;
				panel:Remove();
			self:FadeInTitle();
		end);
	else
		self:FadeInTitle();
	end;
	
	self:FadeOutModelPanel();
	self:FadeOutNavigation();
end;

-- A function to fade out the navigation.
function PANEL:FadeOutNavigation()
	self.previousButton:FadeOut(0.5);
	self.cancelButton:FadeOut(0.5);
	self.nextButton:FadeOut(0.5);
end;

-- A function to fade in the navigation.
function PANEL:FadeInNavigation()
	self.previousButton:FadeIn(0.5);
	self.cancelButton:FadeIn(0.5);
	self.nextButton:FadeIn(0.5);
end;

-- A function to fade out the title.
function PANEL:FadeOutTitle()
	self.subLabel:FadeOut(0.5);
	self.titleImage:SetAlpha(0);
	self.forumButton:FadeOut(0.5);
	self.steamGroupButton:FadeOut(0.5);
	self.contentButton:FadeOut(0.5);
	self.createButton:FadeOut(0.5);
	self.loadButton:FadeOut(0.5);
	self.disconnectButton:FadeOut(0.5);
	self.authorLabel:FadeOut(0.5);
end;

-- A function to fade in the title.
function PANEL:FadeInTitle()
	self.subLabel:FadeIn(0.5);
	self.forumButton:FadeIn(0.5);
	self.steamGroupButton:FadeIn(0.5);
	self.contentButton:FadeIn(0.5);
	self.createButton:FadeIn(0.5);
	self.loadButton:FadeIn(0.5);
	self.disconnectButton:FadeIn(0.5);
	self.titleImage:SetAlpha(255);
	self.authorLabel:FadeIn(0.5);
end;

-- A function to open a panel.
function PANEL:OpenPanel(vguiName, childData, Callback)
	if (!Clockwork.theme:Call("PreCharacterMenuOpenPanel", self, vguiName, childData, Callback)) then
		local panel = Clockwork.character:GetActivePanel();
		
		if (panel) then
			panel:FadeOut(0.5, function()
				panel:Remove(); self.childData = childData;
				
				Clockwork.character.activePanel = vgui.Create(vguiName, self);
				Clockwork.character.activePanel:SetAlpha(0);
				Clockwork.character.activePanel:FadeIn(0.5);
				Clockwork.character.activePanel:MakePopup();
				Clockwork.character.activePanel:SetPos(ScrW() * 0.2, ScrH() * 0.275);
				
				if (Callback) then
					Callback(Clockwork.character.activePanel);
				end;
				
				if (childData) then
					Clockwork.character.activePanel.bIsCreationProcess = true;
					Clockwork.character:FadeInNavigation();
				end;
			end);
		else
			self.childData = childData;
			self:FadeOutTitle();
			
			Clockwork.character.activePanel = vgui.Create(vguiName, self);
			Clockwork.character.activePanel:SetAlpha(0);
			Clockwork.character.activePanel:FadeIn(0.5);
			Clockwork.character.activePanel:MakePopup();
			Clockwork.character.activePanel:SetPos(ScrW() * 0.2, ScrH() * 0.275);
			
			if (Callback) then
				Callback(Clockwork.character.activePanel);
			end;
			
			if (childData) then
				Clockwork.character.activePanel.bIsCreationProcess = true;
				Clockwork.character:FadeInNavigation();
			end;
		end;
		
		--[[ Fade out the model panel, we probably don't need it now! --]]
		self:FadeOutModelPanel();
		
		Clockwork.theme:Call("PostCharacterMenuOpenPanel", self);
	end;
end;

-- Called when the panel is painted.
function PANEL:Paint(w, h)

	if (!Clockwork.theme:Call("PreCharacterMenuPaint", self)) then
		local schemaLogo = Clockwork.option:GetKey("schema_logo");
		local subLabelAlpha = self.subLabel:GetAlpha();
		
		if (schemaLogo != "" and subLabelAlpha > 0) then
			if (!self.logoTextureID) then
				self.logoTextureID = Material(schemaLogo..".png");
			end;
			
			self.logoTextureID:SetFloat("$alpha", subLabelAlpha);
			
			surface.SetDrawColor(255, 255, 255, subLabelAlpha);
			surface.SetMaterial(self.logoTextureID);
			surface.DrawTexturedRect(self.titleImage.x, self.titleImage.y - 64, 512, 256);
		end;
		
		Clockwork.theme:Call("PostCharacterMenuPaint", self)
	end;
end;


-- Called each frame.
function PANEL:Think()
	if (!Clockwork.theme:Call("PreCharacterMenuThink", self)) then
		local characters = table.Count(Clockwork.character:GetAll());
		local bIsLoading = Clockwork.character:IsPanelLoading();
		local schemaLogo = Clockwork.option:GetKey("schema_logo");
		local activePanel = Clockwork.character:GetActivePanel();
		local fault = Clockwork.character:GetFault();
		
		if (Clockwork.plugin:Call("ShouldDrawCharacterBackgroundBlur")) then
			Clockwork.kernel:RegisterBackgroundBlur(self, self.createTime);
		else
			Clockwork.kernel:RemoveBackgroundBlur(self);
		end;
		
		if (self.characterModel) then
			if (!self.characterModel.currentModel
			or self.characterModel.currentModel == "models/error.mdl") then
				self.characterModel:SetAlpha(0);
			end;
		end;
		
		if (!Clockwork.character:IsCreationProcessActive()) then
			if (activePanel) then
				if (activePanel.GetNextDisabled
				and activePanel:GetNextDisabled()) then
					self.nextButton:SetDisabled(true);
				else
					self.nextButton:SetDisabled(false);
				end;
				
				if (activePanel.GetPreviousDisabled
				and activePanel:GetPreviousDisabled()) then
					self.previousButton:SetDisabled(true);
				else
					self.previousButton:SetDisabled(false);
				end;
			end;
		else
			local previousPanelInfo = Clockwork.character:GetPreviousCreationPanel();
			
			if (previousPanelInfo) then
				self.previousButton:SetDisabled(false);
			else
				self.previousButton:SetDisabled(true);
			end;
			
			self.nextButton:SetDisabled(false);
		end;
		
		if (schemaLogo == "") then
			self.titleImage:SetVisible(true);
		else
			self.titleImage:SetVisible(false);
		end;
		
		if (characters == 0 or bIsLoading) then
			self.loadButton:SetDisabled(true);
		else
			self.loadButton:SetDisabled(false);
		end;
		
		if (characters >= Clockwork.player:GetMaximumCharacters()
		or Clockwork.character:IsPanelLoading()) then
			self.createButton:SetDisabled(true);
		else
			self.createButton:SetDisabled(false);
		end;
		
		if (Clockwork.Client:HasInitialized() and !Clockwork.character:IsMenuReset()) then
			self.disconnectButton:SetText("Cancel");
			self.disconnectButton:SizeToContents();
		else
			self.disconnectButton:SetText("Disconnect");
			self.disconnectButton:SizeToContents();
			self.disconnectButton:SetPos(ScrW() * 0.15, ScrH() * 0.7);
		end;
		
		if (self.animation) then
			self.animation:Run();
		end;
		
		self:SetSize(ScrW(), ScrH());
		
		Clockwork.theme:Call("PostCharacterMenuThink", self)
	end;
end;

vgui.Register("cwCharacterMenu", PANEL, "DPanel");