--
--
-- Created by IntelliJ IDEA.
-- User: Silvia
-- Date: 06/09/2021
-- Time: 20:17
-- To change this template use File | Settings | File Templates.
-- Originally created by Honey for Azerothcore
-- requires ElunaLua module


-- This module debuffs players when they enter a map or login into a map specified in Config_Maps.

------------------------------------------------------------------------------------------------
-- ADMIN GUIDE:  -  compile the core with ElunaLua module
--               -  adjust config in this file
--               -  add this script to ../lua_scripts/
------------------------------------------------------------------------------------------------
-- GM GUIDE:     -  nothing to do. Just watch them suffer.
------------------------------------------------------------------------------------------------
local Config = {}
local ConfigRaid = {}
local ConfigDungeon = {}
local ConfigPvP = {}
local Config_RaidMaps = {}         -- maps where to debuff players always for PvE
local Config_DungeonMaps = {}      -- maps where to debuff players when no rdf
local Config_PvPMaps = {}          -- maps where to debuff players always for PvP
local Config_NoWorldBuffMaps = {}  -- maps where to remove world buffs
local Config_WorldBuff = {}        -- spell IDs of world buffs to be removed

-- on/off switch (0/1)
Config.RaidActive = 1
Config.DungeonActive = 0
Config.PvPActive = 1
Config.NoWorldBuffMaps = 1

Config.HpAuraSpellId = 89501
Config.DamageDoneTaken = 89502
Config.BaseStatAP = 89503
Config.RageFromDamage = 89504
Config.HealAndAbsorb = 89505


-- all modifiers are in %
ConfigRaid.baseStatModifier = 0
ConfigRaid.meleeAPModifier = 0
ConfigRaid.rangedAPModifier = 0
ConfigRaid.DamageTaken = 150
ConfigRaid.DamageDone = -65
ConfigRaid.hpModifier = -20
ConfigRaid.RageFromDamage = 25
ConfigRaid.HealAndAbsorb = -30

ConfigDungeon.baseStatModifier = 0
ConfigDungeon.meleeAPModifier = -10
ConfigDungeon.rangedAPModifier = -20
ConfigDungeon.DamageTaken = 50
ConfigDungeon.DamageDone = -60
ConfigDungeon.hpModifier = -30
ConfigDungeon.RageFromDamage = 10
ConfigDungeon.HealAndAbsorb = 0

ConfigPvP.DamageTaken = -20
ConfigPvP.DamageDone = 0

-- all players in these maps will become debuffed on login, when entering and resurrecting
table.insert(Config_DungeonMaps, 429) -- Dire Maul
table.insert(Config_DungeonMaps, 289) -- Scholomance
table.insert(Config_DungeonMaps, 329) -- Stratholme

table.insert(Config_RaidMaps, 229) -- Blackrock Spire
--table.insert(Config_RaidMaps, 409) -- Molten Core
--table.insert(Config_RaidMaps, 469) -- Blackwing Lair
--table.insert(Config_RaidMaps, 509) -- Ruins of Ahn'Qiraj
--table.insert(Config_RaidMaps, 531) -- Temple of Ahn'Qiraj
--table.insert(Config_RaidMaps, 309) -- Zul Gurub

table.insert(Config_PvPMaps, 529) -- Arathi Basin
table.insert(Config_PvPMaps, 30) -- Alterac Valley
table.insert(Config_PvPMaps, 489) -- Warsong Gulch
table.insert(Config_PvPMaps, 618) -- Ring of Valor
table.insert(Config_PvPMaps, 572) -- Ruins of Lordaeron
table.insert(Config_PvPMaps, 559) -- Ring of Trials
table.insert(Config_PvPMaps, 562) -- Blade's Edge Arena
table.insert(Config_PvPMaps, 617) -- Dalaran Arena

table.insert(Config_NoWorldBuffMaps, 229) -- Blackrock Spire
table.insert(Config_NoWorldBuffMaps, 409) -- Molten Core
table.insert(Config_NoWorldBuffMaps, 469) -- Blackwing Lair
table.insert(Config_NoWorldBuffMaps, 509) -- Ruins of Ahn'Qiraj
table.insert(Config_NoWorldBuffMaps, 531) -- Temple of Ahn'Qiraj
table.insert(Config_NoWorldBuffMaps, 309) -- Zul Gurub

table.insert(Config_WorldBuff, 15366) -- Songflower Serenade
table.insert(Config_WorldBuff, 16609) -- Warchiefs Blessing
table.insert(Config_WorldBuff, 22888) -- Rallying Cry of the Dragonslayer
table.insert(Config_WorldBuff, 24425) -- Spirit of Zandalar
table.insert(Config_WorldBuff, 22817) -- Fengus' Ferocity
table.insert(Config_WorldBuff, 22818) -- Mol'dar's Moxie
table.insert(Config_WorldBuff, 22820) -- Slip'kik's Savvy



------------------------------------------
-- NO ADJUSTMENTS REQUIRED BELOW THIS LINE
------------------------------------------

local PLAYER_EVENT_ON_LOGIN = 3               -- (event, player)
local PLAYER_EVENT_ON_MAP_CHANGE = 28         -- (event, player)
local PLAYER_EVENT_ON_RESURRECT = 36          -- (event, player)
local PLAYER_EVENT_ON_PET_SPAWNED = 43        -- (event, player, pet)

local function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

local function zd_shouldRemoveWorldBuff(unit)
    if Config.NoWorldBuffMaps ~= 1 then
        return false
    else
        local mapId = unit:GetMap():GetMapId()
        return has_value(Config_NoWorldBuffMaps, mapId)
    end
end

local function zd_shouldDebuffRaid(player)
    if Config.RaidActive ~= 1 then
        return false
    else
        local mapId = player:GetMap():GetMapId()
        -- hardcoded check for LBRS RDF
        if player:GetGroup() ~= nil then
            if mapId == 229 and player:GetGroup():IsLFGGroup() == true then
                return false
            end
        end
        return has_value(Config_RaidMaps, mapId)
    end
end

local function zd_shouldDebuffRaidPet(pet)
    if Config.RaidActive ~= 1 then
        return false
    else
        local mapId = pet:GetMap():GetMapId()
        -- hardcoded check for LBRS RDF
        if pet:GetOwner():GetGroup() ~= nil then
            if mapId == 229 and pet:GetOwner():GetGroup():IsLFGGroup() == true then
                return false
            end
        end
        return has_value(Config_RaidMaps, mapId)
    end
end

local function zd_shouldDebuffDungeon(unit)
    if Config.DungeonActive ~= 1 then
        return false
    else
        --Check for RDF buff (Luck of the Draw)
        if unit:GetGroup():IsLFGGroup() == true then
            return false
        end
        local mapId = unit:GetMap():GetMapId()
        return has_value(Config_DungeonMaps, mapId)
    end
end

local function zd_shouldDebuffPvP(unit)
    if Config.PvPActive ~= 1 then
        return false
    else
        local mapId = unit:GetMap():GetMapId()
        return has_value(Config_PvPMaps, mapId)
    end
end

local function zd_debuffRaid(player)
    if not player:HasAura(Config.BaseStatAP) then
        player:CastCustomSpell(player, Config.BaseStatAP, false, ConfigRaid.baseStatModifier,ConfigRaid.meleeAPModifier,ConfigRaid.rangedAPModifier)
    end
    if not player:HasAura(Config.DamageDoneTaken) then
        player:CastCustomSpell(player, Config.DamageDoneTaken, false, ConfigRaid.DamageTaken,ConfigRaid.DamageDone)
    end
    if not player:HasAura(Config.HpAuraSpellId) then
        player:CastCustomSpell(player, Config.HpAuraSpellId, false, ConfigRaid.hpModifier)
    end
    if not player:HasAura(Config.RageFromDamage) then
        player:CastCustomSpell(player, Config.RageFromDamage, false, ConfigRaid.RageFromDamage)
    end
    if not player:HasAura(Config.HealAndAbsorb) then
        player:CastCustomSpell(player, Config.HealAndAbsorb, false, ConfigRaid.HealAndAbsorb)
    end
end

local function zd_debuffDungeon(player)
    if not player:HasAura(Config.BaseStatAP) then
        player:CastCustomSpell(player, Config.BaseStatAP, false, ConfigDungeon.baseStatModifier,ConfigDungeon.meleeAPModifier,ConfigDungeon.rangedAPModifier)
    end
    if not player:HasAura(Config.DamageDoneTaken) then
        player:CastCustomSpell(player, Config.DamageDoneTaken, false, ConfigDungeon.DamageTaken,ConfigDungeon.DamageDone)
    end
    if not player:HasAura(Config.HpAuraSpellId) then
        player:CastCustomSpell(player, Config.HpAuraSpellId, false, ConfigDungeon.hpModifier)
    end
    if not player:HasAura(Config.RageFromDamage) then
        player:CastCustomSpell(player, Config.RageFromDamage, false, ConfigDungeon.RageFromDamage)
    end
    if not player:HasAura(Config.HealAndAbsorb) then
        player:CastCustomSpell(player, Config.HealAndAbsorb, false, ConfigDungeon.HealAndAbsorb)
    end
end

local function zd_debuffPvP(player)
    if not player:HasAura(Config.DamageDoneTaken) then
        player:CastCustomSpell(player, Config.DamageDoneTaken, false, ConfigPvP.DamageTaken,ConfigPvP.DamageDone)
    end
end

local function zd_debuffRaidPet(pet)
    pet:CastCustomSpell(pet, Config.DamageDoneTaken, false, ConfigRaid.DamageTaken,ConfigRaid.DamageDone)
end

local function zd_debuffPetDungeon(pet)
    if pet:GetOwner():HasAura(72221) then
        return false
    end
    pet:CastCustomSpell(pet, Config.DamageDoneTaken, false, ConfigDungeon.DamageTaken,ConfigDungeon.DamageDone)
end

local function zd_debuffPetPvP(pet)
    pet:CastCustomSpell(pet, Config.DamageDoneTaken, false, ConfigPvP.DamageTaken,ConfigPvP.DamageDone)
end

local function zd_removeWorldbuffs(player)
    for index, value in ipairs(Config_WorldBuff) do
        player:RemoveAura(tonumber(value))
    end
end

local function zd_removeWorldbuffsPet(pet)
    for index, value in ipairs(Config_WorldBuff) do
        pet:RemoveAura(tonumber(value))
    end
end

local function zd_removeDebuff(player)
    player:RemoveAura(Config.BaseStatAP)
    player:RemoveAura(Config.DamageDoneTaken)
    player:RemoveAura(Config.HpAuraSpellId)
    player:RemoveAura(Config.RageFromDamage)
    player:RemoveAura(Config.HealAndAbsorb)
end

local function zd_removeDebuffPet(pet)
    pet:RemoveAura(Config.DamageDoneTaken)
end

local function zd_checkPlayerMap(player)
    if zd_shouldRemoveWorldBuff(player) then
        zd_removeWorldbuffs(player)
    end
    if zd_shouldDebuffRaid(player) then
        zd_removeDebuff(player)
        zd_debuffRaid(player)
    elseif zd_shouldDebuffDungeon(player) then
        zd_removeDebuff(player)
        zd_debuffDungeon(player)
    elseif zd_shouldDebuffPvP(player) then
        zd_removeDebuff(player)
        zd_debuffPvP(player)
    else
        zd_removeDebuff(player)
    end
end

local function zd_checkPetMap(pet)
    if zd_shouldRemoveWorldBuff(pet) then
        zd_removeWorldbuffsPet(pet)
    end
    if zd_shouldDebuffRaidPet(pet) then
        zd_removeDebuffPet(pet)
        zd_debuffRaidPet(pet)
    elseif zd_shouldDebuffDungeon(pet) then
        zd_removeDebuffPet(pet)
        zd_debuffPetDungeon(pet)
    elseif zd_shouldDebuffPvP(pet) then
        zd_removeDebuffPet(pet)
        zd_debuffPetPvP(pet)
    else
        zd_removeDebuffPet(pet)
    end
end

local function zd_checkMapPetSpawned(event, player, pet)
    zd_checkPetMap(pet)
end

local function zd_checkMapLogin(event, player)
    zd_checkPlayerMap(player)
end

local function zd_checkMapUpdate(event, player, newZone, newArea)
    zd_checkPlayerMap(player)
end

local function zd_checkMapResurrect(event, player)
    zd_checkPlayerMap(player)
end

if Config.RaidActive == 1 or Config.DungeonActive == 1 or Config.PvPActive == 1 or Config.NoWorldBuffMaps == 1 then
    RegisterPlayerEvent(PLAYER_EVENT_ON_LOGIN, zd_checkMapLogin)
    RegisterPlayerEvent(PLAYER_EVENT_ON_MAP_CHANGE, zd_checkMapUpdate)
    RegisterPlayerEvent(PLAYER_EVENT_ON_PET_SPAWNED, zd_checkMapPetSpawned)
    RegisterPlayerEvent(PLAYER_EVENT_ON_RESURRECT,zd_checkMapResurrect)
end
