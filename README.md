## lua-zone-debuff
Lua script for Azerothcore with ElunaLUA to buff/debuff players in zones listed in the configuration.

#### Find me on patreon: https://www.patreon.com/Honeys

## Requirements:
Compile your [Azerothcore](https://github.com/azerothcore/azerothcore-wotlk) with [Eluna Lua](https://www.azerothcore.org/catalogue-details.html?id=131435473).
The ElunaLua module itself usually doesn't require much setup/config. Just specify the subfolder where to put your lua_scripts in its .conf file.

If the directory was not changed in the ElunaLua config, add the .lua script to your `../lua_scripts/` directory as a subfolder of the worldserver.

## Admin Usage:
Adjust the config flags and IDs in the `.lua` files. Each file has it's own list of zones.

There are
- `zoneDebuff.lua` to change player stats globally as well as damage dealt and damage taken.
- `zoneBuffPvP.lua` to change all players resilience ratings. 

## GM Usage:
Nothing to do.

## Player Usage:
Go to the zones. Enjoy the buffs / endure the debuffs.
