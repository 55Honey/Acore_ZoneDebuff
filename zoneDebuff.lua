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
-- GM GUIDE:     -  nothing to do. Just watch them suffer.
------------------------------------------------------------------------------------------------
local Config = {}

-- on/off switch (0/1)
Config.active = 0

-- all modifiers are in %
Config.baseStatModifier = -20
Config.meleeAPModifier = -20
Config.rangedAPModifier = -20
Config.DamageTaken = 30
Config.DamageDone = -50

local Config_Zones = {}     --zones where to debuff players

-- all players in these zones will become debuffed on login, when entering and resurrecting
table.insert(Config_Zones, 2557) -- Dire Maul
--table.insert(Config_Zones, 1583) -- Blackrock Spire

------------------------------------------
-- NO ADJUSTMENTS REQUIRED BELOW THIS LINE
------------------------------------------

local PLAYER_EVENT_ON_LOGIN = 3               -- (event, player)
local PLAYER_EVENT_ON_UPDATE_ZONE = 27        -- (event, player, newZone, newArea)
local PLAYER_EVENT_ON_ENTER_COMBAT = 33       -- (event, player, enemy)
local PLAYER_EVENT_ON_RESURRECT = 36          -- (event, player)

local CREATURE_EVENT_ON_ENTER_COMBAT = 1      -- (event, creature, target)

local function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

local function zd_shouldDebuff(player, checkPet)
    local zone = player:GetZoneId()
    return has_value(Config_Zones, zone)
end

local function zd_debuff(player, checkPet)
    if not player:HasAura(63388) then
        player:CastCustomSpell(player, 63388, false, Config.baseStatModifier,Config.meleeAPModifier,Config.rangedAPModifier)
    end
    if not player:HasAura(72341) then
        player:CastCustomSpell(player, 72341, false, Config.DamageTaken,Config.DamageDone)
    end

    if checkPet == true then
        local petGuid = player:GetPetGUID()

        if tonumber(tostring(petGuid)) ~= 0 then
            local map = player:GetMap()
            local playerPet = map:GetWorldObject(petGuid):ToUnit()
            if not playerPet:HasAura(72341) then
                playerPet:CastCustomSpell(playerPet, 72341, false, Config.DamageTaken,Config.DamageDone)
            end
        end
    end
end

local function zd_removeDebuff(player)
    player:RemoveAura(63388)
    player:RemoveAura(72341)
    local petGuid = player:GetPetGUID()
    if tonumber(tostring(petGuid)) ~= 0 then
        local map = player:GetMap()
        local playerPet = map:GetWorldObject(petGuid):ToUnit()
        playerPet:RemoveAura(72341)
    end
end

local function zd_checkPlayerZone(player, checkPet)
    if zd_shouldDebuff(player) then
        zd_debuff(player, checkPet)
    else
        zd_removeDebuff(player)
    end
end

local function zd_checkZoneLogin(event, player)
    zd_checkPlayerZone(player,false)
end

local function zd_checkZoneUpdate(event, player, newZone, newArea)
    zd_checkPlayerZone(player,false)
end

local function zd_checkZoneCombat(event, player, enemy)
    zd_checkPlayerZone(player,true)
end

local function zd_checkZoneResurrect(event, player)
    zd_checkPlayerZone(player,false)
end

if Config.active == 1 then
    RegisterPlayerEvent(PLAYER_EVENT_ON_LOGIN, zd_checkZoneLogin)
    RegisterPlayerEvent(PLAYER_EVENT_ON_UPDATE_ZONE, zd_checkZoneUpdate)
    RegisterPlayerEvent(PLAYER_EVENT_ON_ENTER_COMBAT, zd_checkZoneCombat)
    RegisterPlayerEvent(PLAYER_EVENT_ON_RESURRECT,zd_checkZoneResurrect)
end
