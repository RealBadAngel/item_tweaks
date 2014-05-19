-- item drop code by kaeza

function minetest.item_drop(itemstack, dropper, pos)
	if dropper.get_player_name then
		local v = dropper:get_look_dir()
		local p = {x=pos.x+v.x, y=pos.y+1.5+v.y, z=pos.z+v.z}
		local r
		if dropper:get_player_control().sneak then
			r = itemstack
			itemstack = itemstack:to_table()
			itemstack.count = 1
			itemstack = ItemStack(itemstack)
			r:take_item()
		else
			r = ItemStack("")
		end
		local obj = minetest.add_item(p, itemstack)
		if obj then
			v.x = v.x*2
			v.y = v.y*2 + 1
			v.z = v.z*2
			obj:setvelocity(v)
		end
		return r
		else
			minetest.add_item(pos, itemstack)
			return ItemStack("")
		end
end
