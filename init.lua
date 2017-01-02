

local modpath = minetest.get_modpath("treefelling")



function fell_tree(pos, oldnode, player)

		local height = 0
		--pos.y = pos.y + 1
		local name = minetest.get_node(pos).name
		minetest.set_node(pos, {name="air"})

		
		local trunk_name = name
		
		minetest.node_dig(pos, oldnode, player) 
		
		
		while name == trunk_name and height < 14 do
			height = height + 1
			pos.y = pos.y + 1
			name = minetest.get_node(pos).name
			local itemstacks = minetest.get_node_drops(name)
			for _, itemname in ipairs(itemstacks) do
				minetest.add_item(pos, itemname)
			end
			minetest.set_node(pos, {name="air"})
			print(name .. " = " .. trunk_name)
			print(height)
		end 
		

		
	end


minetest.override_item("default:tree", { on_dig = fell_tree })
minetest.override_item("default:jungletree", { on_dig = fell_tree })
minetest.override_item("default:pine_tree", { on_dig = fell_tree })
minetest.override_item("default:acacia_tree", { on_dig = fell_tree })
minetest.override_item("default:aspen_tree", { on_dig = fell_tree })

-- bug: handle roots
if minetest.get_modpath("treegrowth") then 
	minetest.override_item("treegrowth:tree_thin_1", { on_dig = fell_tree })
	minetest.override_item("treegrowth:tree_thin_2", { on_dig = fell_tree })
	minetest.override_item("treegrowth:tree_thin_3", { on_dig = fell_tree })
	minetest.override_item("treegrowth:tree_thin_4", { on_dig = fell_tree })
end
