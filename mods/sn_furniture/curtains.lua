local curtain_table = { --name, color, colorize(hex or color name:intensity(1-255))
{'Black', 'black', 'black:225'},
{'Blue', 'blue', 'blue:225'},
{'Brown', 'brown', 'brown:225'},
{'Cyan', 'cyan', 'cyan:200'},
{'Dark Green', 'dark_green', 'green:225'},
{'Dark Grey', 'dark_grey', 'black:200'},
{'Green', 'green', '#32cd32:150'},
{'Grey', 'grey', 'black:100'},
{'Magenta', 'magenta', 'magenta:200'},
{'Orange', 'orange', 'orange:225'},
{'Pink', 'pink', 'pink:225'},
{'Red', 'red', 'red:225'},
{'Violet', 'violet', 'violet:225'},
{'White', 'white', 'white:1'},
{'Yellow', 'yellow', 'yellow:225'},
}

for i in ipairs (curtain_table) do
	local name = curtain_table[i][1]
	local color = curtain_table[i][2]
	local hex = curtain_table[i][3]

minetest.register_node("sn_furniture:curtains_"..color, {
	description= name.. " Curtains",
	tiles= {"default_acacia_tree.png","wool_"..color..".png^mp_curtainb.png","wool_"..color..".png^mp_curtains.png","wool_"..color..".png^mp_curtains.png","wool_"..color..".png^mp_curtains.png","wool_"..color..".png^mp_curtains.png",},
	drawtype= "nodebox",
	paramtype= "light",
	paramtype2 = "facedir",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, furniture = 1},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		node.name = "sn_furniture:curtains_closed_"..color 
		minetest.set_node(pos, node)
	end,
	node_box= {
		type= "fixed",
		fixed= {
			{-0.5, -0.3, 0.5, -0.2, 0.5, 0.4},
			{-0.5, -0.5, 0.5, -0.3, -0.3, 0.4},
			{-0.5, 0.5, 0.5, 0.5, 0.2, 0.4},
			{-0.5, 0.5, 0.5, 0.5, 0.440, 0.350},
			{0.5, -0.3, 0.5, 0.2, 0.5, 0.4},
			{0.5, -0.5, 0.5, 0.3, -0.3, 0.4},
		},
	},
	on_punch = function(pos, node, clicker)
	for _, obj in ipairs (minetest.get_connected_players())  do
        local item = obj:get_wielded_item():get_name()
        if item == 'dye:black' then
            node.name = "sn_furniture:curtains_black"
               minetest.set_node(pos, node)
        else
                if item == 'dye:white' then
            node.name = "sn_furniture:curtains_white"
               minetest.set_node(pos, node)
        else
                if item == 'dye:grey' then
            node.name = "sn_furniture:curtains_grey"
               minetest.set_node(pos, node)
        else
        if item == 'dye:dark_grey' then
            node.name = "sn_furniture:curtains_dark_grey"
               minetest.set_node(pos, node)
        else
                if item == 'dye:violet' then
            node.name = "sn_furniture:curtains_violet"
               minetest.set_node(pos, node)
        else
                if item == 'dye:blue' then
            node.name = "sn_furniture:curtains_blue"
               minetest.set_node(pos, node)
        else
                if item == 'dye:cyan' then
            node.name = "sn_furniture:curtains_cyan"
               minetest.set_node(pos, node)
        else
                if item == 'dye:dark_green' then
            node.name = "sn_furniture:curtains_dark_green"
               minetest.set_node(pos, node)
        else
                if item == 'dye:green' then
            node.name = "sn_furniture:curtains_green"
               minetest.set_node(pos, node)
        else
                if item == 'dye:yellow' then
            node.name = "sn_furniture:curtains_yellow"
               minetest.set_node(pos, node)
        else
                if item == 'dye:orange' then
            node.name = "sn_furniture:curtains_orange"
               minetest.set_node(pos, node)
        else
                if item == 'dye:red' then
            node.name = "sn_furniture:curtains_red"
               minetest.set_node(pos, node)
        else
                if item == 'dye:magenta' then
            node.name = "sn_furniture:curtains_magenta"
               minetest.set_node(pos, node)
        else
                if item == 'dye:pink' then
            node.name = "sn_furniture:curtains_pink"
               minetest.set_node(pos, node)
        else
                if item == 'dye:brown' then
            node.name = "sn_furniture:curtains_brown"
               minetest.set_node(pos, node)
                      end
                     end
                    end
                   end
                  end
                 end
                end
               end
              end
             end
            end
           end
          end
         end
        end
       end
		 end
})

minetest.register_node("sn_furniture:curtains_closed_"..color, {
   description = name.." Closed Curtains",
   tiles= {"default_acacia_tree.png","wool_"..color..".png^mp_curtainb.png","wool_"..color..".png^mp_curtains.png","wool_"..color..".png^mp_curtains.png","wool_"..color..".png^mp_curtains.png","wool_"..color..".png^mp_curtains.png",},
   drawtype = "nodebox",
   paramtype = "light",
   paramtype2 = "facedir",
   groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, not_in_creative_inventory = 1, furniture = 1},
   drop = "sn_furniture:curtains_"..color,
   on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		node.name = "sn_furniture:curtains_"..color 
		minetest.set_node(pos, node)
	end,
   node_box = {
       type = "fixed",
       fixed = {
           {-0.5, -0.5, 0.5, 0.5, 0.5, 0.4},
		   {-0.5, 0.5, 0.5, 0.5, 0.440, 0.350},

       },
   },
   on_punch = function(pos, node, clicker)
	for _, obj in ipairs (minetest.get_connected_players())  do
        local item = obj:get_wielded_item():get_name()
        if item == 'dye:black' then
            node.name = "sn_furniture:curtains_closed_black"
               minetest.set_node(pos, node)
        else
                if item == 'dye:white' then
            node.name = "sn_furniture:curtains_closed_white"
               minetest.set_node(pos, node)
        else
                if item == 'dye:grey' then
            node.name = "sn_furniture:curtains_closed_grey"
               minetest.set_node(pos, node)
        else
        if item == 'dye:dark_grey' then
            node.name = "sn_furniture:curtains_closed_dark_grey"
               minetest.set_node(pos, node)
        else
                if item == 'dye:violet' then
            node.name = "sn_furniture:curtains_closed_violet"
               minetest.set_node(pos, node)
        else
                if item == 'dye:blue' then
            node.name = "sn_furniture:curtains_closed_blue"
               minetest.set_node(pos, node)
        else
                if item == 'dye:cyan' then
            node.name = "sn_furniture:curtains_closed_cyan"
               minetest.set_node(pos, node)
        else
                if item == 'dye:dark_green' then
            node.name = "sn_furniture:curtains_closed_dark_green"
               minetest.set_node(pos, node)
        else
                if item == 'dye:green' then
            node.name = "sn_furniture:curtains_closed_green"
               minetest.set_node(pos, node)
        else
                if item == 'dye:yellow' then
            node.name = "sn_furniture:curtains_closed_yellow"
               minetest.set_node(pos, node)
        else
                if item == 'dye:orange' then
            node.name = "sn_furniture:curtains_closed_orange"
               minetest.set_node(pos, node)
        else
                if item == 'dye:red' then
            node.name = "sn_furniture:curtains_closed_red"
               minetest.set_node(pos, node)
        else
                if item == 'dye:magenta' then
            node.name = "sn_furniture:curtains_closed_magenta"
               minetest.set_node(pos, node)
        else
                if item == 'dye:pink' then
            node.name = "sn_furniture:curtains_closed_pink"
               minetest.set_node(pos, node)
        else
                if item == 'dye:brown' then
            node.name = "sn_furniture:curtains_closed_brown"
               minetest.set_node(pos, node)
                      end
                     end
                    end
                   end
                  end
                 end
                end
               end
              end
             end
            end
           end
          end
         end
        end
       end
		 end
})

minetest.register_node("sn_furniture:curtains_2_tall_"..color, {
	description= name.. " Tall Curtains",
	tiles = {"wool_"..color..".png"},
	drawtype= "nodebox",
	paramtype= "light",
	paramtype2 = "facedir",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, furniture = 1},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		node.name = "sn_furniture:curtains_2_tall_closed_"..color 
		minetest.set_node(pos, node)
	end,
	node_box= {
		type= "fixed",
		fixed= {
			{-0.5, -0.3, 0.5, -0.2, 0.5, 0.4},
			{-0.5, -0.5, 0.5, -0.3, -0.3, 0.4},
			{-0.5, 0.5, 0.5, 0.5, 0.2, 0.4},
			{0.5, -0.3, 0.5, 0.2, 0.5, 0.4},
			{0.5, -0.5, 0.5, 0.3, -0.3, 0.4},
			{-0.5, -0.5, 0.5, -0.3, -1.2, 0.4},
			{0.5, -0.5, 0.5, 0.3, -1.2, 0.4},
			{-0.5, -1.2, 0.5, -0.4, -1.5, 0.4},
			{0.5, -1.2, 0.5, 0.4, -1.5, 0.4},
		},
	},
	on_punch = function(pos, node, clicker)
	for _, obj in ipairs (minetest.get_connected_players())  do
        local item = obj:get_wielded_item():get_name()
        if item == 'dye:black' then
            node.name = "sn_furniture:curtains_2_tall_black"
               minetest.set_node(pos, node)
        else
                if item == 'dye:white' then
            node.name = "sn_furniture:curtains_2_tall_white"
               minetest.set_node(pos, node)
        else
                if item == 'dye:grey' then
            node.name = "sn_furniture:curtains_2_tall_grey"
               minetest.set_node(pos, node)
        else
        if item == 'dye:dark_grey' then
            node.name = "sn_furniture:curtains_2_tall_dark_grey"
               minetest.set_node(pos, node)
        else
                if item == 'dye:violet' then
            node.name = "sn_furniture:curtains_2_tall_violet"
               minetest.set_node(pos, node)
        else
                if item == 'dye:blue' then
            node.name = "sn_furniture:curtains_2_tall_blue"
               minetest.set_node(pos, node)
        else
                if item == 'dye:cyan' then
            node.name = "sn_furniture:curtains_2_tall_cyan"
               minetest.set_node(pos, node)
        else
                if item == 'dye:dark_green' then
            node.name = "sn_furniture:curtains_2_tall_dark_green"
               minetest.set_node(pos, node)
        else
                if item == 'dye:green' then
            node.name = "sn_furniture:curtains_2_tall_green"
               minetest.set_node(pos, node)
        else
                if item == 'dye:yellow' then
            node.name = "sn_furniture:curtains_2_tall_yellow"
               minetest.set_node(pos, node)
        else
                if item == 'dye:orange' then
            node.name = "sn_furniture:curtains_2_tall_orange"
               minetest.set_node(pos, node)
        else
                if item == 'dye:red' then
            node.name = "sn_furniture:curtains_2_tall_red"
               minetest.set_node(pos, node)
        else
                if item == 'dye:magenta' then
            node.name = "sn_furniture:curtains_2_tall_magenta"
               minetest.set_node(pos, node)
        else
                if item == 'dye:pink' then
            node.name = "sn_furniture:curtains_2_tall_pink"
               minetest.set_node(pos, node)
        else
                if item == 'dye:brown' then
            node.name = "sn_furniture:curtains_2_tall_brown"
               minetest.set_node(pos, node)
                      end
                     end
                    end
                   end
                  end
                 end
                end
               end
              end
             end
            end
           end
          end
         end
        end
       end
		 end
})

minetest.register_node("sn_furniture:curtains_2_tall_closed_"..color, {
	description= name.. " Closed Tall Curtains",
	tiles = {"wool_"..color..".png"},
	drawtype= "nodebox",
	paramtype= "light",
	paramtype2 = "facedir",
	drop = "sn_furniture:curtains_2_tall_"..color,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, not_in_creative_inventory = 1},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		node.name = "sn_furniture:curtains_2_tall_"..color 
		minetest.set_node(pos, node)
	end,
	node_box= {
		type= "fixed",
		fixed= {
			   {0.5, 0.5, 0.5, -0.5, -1.5, 0.4},
		},
	},
	on_punch = function(pos, node, clicker)
	for _, obj in ipairs (minetest.get_connected_players())  do
        local item = obj:get_wielded_item():get_name()
        if item == 'dye:black' then
            node.name = "sn_furniture:curtains_2_tall_closed_black"
               minetest.set_node(pos, node)
        else
                if item == 'dye:white' then
            node.name = "sn_furniture:curtains_2_tall_closed_white"
               minetest.set_node(pos, node)
        else
                if item == 'dye:grey' then
            node.name = "sn_furniture:curtains_2_tall_closed_grey"
               minetest.set_node(pos, node)
        else
        if item == 'dye:dark_grey' then
            node.name = "sn_furniture:curtains_2_tall_closed_dark_grey"
               minetest.set_node(pos, node)
        else
                if item == 'dye:violet' then
            node.name = "sn_furniture:curtains_2_tall_closed_violet"
               minetest.set_node(pos, node)
        else
                if item == 'dye:blue' then
            node.name = "sn_furniture:curtains_2_tall_closed_blue"
               minetest.set_node(pos, node)
        else
                if item == 'dye:cyan' then
            node.name = "sn_furniture:curtains_2_tall_closed_cyan"
               minetest.set_node(pos, node)
        else
                if item == 'dye:dark_green' then
            node.name = "sn_furniture:curtains_2_tall_closed_dark_green"
               minetest.set_node(pos, node)
        else
                if item == 'dye:green' then
            node.name = "sn_furniture:curtains_2_tall_closed_green"
               minetest.set_node(pos, node)
        else
                if item == 'dye:yellow' then
            node.name = "sn_furniture:curtains_2_tall_closed_yellow"
               minetest.set_node(pos, node)
        else
                if item == 'dye:orange' then
            node.name = "sn_furniture:curtains_2_tall_closed_orange"
               minetest.set_node(pos, node)
        else
                if item == 'dye:red' then
            node.name = "sn_furniture:curtains_2_tall_closed_red"
               minetest.set_node(pos, node)
        else
                if item == 'dye:magenta' then
            node.name = "sn_furniture:curtains_2_tall_closed_magenta"
               minetest.set_node(pos, node)
        else
                if item == 'dye:pink' then
            node.name = "sn_furniture:curtains_2_tall_closed_pink"
               minetest.set_node(pos, node)
        else
                if item == 'dye:brown' then
            node.name = "sn_furniture:curtains_2_tall_closed_brown"
               minetest.set_node(pos, node)
                      end
                     end
                    end
                   end
                  end
                 end
                end
               end
              end
             end
            end
           end
          end
         end
        end
       end
		 end
})
end