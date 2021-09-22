--
--
-- Created by IntelliJ IDEA.
-- User: Silvia
-- Date: 06/09/2021
-- Time: 20:17
-- To change this template use File | Settings | File Templates.
-- Originally created by Honey for Azerothcore
-- requires ElunaLua module


-- This module debuffs players when they enter or login a zone specified in Config_Zones
------------------------------------------------------------------------------------------------
-- ADMIN GUIDE:  -  compile the core with ElunaLua module
--               -  adjust config in this file
--               -  add this script to ../lua_scripts/
------------------------------------------------------------------------------------------------
-- GM GUIDE:     -  nothing to do.
------------------------------------------------------------------------------------------------
local Config = {}

-- on/off switch (0/1)
Config.active = 0

--Config.baseResilience = 200
Config.DamageTaken = -20
Config.DamageDone = 0

local Config_Zones = {}     --zones where to debuff players

-- all players in these zones will become debuffed on login, when entering and resurrecting
table.insert(Config_Zones, 3358) -- Arathi Basin
table.insert(Config_Zones, 2597) -- Alterac Valley
table.insert(Config_Zones, 3277) -- Warsong Gulch
table.insert(Config_Zones, 4406) -- Ring of Valor
table.insert(Config_Zones, 3968) -- Ruins of Lordaeron
table.insert(Config_Zones, 3698) -- Ring of Trials
table.insert(Config_Zones, 3702) -- Blade's Edge Arena
table.insert(Config_Zones, 4378) -- Dalaran Arena

------------------------------------------
-- NO ADJUSTMENTS REQUIRED BELOW THIS LINE
------------------------------------------

local PLAYER_EVENT_ON_LOGIN = 3               -- (event, player)
local PLAYER_EVENT_ON_UPDATE_ZONE = 27        -- (event, player, newZone, newArea)
local PLAYER_EVENT_ON_RESURRECT = 36          -- (event, player)

local function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

local function zd_shouldDebuff(player)
    local zone = player:GetZoneId()
    return has_value(Config_Zones, zone)
end

local function zd_debuff(player)
    --if not player:HasAura(56509 ) then
    --    player:CastCustomSpell(player, 56509 , false, Config.baseResilience)
    --end
    if not player:HasAura(72341) then
        player:CastCustomSpell(player, 72341, false, Config.DamageTaken,Config.DamageDone)
    end
end

local function zd_removeDebuff(player)
    player:RemoveAura(72341)
end

local function zd_checkPlayerZone(player)
    if zd_shouldDebuff(player) then
        zd_debuff(player)
    else
        zd_removeDebuff(player)
    end
end

local function zd_checkZoneLogin(event, player)
    zd_checkPlayerZone(player)
end

local function zd_checkZoneUpdate(event, player, newZone, newArea)
    zd_checkPlayerZone(player)
end

local function zd_checkZoneResurrect(event, player)
    zd_checkPlayerZone(player)
end

if Config.active == 1 then
    RegisterPlayerEvent(PLAYER_EVENT_ON_LOGIN, zd_checkZoneLogin)
    RegisterPlayerEvent(PLAYER_EVENT_ON_UPDATE_ZONE, zd_checkZoneUpdate)
    RegisterPlayerEvent(PLAYER_EVENT_ON_RESURRECT,zd_checkZoneResurrect)
end
