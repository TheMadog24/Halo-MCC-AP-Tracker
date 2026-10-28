-- put logic functions here using the Lua API: https://github.com/black-sliver/PopTracker/blob/master/doc/PACKS.md#lua-interface
-- don't be afraid to use custom logic functions. it will make many things a lot easier to maintain, for example by adding logging.
-- to see how this function gets called, check: locations/locations.json
-- example:
function has_more_then_n_consumable(n)
    local count = Tracker:ProviderCountForCode('consumable')
    local val = (count > tonumber(n))
    if ENABLE_DEBUG_LOG then
        print(string.format("called has_more_then_n_consumable: count: %s, n: %s, val: %s", count, n, val))
    end
    if val then
        return 1 -- 1 => access is in logic
    end
    return 0 -- 0 => no access
end

-- key = tracker's code prefix; slot = the key that slot data uses for that game.
-- missions are in play order: mission n -> "<prefix>_access_<n>".
GAMES = {
    ce = {
        slot = "ce", name = "Halo CE", skull_prefix = "Skull_HCE_", pickups = "hce_skull_pickups",
        missions = { "The Pillar of Autumn", "Halo", "The Truth and Reconciliation", "The Silent Cartographer",
                     "Assault on the Control Room", "343 Guilty Spark", "The Library", "Two Betrayals",
                     "Keyes", "The Maw" },
    },
    h2 = {
        slot = "h2a", name = "Halo 2", skull_prefix = "Skull_2_", pickups = "h2_skull_pickups",
        missions = { "The Heretic", "The Armory", "Cairo Station", "Outskirts", "Metropolis", "The Arbiter",
                     "The Oracle", "Delta Halo", "Regret", "Sacred Icon", "Quarantine Zone", "Gravemind",
                     "Uprising", "High Charity", "The Great Journey" },
    },
    h3 = {
        slot = "h3", name = "Halo 3", skull_prefix = "Skull_3_", pickups = "h3_skull_pickups",
        missions = { "Arrival", "Sierra 117", "Crow's Nest", "Tsavo Highway", "The Storm", "Floodgate",
                     "The Ark", "The Covenant", "Cortana", "Halo", "Epilogue" },
    },
    h4 = {
        slot = "h4", name = "Halo 4", skull_prefix = "Skull_4_",
        missions = { "Prologue", "Dawn", "Requiem", "Forerunner", "Infinity", "Reclaimer", "Shutdown",
                     "Composer", "Midnight", "Epilogue" },
    },
    reach = {
        slot = "reach", name = "Halo Reach", skull_prefix = "Skull_Reach_",
        missions = { "Noble Actual", "Winter Contingency", "ONI: Sword Base", "Nightfall", "Tip of the Spear",
                     "Long Night of Solace", "Exodus", "New Alexandria", "The Package",
                     "The Pillar of Autumn", "Lone Wolf" },
    },
}

-- scoring skulls per game (the ones skullsanity "all" counts), as item code suffixes
SCORING_SKULLS = {
    ce    = { "Anger", "Black_Eye", "Blind", "Catch", "Eye_Patch", "Famine", "Fog", "Foreign", "Iron",
              "Mythic", "Recession", "That's_Just_Wrong", "Thunderstorm", "Tough_Luck" },
    h2    = { "Anger", "Assassins", "Black_Eye", "Blind", "Catch", "Eye_Patch", "Famine", "Fog", "Iron",
              "Jacked", "Masterblaster", "Mythic", "Recession", "Streaking", "That's_Just_Wrong", "Thunderstorm" },
    h3    = { "Anger", "Black_Eye", "Blind", "Catch", "Eye_Patch", "Famine", "Fog", "Foreign", "Iron",
              "Jacked", "Masterblaster", "Mythic", "Recession", "That's_Just_Wrong", "Thunderstorm", "Tilt",
              "Tough_Luck" },
    h4    = { "Black_Eye", "Blind", "Catch", "Famine", "Fog", "Iron", "Mythic", "Thunderstorm", "Tilt", "Tough_Luck" },
    reach = { "Black_Eye", "Blind", "Catch", "Famine", "Fog", "Iron", "Mythic", "Thunderstorm", "Tilt", "Tough_Luck" },
}

local function value(code)
    return Tracker:ProviderCountForCode(code) -- basically this is just saying "how many of code does player have?"
end

local function has(code)
    return value(code) > 0
end

-- visibility for game. json ex: "$game_enabled|ce"
function game_enabled(game)
    return not has(game .. "_disabled")
end

-- visibility on skull pickup sections. json ex: "$skull_pickups|ce"
function skull_pickups(game)
    return has(game .. "_skull_pickups")
end

-- visibility for a mission's level complete check. json ex: "$not_final|ce|3"
function not_final(game, n)
    return tonumber(n) ~= value(game .. "_final")
end

-- access for a mission's level complete check. json ex: "$skulls_ok|ce"
-- for skullsanity "all" completing a mission needs min(skulls_required, N) different scoring skulls
function skulls_ok(game)
    if value("skullsanity") ~= 2 then
        return true
    end
    local skulls = SCORING_SKULLS[game]
    local prefix = has("skull_item_mode_shared") and "Skull_" or GAMES[game].skull_prefix
    local needed = math.min(value("skulls_required"), #skulls)
    local count = 0
    for _, skull in ipairs(skulls) do
        if has(prefix .. skull) then
            count = count + 1
        end
    end
    return count >= needed
end

-- access on each mission location. json ex: "$mission_open|ce|3"
-- non-final missions need access items. final mission opens once enough of the
-- game's other missions are completable (access item + skull rule); 
-- its own access item never exists in the seed.
function mission_open(game, n)
    n = tonumber(n)
    local final = value(game .. "_final")
    if n ~= final then
        return has(game .. "_access_" .. n)
    end
    local completable = 0
    if skulls_ok(game) then
        for i = 1, #GAMES[game].missions do
            if i ~= final and has(game .. "_access_" .. i) then
                completable = completable + 1
            end
        end
    end
    return completable >= value(game .. "_missions_required")
end

-- goal indicator: every enabled game's final mission is open
-- idk if you want this but made sense to include it here anyhow
function goal_reached()
    for game in pairs(GAMES) do
        if game_enabled(game) then
            local final = value(game .. "_final")
            if final == 0 or not mission_open(game, final) then
                return false
            end
        end
    end
    return true
end