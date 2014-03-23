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


proc/get_line(atom/A, atom/B)
	if(!A || !B)
		return list()

	if(A.z != B.z)
		return list()

	var
		x0 = A.x
		x1 = B.x
		y0 = A.y
		y1 = B.y

	var/vertical = abs(y1-y0) > abs(x1-x0)

	if(vertical)
		x0 = A.y
		y0 = A.x
		x1 = B.y
		y1 = B.x

	if(x0 > x1)
		var/temp = x0
		x0 = x1
		x1 = temp

		temp = y0
		y0 = y1
		y1 = temp

	var
		dx = x1 - x0
		dy = abs(y1 - y0)
		error = 0
		derror = dy / dx
		ystep = y0<y1?1:-1
		y = y0

	var/line[0]
	for(var/x in x0 to x1)
		if(vertical)
			line += locate(y, x, A.z)
		else
			line += locate(x, y, A.z)
		error += derror
		if(error >= 0.5)
			y += ystep
			error -= 1

	return line