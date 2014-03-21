/*
	These are simple defaults for your project.
 */

world
	fps = 25		// 25 frames per second
	icon_size = 32	// 32x32 icon size by default

	view = 6		// show up to 6 tiles outward from center (13x13 view)

mob
	step_size = 10

// Make objects move 8 pixels per tick when walking







client
	Northeast()
		return 0
	Northwest()
		return 0
	Southeast()
		return 0
	Southwest()
		return 0