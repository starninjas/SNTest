
local S = farming.intllib

local function field_timer(pos)
	
	local node = minetest.get_node(pos)
	pos.y = pos.y + 1
	local nn = minetest.get_node_or_nil(pos)
	pos.y = pos.y - 1

	if nn then nn = nn.name else return end

	-- what's on top of soil, if solid/not plant change soil to dirt
	if minetest.registered_nodes[nn]
	and minetest.registered_nodes[nn].walkable
	and minetest.get_item_group(nn, "plant") == 0 then
		minetest.set_node(pos, {name = "default:dirt"})
		return
	end

	-- if map around soil not loaded then skip until loaded
	if minetest.find_node_near(pos, 3, {"ignore"}) then
		return true
	end

	-- check if there is water nearby and change soil accordingly
	if minetest.find_node_near(pos, 3, {"group:water"}) then
		if node.name == "farming:soil" then
			minetest.set_node(pos, {name = "farming:soil_wet"})
		end

	elseif node.name == "farming:soil_wet" then
		minetest.set_node(pos, {name = "farming:soil"})

	elseif node.name == "farming:soil" and minetest.get_item_group(nn, "plant") == 0 then
		minetest.set_node(pos, {name = "default:dirt"})
	end
end

local function field_construct(pos)
	minetest.get_node_timer(pos):start(15 * math.random(1, 3))
end

-- normal soil
minetest.register_node("farming:soil", {
	description = S("Soil"),
	tiles = {"default_dirt.png^farming_soil.png", "default_dirt.png"},
	drop = "default:dirt",
	groups = {crumbly = 3, not_in_creative_inventory = 1, soil = 2},
	sounds = default.node_sound_dirt_defaults(),
	on_construct = function(pos)
		field_construct(pos)
	end,
	on_timer = function(pos)
		field_timer(pos)
	end
})

-- wet soil
minetest.register_node("farming:soil_wet", {
	description = S("Wet Soil"),
	tiles = {"default_dirt.png^farming_soil_wet.png", "default_dirt.png^farming_soil_wet_side.png"},
	drop = "default:dirt",
	groups = {crumbly = 3, not_in_creative_inventory = 1, soil = 3},
	sounds = default.node_sound_dirt_defaults(),
	on_construct = function(pos)
		field_construct(pos)
	end,
	on_timer = function(pos)
		field_timer(pos)
	end
})

-- sand is not soil, change existing sand-soil to use normal soil
minetest.register_alias("farming:desert_sand_soil", "farming:soil")
minetest.register_alias("farming:desert_sand_soil_wet", "farming:soil_wet")

minetest.register_lbm({
	name = "farming:farming_soil",
	nodenames = { "farming:soil", "farming:soil_wet" },
	run_at_every_load = true,
	action = function(pos, node)
		field_timer(pos)
	end,
})
