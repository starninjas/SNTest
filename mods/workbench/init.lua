-- expose api
workbench = {}

-- on_construct
workbench.on_construct = function(pos)
	local width = minetest.get_item_group(minetest.env:get_node(pos).name, "craft_width")
	local meta = minetest.env:get_meta(pos)
	local inv = meta:get_inventory()
	inv:set_size("craftresult", 1)
	inv:set_size("table", width*width)
	inv:set_width("craft", width)
	meta:set_string("formspec", "size[8,"..(width+4.5).."]"
		.."list[current_name;craftresult;6,2;1,1;]"
		.."list[current_player;main;0,"..(width+0.5)..";8,4;]"
		.."list[current_name;table;0,0;"..width..","..width..";]")
	meta:set_string("infotext", width.."x"..width.." WorkBench")
	meta:set_int("width", width)
end

-- can_dig
workbench.can_dig = function(pos,player)
	local meta = minetest.env:get_meta(pos);
	local inv = meta:get_inventory()
	if inv:is_empty("table") and inv:is_empty("craftresult") then
		return true
	end
	return false
end

-- allow_metadata_inventory_move
workbench.allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
	if to_list == "craftresult" then
		return 0
	end
	if to_list == "table" then
		workbench.update_inventory(pos, true, true)
	end
	return count
end

-- allow_metadata_inventory_put
workbench.allow_metadata_inventory_put = function(pos, listname, index, stack, player)
	if listname == "craftresult" then
		return 0
	end
	return stack:get_count()
end

-- allow_metadata_inventory_take
workbench.allow_metadata_inventory_take = function(pos, listname, index, stack, player)
	return stack:get_count()
end

-- on_metadata_inventory_move
workbench.on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
	if to_list == "table" then
		workbench.update_inventory(pos)
	end
end

-- on_metadata_inventory_put
workbench.on_metadata_inventory_put = function(pos, listname, index, stack, player)
	if listname == "table" then
		workbench.update_inventory(pos)
	end
end

-- on_metadata_inventory_take
workbench.on_metadata_inventory_take = function(pos, listname, index, count, player)
	if listname == "table" then
		workbench.update_inventory(pos)
	elseif listname == "craftresult" then
		workbench.update_inventory(pos, true)
	end
end

-- update_inventory
workbench.update_inventory = function(pos,update_table,skip_update_craft)
	local meta = minetest.env:get_meta(pos)
	local inv = meta:get_inventory()
	local width = meta:get_int("width")
	local tablelist = inv:get_list("table")
	local crafted = nil
	local table_dec = nil

	-- update table
	if update_table then
		-- get craft result
		if tablelist then
			_, table_dec = minetest.get_craft_result({method = "normal", width = width, items = tablelist})
		end
		-- update table
		if table_dec then
			inv:set_list("table", table_dec.items)
		else
			inv:set_list("table", nil)
		end
		tablelist = table_dec.items
	end	

	-- update craft result
	if not skip_update_craft then
		-- get craft result
		if tablelist then
			crafted = minetest.get_craft_result({method = "normal", width = width, items = tablelist})
		end
		-- update craft result
		if crafted then
			inv:set_stack("craftresult", 1, crafted.item)
		else
			inv:set_stack("craftresult", 1, nil)
		end
	end
	
end

-- register
workbench.register = function(width, recipe)
	minetest.register_node("workbench:"..width.."x"..width, {
		description = "Aeon Forge",
		tile_images = {"forge_top.png","forge_bottom.png","forge_side.png"},
		paramtype2 = "facedir",
		groups = {cracky=2,craft_width=width},
		legacy_facedir_simple = true,
		sounds = default.node_sound_wood_defaults(),
		on_construct = workbench.on_construct,
		can_dig = workbench.can_dig,
		allow_metadata_inventory_move = workbench.allow_metadata_inventory_move,
		allow_metadata_inventory_put = workbench.allow_metadata_inventory_put,
		allow_metadata_inventory_take = workbench.allow_metadata_inventory_take,
		on_metadata_inventory_move = workbench.on_metadata_inventory_move,
		on_metadata_inventory_put = workbench.on_metadata_inventory_put,
		on_metadata_inventory_take = workbench.on_metadata_inventory_take,
	})
	minetest.register_craft({
		output = "workbench:"..width.."x"..width,
		recipe = recipe,
	})
end

-- register workbenches
workbench.register(5, {
	{"default:wood","default:wood","default:wood"},
	{"default:wood","default:wood","default:wood"},
	{"default:wood","default:wood","default:wood"},
})