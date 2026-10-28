-- entry point for all lua code of the pack
-- more info on the lua API: https://github.com/black-sliver/PopTracker/blob/master/doc/PACKS.md#lua-interface
ENABLE_DEBUG_LOG = true
-- get current variant
local variant = Tracker.ActiveVariantUID
-- check variant info
IS_ITEMS_ONLY = variant:find("itemsonly")

print("-- Example Tracker --")
print("Loaded variant: ", variant)
if ENABLE_DEBUG_LOG then
    print("Debug logging is enabled!")
end

-- Utility Script for helper functions etc.
ScriptHost:LoadScript("scripts/utils.lua")

-- Logic
ScriptHost:LoadScript("scripts/logic/logic.lua")

-- Locations
Tracker:AddLocations("locations/Overview.jsonc")
Tracker:AddLocations("locations/Halo CE.jsonc")
Tracker:AddLocations("locations/Halo Reach.jsonc")
Tracker:AddLocations("locations/Halo 2.jsonc")
Tracker:AddLocations("locations/Halo 3.jsonc")

-- Custom Items
ScriptHost:LoadScript("scripts/custom_items/class.lua")
ScriptHost:LoadScript("scripts/custom_items/progressiveTogglePlus.lua")
ScriptHost:LoadScript("scripts/custom_items/progressiveTogglePlusWrapper.lua")

-- Items
Tracker:AddItems("items/settings.jsonc")
Tracker:AddItems("items/items.jsonc")
Tracker:AddItems("items/Halo_CE_items.jsonc")
Tracker:AddItems("items/Halo_Reach_items.jsonc")
Tracker:AddItems("items/Halo_2_items.jsonc")
Tracker:AddItems("items/Halo_3_items.jsonc")

if not IS_ITEMS_ONLY then -- <--- use variant info to optimize loading
    -- Maps
    Tracker:AddMaps("maps/maps.jsonc")
end

-- Layout
Tracker:AddLayouts("layouts/shared_items.jsonc")
Tracker:AddLayouts("layouts/tracker.jsonc")
Tracker:AddLayouts("layouts/broadcast.jsonc")
Tracker:AddLayouts("layouts/Halo_CE_items.json")
Tracker:AddLayouts("layouts/Halo_Reach_Items.json")
Tracker:AddLayouts("layouts/Halo_2_Items.json")
Tracker:AddLayouts("layouts/Halo_3_Items.json")

-- AutoTracking for Poptracker
if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end
