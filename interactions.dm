obj/verb/Eat()
	if(edible && usr.ChkUse())
		usr << "\blue You eat [name]!"
		view() << "\blue [usr] eats [name]!"
		del src
	else
		usr << "\blue You gnaw on [name]!"
		view() << "\blue [usr] gnaws on [name]!"

obj/var/edible = 0


obj/verb/Lick(obj/O in usr)
	if(usr.ChkUse())
		usr << "\blue You lick [name]!"
		view() << "\blue [usr] licks [name]!"

mob/verb/pull(mob/M in view(1))
	if(usr.ChkUse())
		if(pulling && M.pull <> usr)
			return
		if(!pulling)
			M.pull = usr
			pullmob = M
			pulling = 1
		else
			pullmob = null
			M.pull = null
			pulling = 0



mob/var/pull
obj/var/pull
mob/var/pulling
mob/var/pullmob
mob/var/oloc

mob/Move()
	if(world.time < move_time)
		return
	move_time = world.time + move_delay
		 // do the default Move() proc and return what it ret
	oloc = loc

	if(pull)
		if(restrained)
			return
		pull = null
	if(pulling)
		var/mob/M = pullmob
		if(get_dist(M,usr) > 1)

			M.pull = null
			pulling = 0
			pullmob = null
		for(var/mob/N in view(1))
			if(N.pull == usr)
				N.loc = oloc
	.=..()












