world/New()
	spawn(10) DayNight()
	..()



/proc/DayNight()
	for()
		world << "\n\blue\bold The sun climbs over the eastern horizon."
		sleep(1200)
		world << "\n\blue\bold The sun ascends in the eastern sky."
		sleep(1200)
		world << "\n\blue\bold The sun rises directly over the plains as it is high noon."
		sleep(1200)
		world << "\n\blue\bold The sun descends in the western sky"
		sleep(1200)
		world << "\n\blue\bold The western horizon explodes into color as the sun sets."
		sleep(1200)
		world << "\n\blue\bold The sky goes dark as the moon rises into the heavens."
		sleep(1200)
		world << "\n\blue\bold The moon takes its place in the sky as midnight strikes."
		sleep(1200)
		world << "\n\blue\bold The moon begins its descent out of the heavens."
		sleep(1200)
		world << "\n\blue\bold The dawn breaks as the moon sweeps out of sight."


world
	hub = "Vivalas.Flooshland"