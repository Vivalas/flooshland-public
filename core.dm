/*
	These are simple defaults for your project.
 */

world
	fps = 25		// 25 frames per second
	icon_size = 32	// 32x32 icon size by default

	view = 10		// show up to 6 tiles outward from center (13x13 view)
	mob = /mob


// Make objects move 8 pixels per tick when walking
world
	status = "\[MAIN SERVER] Hosted by Vivalas (BYOND SHELL SERVER)"

mob
    var
        move_delay = 2
        tmp
            move_time = 0





client
	Northeast()
		return 0
	Northwest()
		return 0
	Southeast()
		return 0
	Southwest()
		return 0



proc/blp(var/atom/point_a, var/atom/point_b)
   	var/list/inline_turfs = get_line(point_a, point_b)
   	for(var/turf/t in inline_turfs)

        if(t.is_blockade())
            return 1

turf
    proc/is_blockade()

        for(var/turf/fglass in src)
            return 1

area
	invisibility = 101