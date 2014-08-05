--[[
	Omni Cooldown Count
		A universal cooldown count, based on Gello's spec
--]]
local function log(msg) DEFAULT_CHAT_FRAME:AddMessage(msg) end -- alias for convenience

--returns the formatted time, scaling to use, color, and the time until the next update is needed
local function GetFormattedTime(secs)
	--day
	if secs > 86400 then
		return ceil(secs / 86400) .. "d", 15, 200, 200, 200, mod(secs, 86400);
	--hour
	elseif secs > 3600 then
		return ceil(secs / 3600) .. "h", 15, 200, 200, 200, mod(secs, 3600);
	--minute
	elseif secs > 60 then
		return ceil(secs / 60) .. "m", 15, 100, 100, 100, mod(secs, 60);
	--second, more than 5 seconds left
	elseif secs >= 5.5 then
		return floor(secs + 0.5), 15, 255, 255, 0, secs - floor(secs);
	end
	--second, 5 or less left
	return floor(secs + 0.5), 15, 255, 0,0, secs - floor(secs);
end

--[[
	Text cooldown constructor
		Its a seperate frame to prevent some rendering issues.
--]]

local function CreateCooldownCount(cooldown, start, duration)
	--[[
		OmniCC hides the text cooldown if the icon the button is hidden or not.
		This makes it a bit more dependent on other mods as far as their icon format goes.
		Its the only way I can think of to absolutely make sure that the text cooldown is hidden properly.
	--]]
	local icon = 
		--standard action button icon, $parentIcon
		getglobal(cooldown:GetParent():GetName() .. "EBF")
	
	if icon then
		local textFrame = CreateFrame("Frame", nil, cooldown:GetParent());
		textFrame:SetAllPoints(cooldown:GetParent());
		textFrame:SetFrameLevel(textFrame:GetFrameLevel() + 1);
		cooldown.textFrame = textFrame;
		
		textFrame.text = textFrame:CreateFontString(nil, "OVERLAY");
		textFrame.text:SetPoint("CENTER", textFrame, "CENTER", 0, 1);
		
		textFrame.icon = icon;
		
		textFrame:SetAlpha(cooldown:GetParent():GetAlpha());
		textFrame:Hide();
		
		textFrame:SetScript("OnUpdate", EBFTimer_OnUpdate);
		
		return textFrame;
	end
end

--[[ Text Update ]]--

function EBFTimer_OnUpdate()
	if this.timeToNextUpdate <= 0 or not this.icon:IsVisible() then
		local remain = this.duration - (GetTime() - this.start);

		if floor(remain + 0.5) > 0 and this.icon:IsVisible() then
			local time, scale, r, g, b, timeToNextUpdate = GetFormattedTime( remain );
			this.text:SetFont(STANDARD_TEXT_FONT, this:GetHeight()/2.8, "OUTLINE");
			this.text:SetText( time );
			this.text:SetTextColor(r, g, b);
			this.timeToNextUpdate = timeToNextUpdate;
		else
			this:Hide();
		end
	else
		this.timeToNextUpdate = this.timeToNextUpdate - arg1;
	end
end

--[[ Function Hooks ]]--

local oCooldownFrame_SetTimer = CooldownFrame_SetTimer
CooldownFrame_SetTimer = function(cooldownFrame, start, duration, enable)
	oCooldownFrame_SetTimer(cooldownFrame, start, duration, enable);
	
	if start > 0 and duration > 1.5 and enable > 0 then
		local cooldownCount = cooldownFrame.textFrame or CreateCooldownCount(cooldownFrame, start, duration);	
		if cooldownCount then
			cooldownCount.start = start;
			cooldownCount.duration = duration;
			cooldownCount.timeToNextUpdate = 0;
			cooldownCount:Show();
		end
	elseif cooldownFrame.textFrame then
		cooldownFrame.textFrame:Hide();
	end
end