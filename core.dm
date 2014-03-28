/*
	These are simple defaults for your project.
 */

world
	fps = 25		// 25 frames per second
	icon_size = 32	// 32x32 icon size by default

	view = 7		// show up to 6 tiles outward from center (13x13 view)



// Make objects move 8 pixels per tick when walking


mob
    var
        move_delay = 2
        tmp
            move_time = 0

    Move()
        if(world.time < move_time)
            return

        // set the move_time for move_delay ticks from now
        move_time = world.time + move_delay
        return ..() // do the default Move() proc and return what it ret





client
	Northeast()
		return 0
	Northwest()
		return 0
	Southeast()
		return 0
	Southwest()
		return 0

