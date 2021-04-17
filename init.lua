minetest.clear_registered_biomes()
minetest.clear_registered_ores()
minetest.clear_registered_decorations()
math.randomseed(2317)
local randhex = {'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'}
for i=0,230 do
	local watex = "^[colorize:#"..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)].."7F"
	minetest.register_node("multibiomegen:meta_water_source_"..i, {
		description = "Meta Water Source"..i.."."..math.random(0,999),
		drawtype = "liquid",
		waving = 3,
		tiles = {
			{
				name = "default_water_source_animated.png"..watex,
				backface_culling = false,
				animation = {
					type = "vertical_frames",
					aspect_w = 16,
					aspect_h = 16,
					length = 2.0,
				},
			},
			{
				name = "default_water_source_animated.png"..watex,
				backface_culling = true,
				animation = {
					type = "vertical_frames",
					aspect_w = 16,
					aspect_h = 16,
					length = 2.0,
				},
			},
		},
		use_texture_alpha = "blend",
		paramtype = "light",
		walkable = false,
		pointable = false,
		diggable = false,
		buildable_to = true,
		is_ground_content = false,
		drop = "",
		drowning = 1,
		liquidtype = "source",
		liquid_alternative_flowing = "multibiomegen:meta_water_flowing_"..i,
		liquid_alternative_source = "multibiomegen:meta_water_source_"..i,
		liquid_viscosity = 1,
		post_effect_color = {a = 103, r = 30, g = 60, b = 90},
		groups = {water = 3, liquid = 3, cools_lava = 1},
		sounds = default.node_sound_water_defaults(),
	})
	minetest.register_node("multibiomegen:meta_water_flowing_"..i, {
		description = "Meta Flowing Water"..i.."."..math.random(0,999),
		drawtype = "flowingliquid",
		waving = 3,
		tiles = {"default_water.png"..watex},
		special_tiles = {
			{
				name = "default_water_flowing_animated.png"..watex,
				backface_culling = false,
				animation = {
					type = "vertical_frames",
					aspect_w = 16,
					aspect_h = 16,
					length = 0.5,
				},
			},
			{
				name = "default_water_flowing_animated.png"..watex,
				backface_culling = true,
				animation = {
					type = "vertical_frames",
					aspect_w = 16,
					aspect_h = 16,
					length = 0.5,
				},
			},
		},
		use_texture_alpha = "blend",
		paramtype = "light",
		paramtype2 = "flowingliquid",
		walkable = false,
		pointable = false,
		diggable = false,
		buildable_to = true,
		is_ground_content = false,
		drop = "",
		drowning = 1,
		liquidtype = "flowing",
		liquid_alternative_flowing = "multibiomegen:meta_water_flowing_"..i,
		liquid_alternative_source = "multibiomegen:meta_water_source_"..i,
		liquid_viscosity = 1,
		post_effect_color = {a = 103, r = 30, g = 60, b = 90},
		groups = {water = 3, liquid = 3, not_in_creative_inventory = 1,
			cools_lava = 1},
		sounds = default.node_sound_water_defaults(),
	})
	bucket.register_liquid(
		"multibiomegen:meta_water_source_"..i,
		"multibiomegen:meta_water_flowing_"..i,
		"multibiomegen:meta_water_"..i,
		"bucket_water.png"..watex,
		"Meta Bucket v"..i.."."..math.random(0,999)
	)
	local mytreedef = {
		axiom="FFFFFAFFBF",
		rules_a="[&&&FFFFF&&FFFF][&&&++++FFFFF&&FFFF][&&&----FFFFF&&FFFF]",
		rules_b="[&&&++FFFFF&&FFFF][&&&--FFFFF&&FFFF][&&&------FFFFF&&FFFF]",
		trunk="multibiomegen:tree_"..i,
		leaves="multibiomegen:leaf_"..i,
		angle=30,
		iterations=2,
		random_level=0,
		trunk_type="single",
		thin_branches=true,
		fruit_chance=1,
		fruit="multibiomegen:fruit_"..i
	}
	minetest.register_node("multibiomegen:tree_"..i, {
		description = "Meta Tree v"..i.."."..math.random(0,999),
		tiles = {"default_tree_top.png^[colorize:#"..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)].."7F", "default_tree_top.png^[colorize:#"..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)].."7F", "default_tree.png^[colorize:#"..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)].."7F"},
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {tree = 1, choppy = math.random(1,3), oddly_breakable_by_hand = math.random(1,3), flammable = 2},
		sounds = default.node_sound_wood_defaults(),
		on_place = minetest.rotate_node,
	})
	minetest.register_node("multibiomegen:wood_"..i, {
		description = "Meta Wood Planks v"..i.."."..math.random(0,999),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"default_wood.png^[colorize:#"..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)].."7F"},
		is_ground_content = false,
		groups = {choppy = math.random(1,3), oddly_breakable_by_hand = math.random(1,3), flammable = 2, wood = 1},
		sounds = default.node_sound_wood_defaults(),
	})
	minetest.register_craft({
		output = "multibiomegen:wood_"..i.." 4",
		recipe = {
			{"multibiomegen:tree_"..i},
		}
	})
	minetest.register_node("multibiomegen:leaf_"..i, {
		description = "Meta Tree Leaves v"..i.."."..math.random(0,999),
		drawtype = "allfaces_optional",
		waving = 1,
		tiles = {"default_leaves.png^[colorize:#"..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)].."7F"},
		special_tiles = {"default_leaves_simple.png^[colorize:#"..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)].."7F"},
		paramtype = "light",
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 1,
			items = {
			{
				items = {"multibiomegen:sapling_"..i},
				rarity = 20,
			},
			{
				items = {"multibiomegen:leaf_"..i},
			}
		}
		},
		sounds = default.node_sound_leaves_defaults(),
		after_place_node = after_place_leaves,
	})
	local dirtex = "^[colorize:#"..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)].."7F"
	local grastex = "^[colorize:#"..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)].."7F"
	minetest.register_node("multibiomegen:dirt_"..i, {
		description = "Meta Dirt v"..i.."."..math.random(0,999),
		tiles = {"default_dirt.png"..dirtex},
		groups = {crumbly = 3, soil = 1},
		sounds = default.node_sound_dirt_defaults(),
	})
	minetest.register_node("multibiomegen:".."dirt_with_meta_"..i, {
		description = "Meta Dirt with Meta Grass v"..i.."."..math.random(0,999),
		tiles = {"default_grass.png"..grastex, "default_dirt.png"..dirtex,
			{name = "default_dirt.png^default_grass_side.png"..grastex,
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
		drop = "multibiomegen:dirt_"..i,
		--drop = "default:dirt",
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain = 0.25},
		}),
	})
	local appletex = "^[colorize:#"..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)].."7F"
	minetest.register_node("multibiomegen:fruit_"..i, {
		description = "Meta Fruit v"..i.."."..math.random(0,999),
		drawtype = "plantlike",
		tiles = {"default_apple.png"..appletex},
		inventory_image = "default_apple.png"..appletex,
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		is_ground_content = false,
		selection_box = {
			type = "fixed",
				fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
		},
		groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
			leafdecay = 3, leafdecay_drop = 1, food_apple = 1},
		on_use = minetest.item_eat(math.random(-20,20)),
		sounds = default.node_sound_leaves_defaults(),
		after_place_node = function(pos, placer, itemstack)
			minetest.set_node(pos, {name = "multibiomegen:fruit_"..i, param2 = 1})
		end,
	})
	local appletex = "^[colorize:#"..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)].."7F"
	minetest.register_node("multibiomegen:sapling_"..i, {
		description = "Meta Sapling v"..i.."."..math.random(0,999),
		drawtype = "plantlike",
		tiles = {"default_sapling.png"..appletex},
		inventory_image = "default_sapling.png"..appletex,
		wield_image = "default_sapling.png"..appletex,
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2,
			attached_node = 1, sapling = 1},
		sounds = default.node_sound_leaves_defaults(),
	})
	minetest.register_abm({
		nodenames = {"multibiomegen:sapling_"..i},
		chance = 1,
		interval = 1,
		action = function(pos)
			minetest.set_node(pos, {name="air"})
			minetest.spawn_tree(pos, mytreedef)
		end,
	})
	--local mymin = math.random(-31000,30999)
	--local mymax = math.random(mymin,31000)
	minetest.register_biome({
		name = "mbg"..i,
		node_top = "multibiomegen:".."dirt_with_meta_"..i,
		depth_top = 1,
		node_filler = "multibiomegen:".."dirt_"..i,
		depth_filler = 2,
		node_riverbed = "multibiomegen:".."dirt_"..i,
		depth_riverbed = 2,
		node_dungeon = "default:mossycobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "air",
		vertical_blend = 1,
		node_river_water = "multibiomegen:meta_water_source_"..i,
		node_water = "multibiomegen:meta_water_source_"..i,
		y_max = 31000,--math.random(-31000,31000),
		y_min = -31000,--math.random(-31000,-1),
		heat_point = math.random(-100,200),
		humidity_point = math.random(-100,200),
	})
	minetest.register_decoration({
		deco_type = "simple",
		place_on = "multibiomegen:dirt_with_meta_"..i,
		sidelen = 8,
		fill_ratio = 0.00023,
		biomes = {"mbg"..i},
		decoration = "multibiomegen:sapling_"..i,
		height = 1,
	})
	minetest.register_node("multibiomegen:metaore_"..i, {
		description = "Meta Ore v"..i.."."..math.random(0,999),
		inventory_image = "default_diamond.png^[colorize:#"..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)].."7F",
	})
	minetest.register_node("multibiomegen:stone_with_metaore_"..i, {
		description = "Stone with Meta Ore v"..i.."."..math.random(0,999),
		tiles = {"default_stone.png^default_mineral_diamond.png^[colorize:#"..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)].."7F"},
		groups = {cracky = math.random(1,3)},
		drop = "multibiomegen:metaore_"..i,
		sounds = default.node_sound_stone_defaults(),
	})
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "multibiomegen:stone_with_metaore_"..i,
		wherein        = "default:stone",
		clust_scarcity = math.random(8*8*8,64*64*64),
		clust_num_ores = 3,
		clust_size     = 2,
		y_max          = 31000,
		y_min          = -31000,
	})
	minetest.register_tool("multibiomegen:pick_meta_"..i, {
		description = "Meta Pickaxe v"..i.."."..math.random(0,999),
		inventory_image = "default_tool_diamondpick.png^[colorize:#"..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)].."7F",
		tool_capabilities = {
			full_punch_interval = math.random(0.5,1.5),
			max_drop_level=math.random(0,3),
			groupcaps={
				cracky = {times={[1]=math.random(0.5,2.0), [2]=math.random(0.5,2.0), [3]=math.random(0.5,2.0)}, uses=math.random(10,30), maxlevel=math.random(1,3)},
			},
			damage_groups = {fleshy=math.random(1,8)},
		},
		sound = {breaks = "default_tool_breaks"},
		groups = {pickaxe = 1}
	})
	minetest.register_tool("multibiomegen:axe_meta_"..i, {
		description = "Meta Axe v"..i.."."..math.random(0,999),
		inventory_image = "default_tool_diamondaxe.png^[colorize:#"..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)].."7F",
		tool_capabilities = {
			full_punch_interval = math.random(0.5,1.5),
			max_drop_level=math.random(0,3),
			groupcaps={
				choppy={times={[1]=math.random(0.5,2.0), [2]=math.random(0.5,2.0), [3]=math.random(0.5,2.0)}, uses=math.random(10,30), maxlevel=math.random(1,3)},
			},
			damage_groups = {fleshy=math.random(1,8)},
		},
		sound = {breaks = "default_tool_breaks"},
		groups = {axe = 1}
	})
	local shovtex = "^[colorize:#"..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)].."7F"
	minetest.register_tool("multibiomegen:shovel_meta_"..i, {
		description = "Meta Shovel v"..i.."."..math.random(0,999),
		inventory_image = "default_tool_diamondshovel.png"..shovtex,
		wield_image = "default_tool_diamondshovel.png^[transformR90"..shovtex,
		tool_capabilities = {
			full_punch_interval = math.random(0.5,1.5),
			max_drop_level=math.random(0,3),
			groupcaps={
				crumbly = {times={[1]=math.random(0.5,2.0), [2]=math.random(0.5,2.0), [3]=math.random(0.5,2.0)}, uses=math.random(10,30), maxlevel=math.random(1,3)},
			},
			damage_groups = {fleshy=math.random(1,8)},
		},
		sound = {breaks = "default_tool_breaks"},
		groups = {shovel = 1}
	})
	minetest.register_tool("multibiomegen:sword_meta_"..i, {
		description = "Meta Sword v"..i.."."..math.random(0,999),
		inventory_image = "default_tool_diamondsword.png^[colorize:#"..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)]..randhex[math.random(#randhex)].."7F",
		tool_capabilities = {
			full_punch_interval = math.random(0.5,1.5),
			max_drop_level=math.random(0,3),
			groupcaps={
				snappy={times={[1]=math.random(0.5,2.0), [2]=math.random(0.5,2.0), [3]=math.random(0.5,2.0)}, uses=math.random(10,30), maxlevel=math.random(1,3)},
			},
			damage_groups = {fleshy=math.random(1,8)},
		},
		sound = {breaks = "default_tool_breaks"},
		groups = {sword = 1}
	})
	minetest.register_craft({
		output = "multibiomegen:pick_meta_"..i,
		recipe = {
			{"multibiomegen:metaore_"..i, "multibiomegen:metaore_"..i, "multibiomegen:metaore_"..i},
			{"", "group:stick", ""},
			{"", "group:stick", ""}
		}
	})
	minetest.register_craft({
		output = "multibiomegen:axe_meta_"..i,
		recipe = {
			{"multibiomegen:metaore_"..i, "multibiomegen:metaore_"..i, ""},
			{"multibiomegen:metaore_"..i, "group:stick", ""},
			{"", "group:stick", ""}
		}
	})
	minetest.register_craft({
		output = "multibiomegen:shovel_meta_"..i,
		recipe = {
			{"", "multibiomegen:metaore_"..i, ""},
			{"", "group:stick", ""},
			{"", "group:stick", ""}
		}
	})
	minetest.register_craft({
		output = "multibiomegen:sword_meta_"..i,
		recipe = {
			{"", "multibiomegen:metaore_"..i, ""},
			{"", "multibiomegen:metaore_"..i, ""},
			{"", "group:stick", ""}
		}
	})
end
