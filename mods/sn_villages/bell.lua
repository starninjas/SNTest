minetest.register_node("sn_villages:bell", {
description = "Bell",
	tiles = {
		"nextgen_bell_top.png",
		"nextgen_bell_bottom.png",
		"nextgen_bell.png",
		"nextgen_bell.png",
		"nextgen_bell.png",
		"nextgen_bell.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {cracky = 2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.1875, -0.25, 0.25, -0.0625, 0.25}, -- NodeBox1
			{-0.1875, -0.0625, -0.1875, 0.1875, 0.375, 0.1875}, -- NodeBox2
			{-0.0625, 0.375, -0.0625, 0.0625, 0.5, 0.0625}, -- NodeBox3
		}
	}
})

