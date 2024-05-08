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
local data = AtlasLoot.ItemDB:Add(addonname, 4, AtlasLoot.CATA_VERSION_NUM)

local AL = AtlasLoot.Locales
local ALIL = AtlasLoot.IngameLocales

local NORMAL_DIFF = data:AddDifficulty("NORMAL", nil, nil, nil, true)
local HEROIC_DIFF = data:AddDifficulty("HEROIC", nil, nil, nil, true)
local ALPHA_DIFF = data:AddDifficulty(AL["Titan Rune Alpha"], "TRA", nil, nil, true)
local BETA_DIFF = data:AddDifficulty(AL["Titan Rune Beta"], "TRB", nil, nil, true)

local NORMAL_ITTYPE = data:AddItemTableType("Item", "Item")
local SET_ITTYPE = data:AddItemTableType("Set", "Item")
local AC_ITTYPE = data:AddItemTableType("Achievement", "Item")

local QUEST_EXTRA_ITTYPE = data:AddExtraItemTableType("Quest")
local PRICE_EXTRA_ITTYPE = data:AddExtraItemTableType("Price")

local DUNGEON_CONTENT = data:AddContentType(AL["Dungeons"], ATLASLOOT_DUNGEON_COLOR)
local RAID_CONTENT = data:AddContentType(AL["Raids"], ATLASLOOT_RAID20_COLOR)
local RAID10_CONTENT = data:AddContentType(AL["10 Raids"], ATLASLOOT_RAID20_COLOR)
local RAID25_CONTENT = data:AddContentType(AL["25 Raids"], ATLASLOOT_RAID40_COLOR)

local ATLAS_MODULE_NAME = "Atlas_Cataclysm"

-- extra
local CLASS_NAME = AtlasLoot:GetColoredClassNames()

-- name formats
local NAME_COLOR, NAME_COLOR_BOSS = "|cffC0C0C0", "|cffC0C0C0"
local NAME_CATACLYSM = NAME_COLOR..AL["Cataclysm"]..":|r %s" -- Blackrock Mountain
local NAME_BLACKROCK = NAME_COLOR..AL["Blackrock"]..":|r %s" -- Blackrock Mountain
local NAME_CAVERNS_OF_TIME = NAME_COLOR..AL["CoT"]..":|r %s" -- Caverns of Time
local NAME_SKYWALL = NAME_COLOR..AL["Skywall"]..":|r %s" -- Skywall
local NAME_ULDUM = NAME_COLOR..AL["Uldum"]..":|r %s" -- Uldum

-- colors
local BLUE = "|cff6666ff%s|r"
--local GREY = "|cff999999%s|r"
local GREEN = "|cff66cc33%s|r"
local _RED = "|cffcc6666%s|r"
local PURPLE = "|cff9900ff%s|r"
--local WHIT = "|cffffffff%s|r"

-- format
local BONUS_LOOT_SPLIT = "%s - %s"

local T11_SET = {
	name = format(AL["Tier %s Sets"], "11"),
	ExtraList = true,
	TableType = SET_ITTYPE,
	IgnoreAsSource = true,
    [NORMAL_DIFF] = {
		{ 1,    3250884 }, -- Warlock
		{ 3,    3250885 }, -- Priest / Heal
        { 4,    3250886 }, -- Priest / Shadow
        { 6,    3250890 }, -- Rogue
		{ 8,    3250891 }, -- Hunter
		{ 10,   3250896 }, -- Warrior / Prot
        { 11,   3250895 }, -- Warrior / DD
        { 13,   3250898 }, -- Deathknight / Prot
        { 14,   3250897 }, -- Deathknight / DD
		{ 16,   3250883 }, -- Mage
		{ 18,   3250887 }, -- Druid / Heal
        { 19,   3250888 }, -- Druid / Owl
        { 20,   3250889 }, -- Druid / Feral
        { 22,   3250892 }, -- Shaman / Heal
        { 23,   3250893 }, -- Shaman / Ele
        { 24,   3250894 }, -- Shaman / Enh
		{ 26,   3250899 }, -- Paladin / Heal
        { 27,   3250901 }, -- Paladin / Prot
        { 28,   3250900 }, -- Paladin / DD
	},
    [HEROIC_DIFF] = {
		{ 1,    3251884 }, -- Warlock
		{ 3,    3251885 }, -- Priest / Heal
        { 4,    3251886 }, -- Priest / Shadow
        { 6,    3251890 }, -- Rogue
		{ 8,    3251891 }, -- Hunter
		{ 10,   3251896 }, -- Warrior / Prot
        { 11,   3251895 }, -- Warrior / DD
        { 13,   3251898 }, -- Deathknight / Prot
        { 14,   3251897 }, -- Deathknight / DD
		{ 16,   3251883 }, -- Mage
		{ 18,   3251887 }, -- Druid / Heal
        { 19,   3251888 }, -- Druid / Owl
        { 20,   3251889 }, -- Druid / Feral
        { 22,   3251892 }, -- Shaman / Heal
        { 23,   3251893 }, -- Shaman / Ele
        { 24,   3251894 }, -- Shaman / Enh
		{ 26,   3251899 }, -- Paladin / Heal
        { 27,   3251901 }, -- Paladin / Prot
        { 28,   3251900 }, -- Paladin / DD
	},
}

data["Deadmines"] = {
    nameFormat = NAME_CATACLYSM,
	MapID = 1581,
	InstanceID = 36,
    ContentType = DUNGEON_CONTENT,
	AtlasModule = ATLAS_MODULE_NAME,
	items = {
        { -- AhnkahetNadox / 15
            name = AL["Glubtok"],
            npcID = 29309,
            EncounterJournalID = 89,
            Level = 75,
            -- DisplayIDs = {{0}},
            AtlasMapBossID = 1,
            [NORMAL_DIFF] = {
                { 1, 35607 }, -- Buzzer Blade
                { 2, 35608 }, -- Miner's Cape
                { 3, 35606 }, -- Gold-Flecked Gloves
            },
            [HEROIC_DIFF] = {
                { 1, 45624 }, -- Buzzer Blade
                { 3, 37594 }, -- Missing Diplomat's Pauldrons
                { 4, 37593 }, -- Shadow of the Past
            },
            [ALPHA_DIFF] = {
            },
            [BETA_DIFF] = {
            }
        },
	}
}