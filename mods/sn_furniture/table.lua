local table_table = { --name, material, invimg
{'Stone Table', 'cobble', 'mp_table_stone.png'},
{'Wood Table', 'wood', 'mp_table_wood.png'},
{'Acacia Wood Table', 'acacia_wood', 'mp_table_wood_acacia.png'},
{'Aspen Wood Table', 'aspen_wood', 'mp_table_wood_aspen.png'},
{'Pine Wood Table', 'pine_wood', 'mp_table_wood_pine.png'},
{'Jungle Wood Table', 'junglewood', 'mp_table_wood_jungle.png'}
}

for i in ipairs (table_table) do
	local name = table_table[i][1]
	local material = table_table[i][2]
	local invimg = table_table[i][3]
	
minetest.register_node('sn_furniture:table_'..material, {
	description = name,
	drawtype = 'nodebox',
	tiles = {'default_'..material..'.png'},
	align_style="world",
	groups = {snappy = 2, oddly_breakable_by_hand = 2, furniture = 1, flammable = 1, table = 1},
	paramtype = 'light',
	paramtype2 = 'facedir',
	sounds = default.node_sound_wood_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.125, 0.125, 0.375, 0.125}, -- NodeBox8
			{-0.5, 0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox9
		}
	},
})
end