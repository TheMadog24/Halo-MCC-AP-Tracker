-- use this file to map the AP location ids to your locations
-- first value is the code of the target location/item and the second is the item type override (feel free to expand the table with any other values you might need (i.e. special initial values, increments, etc.)!)
-- to reference a location in Pop use @ in the beginning and then path to the section (more info: https://github.com/black-sliver/PopTracker/blob/master/doc/PACKS.md#locations)
-- to reference an item use it's code
-- here are the SM locations as an example: https://github.com/Cyb3RGER/sm_ap_tracker/blob/main/scripts/autotracking/location_mapping.lua
BASE_LOCATION_ID = 0
LOCATION_MAPPING = {
	-- [BASE_LOCATION_ID + 00001] = { { "@Example Parent/Example Location 1/Example Section 1" } },
	-- [BASE_LOCATION_ID + 00002] = { { "toggle" } },
	-- -- multiple locations on this id
	-- [BASE_LOCATION_ID + 00003] = { { "@Example Parent/Example Location 1/Example Section 1" }, { "@Example Parent/Example Location 1/Example Section 2" } },

	-- CE
	-- The Pillar of Autumn
	[101000] = {{ "@Halo CE/The Pillar of Autumn/Level Complete" }},
	[101011] = {{ "@Halo CE/The Pillar of Autumn/Reveille" }},
	[101012] = {{ "@Halo CE/The Pillar of Autumn/AI Constructs and Cyborgs First!" }},
	[101021] = {{ "@Halo CE/The Pillar of Autumn/Iron Skull" }},

	-- Halo
	[102000] = {{ "@Halo CE/Halo/Level Complete" }},
	[102011] = {{ "@Halo CE/Halo/Flawless Cowboy" }},
	[102012] = {{ "@Halo CE/Halo/Reunion Tour" }},
	[102021] = {{ "@Halo CE/Halo/Mythic Skull" }},
	[102022] = {{ "@Halo CE/Halo/Boom Skull" }},
	
	-- The Truth and Reconciliation
	[103000] = {{ "@Halo CE/The Truth and Reconciliation/Level Complete" }},
	[103011] = {{ "@Halo CE/The Truth and Reconciliation/The Truth and Reconciliation" }},
	[103012] = {{ "@Halo CE/The Truth and Reconciliation/Into the Belly of the Beast" }},
	[103013] = {{ "@Halo CE/The Truth and Reconciliation/Shut Up and Get Behind me... Sir" }},
	[103022] = {{ "@Halo CE/The Truth and Reconciliation/Foreign Skull" }},
	
	-- The Silent Cartographer
	[104000] = {{ "@Halo CE/The Silent Cartographer/Level Complete" }},
	[104011] = {{ "@Halo CE/The Silent Cartographer/The Silent Cartographer" }},
	[104012] = {{ "@Halo CE/The Silent Cartographer/Its Quiet..." }},
	[104013] = {{ "@Halo CE/The Silent Cartographer/Shafted" }},
	[104021] = {{ "@Halo CE/The Silent Cartographer/Famine Skull" }},
	[104022] = {{ "@Halo CE/The Silent Cartographer/Bandana Skull" }},
	
	-- Assault on the Control Room
	[105000] = {{ "@Halo CE/Assault on the Control Room/Level Complete" }},
	[105011] = {{ "@Halo CE/Assault on the Control Room/I Would Have Been Your Daddy..." }},
	[105012] = {{ "@Halo CE/Assault on the Control Room/Rolling Thunder" }},
	[105013] = {{ "@Halo CE/Assault on the Control Room/If I Had a Super Weapon..." }},
	[105021] = {{ "@Halo CE/Assault on the Control Room/Fog Skull" }},
	[105022] = {{ "@Halo CE/Assault on the Control Room/Malfunction Skull" }},
	
	-- 343 Guilty Spark
	[106000] = {{ "@Halo CE/343 Guilty Spark/Level Complete" }},
	[106011] = {{ "@Halo CE/343 Guilty Spark/Well Enough Alone" }},
	[106012] = {{ "@Halo CE/343 Guilty Spark/The Flood" }},
	[106013] = {{ "@Halo CE/343 Guilty Spark/343 Guilty Spark" }},
	[106021] = {{ "@Halo CE/343 Guilty Spark/Recession Skull" }},

	-- The Library
	[107000] = {{ "@Halo CE/The Library/Level Complete" }},
	[107011] = {{ "@Halo CE/The Library/The Library" }},
	[107012] = {{ "@Halo CE/The Library/Wait, it Gets Worse!" }},
	[107013] = {{ "@Halo CE/The Library/But I Don't Want to Ride the Elevator!" }},
	[107014] = {{ "@Halo CE/The Library/Fourth Floor: Tools, Guns, Keys To Super Weapons" }},
	[107021] = {{ "@Halo CE/The Library/Black Eye Skull" }},
	[107022] = {{ "@Halo CE/The Library/Eye Patch Skull" }},

	-- Two Betrayals
	[108000] = {{ "@Halo CE/Two Betrayals/Level Complete" }},
	[108011] = {{ "@Halo CE/Two Betrayals/The Gun Pointed at the Head of the Universe" }},
	[108012] = {{ "@Halo CE/Two Betrayals/Breaking Stuff to look Tough" }},
	[108013] = {{ "@Halo CE/Two Betrayals/The Tunnels Below" }},
	[108014] = {{ "@Halo CE/Two Betrayals/Final Run" }},
	[108021] = {{ "@Halo CE/Two Betrayals/Pinata Skull" }},

	-- Keyes
	[109000] = {{ "@Halo CE/Keyes/Level Complete" }},
	[109011] = {{ "@Halo CE/Keyes/Under New Management" }},
	[109012] = {{ "@Halo CE/Keyes/Upstairs, Downstairs" }},
	[109013] = {{ "@Halo CE/Keyes/The Captain" }},

	-- The Maw
	[110000] = {{ "@Halo CE/The Maw/Level Complete" }},
	[110011] = {{ "@Halo CE/The Maw/...And the Horse You Rode in On" }},
	[110012] = {{ "@Halo CE/The Maw/Light Fuse, Run Away" }},
	[110013] = {{ "@Halo CE/The Maw/Warning: Hitchhikers May Be Escaping Convicts" }},
	[110021] = {{ "@Halo CE/The Maw/Grunt Birthday Party Skull" }},
	

	-- TODO: Other game's locations
}
