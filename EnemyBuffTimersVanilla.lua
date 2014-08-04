local abilities = { 
-- Debuffs
	["Taunt"] = 3,
	["Mocking Blow"] = 6,
	["Challenging Shout"] = 6,
	["Hamstring"] = 15,
	["Piercing Howl"] = 6,
	["Shield Bash - Silenced"] = 4,
	["Concussion Blow"] = 5,
	["Charge Stun"] = 1,
	["Intercept Stun"] = 3,
	["Revenge Stun"] = 3,
	["Intimidating Shout"] = 8,
	["Disarm"] = 10,
	["Mortal Strike"] = 10,
	["Rend"] = 21,
	["Blast Wave"] = 6,
	["Frost Nova"] = 8,
	["Frostbite"] = 5,
	["Chilled"] = 5,
	["Cone of Cold"] = 8,
	["Frostbolt"] = 9,
	["Winter's Chill"] = 15,
	["Fire Vulnerability"] = 30,
	["Polymorph"] = 50,
	["Polymorph: Pig"] = 50,
	["Polymorph: Turtle"] = 50,
	["Counterspell - Silenced"] = 4,
	["Flamestrike"] = 8,
	["Wing Clip"] = 10,
	["Improved Concussive Shot"] = 3,
	["Freezing Trap Effect"] = 20,
	["Expose Weakness"] = 7,
	["Concussive Shot"] = 4,
	["Viper Sting"] = 8,
	["Wyvern Sting"] = 12,
	["Scatter Shot"] = 4,
	["Serpent Sting"] = 15,
	["Shadow Vulnerability"] = 15,
	["Mind Soothe"] = 15,
	["Shackle Undead"] = 50,
	["Psychic Scream"] = 8,
	["Silence"] = 5,
	["Shadow Word: Pain"] = 18,
	["Devouring Plague"] = 24,
	["Holy Fire"] = 10,
	["Banish"] = 30,
	["Seduction"] = 15,
	["Fear"] = 20,
	["Curse of Exhaustion"] = 12,
	["Curse of Tongues"] = 30,
	["Curse of Doom"] = 60,
	["Curse of Agony"] = 24,
	["Corruption"] = 18,
	["Immolate"] = 15,
	["Siphon Life"] = 30,
	["Shadowburn"] = 5,
	["Crippling Poison"] = 12,
	["Sap"] = 45,
	["Kidney Shot"] = 6,
	["Cheap Shot"] = 4,
	["Gouge"] = 4,
	["Blind"] = 10,
	["Kick - Silenced"] = 2,
	["Riposte"] = 6,
	["Expose Armor"] = 30,
	["Garrote"] = 18,
	["Rupture"] = 22,
	["Growl"] = 3,
	["Challenging Roar"] = 6,
	["Entangling Roots"] = 27,
	["Hibernate"] = 40,
	["Bash"] = 4,
	["Pounce"] = 2,
	["Feral Charge Effect"] = 4,
	["Insect Swarm"] = 12,
	["Moonfire"] = 12,
	["Rip"] = 12,
	["Hammer of Justice"] = 6,
	["Repentance"] = 6,
	["Frost Shock"] = 8,
	["Flame Shock"] = 12,
	["Mortal Wound"] = 15,
	["Mutating Injection"] = 10,
	["Web Wrap"] = 60,
	["Necrotic Poison"] = 30,
	["Delusions of Jin'do"] = 20,
	["Cause Insanity"] = 9,
	["Threatening Gaze"] = 5,
	["Living Bomb"] = 8,
	["Conflagration"] = 10,
	["Burning Adrenaline"] = 20,
	["Shadow of Ebonroc"] = 8,
	["True Fulfillment"] = 20,
	["Plague"] = 40,
	["Entangle"] = 10,
	["Paralyze"] = 10,
	["Greater Polymorph"] = 20,
	["Recently Bandaged"] = 60,
-- Buffs
	["Will of the Forsaken"] = 5, -- Will of the Forsaken
	["Cannibalize"] = 10,
	["Perception"] = 20,
	["Stoneform"] = 8,
	["Blood Fury"] = 25,
	["War Stomp"] = 2,
	["Berserking"] = 10,
	["Reckless Charge"] = 30,
	["Sleep"] = 30,
	-- Warrior
	["Death Wish"] = 30, -- Death Wish
	["Sunder Armor"] = 30, -- Sunder Armor
	["Berserker Rage"] = 10, -- Berserker Rage
	["Mortal Strike"] = 10, -- Mortal Strike
	-- Paladin
	["Blessing of Freedom"] = 14, -- Blessing of Freedom
	["Blessing of Sacrifice"] = 30, -- Blessing of Sacrifice
	["Blessing of Protection"] = 10, -- Blessing of Protection
	-- Hunter
	["Bestial Wrath"] = 18, -- Bestial Wrath
	["Viper Sting"] = 8, -- Viper Sting
	["Frost Trap Aura"] = 30, -- Frost Trap Aura
	["Frost Trap"] = 30, -- Frost Trap
	-- Druid
	["Regrowth"] = 21, -- Regrowth
	["Rejuvenation"] = 12, -- Rejuvenation
	["Fairie Fire"] = 40, -- Fairie Fire
	["Fairie Fire (Feral)"] = 40, -- Fairie Fire (Feral)
	["Barkskin"] = 12, -- Barkskin
	["Abolish Poison"] = 8, -- Abolish Poison
	-- Rogue
	["Sprint"] = 15, -- Sprint
	["Wound Poison"] = 15, -- Wound Poison
	["Evasion"] = 15, -- Evasion
	["Adrenaline Rush"] = 15, -- Adrenaline Rush
	["Cheap Shot"] = 4,
	["Kidney Shot"] = 6, -- would need combopoint check
	["Gouge"] = 5.5, -- needs talent check
	["Blind"] = 10,
	-- Priest
	["Abolish Disease"] = 20,
	["Power Word: Shield"] = 30, -- Power Word: Shield
	["Divine Shield"] = 12, -- Divine Shield
	["Weakened Soul"] = 15, -- Weakened Soul
	["Renew"] = 15,
	["Holy Fire"] = 10,
	["Fade"] = 10,
	["Power Word: Fortitude"] = 1800,
	["Prayer of Fortitude"] = 3600,
	["Divine Spirit"] = 1800,
	["Prayer of Spirit"] = 3600,
	["Shadow Protection"] = 600,
	["Prayer of Shadow Protection"] = 1200,
	["Power Infusion"] = 15, -- Power Infusion
	["Shadow Word: Pain"] = 18, -- Shadow Word: Pain
	["Starshards"] = 15, -- Starshards
	["Elune's Grace"] = 15, -- Elune's Grace
	["Devouring Plague"] = 24, -- Devouring Plague
	["Fear Ward"] = 180, -- Fear Ward
	-- Mage
	["Arcane Intellect"] = 1800,
	["Arcane Brilliance"] = 3600,
	["Amplify Magic"] = 600,
	["Dampen Magic"] = 600,
	["Mage Armor"] = 1800,
	["Ice Armor"] = 1800,
	["Frost Armor"] = 1800,
	["Frost Ward"] = 30,
	["Fire Ward"] = 30,
	["Pyroblast"] = 12,
	["Fireball"] = 8,
	["Frost Nova"] = 8,
	["Blast Wave"] = 6,
	["Detect Magic"] = 120,
	["Mana Shield"] = 60,
	["Slow Fall"] = 30,
	["Ice Block"] = 10,
	["Ignite"] = 4,
	-- Warlock
};
local function log(msg) DEFAULT_CHAT_FRAME:AddMessage(msg) end -- alias for convenience

local function firstToUpper(str)
	if (str~=nil) then
		return (string.gsub(str, "^%l", string.upper));
	else
		return nil;
	end
end

local EnemyBuffTimers = CreateFrame("Frame", nil, UIParent, "ActionButtonTemplate")
EnemyBuffTimers.TimeSinceLastUpdate = 0
EnemyBuffTimers.OnEvent = function() -- functions created in "object:method"-style have an implicit first parameter of "this", which points to object || in 1.12 parsing arguments as ... doesn't work
	this[event]() -- route event parameters to EnemyBuffTimers:event methods
end

function EnemyBuffTimers_OnUpdate(elapsed)
	EnemyBuffTimers.TimeSinceLastUpdate = EnemyBuffTimers.TimeSinceLastUpdate + elapsed
	if EnemyBuffTimers.TimeSinceLastUpdate >= 1 then
		EnemyBuffTimers.TimeSinceLastUpdate = 0
		this = EnemyBuffTimers
		EnemyBuffTimers:PLAYER_TARGET_CHANGED()
	end
end

EnemyBuffTimers:SetScript("OnEvent", EnemyBuffTimers.OnEvent)
EnemyBuffTimers:RegisterEvent("PLAYER_ENTERING_WORLD")

function EnemyBuffTimers:CreateFrames(destName, spellName)
	if type(this.guids[destName]) ~= "table" then
		this.guids[destName] = { }
	end
	-- don't create any more frames than necessary to avoid memory overload
	if this.guids[destName] and this.guids[destName][spellName] then
		this:UpdateFrames(destName, spellName)
	elseif this.abilities[spellName] then
		this.guids[destName][spellName] = CreateFrame("Model", spellName .. "_" .. destName.."Cooldown", nil, "CooldownFrameTemplate")
		-- to make this work with OmniCC || OmniCC requires parent and Icon
		this.guids[destName][spellName].parent = CreateFrame("Frame", spellName .. "_" .. destName)
		this.guids[destName][spellName].parent:Hide()
		this.guids[destName][spellName].parent.icon = CreateFrame("Frame", spellName .. "_" .. destName.."EBF")
		this.guids[destName][spellName].parent.icon:SetAllPoints(this.guids[destName][spellName].parent)
		this.guids[destName][spellName]:SetAllPoints(this.guids[destName][spellName].parent)
		-------------------------------
		this.guids[destName][spellName]:SetParent(this.guids[destName][spellName].parent)
		CooldownFrame_SetTimer(this.guids[destName][spellName], GetTime(), this.abilities[spellName], 1)
		this.guids[destName][spellName].onFrame = "none"
		this.guids[destName][spellName]:Show()
		local scale = TargetFrame:GetScale()
		this.guids[destName][spellName]:SetModelScale(scale*(2/5))
		
		if UnitName("target") == destName then
			this:PLAYER_TARGET_CHANGED()
		end
	end

end

function EnemyBuffTimers:UpdateFrames(destName, spellName)
	if this.guids[destName] and this.guids[destName][spellName] and this.abilities[spellName] then
		CooldownFrame_SetTimer(this.guids[destName][spellName], GetTime(), this.abilities[spellName], 1)
		if destName ~= UnitName("target") then
			local scale = TargetFrame:GetScale()
			this.guids[destName][spellName]:SetModelScale(scale*(2/5))
			this.guids[destName][spellName].parent:Hide()
			this.guids[destName][spellName].onFrame = "none"
		end
		
		if UnitName("target") == destName then
			this:PLAYER_TARGET_CHANGED()
		end
	end
end

function EnemyBuffTimers:HideFrames(destName, spellName)
	if this.guids[destName] and this.guids[destName][spellName] and this.abilities[spellName] then
		this.guids[destName][spellName].parent:ClearAllPoints()
		this.guids[destName][spellName].parent:Hide()
		this.guids[destName][spellName].onFrame = "none"
	end
end

function EnemyBuffTimers:PLAYER_ENTERING_WORLD()
	-- clear frames, just to be sure
	if type(this.guids) == "table" then
		for k,v in pairs(this.guids) do
			for ke,va in pairs(v) do
				v = nil
			end
			v = nil
		end
	end
	this.guids = {}
	this.abilities = abilities
	
	this:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	this:RegisterEvent("UNIT_AURA")
	this:RegisterEvent("PLAYER_TARGET_CHANGED")

	this:RegisterEvent("SPELLCAST_START")
	this:RegisterEvent("SPELLCAST_STOP")
	--this:RegisterEvent("SPELLCAST_FAILED")
	--this:RegisterEvent("SPELLCAST_INTERRUPTED")
	
	--events for HideFrames
	this:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER")
	this:RegisterEvent("CHAT_MSG_SPELL_BREAK_AURA")
	
	--events for gain/refresh frames
	this:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS")
	this:RegisterEvent("CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF")
	this:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE")
	this:RegisterEvent("CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE")
	
	-- for healers || buff/debuff || hots/dots
	this:RegisterEvent("CHAT_MSG_SPELL_FRIENDLYPLAYER_BUFF")
	this:RegisterEvent("CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE")
	this:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_BUFFS")
	this:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE")
	
	this:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_BUFFS")
	this:RegisterEvent("CHAT_MSG_SPELL_PARTY_BUFF")
	this:RegisterEvent("CHAT_MSG_SPELL_PARTY_DAMAGE")
	this:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE")
end

function EnemyBuffTimers:SPELLCAST_START()
	EnemyBuffTimers:PLAYER_TARGET_CHANGED()
end
function EnemyBuffTimers:SPELLCAST_STOP()
	EnemyBuffTimers:PLAYER_TARGET_CHANGED()
end
-----------------
-- HIDE FRAMES --
----------------- 
function EnemyBuffTimers:CHAT_MSG_SPELL_AURA_GONE_OTHER()
	--log(event.."  "..arg1.."  "..arg2.."  "..arg3.."  "..arg4)
	local first, last = string.find(arg1, "([\s\S]*)fades") -- idk what I'm doing
	if first ~=nil then
	local spellName = string.sub(arg1, 0, first-2)
	end
	
	local first, last = string.find(arg1, "[^ ]*$") --last word of a sentence
	if first ~=nil then
	local destName = string.sub(arg1, first, last-1) -- remove period
	end
	
	--log(event.."  destName: "..destName.."  spellName: "..spellName)
	--SpellName fades from UnitName.
	if UnitName("target") == destName then
		this:PLAYER_TARGET_CHANGED()
	end
	this:HideFrames(destName, spellName)
end

function EnemyBuffTimers:CHAT_MSG_SPELL_BREAK_AURA()
	--log(event.."  "..arg1.."  "..arg2.."  "..arg3.."  "..arg4)
	if UnitName("target") == destName then
		this:PLAYER_TARGET_CHANGED()
	end
	this:HideFrames(destName, spellName)
end

------------------
-- TargetFrames --
------------------ 

function EnemyBuffTimers:CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS()
	--hots
	--playerName gains spellName.
	--log(event.."  "..arg1.."  "..arg2.."  "..arg3.."  "..arg4)
	this:PLAYER_TARGET_CHANGED()
end

function EnemyBuffTimers:CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF()
	--buffs
	--playerName gains spellName.
	--log(event.."  "..arg1.."  "..arg2.."  "..arg3.."  "..arg4)
	this:PLAYER_TARGET_CHANGED()
end

function EnemyBuffTimers:CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE()
	--dots
	--playerName is afflicted by spellName.
	local destName = ""
	local spellName = ""
	
	local first, last = string.find(arg1, "([\s\S]*)is") -- idk what I'm doing
	if first ~=nil then
	destName = string.sub(arg1, 0, first-2)
	end
	
	local first, last = string.find(arg1, "(by.+)") --last word of a sentence
	if first ~=nil then
	spellName = string.sub(arg1, first+3, last-1) -- remove period
	end
	
	--log(event.."  destName: "..destName.."  spellName: "..spellName)
	this:CreateFrames(destName, spellName)
	if UnitName("target") == destName then
		this:PLAYER_TARGET_CHANGED()
	end
end

function EnemyBuffTimers:CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE()
	--debuffs
	--playerName is afflicted by spellName.
	local destName = ""
	local spellName = ""
	
	local first, last = string.find(arg1, "([\s\S]*)is") -- idk what I'm doing
	if first ~=nil then
	destName = string.sub(arg1, 0, first-2) -- get first word
	end
	
	local first, last = string.find(arg1, "(by.+)") --last word of a sentence
	if first ~=nil then
	spellName = string.sub(arg1, first+3, last-1) -- remove period
	end
	
	--log(event.."  destName: "..destName.."  spellName: "..spellName)
	this:CreateFrames(destName, spellName)
	if UnitName("target") == destName then
		this:PLAYER_TARGET_CHANGED()
	end
end

----------------
-- HealTarget --
----------------
function EnemyBuffTimers:CHAT_MSG_SPELL_FRIENDLYPLAYER_BUFF()
	--buffs
	--playerName gains spellName.
	local destName = ""
	local spellName = ""
	
	local first, last = string.find(arg1, "([\s\S]*)gains") -- idk what I'm doing
	if first ~=nil then
	destName = string.sub(arg1, 0, first-2)
	end
	
	local first, last = string.find(arg1, "gains(.+)") --last word of a sentence
	if first ~=nil then
	spellName = string.sub(arg1, first+6, last-1) -- remove gains and space
	end
	
	--log(event.."  destName: "..destName.."  spellName: "..spellName)
	this:CreateFrames(destName, spellName)
	if UnitName("target") == destName then
		this:PLAYER_TARGET_CHANGED()
	end
end

function EnemyBuffTimers:CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE()
	--debuffs
	--playerName is afflicted by spellName.
	local destName = ""
	local spellName = ""
	
	local first, last = string.find(arg1, "([\s\S]*)is") -- idk what I'm doing
	if first ~=nil then
	destName = string.sub(arg1, 0, first-2) -- get first word
	end
	
	local first, last = string.find(arg1, "(by.+)") --last word of a sentence
	if first ~=nil then
	spellName = string.sub(arg1, first+3, last-1) -- remove period
	end
	
	--log(event.."  destName: "..destName.."  spellName: "..spellName)
	this:CreateFrames(destName, spellName)
	if UnitName("target") == destName then
		this:PLAYER_TARGET_CHANGED()
	end
end

function EnemyBuffTimers:CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_BUFFS()
	--hots
	--playerName gains spellName.
	local destName = ""
	local spellName = ""
	
	local first, last = string.find(arg1, "([\s\S]*)gains") -- idk what I'm doing
	if first ~=nil then
	destName = string.sub(arg1, 0, first-2)
	end
	
	local first, last = string.find(arg1, "gains(.+)") --last word of a sentence
	if first ~=nil then
	spellName = string.sub(arg1, first+6, last-1) -- remove gains and space
	end
	
	--log(event.."  destName: "..destName.."  spellName: "..spellName)
	this:CreateFrames(destName, spellName)
	if UnitName("target") == destName then
		this:PLAYER_TARGET_CHANGED()
	end
end

function EnemyBuffTimers:CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE()
	--dots
	--playerName is afflicted by spellName.
	local destName = ""
	local spellName = ""
	
	local first, last = string.find(arg1, "([\s\S]*)is") -- idk what I'm doing
	if first ~=nil then
	destName = string.sub(arg1, 0, first-2) -- get first word
	end
	
	local first, last = string.find(arg1, "(by.+)") --last word of a sentence
	if first ~=nil then
	spellName = string.sub(arg1, first+3, last-1) -- remove period
	end
	
	--log(event.."  destName: "..destName.."  spellName: "..spellName)
	this:CreateFrames(destName, spellName)
	if UnitName("target") == destName then
		this:PLAYER_TARGET_CHANGED()
	end
end

---------------
---- PARTY ----
---------------

function EnemyBuffTimers:CHAT_MSG_SPELL_PARTY_BUFF()
	--buffs
	--playerName gains spellName.
	local destName = ""
	local spellName = ""
	
	local first, last = string.find(arg1, "([\s\S]*)gains") -- idk what I'm doing
	if first ~=nil then
	destName = string.sub(arg1, 0, first-2)
	end
	
	local first, last = string.find(arg1, "gains(.+)") --last word of a sentence
	if first ~=nil then
	spellName = string.sub(arg1, first+6, last-1) -- remove gains and space
	end
	
	--log(event.."  destName: "..destName.."  spellName: "..spellName)
	this:CreateFrames(destName, spellName)
	if UnitName("target") == destName then
		this:PLAYER_TARGET_CHANGED()
	end
end

function EnemyBuffTimers:CHAT_MSG_SPELL_PARTY_DAMAGE()
	--debuffs
	--playerName is afflicted by spellName.
	local destName = ""
	local spellName = ""
	
	local first, last = string.find(arg1, "([\s\S]*)is") -- idk what I'm doing
	if first ~=nil then
	destName = string.sub(arg1, 0, first-2) -- get first word
	end
	
	local first, last = string.find(arg1, "(by.+)") --last word of a sentence
	if first ~=nil then
	spellName = string.sub(arg1, first+3, last-1) -- remove period
	end
	
	--log(event.."  destName: "..destName.."  spellName: "..spellName)
	this:CreateFrames(destName, spellName)
	if UnitName("target") == destName then
		this:PLAYER_TARGET_CHANGED()
	end
end

function EnemyBuffTimers:CHAT_MSG_SPELL_PERIODIC_PARTY_BUFFS()
	--hots
	--playerName gains spellName.
	local destName = ""
	local spellName = ""
	
	local first, last = string.find(arg1, "([\s\S]*)gains") -- idk what I'm doing
	if first ~=nil then
	destName = string.sub(arg1, 0, first-2)
	end
	
	local first, last = string.find(arg1, "gains(.+)") --last word of a sentence
	if first ~=nil then
	spellName = string.sub(arg1, first+6, last-1) -- remove gains and space
	end
	
	--log(event.."  destName: "..destName.."  spellName: "..spellName)
	this:CreateFrames(destName, spellName)
	if UnitName("target") == destName then
		this:PLAYER_TARGET_CHANGED()
	end
end

function EnemyBuffTimers:CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE()
	--dots
	--playerName is afflicted by spellName.
	local destName = ""
	local spellName = ""
	
	local first, last = string.find(arg1, "([\s\S]*)is") -- idk what I'm doing
	if first ~=nil then
	destName = string.sub(arg1, 0, first-2) -- get first word
	end
	
	local first, last = string.find(arg1, "(by.+)") --last word of a sentence
	if first ~=nil then
	spellName = string.sub(arg1, first+3, last-1) -- remove period
	end
	
	--log(event.."  destName: "..destName.."  spellName: "..spellName)
	this:CreateFrames(destName, spellName)
	if UnitName("target") == destName then
		this:PLAYER_TARGET_CHANGED()
	end
end

function EnemyBuffTimers:UNIT_AURA(unitID)
	if unitID == "" then
		unitID = arg1 -- in case gets called by interface; it appears UNIT_AURA doesn't work for "target" in Vanilla
	end
	if unitID == "target" then
		local destName = "none"
		destName = UnitName(unitID)
		if this.guids[destName] then
			for i=1,16 do
				local iconTexture, count =  UnitBuff(unitID, i)
				--break loop if a cooldown timer already exists or 
				if not iconTexture then
					break
				end
				EnemyToolTip:ClearLines()
				EnemyToolTip:SetUnitBuff(unitID, i)
				local name = EnemyToolTipTextLeft1:GetText()
				if this.guids[destName][name] then
					local region = getglobal(firstToUpper(unitID).."FrameBuff"..i)
					if region then
						this.guids[destName][name].parent:SetAllPoints(region)
						this.guids[destName][name].parent:Show()
						this.guids[destName][name].onFrame = unitID
					end
				end
			end
			for i=1,16 do
				local iconTexture, count =  UnitDebuff(unitID, i)
				--break loop if a cooldown timer already exists or 
				if not iconTexture then
					break
				end
				EnemyToolTip:ClearLines()
				EnemyToolTip:SetUnitDebuff(unitID, i)
				local name = EnemyToolTipTextLeft1:GetText()
				if this.guids[destName][name] then
					local region = getglobal(firstToUpper(unitID).."FrameDebuff"..i)
					if region then
						this.guids[destName][name].parent:SetAllPoints(region)
						this.guids[destName][name].parent:Show()
						this.guids[destName][name].onFrame = unitID
					end
				end
			end
		end
	end	
end

function EnemyBuffTimers:PLAYER_TARGET_CHANGED()
	for k,v in pairs(this.guids) do
		for ke, va in pairs(v) do
			if va.onFrame == "target" then
				va.parent:ClearAllPoints()
				va.parent:Hide()
				va.onFrame = "none"
			end
		end
	end
	if UnitName("target") then this.lastTarget = UnitName("target") end
	this:UNIT_AURA("target")
end