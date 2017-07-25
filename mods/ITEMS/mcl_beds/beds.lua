-- 3D bed

local nodebox = {
	bottom = {
		{-0.5, -5/16, -0.5, 0.5, 0.06, 0.5},
		{-0.5, -0.5, -0.5, -5/16, -5/16, -5/16},
		{0.5, -0.5, -0.5, 5/16, -5/16, -5/16},
	},
	top = {
		{-0.5, -5/16, -0.5, 0.5, 0.06, 0.5},
		{-0.5, -0.5, 0.5, -5/16, -5/16, 5/16},
		{0.5, -0.5, 0.5, 5/16, -5/16, 5/16},
	},
}

local colors = {
	-- { ID, decription, wool, dye }
	{ "red", "Red Bed", "mcl_wool:red", "mcl_dye:red" },
	{ "blue", "Blue Bed", "mcl_wool:blue", "mcl_dye:blue" },
	{ "cyan", "Cyan Bed", "mcl_wool:cyan", "mcl_dye:cyan" },
	{ "grey", "Grey Bed", "mcl_wool:grey", "mcl_dye:dark_grey" },
	{ "silver", "Light Grey Bed", "mcl_wool:silver", "mcl_dye:grey" },
	{ "black", "Black Bed", "mcl_wool:black", "mcl_dye:black" },
	{ "yellow", "Yellow Bed", "mcl_wool:yellow", "mcl_dye:yellow" },
	{ "green", "Green Bed", "mcl_wool:green", "mcl_dye:dark_green" },
	{ "magenta", "Magenta Bed", "mcl_wool:magenta", "mcl_dye:magenta" },
	{ "orange", "Orange Bed", "mcl_wool:orange", "mcl_dye:orange" },
	{ "purple", "Purple Bed", "mcl_wool:purple", "mcl_dye:violet" },
	{ "brown", "Brown Bed", "mcl_wool:brown", "mcl_dye:brown" },
	{ "pink", "Pink Bed", "mcl_wool:pink", "mcl_dye:pink" },
	{ "lime", "Lime Bed", "mcl_wool:lime", "mcl_dye:green" },
	{ "light_blue", "Light Blue Bed", "mcl_wool:light_blue", "mcl_dye:lightblue" },
	{ "white", "White Bed", "mcl_wool:white", "mcl_dye:white" },
}

for c=1, #colors do
	local colorid = colors[c][1]

	-- Recoloring recipe for white bed
	minetest.register_craft({
		type = "shapeless",
		output = "mcl_beds:bed_"..colorid.."_bottom",
		recipe = { "mcl_beds:bed_white_bottom", colors[c][4] },
	})

	-- Register bed
	mcl_beds.register_bed("mcl_beds:bed_"..colorid, {
		description = colors[c][2],
		inventory_image = "mcl_beds_bed_"..colorid..".png",
		wield_image = "mcl_beds_bed_"..colorid..".png",
		tiles = {
			bottom = {
				"mcl_beds_bed_top_bottom_"..colorid..".png^[transformR90",
				"default_wood.png^mcl_beds_bed_bottom_bottom.png",
				"mcl_beds_bed_side_bottom_r_"..colorid..".png",
				"mcl_beds_bed_side_bottom_r_"..colorid..".png^[transformfx",
				"mcl_beds_bed_side_top_"..colorid..".png",
				"mcl_beds_bed_side_bottom_"..colorid..".png"
			},
			top = {
				"mcl_beds_bed_top_top_"..colorid..".png^[transformR90",
				"default_wood.png^mcl_beds_bed_bottom_top.png",
				"mcl_beds_bed_side_top_r_"..colorid..".png",
				"mcl_beds_bed_side_top_r_"..colorid..".png^[transformfx",
				"mcl_beds_bed_side_top_"..colorid..".png",
				"mcl_beds_bed_side_bottom_"..colorid..".png"
			}
		},
		nodebox = nodebox,
		selectionbox = {
			bottom = {-0.5, -0.5, -0.5, 0.5, 0.06, 0.5},
			top = {-0.5, -0.5, -0.5, 0.5, 0.06, 0.5},
		},
		-- Simplified collision box because Minetest acts weird if we use the nodebox one
		collisionbox = {
			bottom = {-0.5, -0.5, -0.5, 0.5, 0.06, 0.5},
			top = {-0.5, -0.5, -0.5, 0.5, 0.06, 0.5},
		},
		-- Main bed recipe
		recipe = {
			{colors[c][3], colors[c][3], colors[c][3]},
			{"group:wood", "group:wood", "group:wood"}
		},
	})

end

minetest.register_alias("beds:bed_bottom", "mcl_beds:bed_red_bottom")
minetest.register_alias("beds:bed_top", "mcl_beds:bed_red_top")
