-----------------------------------------------------------------------
-- Upvalued Lua API.
-----------------------------------------------------------------------
local _G = getfenv(0)
local select = _G.select
local string = _G.string
local format = string.format

-- WoW

-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local addonname = ...
local AtlasLoot = _G.AtlasLoot
if AtlasLoot:GameVersion_LT(AtlasLoot.CATA_VERSION_NUM) then return end
local data = AtlasLoot.ItemDB:Add(addonname, 1, AtlasLoot.CATA_VERSION_NUM)

local AL = AtlasLoot.Locales
local ALIL = AtlasLoot.IngameLocales

local NORMAL_DIFF = data:AddDifficulty(AL["Normal"], "n", 1, nil, true)
local ALLIANCE_DIFF
local HORDE_DIFF
local LOAD_DIFF
if UnitFactionGroup("player") == "Horde" then
	HORDE_DIFF = data:AddDifficulty(FACTION_HORDE, "horde", nil, 1)
	ALLIANCE_DIFF = data:AddDifficulty(FACTION_ALLIANCE, "alliance", nil, 1)
	LOAD_DIFF = HORDE_DIFF
else
	ALLIANCE_DIFF = data:AddDifficulty(FACTION_ALLIANCE, "alliance", nil, 1)
	HORDE_DIFF = data:AddDifficulty(FACTION_HORDE, "horde", nil, 1)
	LOAD_DIFF = ALLIANCE_DIFF
end

local NORMAL_ITTYPE = data:AddItemTableType("Item", "Item")

local QUEST_EXTRA_ITTYPE = data:AddExtraItemTableType("Quest")
local PRICE_EXTRA_ITTYPE = data:AddExtraItemTableType("Price")
local SET_EXTRA_ITTYPE = data:AddExtraItemTableType("Set")

local FACTIONS_CONTENT = data:AddContentType(AL["Factions"], ATLASLOOT_FACTION_COLOR)
local FACTIONS2_CONTENT = data:AddContentType(AL["Secondary factions"], {0.1, 0.3, 0.1, 1})

local FACTIONS_HORDE_CONTENT, FACTIONS_ALLI_CONTENT
if UnitFactionGroup("player") == "Horde" then
    FACTIONS_HORDE_CONTENT = data:AddContentType(FACTION_HORDE, ATLASLOOT_HORDE_COLOR)
    FACTIONS_ALLI_CONTENT = data:AddContentType(FACTION_ALLIANCE, ATLASLOOT_ALLIANCE_COLOR)
else
    FACTIONS_ALLI_CONTENT = data:AddContentType(FACTION_ALLIANCE, ATLASLOOT_ALLIANCE_COLOR)
    FACTIONS_HORDE_CONTENT = data:AddContentType(FACTION_HORDE, ATLASLOOT_HORDE_COLOR)
end

--[[
0 - Unknown
1 - Hated
2 - Hostile
3 - Unfriendly
4 - Neutral
5 - Friendly
6 - Honored
7 - Revered
8 - Exalted
]]--

data["GuardiansHyjal"] = {
	FactionID = 1158,
	ContentType = FACTIONS_CONTENT,
	LoadDifficulty = LOAD_DIFF,
	items = {
		{ -- Exalted 8
			name = ALIL["Exalted"],
			[NORMAL_DIFF] = {
				{ 1, "f1158rep8" },
				{ 2, 62386 },	-- Cord of the Raven Queen
				{ 3, 62385 },	-- Treads of Malorne
				{ 4, 62384 },	-- Belt of the Ferocious Wolf
				{ 5, 62383 },	-- Wrap of the Great Turtle
			},
		},
		{ -- Revered 7
			name = ALIL["Revered"],
			[NORMAL_DIFF] = {
				{ 1, "f1158rep7" },
				{ 2, 62378 },	-- Acorn of the Daughter Tree
				{ 3, 62382 },	-- Waywatcher's Boots
				{ 4, 62381 },	-- Aessina-Blessed Gloves
				{ 5, 62380 },	-- Wilderness Legguards
				{ 17, 62367 },	-- Arcanum of Hyjal
			},
		},
		{ -- Honored 6
			name = ALIL["Honored"],
			[NORMAL_DIFF] = {
				{ 1, "f1158rep6" },
				{ 2, 62377 },	-- Cloak of the Dryads
				{ 3, 62375 },	-- Galrond's Band
				{ 4, 62376 },	-- Mountain's Mouth
				{ 5, 62374 },	-- Sly Fox Jerkin
			},
		},
		{ -- Friendly 5
			name = ALIL["Friendly"],
			[NORMAL_DIFF] = {
				{ 1, "f1158rep5" },
				{ 2, 65906 },	-- Tabard of the Guardians of Hyjal
			},
		},
	},
}

data["DragonmawClan"] = {
	FactionID = 1172,
	ContentType = FACTIONS_HORDE_CONTENT,
	LoadDifficulty = LOAD_DIFF,
	items = {
		{ -- Exalted 8
			name = ALIL["Exalted"],
			[NORMAL_DIFF] = {
				{ 1, "f1158rep8" },
				{ 2, 62416 },	-- 
				{ 3, 62418 },	-- 
				{ 4, 62417 },	-- 
				{ 5, 62420 },	-- 
			},
		},
		{ -- Revered 7
			name = ALIL["Revered"],
			[NORMAL_DIFF] = {
				{ 1, "f1158rep7" },
				{ 2, 62415 },	-- 
				{ 3, 62408 },	-- 
				{ 4, 62409 },	-- 
				{ 5, 62410 },	-- 
				{ 17, 62368 },	-- 
			},
		},
		{ -- Honored 6
			name = ALIL["Honored"],
			[NORMAL_DIFF] = {
				{ 1, "f1158rep6" },
				{ 2, 62406 },	-- 
				{ 3, 62404 },	-- 
				{ 4, 62405 },	-- 
				{ 5, 62407 },	-- 
			},
		},
		{ -- Friendly 5
			name = ALIL["Friendly"],
			[NORMAL_DIFF] = {
				{ 1, "f1158rep5" },
				{ 2, 65909 },	-- Tabard
			},
		},
	},
}

data["WildhammerClan"] = {
	FactionID = 1174,
	ContentType = FACTIONS_ALLI_CONTENT,
	LoadDifficulty = LOAD_DIFF,
	items = {
		{ -- Exalted 8
			name = ALIL["Exalted"],
			[NORMAL_DIFF] = {
				{ 1, "f1158rep8" },
				{ 2, 62416 },	-- 
				{ 3, 62418 },	-- 
				{ 4, 62417 },	-- 
				{ 5, 62420 },	-- 
			},
		},
		{ -- Revered 7
			name = ALIL["Revered"],
			[NORMAL_DIFF] = {
				{ 1, "f1158rep7" },
				{ 2, 62415 },	-- 
				{ 3, 62408 },	-- 
				{ 4, 62409 },	-- 
				{ 5, 62410 },	-- 
				{ 17, 62422 },	-- 
			},
		},
		{ -- Honored 6
			name = ALIL["Honored"],
			[NORMAL_DIFF] = {
				{ 1, "f1158rep6" },
				{ 2, 62406 },	-- 
				{ 3, 62404 },	-- 
				{ 4, 62405 },	-- 
				{ 5, 62407 },	-- 
			},
		},
		{ -- Friendly 5
			name = ALIL["Friendly"],
			[NORMAL_DIFF] = {
				{ 1, "f1158rep5" },
				{ 2, 65908 },	-- Tabard
			},
		},
	},
}