--[[
TO DO:
- figure out why hooking causes errors here but not in KTM or SpellTimer
- take combo point to duration functionality from SpellTimer
- do the same for trap time
- hook CastSpell, UseContainerItem, UseIventoryItem, CastPetAction
- temporarily store timers and reset them on Dodge, Parry, Block, Resist
	- take functionality from SpellTimer
- add delay for cast time spells like Frostbolt (debuff) and Immolate
	- again, SpellTimer has this functionality
--]]

local abilities = { 
----- Mixed Class & Other Buff/Debuffs, Trinket & Weapon Buff/Debuffs.
	["Ressurection Sickness"] = 600,
	["Banish"] = 30,
	["Fear"] = 20,
	["Earthbind"] = 5,
	["Curse of Agony"] = 24,
	["Curse of Recklessness"] = 120,
	["Curse of Weakness"] = 120,
	["Curse of Shadow"] = 300,
	["Curse of Exhaustion"] = 12,
	["Curse of Tongues"] = 30,
	["Curse of Doom"] = 60,	
	["Corruption"] = 18,
	["Immolate"] = 15,
	["Siphon Life"] = 30,
	["Shadowburn"] = 5,
	["Improved Shadow Bolt"] = 10,
	["Aftermath"] = 5,
	["Blackout"] = 3,
	["Taunt"] = 3,
	["Mocking Blow"] = 6,
	["Challenging Shout"] = 6,
	["Hamstring"] = 15,
	["Improved Hamstring"] = 5,
	["Piercing Howl"] = 6,
	["Howling Rage"] = 300,
	["Howling Blage"] = 30,
	["Tainted Howl"] = 120,
	["Bloody Howl"] = 15,
	["Enraging Howl"] = 30,
	["Shield Bash - Silenced"] = 4,
	["Concussion Blow"] = 5,
	["Charge Stun"] = 1,
	["Mace Stun Effect"] = 3,
	["Intercept Stun"] = 3,
	["Revenge Stun"] = 3,
	["Intimidating Shout"] = 8,
	["Deafening Screech"] = 8,
	["Disarm"] = 10,
	["Shield Block"] = 5,
	["Mortal Strike"] = 10,
	["Deep Wound"] = 12,
	["Rend"] = 21,
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
	["Black Sludge"] = 120,
	["Scatter Shot"] = 4,
	["Serpent Sting"] = 15,
	["Shadow Vulnerability"] = 12,
	["Mind Soothe"] = 15,
	["Corrosive Poison"] = 30,
	["Psychic Scream"] = 8,
	["Silence"] = 5,
	["Shadow Word: Pain"] = 18,
	["Devouring Plague"] = 24,
	["Holy Fire"] = 10,
	["Sap"] = 45,
	["Kidney Shot"] = 6,
	["Cheap Shot"] = 4,
	["Gouge"] = 4,
	["Blind"] = 10,
	["Kick - Silenced"] = 2,
	["Riposte"] = 6,
	["Expose Armor"] = 30,
	["Garrote"] = 18,
	["Rupture"] = 16,
	["Growl"] = 3,
	["Challenging Roar"] = 6,
	["Entangling Roots"] = 27,
	["Hibernate"] = 40,
	["Bash"] = 5, -- with talent
	["Pounce"] = 3, -- with talent
	["Pounce Bleed"] = 18,
	["Feral Charge"] = 4,
	["Feral Charge Effect"] = 4,
	["Insect Swarm"] = 12,
	["Moonfire"] = 12,
	["Rip"] = 12,
	["Hammer of Justice"] = 6,
	["Repentance"] = 6,
	["Frost Shock"] = 8,
	["Flame Shock"] = 12,
	["Mutating Injection"] = 10,
	["Web Wrap"] = 60,
	["Necrotic Poison"] = 30,
	["Delusions of Jin'do"] = 20,
	["Cause Insanity"] = 9,
	["Threatening Gaze"] = 5,
	--["Stoneform"] = 15,
	["Burning Adrenaline"] = 20,
	["Shadow of Ebonroc"] = 8,
	["True Fulfillment"] = 20,
	["Plague"] = 40,
	["Fire Resistance"] = 60,
	["Flame Wrath"] = 15,
	["Entangle"] = 10,
	["Paralyze"] = 10,
	["Greater Polymorph"] = 20,
	["Recently Bandaged"] = 60,
	["Death Coil"] = 3,
	["Howl of Terror"] = 15,
	["Circle of Flame"] = 10,
	["Hunter's Mark"] = 120,
	["Fire Shield II"] = 60,
	["Fire Shield III"] = 30,
	["Fire Shield IV"] = 15,
	["Sap Might	"] = 300,
	["Dazed"] = 4,
	["Boar Charge"] = 1,
	["Mortal Strike"] = 10, -- Mortal Strike
	["Tidal Charm"] = 3,	
	["Deserter"] = 900,
	["Rallying Cry of the Dragonslayer"] = 7200,
	["Spirit of Zandalar"] = 120,
	["Contagion of Rot"] = 240,
	["Persistent Shield"] = 8,
	["Reckless Charge"] = 30,
	["Chitinous Spikes"] = 30,
	["Gnomish Mind Control Cap"] = 20,
	["Gnomish Rocket Boots"] = 20,
	["Shrink Ray"] = 20,
	["Flee"] = 10,
	["Quick Flame Ward"] = 10,
	["Quick Frost Ward"] = 10,
	["Damage Absorb"] = 15,
	["Sleep"] = 30,
	["Unstable Power"] = 20,
	["Devilsaur Fury"] = 20,
	["Blazing Emblem"] = 15,
	["Holy Strength"] = 15,
	["Call of the Grave"] = 60,
	["Aura of the Blue Dragon"] = 15,
	["Chromatic Infusion"] = 15,
	["Cold Eye"] = 15,
	["Healing of the Ages"] = 20,
	["Aegis of Preservation"] = 20,
	["Aura of Protection"] = 20,
	["Net-o-Matic"] = 10,
	["Cloaking"] = 10,
	["Burst of Knowledge"] = 10,
	["Force of Will"] = 10,
	["Second Wind"] = 10,
	["Avatar"] = 15,
	["Cauterizing Flames"] = 900,
	["Engulfing Flames"] = 6,
	["Flameshocker's Touch"] = 3,
	["Flames of Chaos"] = 35,
	["Shadow Shell"] = 10,
	["Shadow Weakness"] = 45,
	["Shadow Word: Fumble"] = 10,
	["Shadow Word: Silence"] = 6,
	["Shadow of Ebonroc"] = 8,
	["Shadowstalker Stab"] = 5,
	["Shadow Shield"] = 30,
	["Taint of Shadow"] = 1200,
	["Touch of Shadow"] = 1800,
	["Veil of Shadow"] = 8,
	["Flamethrower"] = 2,
	["Growing Flames"] = 6,
	["Searing Flames"] = 9,
	["Superheated Flames"] = 10,
	["Incite Flames"] = 60,
	["Mark of Flames"] = 120,
	["Piercing Shadow"] = 1800,
	["Shadow Mark"] = 15,
	["Earthstrike"] = 20,
	["Gift of Life"] = 20,
	["Glyph of Deflection"] = 20,
	["Mind Quickening"] = 20,
	["Prismstone"] = 20,
	["Mark of the Chosen"] = 60,
	["Mercurial Shield"] = 60,
	["Ragged John's Neverending Cup"] = 600,
	["The Lion Horn of Stormwind"] = 30,
	["Frost Reflector"] = 5,
	["Shadow Reflector"] = 5,
	["Fire Reflector"] = 5,
	["Breath of Fire"] = 5,
	["Resist Fire"] = 3600,
	["Tendon Rip"] = 8,
	["Unholy Curse"] = 12,
	["Curse of Impotence"] = 120,
	["Infected Wound"] = 300,
	["Magic Reflection"] = 10,
	["Net-o-Matic"] = 10,
	["Gnomish Rocket Boots"] = 20,
	["Goblin Rocket Boots"] = 20,
	["Rocket Boots Malfunction"] = 5, --Disoriented effect
	["Transporter Malfunction"] = 10, --Transmog effect
	["Electrified Net"] = 10,
	["Net"] = 5,
	["Tiger's Fury"] = 6,
	["Net Guard"] = 20,
	["Hooked Net"] = 10,
	["Control Machine"] = 60, --Universal Remote
	["Diamond Flask"] = 60,
	["Mobility Malfunction"] = 20, --Universal remote
	["Toxic Vapors"] = 12,
	["Sludge Toxin"] = 45,
	["Intoxicating Venom"] = 120,
	["Corrosive Venom Spit"] = 10,
	["Venom Spit"] = 10,
	["Venom Sting"] = 45,
	["Creeper Venom"] = 600,
	["Minor Scorpion Venom"] = 60,
	["Minor Scorpion Venom Effect"] = 60,
	["Toxin"] = 9,
	["Deadly Toxin"] = 12,
	["Deadly Toxin II"] = 12,
	["Deadly Toxin III"] = 12,
	["Deadly Toxin IV"] = 12,
	["Deadly Poison"] = 12,
	["Deadly Poison II"] = 12,
	["Deadly Poison III"] = 12,
	["Deadly Poison IV"] = 12,
	["Deadly Poison V"] = 12,
	["Mind-numbing Poison"] = 10,
	["Mind-numbing Poison II"] = 12,
	["Mind-numbing Poison III"] = 14,
	["Crippling Poison"] = 12,
	["Bloodpetal Poison"] = 30,
	["Baneful Poison"] = 120,
	["Atal'ai Poison"] = 30,
	["Deadly Leech Poison"] = 45,
	["Leech Poison"] = 40,
	["Nullify Poison"] = 30,
	["Overseer's Poison"] = 60,
	["Paralyzing Poison"] = 8,
	["Poison Bolt"] = 10,
	["Poison Bolt Volley"] = 10,
	["Poison Charge"] = 9,
	["Poison Stinger"] = 10,
	["Poisonous Blood"] = 90,
	["Withering Poison"] = 180,
	["Poisonous Stab"] = 15,
	["Poisonous Spit"] = 15,
	["Scorpid Poison"] = 10,
	["Weak Poison"] = 12,
	["Trap"] = 10,
	["Battle Net"] = 10,
	["Mark of Nature"] = 900,
	["Electromagnetic Gigaflux Reactivator"] = 3,
	["Static Barrier"] = 600,
	["Slowing Poison"] = 25,
	["Spider Poison"] = 30,
	["Virulent Poison"] = 30,
	["Venomhide Poison"] = 30,	
	["Large Copper Bomb"] = 1,
	["Rough Copper Bomb"] = 1,
	["Small Bronze Bomb"] = 2,
	["Mithril Frag Bomb"] = 2,
	["Big Bronze Bomb"] = 2,
	["Flash Bomb"] = 10,
	["Dark Iron Bomb"] = 4,
	["Big Iron Bomb"] = 3,
	["Iron Grenade"] = 3,
	["M73 Frag Grenade"] = 3,
	["Thorium Grenade"] = 3,
	["Arcane Bomb"] = 5,
	["Stun Bomb"] = 5,
	["Goblin Land Mine"] = 60,
	["Stunning Blow"] = 8,
	["Festering Bites"] = 1800,
	["Curse of Thule"] = 240,
	["Plague Cloud"] = 240,
	["Hex of Ravenclaw"] = 30,
	["Touch of Ravenclaw"] = 5,
	["Dominate Mind"] = 15,
	["Abolish Magic"] = 5,
	["Honorless Target"] = 30,
	["Grow"] = 30,
	["Shrink"] = 30,
	["Super Shrink Ray"] = 20,
	["Jang'thraze"] = 20,	
	["Mind Rot"] = 30,
	["Putrid Bile"] = 45,
	["Bile Vomit"] = 20,
	["Biletoad Infection"] = 180,
	["Terrifying Screech"] = 4,
	["Wailing Dead"] = 6,
	["Maggot Goo"] = 6,
	["Maggot Slime"] = 1800,
	["Infected Bite"] = 180,	
	["Curse of the Deadwood"] = 120,
	["Touch of Zanzil"] = 604800,
	["Burning Flesh"] = 21,
	["Dark Sludge"] = 300,
	["Tainted Mind"] = 600,
	["Incapacitating Shout"] = 60,
	["Sludge"] = 3,
	["Snap Kick"] = 2,
	["Felsh Rot"] = 10,
	["Rend Flesh"] = 12,
	["Fatal Sting"] = 12,
	["Uther's Light Effect"] = 15,
	["Head Butt"] = 2,
	["Venomous Totem"] = 20,
	["Web"] = 10,
	["Furbolg Medicine Pouch"] = 10,
	["Primal Blessing"] = 12,
	["Battle Fury"] = 240,
	["Forsaken Skill: 2H Axes"] = 60,
	["Forsaken Skill: 2H Maces"] = 60,
	["Forsaken Skill: 2H Swords"] = 60,
	["Forsaken Skill: Axes"] = 60,
	["Forsaken Skill: Maces"] = 60,
	["Forsaken Skill: Swords"] = 60,
	["Forsaken Skill: Bows"] = 60,
	["Forsaken Skill: Daggers"] = 60,
	["Forsaken Skill: Defense"] = 60,
	["Forsaken Skill: Fire"] = 60,
	["Forsaken Skill: Frost"] = 60,
	["Forsaken Skill: Guns"] = 60,
	["Forsaken Skill: Holy"] = 60,
	["Forsaken Skill: Shadow"] = 60,
	["Forsaken Skill: Staves"] = 60,
	["Forsaken Skills"] = 300,
	["Turn Undead"] = 15,
	["Undead Tracker"] = 60,
	["Bloodfang"] = 60,
	["Wandering Plague"] = 300,
	["Copy of Wandering Plague"] = 300,
	["Creeping Plague"] = 20,
	["Curse of the Plague Rat"] = 14,
	["Dark Plague"] = 90,
	["Fevered Plague"] = 180,
	["Ghoul Plague"] = 1800,
	["Ghoul Rot"] = 600,
	["Ghostly"] = 60,
	["Plague"] = 40,
	["Plague Mind"] = 600,
	["Plague Mist"] = 8,
	["Retching Plague"] = 300,
	["Wrath of the Plaguebringer"] = 10,
	["Disease Buffet"] = 20,
	["Diseased Shot"] = 10,
	["Diseased Slime"] = 120,
	["Diseased Spit"] = 10,
	["Weakness Disease"] = 30,
	["Sanctuary"] = 10,
	["Drunken Rage"] = 15,
	["Drunken Stupor"] = 3,
	["Sanctified Orb"] = 25,
	["Overdrive"] = 6,
	["Slavedriver's Cane"] = 30,
	["Baron Rivendare's Soul Drain"] = 3,
	["Trip"] = 3,
	["Brain Freeze"] = 120,
	["Mar'li's Brain Boost"] = 30,
	["Corrupted Mind"] = 60,
	["Mind Bomb Effect"] = 60,
	["Mind Exhaustion"] = 60,
	["Mind Tremor"] = 600,
	["Mind Quickening"] = 20,
	["Poison Mind"] = 15,
	["Drowning Death"] = 300,
	["Cheat Death"] = 5,
	["Death Bed"] = 10,
	["Fake Death"] = 300,
	["Gnomish Death Ray"] = 4,
	["Presence of Death"] = 10,
	["Curse of the Firebrand"] = 300,
	["Curse of Hakkar"] = 120,
	["Curse of Stalvan"] = 600,
	["Curse of Thorns"] = 180,
	["Curse of Thule"] = 240,
	["Curse of Tuten'kash"] = 900,
	["Curse of Blackheart"] = 180,
	["Curse of the Eye"] = 120,
	["Curse of Darkmaster"] = 60,
	["Curse of Dreadmaul"] = 60,
	["Curse of Deadwood"] = 120,
	["Curse of the Tribes"] = 1800,
	["Gehennas' Curse"] = 300,
	["Gehenna's Curse"] = 300,
	["Lucifron's Curse"] = 300,
	["Marduk's Curse"] = 5,
	["Mystical Disjunction"] = 8,
	["Unholy Curse"] = 12,
	["Shazzrah's Curse"] = 300,
	["Crystal Gaze"] = 6,
	["Crystal Spire"] = 600,
	["Crystal Force"] = 1800,
	["Crystal Flash"] = 15,
	["Crystalline Slumber"] = 15,
	["Crystallize"] = 6,
	["Fang of the Crystal Spider"] = 10,
	["Spider's Kiss"] = 10,
	["Repulsive Gaze"] = 8,
	["Threatening Gaze"] = 6,
	["Basilisk Skin"] = 5,
	["Cozy Fire"] = 60,
	["Rock Skin"] = 3600,
	["Skin of Rock"] = 8,
	["Stone Skin"] = 6,
	["Insight"] = 10,
	["Obsidian Insight"] = 30,
	["Freeze Solid"] = 10,
	["Icicle"] = 10,
	["Frost Breath"] = 10,
	["Low Swipe"] = 15,
	["Dismounting Shot"] = 2,
	["Frost Shot"] = 10,
	["Grasping Vines"] = 10,
	["Infected Spine"] = 300,
	["Web Spin"] = 7,
	["Whirlwind"] = 6,
	["Whirlwind Primer"] = 2,
	["Acid Breath"] = 45,
	["Breath of Fire"] = 5,
	["Chilling Breath"] = 12,
	["Breath of Sargeras"] = 90,
	["Scorch Breath"] = 15,
	["Sand Breath"] = 10,
	["Putrid Breath"] = 30,
	["Noxious Breath"] = 30,
	["Petrify"] = 8,
	["Ascendance"] = 20,
	["Illusion: Black Dragonkin"] = 900,
	["Curse of Shahram"] = 10,
	["Might of Shahram"] = 5,
	["Fist of Shahram"] = 8,
	["Blessing of Shahram"] = 20,
	["Will of Shahram"] = 20,
	["Eskhandar's Rage"] = 5,
	["Eskhandar's Rake"] = 30,
	["Searing Blast"] = 30,
	["Eyes of the Beast"] = 60,
	["Twisted Tranquility"] = 10,
	["Agonizing Pain"] = 15,
	["Distracting Pain"] = 15,
	["Chest Pains"] = 5,
	["Numbing Pain"] = 10,
	["Intense Pain"] = 15,
	["Wracking Pains"] = 180,
	["Rift Beacon"] = 60,
	["Swoop"] = 2,
	["Ravage"] = 2,
	["Greater Invisibility"] = 120,
	["Primal Blessing"] = 12,
	["Blaze"] = 30,
	["Air Bubbles"] = 4,
	["Corrupted Stamina"] = 4,
	["Cadaver Worms"] = 600,
	["Terrifying Howl"] = 3,
	["The Baron's Ultimatum"] = 2700,
	["Bone Armor"] = 60,
	["Soul Trap"] = 12,
	["Harvest Soul"] = 60,
	["Flame Lash"] = 45,
	["Flame Spike"] = 9,
	["Orb of Deception"] = 300,
	["World Enlarger"] = 300,
	["Mercurial Shield"] = 60,
	["Puncture Armor"] = 30,
	["Demonfork"] = 25,
	["Armor Shatter"] = 45,
	["Soul Breaker"] = 30,
	["Dust Cloud"] = 12,
	["Lightning Cloud"] = 15,
	["Poison Cloud"] = 45,
	["Smoke Cloud"] = 3,
	["Spore Cloud"] = 5,
	["Mark of Frost"] = 900,
	["Mark of Kazzak"] = 60,
	["Mark of Korth'azz"] = 75,
	["Mark of Mograine"] = 75,
	["Mark of Blaumeux"] = 75,
	["Mark of Arlokk"] = 120,
	["Rage of Ages"] = 3600,
	["Spirit of Boar"] = 3600,
	["Infallible Mind"] = 3600,
	["Devilsaur Barb"] = 10,
	["Devilsaur Fury"] = 20,
	["Evil Twin"] = 7200,
	["Deep Sleep"] = 10,
	["Sleep Walk"] = 10,
	["The Black Sheep"] = 10,
	["Aegis of Ragnaros"] = 300,
	["Savage Rage"] = 4,
	["Chains of Ice"] = 20,
	["Extract Essence"] = 12,
	["Essence of Sapphiron"] = 20,
	["Submersion"] = 60,
	["Riptide"] = 4,
	["Bladestorm"] = 9,
	["Chaotic Focus"] = 1800,
	["Shield Slam"] = 2,
	["Resist Arcane"] = 3600,
	["Gnarlpine Vengance"] = 6,
	["Seal of Protection"] = 8,
	["Crusader Strike"] = 30,
	["Acid Splash"] = 30,
	["Flash"] = 8,
	["Thorn Volley"] = 2,
	["Lash"] = 2,
	["Whipweed Entangle"] = 18,
	["Crush Armor"] = 30,
	["Claw Grasp"] = 4,
	["Icy Grasp"] = 5,
	["Stygian Grasp"] = 5,
	["Grap Weapon"] = 15,
	["Torch"] = 8,
	["Blight"] = 60,
	["Brilliant Light"] = 15,
	["Flight of the Peregrine"] = 15,
	["Argent Avenger"] = 10,
	["Poison"] = 15,
	["Pummel"] = 5,
	["Decayed Strength"] = 30,
	["Haste"] = 30,
	["Bottle of Poison"] = 30,
	["Poison Bolt Volley"] = 10,
	["Copy of Poison Bolt Volley"] = 10,
	["Atal'ai Poison"] = 30,
	["Poison Mushroom"] = 30,
	["Poison Charge"] = 9,
	["Tranquilizing Poison"] = 8,
	["Poison Stinger"] = 10,
	["Phantom Strike"] = 20,
	["Haunting Phantoms"] = 300,
	["Soul Breaker"] = 30,
	["Weakening Disease"] = 30,
	["Puncture"] = 10,
	["Lung Puncture"] = 260,
	["Frightalon"] = 60,
	["Malown's Slam"] = 2,
	["Surge of Strength"] = 30,
	["Power Surge"] = 10,
	["Creeping Mold"] = 15,
	["Strength of the Champion"] = 30,
	["Shadow Bolt"] = 6,
	["Seeping Willow"] = 30,
	["Skullforge Brand"] = 30,
	["Zeal"] = 15,
	["Far Sight"] = 60,
	["Light of Elune"] = 10,
	["Lunar Fortune"] = 1800,
	["Tornado"] = 4,
	["Smolderweb Protection"] = 30,
	["Web Explosion"] = 10,
	["Freeze Solid"] = 10,
	["Freezing Claw"] = 5,
	["Flash Freeze"] = 5,
	["Trelane's Freezing Touch"] = 12,
	["Chilling Touch"] = 8,
	["Debilitating Touch"] = 120,
	["Nimble Healing Touch"] = 15,
	["Withered Touch"] = 180,
	["Wither Touch"] = 120,
	["Aura of Frost"] = 5,
	["Draw from the Earth"]	= 10,
	["Frost"] = 10,
	["Frost Weakness"] = 45,
	["Arcane Weakness"] = 45,
	["Fire Weakness"] = 45,
	["Nature Weakness"] = 45,
	["Shadow Weakness"] = 45,
	["Draw of Thistlenettle"] = 8,
	["Daunting Growl"] = 30,
	["Growl of Fortitude"] = 300,
	["Intimidating Growl"] = 5,
	["Threatening Growl"] = 30,
	["Ancestor's Vengeance"] = 20,
	["Challenger is Dazed"] = 30,
	["Curse of Vengance"] = 900,
	["Flameshocker's Revenge"] = 2,
	["Vengeance"] = 8,
	["Corrupted Fear"] = 2,
	["Enigma's Answer"] = 20,
	["Elemental Vulnerability"] = 30,
	["Adaptive Warding"] = 30,
	["Arcane Resistance"] = 30,
	--["Fire Resistance"] = 30,
	["Shadow Resistance"] = 30,
	["Nature Resistance"] = 30,
	["Crusader's Wrath"] = 10,
	["Netherwind Focus"] = 10,
	["Holy Power"] = 8,
	["Totemic Power"] = 8,
	["Shred"] = 12,
	["Epiphany"] = 30,
	["Greater Heal"] = 15,
	["Enrage (druid ability)"] = 10,
	["Holy Shield"] = 10,
	["Unholy Shield"] = 600,
	["Volatile Infection"] = 15,
	["Pagle's Broken Reel"] = 15,
	["Heartbroken"] = 3600,
	["Fire Festival Fury"] = 3600,
	["Chaos Fire"] = 60,
	["Cloak of Fire"] = 15,
	["Corrupt Healing"] = 30,
	["Corrupted Intellect"] = 4,
	["Corrupted Agility"] = 4,
	["Corrupted Strength"] = 4,
	["Corrupted Stamina"] = 4,
	["Corrupted Spirit"] = 4,
	["Corrupted Mind"] = 60,
	["Corruption of the Earth"] = 10,
	["Soul Corruption"] = 15,
	["Azrethoc's Stomp"] = 5,
	["Fel Stomp"] = 3,
	["Ground Stomp"] = 5,
	["Kodo Stomp"] = 3,
	["Smite Stomp"] = 10,
	["Stomp"] = 2,
	["Atal'ai Corpse Eat"] = 12,
	["Cheetah Sprint"] = 4,
	["Sand Blast"] = 5,
	["Sand Breath"] = 10,
	["Harsh Winds"] = 1,
	["Sand Storm"] = 7,
	["Sand Trap"] = 20,
	["Smothering Sands"] = 20,
	["Dust Field"] = 8,
	["Dust Cloud"] = 12,
	["Radiation Cloud"] = 30,
	["Fury of Forgewright"] = 10,
	["Involuntary Transformation"] = 30,
	["Piercing Ankle"] = 6,
	["Piercing Shot"] = 15,
	["Piercing Shriek"] = 6,
	["Banshee Shriek"] = 5,
	["Frightening Shriek"] = 6,
	["Deadful Fright"] = 5,
	["Ancient Dread"] = 900,
	["Ancient Despair"] = 5,
	["Ancient Hysteria"] = 900,
	["Wings of Despair"] = 6,
	["Beast Claws"] = 10,
	["Bloodlust II"] = 30,
	["Cleave Armor"] = 20,
	["Strong Cleave"] = 10,
	["Black March Blessing"] = 6,
	["Blessing of Blackfathom"] = 3600,
	["Blessing of Nordrassil"] = 10,
	["Blessing of Thule"] = 8,
	["Fatigued"] = 2,
	["Blessing of the Claw"] = 4,
	["Bolt Discharge Bramble"] = 120,
	["Cthun Vulnerable"] = 45,
	["Curse of Blackheart"] = 180,
	["Inevitable Doom"] = 10,
	["Self Invulnerability"] = 3,
	["Lordaeron's Blessing"] = 1800,
	["Nimble Healing Touch"] = 15,
	["Prayer Beads Blessing"] = 20,
	["Reduced to Rubble"] = 1800,
	["Unkillable Off"] = 3,
	["Warchief's Blessing"] = 3600,
	["Water Bubble"] = 30,
	["Arantir's Rage"] = 6,
	["Encouragement"] = 1800,
	["Frenzied Rage"] = 5,
	["Frenzied Regeneration"] = 10,
	["Frenzied Capo the Mean"] = 15,
	["Frenzied Command"] = 10,
	["Frenzied Dive"] = 2,
	["Frenzy"] = 8,
	["Frenzy Effect"] = 8,
	["Demonic Frenzy"] = 30,
	["Unholy Frenzy"] = 20,
	["Serrated Bite"] = 30,
	["Enraging Bite"] = 6,
	["Festering Bite"] = 1800,
	["Putrid Bite"] = 30,
	["Widow Bite"] = 4,
	["Suppression Aura"] = 6,
	["Anub'Rekhan's Aura"] = 5,
	["Aura of Agony"] = 8,
	["Aura of Command"] = 30,
	["Aura of Fear"] = 3,
	["Aura of Shock"] = 300,
	["Defiling Aura"] = 5,
	["Emeriss Aura"] = 10,
	["Frost Aura"] = 5,
	["Poison Aura"] = 12,
	["Ritual Candle Aura"] = 6,
	["Thorns Aura"] = 60,
	["Anti-Magic Shield"] = 6,
	["Bone Shield"] = 300,
	["Damage Shield"] = 10,
	["Energized Shield"] = 20,
	["Persistent Shield"] = 8,
	["Shell Shield"] = 12,
	["Shield of Rajaxx"] = 6,
	["Violent Shield"] = 8,
	["Violent Shield Effect"] = 8,
	["Slime Bolt"] = 10,
	["Slime Burst"] = 5,
	["Slime Dysentery"] = 1800,
	["Slime Stream"] = 3,
	["Sling Dirt"] = 10,
	["Sling Mud"] = 15,
	["Tendon Slice"] = 8,
	["Miring Mud"] = 5,
	["Mirefin Fungus"] = 8,
	["Mirkfallon Fungus"] = 2700,
	["Admiral's Hat"] = 600,
	["Celebrate Good Times!"] = 1800,
	["Counterattack"] = 5,
	["Lacerations"] = 60,
	["Lacerate"] = 8,
	["Rat Nova"] = 10,
	["Seperation Anxiety"] = 5,
	["Shield Generator"] = 30,
	["Stormcaller's Wrath"] = 8,
	["Wild Regeneration"] = 20,
	["Wild Rage"] = 60,
	["Wild Polymorph"] = 20,
	["Wild Magic"] = 30,
	["Control Machine"] = 60,
	["Control Shredder"] = 1800,
	["Using Control Console"] = 300,
	["Decimate"] = 30,
	["Demonic Transformation"] = 15,
	["Chromatic Chaos"] = 300,
	["Chromatic Mutation"] = 300,
	["Enveloping Winds"] = 10,
	["Spirit of Wind"] = 300,
	["Swift Wind"] = 3600,
	["Windsor's Frenzy"] = 600,
	["Hex of Jammal'an"] = 10,
	["Voodoo Hex"] = 120,
	["Hex"] = 10,
	["Darken Vision"] = 12,
	["Mind Vision"] = 60,
	["Mistletoe"] = 1800,
	["Gust of Wind"] = 4,
	["Crystal Force"] = 1800,
	["Force of Will"] = 10,
	["Forcefield Collapse"] = 20,
	["Decrepit Fever"] = 21,
	["Fevered Exhaustion"] = 900,
	["Muculent Fever"] = 600,
	["Party Fever"] = 120,
	["Party Fever Effect"] = 120,
	["Fevered Plague"] = 180,
	["Fevered Fatigue"] = 1800,
	["Bubbly Refreshment"] = 1800,
	["Midsummer Sausage"] = 3600,
	["Elderberry Pie"] = 3600,
	["Toasted Smorch"] = 3600,
	["Fire-Toasted Bun"] = 3600,
	["Befuddlement"] = 15,
	["Elemental Armor"] = 60,
	["Elemental Fury"] = 30,
	["Elemental Fire"] = 8,
	["Hercular's Ward"] = 5,
	["Curse of the Darkmaster"] = 60,
	["Dark Wispers"] = 600,
	["Frostwhisper's Lifeblood"] = 20,
	["Time Stop"] = 4,
	["Time Step"] = 10,
	["Rushing Charge"] = 3,
	["Black Sapphire"] = 11,
	["Sapta Sight"] = 1200,
	["Flow of the Northspring"] = 15,
	["Songflower Serenade"] = 3600,
	["Crazed"] = 60,
	["Crazed Hunger"] = 6,
	["Krazek's Drug"] = 10,
	["Razor Mane"] = 45,
	["Razorhide"] = 600,
	["Razorlash Root"] = 10,
	["Sul'thraze"] = 15,
	["Fire Festival Fortitude"] = 3600,
	["Ice Claw"] = 6,
	["Run Away!"] = 5,
	["Ice Nova"] = 2,
	["Icebolt"] = 2,
	["Savior's Sacrifice"] = 10,
	["Untamed Fury"] = 8,
	["Tame Ice Claw Bear"] = 20,
	["Tame Dire Mottled Boar"] = 20,
	["Tame Adult Plainstrider"] = 20,
	["Tame Armored Scorpid"] = 20,
	["Tame Large Crag Boar"] = 20,
	["Tame Nightsaber Stalker"] = 20,
	["Tame Prairie Stalker"] = 20,
	["Tame Surf Crawler"] = 20,
	["Tame Strigid Screecher"] = 20,
	["Tame Snow Leopard"] = 20,
	["Tame Swoop"] = 20,
	["Tame Webwood Lurker"] = 20,
	["Bone Shards"] = 10,
	["Harden Skin"] = 10,
	["Toughen Hide"] = 10,
	["Identify Brood"] = 20,
	["Kiss of the Spider"] = 15,
	["Moss Hide"] = 10,
	["Fungal Bloom"] = 90,
	["Shared Bonds"] = 4,
	["Teleport to Azshara Tower"] = 3,
	["Teleport from Azshara Tower"] = 3,
	["Charge (TEST)"] = 1,
	["Shadow Charge"] = 6,
	["Shadowhorn Charge"] = 6,
	["Shadow Port"] = 10,
	["Curse of the Shadowhorn"] = 300,
	["Supercharge"] = 10,
	["Debilitating Charge"] = 8,
	["Debilitate"] = 15,
	["Curse of Mending"] = 180,
	["Curse of Impotence"] = 6,
	["Curse of Vengeance"] = 900,
	["Curse of the Fallen Magram"] = 900,
	["Curse of the Tribes"] = 1800,
	["Cursed Blade"] = 20,
	["Cursed Blood"] = 600,
	["Jin'Zil's Curse"] = 10,
	["Marduk's Curse"] = 5,
	["Argent Avenger"] = 10,
	["Call Reavers"] = 600,
	["Headmaster's Charge"] = 900,
	["Flameblade"] = 180,
	["Howling Blade"] = 30,
	["Dredge Sickness"] = 300,
	["Magenta Cap Sickness"] = 1200,
	["Critical Strike"] = 30,
	["Drink Disease Bottle"] = 10,
	["Overdrive"] = 6,
	["Slavedriver's Cane"] = 30,
	["Tendrils of Air"] = 2,
	["Drunken Pit Crew"] = 30,
	["Sentry Totem"] = 300,
	["Badge of the Swarmguard"] = 30,
	["Guardian Effect"] = 15,
	["Crystal Prison"] = 18,
	["Crystal Protection"] = 60,
	["Crystal Restore"] = 15,
	["Crystal Ward"] = 1800,
	["Crystal Yield"] = 120,
	["Crystalline Slumber"] = 15,
	["General's Warcry"] = 120,
	["Lord General's Sword"] = 30,
	["Eagle Claw"] = 15,
	["Tunneler Acid"] = 30,
	["Earthborer Acid"] = 30,
	["Deadly Acid"] = 10,
	["Corrosive Acid Spit"] = 10,
	["Acid Breath"] = 45,
	["Corrosive Acid Breath"] = 30,
	["Acid of Hakkar"] = 60,
	["Acid Volley"] = 25,
	["Acid of Hakkar"] = 60,
	["Acid Spray"] = 10,
	["Acid Slime"] = 30,
	["Molten Metal"] = 15,
	["Massive Tremor"] = 2,
	["Ground Tremor"] = 2,
	["Mind Tremor"] = 600,
	["Arcane Bubble"] = 8,
	["Arcane Burst"] = 8,
	["Arcane Focus"] = 30,
	["Arcane Infused"] = 10,
	["Arcane Might"] = 1800,
	["Arcane Potency"] = 20,
	["Furious Anger"] = 60,
	["Furious Howl"] = 15,
	["The Furious Storm"] = 10,
	["Locust Swarm"] = 6,
	["Ruthless Strength"] = 20,
	["Restless Strength"] = 20,
	["Strength of Arko'narin"] = 1800,
	["Strength of Isha Awak"] = 1800,
	["Rage"] = 15,
	["Ishamuhale's Rage"] = 1800,
	["Rage of Ages"] = 3600,
	["Rage of Thule"] = 120,
	["Pyroclast Barrage"] = 6,
	["Savage Rage"] = 4,
	["Unleashed Rage"] = 10,
	["Savagery"] = 8,
	["Savage Pummel"] = 5,
	["Savage Assault"] = 30,
	["Savage Assault II"] = 30,
	["Savage Assault III"] = 30,
	["Savage Assault IV"] = 30,
	["Savage Assault V"] = 30,
	["Lightheaded"] = 30,
	["Head Smash"] = 2,
	["Aquatic Miasma"] = 3600,
	["Charisma"] = 30,
	["Holy Sunder"] = 60,
	["Inferno Shell"] = 10,
	["Tough Shell"] = 12,
	["Inferno Effect"] = 2,
	["Inferno"] = 8,
	["Capture Infernal Spirit"] = 9,
	["Infatuation"] = 1800,
	["Hyper Coward"] = 10,
	["Cowardly Flight"] = 30,
	["Cowering Roar"] = 5,
	["Polymorph: Cow"] = 50,
	["Polymorph: Turtle"] = 50,
	["Polymorph: Pig"] = 50,
	["Polymorph: Sheep"] = 10,
	["Polymorph: Chicken"] = 10,
	["Greater Polymorph"] = 20,
	["Polymorph Backfire"] = 8,
	["Wild Polymorph"] = 20,
	["Capture Spirit"] = 9,
	["Capture Treant"] = 5,
	["Improved Blocking"] = 6,
	["Improved Shield Block"] = 2,
	["Lock Down"] = 10,
	["Warlock Channeling"] = 7,
	["Warlock Terror"] = 2,
	["Impact"] = 2,
	["Running Speed"] = 15,
	["Swiftness"] = 30,
	["Speed Slash"] = 6,
	["Gathering Speed"] = 180,
	["Magma Spit"] = 30,
	["Magma Shackles"] = 15,
	["Magma Splash"] = 30,
	["Magmakin Confuse"] = 1,
	["confused"] = 2,
	["Eye of Immol'thar"] = 4,
	["Eye Peck"] = 12,
	["Ryson's All Seeing Eye"] = 1800,
	["The Eye of Diminution"] = 20,
	["Ward of the Eye"] = 8,
	["Consuming Shadows"] = 15,
	["Fel Domination"] = 15,
	["Fel Stamina"] = 1800,
	["Capture Felhound Spirit"] = 9,
	["Dominion of Soul"] = 60,
	["Fel Curse Effect"] = 15,
	["Fel Energy"] = 1800,
	["Draw Spirit"] = 5,
	["Spirit Decay"] = 1200,
	["Spirit Shock"] = 30,
	["Spirit of Zandalar"] = 7200,
	["Spiritual Domination"] = 3600,
	["Mental Domination"] = 120,
	["Flame Wrath"] = 15,
	["Warrior's Wrath"] = 10,
	["Soul Siphon"] = 10,
	["Harvest Soul"] = 60,
	["Blood Siphon"] = 8,
	["Siphon Blessing"] = 30,
	["Siphon Soul"] = 10,
	["Extra-Dimensional Ghost Revealer"] = 600,
	["Bull Rush"] = 30,
	["Black Arrow"] = 30,
	["Argent Dawn"] = 10,
	["Frostmane Strength"] = 180,
	["Crash of Waves"] = 10,
	["Thunderfury"] = 12,
	["Thundercrack"] = 3,
	["Thunderbrew Lager"] = 300,
	["Thundershock"] = 5,
	["Cracking Stone"] = 180,
	["Entangle"] = 8,
	["Toast"] = 1800,
	["Haunted"] = 600,
	["Infected Spine"] = 300,
	["The Lion Horn"] = 30,
	["Enslave"] = 15,
	["Earthen Sigil"] = 10,
	["Attack"] = 15,
	["Attack Order"] = 10,
	["Battle Squawk"] = 240,
	["Frostbrand Attack"] = 8,
	["Mind Shatter"] = 3,
	["Surprise Attack"] = 2.5,
	["Shadow Fissure"] = 10,
	["Survival Instinct"] = 2,
	["Prismstone"] = 30,
	["Creature - Frog Form"] = 60,
	["Creature of Nightmare"] = 30,
	["Balnazzar Transform Stun"] = 5,
	["Cobrahn Serpent Form"] = 300,
	["Form of the Moonstalker"] = 300,
	["Cadaver Stun"] = 3,
	["Stun Bomb"] = 5,
	["Discombobulate"] = 12,
	["Dismounting Shot"] = 2,
	["Dismember"] = 10,
	["Disjunction"] = 300,
	["Dissolve Armor"] = 30,
	["Distracting Spit"] = 15,
	["Ectoplasmic Distiller"] = 3,
	["Thaumaturgy Channel"] = 5,
	["Spirit Heal Channel"] = 30,
	["Foul Chill"] = 120,
	["Chill Nova"] = 10,
	["Chilling Touch"] = 8,
	["Chill"] = 15,
	["Bone Smelt"] = 20,
	["Melt Ore"] = 20,
	["Melt Armor"] = 60,
	["Naralex's Nightmare"] = 15,
	["Wail of Nightlash"] = 15,
	["Wail of the Banshee"] = 12,
	["Twin Colossals Teleport"] = 3,
	["Toxic Saliva"] = 120,
	["Toxic Contagion"] = 60,
	["Terrifying Roar"] = 5,
	["Bellowing Roar"] = 3,
	["Echoing Roar"] = 20,
	["Glacial Roar"] = 3,
	["Battle Roar"] = 60,
	["Defensive Stance"] = 180,
	["Berserker Stance"] = 240,
	["Aura of Command"] = 30,
	["Aural Shock"] = 300,
	["Defiling Aura"] = 5,
	["Rhahk'Zor Slam"] = 3,
	["Sticky Tar"] = 4,
	["Muscle Tear"] = 5,
	["Geyser"] = 5,
	["Slap!"] = 3,
	["Widow's Embrace"] = 30,
	["Five Fat Finger Exploding Heart Technique"] = 30,
	["Purge"] = 2,
	["Purity"] = 2,
	["Happy Pet"] = 3,
	["Stormpike's Salvation"] = 120,
	["Fury of the Frostwolf"] = 120,
	["Lash of Submission"] = 18,
	["Narain!"] = 1800,
	["Brain Wash"] = 240,
	["Washta Pawne's Resolve"] = 1800,
	["Bruising Blow"] = 5,
	["Bruise"] = 10,
	["Splintered Obsidian"] = 3600,
	["Obsidian Armor"] = 6,
	["Raptor Punch"] = 300,
	["Siren's Song"] = 180,
	["Elune's Blessing"] = 3600,
	["Harm Prevention Belt"] = 600,
	["Speed of Owatanka"] = 1800,
	["Terrify"] = 4,
	["Fade Out"] = 2,
	["Reactive Fade"] = 4,
	["Blessing of Aman"] = 1800,
	["Wither Strike"] = 8,
	["Wither"] = 21,
	["Withering Heat"] = 900,
	["Fiend Fury"] = 10,
	["Mend Dragon"] = 20,
	["Hand Snap"] = 8,
	["Snap Kick"] = 2,
	["Fist of Ragnaros"] = 5,
	["Fist of Stone"] = 12,
	["Phasing"] = 4,
	["Spitelash"] = 20,
	["Invocation of the Wickerman"] = 7200,
	["Physical Protection"] = 10,
	["Serious Wound"] = 10,
	["Fanatic Blade"] = 10,
	["Tune Up"] = 20,
	["Lag"] = 10,
	["Mol'dar's Moxie"] = 7200,
	["Fengus' Ferocity"] = 7200,
	["Fengu's Ferocity"] = 7200,
	["Slip'kik's Savvy"] = 7200,
	["Jadefire"] = 8,
	["Silithid Pox"] = 1800,
	["Traces of Silithyst"] = 1800,
	["Barbed Sting"] = 300,
	["Spell Blasting"] = 10,
	["Stinging Trauma"] = 18,
	["Phase Shift"] = 6,
	
-- freeze, stun, sleep are not included
	
---- Darkmoon
	["Sayge's Dark Fortune of Agility"] = 7200,
	["Sayge's Dark Fortune of Armor"] = 7200,
	["Sayge's Dark Fortune of Damage"] = 7200,
	["Sayge's Dark Fortune of Intelligence"] = 7200,
	["Sayge's Dark Fortune of Resistance"] = 7200,
	["Sayge's Dark Fortune of Spirit"] = 7200,
	["Sayge's Dark Fortune of Stamina"] = 7200,
	["Sayge's Dark Fortune of Strength"] = 7200,
	
---- Scroll's
	["Armor"] = 1800,
	["Stamina"] = 1800,
	["Strength"] = 1800,
	["Spirit"] = 1800,
	["Agility"] = 1800,
	["Intellect"] = 1800,
	
	
---- AV buff's
	["Polished Armor"] = 1800,
	
---- Weapon buff/debuffs
	["Curse of Timmy"] = 60,
	["Gutgore Ripper"] = 30,
	["Brain Hacker"] = 30,
	["Brain Damage"] = 30,
	["Wound"] = 25,
	["Siphon Health"] = 15,
	["Sul'thraze"] = 15,
	["Bonereaver's Edge"] = 10,
	["Thunderfury"] = 12,
	["Destiny"] = 10,
	["Untamed Fury"] = 8,
	["Spell Vulnerability"] = 5,
	["Glimpse of Madness"] = 3,
	["Earthshaker"] = 3,
	["Felstriker"] = 3,
	
---- Elixir & Potions	
	["Invulnerability"] = 6, --Limited Invulnearbility Potion
	["Speed"] = 15,  --Swiftness Potion
	["Swim Speed"] = 20,  --Swim Speed Potion
	["Free Action"] = 30,  --Free Action Potion
	["Mighty Rage"] = 20, --Mighty Rage Potion
	["Restoration"] = 30, --Restorative Potion
	["Resistance"] = 180, --Magic Resistance Potion
	["Gift of Arthas"] = 180,
	["Invisibility"] = 18,
	["Living Free Action"] = 5,
	["Stealth Detection"] = 600,
	["Holy Protection"] = 3600,
	["Shadow Protection"] = 3600,
	["Nature Protection"] = 3600,
	["Frost Protection"] = 3600,
	["Fire Protection"] = 3600,
	["Shadow Oil"] = 1800,
	["Frost Oil"] = 1800,
	["Elixir of the Mongoose"] = 3600,
	["Elixir of the Giants"] = 3600,
	["Greater Arcane Elixir"] = 3600,
	["Arcane Elixir"] = 1800,
	["Elixir of Brute Force"] = 1800,
	["Elixir of Dodging"] = 1800,
	["Elixir of the Sages"] = 3600,
	["Detect Undead"] = 3600,
	["Greater Armor"] = 3600,
	["Shadow Power"] = 1800,
	["Noggenfogger Elixir"] = 600,
	["Elixir of Resistance"] = 1800,
	["Lesser Strength"] = 3600,
	["Lesser Armor"] = 3600,
	["Lesser Intellect"] = 3600,
	["Greater Intellect"] = 3600,
	["Lesser Agility"] = 3600,
	["Greater Agility"] = 3600,
	["Regeneration"] = 3600,
	["Greater Armor"] = 3600,
	["Health"] = 3600,
	["Health II"] = 3600,
	["Health III"] = 3600,
	["Water Breathing"] = 1800,
	["Greater Water Breathing"] = 3600,
	["Water Walking"] = 1800,
	["Frost Power"] = 1800,
	["Enlarge"] = 120,
	["Swim Speed"] = 20,
	["Stoneshield"] = 90,
	["Greater Stoneshield"] = 120,
	["Greater Dreamless Sleep"] = 12,
	["Dreamless Sleep"] = 12,
	["Dream Vision"] = 120,
	["Elixir of Giants"] = 3600,
	["Elixir of Demonslaying"] = 300,
	["Detect Demon"] = 3600,
	["Fire Power"] = 1800,
	["Greater Firepower"] = 1800,
	["Mighty Rage"] = 20,
	["Elixir of Brute Force"] = 3600,
	["Mana Regeneration"] = 3600,	
	["Winterfall Firewater"] = 1200,
	
---- Flasks
	["Petrification"] = 60,
	["Supreme Power"] = 7200,
	["Flask of the Titans"] = 7200,
	["Distilled Wisdom"] = 7200,
	["Chromatic Resistance"] = 7200,

---- Juju	
	["Juju Power"] = 1800,
	["Juju Might"] = 600,
	["Juju Guile"] = 1800,
	["Juju Flurry"] = 20,
	["Juju Escape"] = 10,
	["Juju Ember"] = 600,
	["Juju Chill"] = 600,
	
---- Zanza
	["Sheen of Zanza"] = 7200,
	["Spirit of Zanza"] = 7200,
	["Swiftness of Zanza"] = 7200,
	
---- Food
    ["Well Fed"] = 900,
	["Increased Stamina"] = 600,
	["Dragonbreath Chili"] = 600,
	["Increased Intellect"] = 600,
	["Infallible Mind"] = 3600,
	["Increased Agility"] = 600,
	["Increased Spirit"] = 600,
	["Alterac Spring Water"] = 600,
	["Dark Desire"] = 3600,
	["Strike of the Scorpok"] = 3600,
	["Very Berry Cream"] = 3600,
	["Buttermilk Delight"] = 3600,
	["Sweet Surprise"] = 3600,
	["Stormstout"] = 300,
	["Rumsey Rum Light"] = 900,
	["Rumsey Rum Dark"] = 900,
	["Rumsey Rum Black Label"] = 900,
	["Rumsey Rum"] = 900,
	["Gordok Green Grog"] = 900,
	["Kreeg's Stout Beatdown"] = 900,
	["Food"] = 30,
	["Graccu's Mince Meat Fruitcake"] = 20,
	["Drink"] = 30,
	
---- Deviate Random Buff/Debuffs
	["Party Time"] = 120,
	["Sleepy"] = 30,
	["Healthy Spirit"] = 1800,
	["Yaaarrr"] = 3600,
	["Flip Out"] = 3600,
	
---- Event
	["Hallow's End Candy"] = 1200,
	["Hallow's End Fright"] = 6,
	["Scarlet Illusion"] = 900,
	["Furbolg Form"] = 180,
	["Gordok Ogre Suit"] = 600,
	["Dire Brew"] = 3600,
	["Greater Mark of the Dawn"] = 3600,
	["Lesser Mark of the Dawn"] = 3600,
	["Mark of the Dawn"] = 3600,
	
----- Racial Traits
	["Will of the Forsaken"] = 5, -- Will of the Forsaken
	["Cannibalize"] = 10,
	["Perception"] = 20,
	["Stoneform"] = 8,
	["Blood Fury"] = 25, -- can only be tracked correctly on Kronos, other servers such as Feenix, Nostalrious do not fix chat or log issues.
	["War Stomp"] = 2, -- change the value 2 to 5 as healer to get the boss/npc stun timer instead of tauren tank timer.
	["Berserking"] = 10,
	
---- Racial spells
	["Shadowguard"] = 600,
	["Touch of Weakness"] = 120,
	["Hex of Weakness"] = 120,
	["Starshards"] = 6, -- Starshards
	["Feedback"] = 15,
	["Elune's Grace"] = 15, -- Elune's Grace
	["Devouring Plague"] = 24, -- Devouring Plague
	["Fear Ward"] = 180, -- Fear Ward

------ Classes
	-- Warrior	
	["Thunderclap"] = 10,
	["Demoralizing Shout"] = 30,
	["Battle Shout"] = 180, -- Battle shout - with talent
	["Death Wish"] = 30, -- Death Wish
	["Bloodthirst"] = 8,
	["Bloodrage"] = 10,
	["Thunder Clap"] = 30,
	["Last Stand"] = 20,
	["Enrage"] = 12,
	["Sunder Armor"] = 30, -- Sunder Armor
	["Berserker Rage"] = 10, -- Berserker Rage
	["Shield Wall"] = 10,
	["Blood Craze"] = 6,
	-- Warlock
	["Soulstone Ressurection"] = 900, --Soulstone
	["Enslave Demon"] = 300,
	["Curse of the Elements"] = 300,
	["Demon Skin"] = 1800,
	["Demon Armor"] = 1800,
	["Demonic Safricice"] = 1800,
	["Amplify Curse"] = 30,
	["Shadow Ward"] = 30,
	["Massive Destruction"] = 20,
	["Drain Mana"] = 5,
	["Drain Life"] = 5,
	["Drain Soul"] = 15,
	["Hellfire"] = 15,
	["Unending Breath"] = 600,
	["Detect Greater Invisibility"] = 600,
	["Detect Lesser Invisibility"] = 600,
	["Lesser Invisibility"] = 600,
	["Detect Invisibility"] = 600,
	["Health Funnel"] = 10,
	["Shadow Trance"] = 10,
	["Blessing of the Black Book"] = 30,
	["Spellstone"] = 60,
	["Major Spellstone"] = 60,
	["Greater Spellstone"] = 60,
	-- Pet
	["Spell Lock"] = 3,
	["Sacrifice"] = 30,
	["Tainted Blood"] = 60,
	["Fire Shield"] = 180,
	["Consume Shadows"] = 10,
	["Seduction"] = 15,
	-- Paladin
	["Vindication"] = 10,
	["Redoubt"] = 10,
	["Divine Protection"] = 6,
	["Forbearance"] = 60, -- Divine Shield
	["Divine Shield"] = 12, -- Divine Shield
	["Lay on Hands"] = 120, -- improved lay on hands
	["Righteous Fury"] = 1800,
	["Greater Blessing of Salvation"] = 900,
	["Greater Blessing of Kings"] = 900,
	["Greater Blessing of Sanctuary"] = 900,
	["Greater Blessing of Light"] = 900,
	["Greater Blessing of Wisdom"] = 900,
	["Greater Blessing of Might"] = 900,
	["Blessing of Sanctuary"] = 300,
	["Blessing of Light"] = 300,
	["Blessing of Kings"] = 300,
	["Blessing of Might"] = 300,
	["Blessing of Salvation"] = 300,
	["Blessing of Wisdom"] = 300,
	["Blessing of Freedom"] = 14, -- Blessing of Freedom
	["Blessing of Sacrifice"] = 30, -- Blessing of Sacrifice
	["Blessing of Protection"] = 10, -- Blessing of Protection
	["Blessing of Freedom"] = 10,
	["Judgement of Light"] = 10,
	["Judgement of the Crusader"] = 10,
	["Seal of the Crusader"] = 10,
	["Seal of Justice"] = 10,
	["Seal of Righteousness"] = 30,
	["Seal of Command"] = 30,
	["Seal of Wisdom"] = 30,
	["Judgement of the Wisdom"] = 10,
	["Judgement of the Crusader"] = 10,
	
	-- Priest
	["Mind Control"] = 60,
	["Inspiration"] = 15,
	["Spirit Tap"] = 15,
	["Vampiric Embrace"] = 60,
	["Blessed Recovery"] = 6,
	["Focused Casting"] = 6,
	["Abolish Disease"] = 20,
	["Power Word: Shield"] = 30, -- Power Word: Shield
	["Shackle Undead"] = 50,
	["Weakened Soul"] = 15, -- Weakened Soul
	["Renew"] = 15,
	["Holy Fire"] = 10,
	["Fade"] = 10,
	["Holy Fire"] = 10,
	["Power Word: Fortitude"] = 1800,
	["Prayer of Fortitude"] = 3600,
	["Divine Spirit"] = 1800,
	["Prayer of Spirit"] = 3600,
	["Shadow Protection"] = 600,
	["Inner Fire"] = 600,
	["Levitate"] = 120,
	["Prayer of Shadow Protection"] = 1200,
	["Power Infusion"] = 15, -- Power Infusion
	["Shadow Word: Pain"] = 18, -- Shadow Word: Pain
	["Mind Soothe"] = 15,
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
	["Evocation"] = 8,
	["Frost Nova"] = 8,
	["Blast Wave"] = 6,
	["Detect Magic"] = 120,
	["Mana Shield"] = 60,
	["Slow Fall"] = 30,
	["Ice Block"] = 10,
	["Ice Barrier"] = 60,
	["Ignite"] = 4,
	["Arcane Power"] = 15,
	["Presence of Mind"] = 10,
	["Blink"] = 1,
	-- Druid
	["Thorns"] = 600,
	["Hurricane"] = 10,
	["Bash"] = 4,
	["Rake"] = 9,
	["Tranquility"] = 10,
	["Innervate"] = 20,
	["Nature's Grasp"] = 45,
	["Demoralizing Roar"] = 30,
	["Regrowth"] = 21, -- Regrowth
	["Rejuvenation"] = 12, -- Rejuvenation
	["Faerie Fire"] = 40, -- Faerie Fire
	["Faerie Fire (Feral)"] = 40, -- Faerie Fire (Feral)
	["Barkskin"] = 15, -- Barkskin
	["Soothe Animal"] = 15,
	["Abolish Poison"] = 8, -- Abolish Poison
	["Mark of the Wild"] = 1800,
	["Gift of the Wild"] = 3600,
	["Omen of Clarity"] = 600,
	["Clearcasting"] = 15,
	--Shaman
	["Elemental Devastation"] = 10,
	["Healing Way"] = 15,
	["Flurry"] = 15,
	["Ancestral Fortitude"] = 15,
	["Nature's Swiftness"] = 10,
	["Stormstrike"] = 12,
	["Lightning Shield"] = 600,
	--Totem
	["Earthbind Totem Passive"] = 45,
	
	-- Hunter
	["Deterrence"] = 10,
	["Trueshot Aura"] = 1800,
	["Eagle Eye"] = 60,
	["Bestial Wrath"] = 18, -- Bestial Wrath
	["Viper Sting"] = 8, -- Viper Sting
	["Frost Trap Aura"] = 30, -- Frost Trap Aura
	["Frost Trap"] = 30, -- Frost Trap
	["Feign Death"] = 360,
	["Tame Beast"] = 20,
	["Quick Shots"] = 12,
	["Rapid Fire"] = 15,
	["Scare Beast"] = 20,
	--Pet
	["Screech"] = 4,
	["Furious Howl"] = 10,
	["Dive"] = 15,
	["Dash"] = 15,
	["Scorpid Sting"] = 10,
	["Shell Shield"] = 12,
	["Intimidation"] = 3,
	["Feed Pet Effect"] = 20,
	
	-- Rogue
	["Remorseless Attacks"] = 20,
	["Blade Flurry"] = 15,
	["Ghostly Strike"] = 7,
	["Hemorrhage"] = 15,
	["Vanish"] = 10, -- Improved Vanish
	["Sprint"] = 15, -- Sprint
	["Wound Poison"] = 15, -- Wound Poison
	["Evasion"] = 15, -- Evasion
	["Adrenaline Rush"] = 15, -- Adrenaline Rush
	["Cheap Shot"] = 4,
	["Kidney Shot"] = 6, -- would need combopoint check
	["Gouge"] = 5.5, -- needs talent check
	["Blind"] = 10,

-------Dungeon Debuffs

	--Shadowfang Keep
	["Soul Drain"] = 10,
	["Anti-Magic Shield"] = 10,
	["Haunting Spirits"] = 10,
	["Fel Stomp"] = 3,
	["Arugal's Curse"] = 10,
	
	--Wailing Caverns
	["Serpent Form"] = 10,
	["Druid's Slumber"] = 15,
	
	--Deadmines
	["Smite Stomp"] = 10,
	
	--Gnomeregan
	["Corrosive Ooze"] = 60,
	["Radiation Poisoning"] = 25,
	
	--Stratholme
	["Possess"] = 120,
	["Banshee Curse"] = 12,
	["Unrelenting Anguish"] = 5,
	["Enchanting Lullaby"] = 10,
	["Ground Smash"] = 3,
	["Head Crack"] = 20,
	["Burning Winds"] = 8,
	["Domination"] = 15,
	["Crusader's Hammer"] = 4,
	["Encasing Webs"] = 6,
	["Pierce Armor"] = 20,
	["Ice Tomb"] = 10,
	["Furious Anger"] = 60,
	["Knockout"] = 6,
	["Shadow Barrier"] = 600,
	["Black Rot"] = 1800,
	
	--Blackrock Depths
	["Ground Tremor"] = 2,
	["Hand of Thaurissan"] = 5,
	["Backhand"] = 10,
	["Avatar of Flame"] = 10,
	["Recklessness"] = 15,
	["Curse of the Elemental Lord"] = 15,
	["Drunken Rage"] = 15,
	["Curse of Blood"] = 20,
	["Magma Splash"] = 30,
	["Seal of Reckoning"] = 30,
	["Burning Spirit"] = 180,
			
	--Blackrock Spire (lower)
	["Slow"] = 10,
	
-------Raid Debuffs
	-- Hakkar
	["Blood Siphon"] = 8,
	-- Molten Core
	["Living Bomb"] = 8,
	["Shazzrah's Curse"] = 300,
	-- Blackwing Lair
	---- Trash
	["Mark of Detonation"] = 30,
	---- Razogore the Untamed
	["Calm Dragonkin"] = 30,
	["Conflagration"] = 10,
	--["War Stomp"] = 5,
	---- Vaelastrasz, the Corrupted
	["Burning Adrenaline"] = 20,
	["Essence of the Red"] = 180,
	---- Three Dragons
	["Flame Buffet"] = 20,
	["Shadow Flame"] = 10,
	["Shadow of Ebonroc"] = 8,
	---- Chromaggus
	["Brood Affliction: Black"] = 600,
	["Brood Affliction: Blue"] = 600,
	["Brood Affliction: Bronze"] = 5,
	["Brood Affliction: Green"] = 600,
	["Brood Affliction: Red"] = 600,
	["Corrosive Acid"] = 300,
	["Frost Burn"] = 15,
	["Ignite Flesh"] = 60,
	["Time Lapse"] = 8,
	---- Nefarian
	["Corrupted Healing"] = 30,
	["Paralyze"] = 30,
	["Siphon Blessing"] = 30,
	["Veil of Shadow"] = 6,
	["Tail Lash"] = 2,
	["Wild Magic"] = 30,
	
	-- Temple of Ahn'Qiraj
	---- Skeram
	["True Fulfillment"] = 20,
	---- Bug Trio
	["Knockdown"] = 2,
	["Toxic Volley"] = 15,
	---- Battleguard Sartura
	["Sundering Cleave"] = 30,
	---- Fankriss
	["Mortal Wound"] = 15,
	---- Viscidus
	["Poison Bolt Volley"] = 10,
	---- Princess Huhuran
	["Acid Spit"] = 30,
	["Noxious Poison"] = 8,
	["Wyvern Sting "] = 12,
	---- The Twin Emperors
	["Unbalancing Strike"] = 6,
	---- Ouro
	["Sand Blast"] = 5,
	---- C'Thun
	["Digestive Acid"] = 5,
	["Ground Tremor"] = 2,
	["Mind Flay"] = 10,
	["Whisperings of C'Thun"] = 60,
	
	-- Naxxramas
	----- Anub'Rekhan
	["Locust Swarm"] = 6,
	----- Faerlina
	["Poison Bolt Volley"] = 10,
	----- Maexxna
	["Necrotic Poison"] = 30,
	["Web Spray"] = 10,
	----- Noth the Plaguebringer
	["Cripple"] = 15,
	["Curse of the Plaguebringer"] = 10,
	["Wrath of the Plaguebringer"] = 10,
	---- Loatheb
	["Decrepit Fever"] = 21,
	["Inevitable Doom"] = 10,
	---- Grobbulus
	["Mutating Injection"] = 10,
	["Slime Stream"] = 3,
	---- Gluth
	["Mortal Wound"] = 15,
	["Positive Charge"] = 60,
	["Negative Charge"] = 60,
	---- Gothik
	["Harvest Soul"] = 60,
	---- The Four Horsemen
	["Mark of Korth'azz"] = 75,
	["Mark of Blaumeux"] = 75,
	["Mark of Mograine"] = 75,
	["Righteous Fire"] = 8,
	["Mark of Zeliek"] = 75,
	---- Sapphiron
	["Frost Aura"] = 5,
	["Life Drain"] = 12,
	---- Kel'Thuzad
	["Chains of Kel'Thuzad"] = 20,
	["Detonate Mana"] = 5,
	["Frost Blast"] = 5,
	
};
local function log(msg) DEFAULT_CHAT_FRAME:AddMessage(msg) end -- alias for convenience

local function firstToUpper(str)
	if (str~=nil) then
		return (string.gsub(str, "^%l", string.upper));
	else
		return nil;
	end
end

EnemyBuffTimers = CreateFrame("Frame", nil, UIParent, "ActionButtonTemplate")
EnemyBuffTimers.TimeSinceLastUpdate = 0
EnemyBuffTimers.lastTarget = ""
EnemyBuffTimers.OnEvent = function() -- functions created in "object:method"-style have an implicit first parameter of "this", which points to object || in 1.12 parsing arguments as ... doesn't work
	this[event](EnemyBuffTimers, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10) -- route event parameters to EnemyBuffTimers:event methods
end

function EnemyBuffTimers:OnUpdate(elapsed)
	if not elapsed then
		elapsed = 1/GetFramerate()
	end	
	EnemyBuffTimers.TimeSinceLastUpdate = EnemyBuffTimers.TimeSinceLastUpdate + elapsed
	if EnemyBuffTimers.TimeSinceLastUpdate >= 1 then
		EnemyBuffTimers.TimeSinceLastUpdate = 0
		this = EnemyBuffTimers
		EnemyBuffTimers:PLAYER_TARGET_CHANGED()
	end
end

EnemyBuffTimers:SetScript("OnEvent", EnemyBuffTimers.OnEvent)
EnemyBuffTimers:SetScript("OnUpdate", EnemyBuffTimers.OnUpdate)
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
		
		if UnitName("target") == destName then
			this:PLAYER_TARGET_CHANGED()
		end
	end

end

function EnemyBuffTimers:UpdateFrames(destName, spellName)
	if this.guids[destName] and this.guids[destName][spellName] and this.abilities[spellName] then
		CooldownFrame_SetTimer(this.guids[destName][spellName], GetTime(), this.abilities[spellName], 1)
		if destName ~= UnitName("target") then
			this.guids[destName][spellName]:SetHeight(36)
			this.guids[destName][spellName]:SetWidth(36)
			local scale = TargetFrameDebuff1:GetHeight()/36
			this.guids[destName][spellName]:SetScale(scale)
			this.guids[destName][spellName].parent:SetAllPoints(region)
			this.guids[destName][spellName].parent:Show()
			this.guids[destName][spellName].onFrame = unitID
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
	this:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE")
	this:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	
	-- for healers || buff/debuff || hots/dots
	this:RegisterEvent("CHAT_MSG_SPELL_FRIENDLYPLAYER_BUFF")
	this:RegisterEvent("CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE")
	this:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_BUFFS")
	this:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE")
	
	this:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_BUFFS")
	this:RegisterEvent("CHAT_MSG_SPELL_PARTY_BUFF")
	this:RegisterEvent("CHAT_MSG_SPELL_PARTY_DAMAGE")
	this:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE")
	
	EnemyToolTip:ClearLines()
end

function EnemyBuffTimers:SPELLCAST_START()
	--log(arg1)
	--log("cast start")
	EnemyBuffTimers:PLAYER_TARGET_CHANGED()
end
function EnemyBuffTimers:SPELLCAST_STOP()
	--log(arg1)
	--log("cast stop")
	EnemyBuffTimers:PLAYER_TARGET_CHANGED()
end

-- CastSpellByName hook to keep timers updated
local oCastSpellByName = CastSpellByName
function CastSpellByName(name)
	-- check for GCD
	local gcd1 = GetActionCooldown(1)
	local gcd2 = GetActionCooldown(2)
	if gcd1 == gcd2 and gcd1 ~= 0 then return end
	oCastSpellByName(name)
	if string.gfind(name, "(Rank") ~= nil then
		name = string.sub(name, 0, string.len(name)-8)
	end
	EnemyBuffTimers:CreateFrames(UnitName("target"), name)
end

-- UseAction hook to keep timers updated
-- something about this hook is broken, causes Lua errors but keeps functionality perfectly 
--[[local oUseAction = UseAction
nUseAction = function(slot, checkCursor, onSelf)
	--local test = getglobal("ActionButton"..slot)
	if not (GetActionCooldown(slot) > 0) then
		EnemyToolTip:ClearLines()
		EnemyToolTip:SetAction(slot)
		local spellName = EnemyToolTipTextLeft1:GetText()
		if onSelf or UnitName("target") == nil then
			EnemyBuffTimers:CreateFrames(UnitName("player"), spellName, EnemyBuffTimers)
		else
			EnemyBuffTimers:CreateFrames(UnitName("target"), spellName, EnemyBuffTimers)
		end
		
		oUseAction(slot, checkCursor, onSelf)
	end
	
end
UseAction = nUseAction]]

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
	this:CreateFrames(destName, spellName)
	if UnitName("target") == destName then
		this:PLAYER_TARGET_CHANGED()
	end
end

function EnemyBuffTimers:CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF()
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
	this:CreateFrames(destName, spellName)
	if UnitName("target") == destName then
		this:PLAYER_TARGET_CHANGED()
	end
end


function EnemyBuffTimers:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS()
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

function EnemyBuffTimers:CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE()
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
						this.guids[destName][name]:SetHeight(36)
						this.guids[destName][name]:SetWidth(36)
						local scale = TargetFrameBuff1:GetHeight()/36
						this.guids[destName][name]:SetScale(scale)
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
						this.guids[destName][name]:SetHeight(36)
						this.guids[destName][name]:SetWidth(36)
						local scale = TargetFrameDebuff1:GetHeight()/36
						this.guids[destName][name]:SetScale(scale)
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
			if this.lastTarget ~= UnitName("target") then
				va.parent:ClearAllPoints()
				va.parent:Hide()
				va.onFrame = "none"
			end
		end
	end
	if UnitName("target") then this.lastTarget = UnitName("target") end
	this:UNIT_AURA("target")
end
