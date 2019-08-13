local chair_table = { --name, material, invimg
{'Stone Chair', 'cobble', 'mp_chair_stone.png'},
{'Wood Chair', 'wood', 'mp_chair_wood.png'}
}

for i in ipairs (chair_table) do
	local name = chair_table[i][1]
	local material = chair_table[i][2]
	local invimg = chair_table[i][3]

minetest.register_node('sn_furniture:chair_'..material, {
	description = name,
	drawtype = 'nodebox',
	tiles = {'default_'..material..'.png'},
	groups = {choppy=2, oddly_breakably_by_hand=2, furniture=1, flammable=1},
	paramtype = 'light',
	paramtype2 = 'facedir',
	sounds = default.node_sound_wood_defaults(),
	can_dig = sn_furniture.sit_dig,
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		pos.y = pos.y + 0  -- Sitting position
		sn_furniture.sit(pos, node, clicker, pointed_thing)
		return itemstack
	end,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, 0.3125, -0.3125, -0.0625, 0.4375}, -- NodeBox10
			{0.3125, -0.5, 0.3125, 0.4375, -0.0625, 0.4375}, -- NodeBox11
			{-0.4375, -0.5, -0.4375, -0.3125, -0.0625, -0.3125}, -- NodeBox12
			{0.3125, -0.5, -0.4375, 0.4375, -0.0625, -0.3125}, -- NodeBox13
			{-0.4375, -0.0625, -0.4375, 0.4375, 0.0625, 0.4375}, -- NodeBox14
			{-0.4375, 0.0625, 0.3125, 0.4375, 0.8125, 0.4375}, -- NodeBox15
		}
	}
})
end
