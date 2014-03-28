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
			pulling = 1
		else
			M.pull = null
			pulling = 0
			walk(M,null)


mob/var/pull
obj/var/pull
mob/var/pulling
mob/var/oloc

mob/Move()
	if(pulling)
		for(var/mob/M in view(1))
			if(M.pull == usr)
				walk_to(M,usr,1)
		for(var/mob/M in world)
			if(M.pull == usr)
				if(get_dist(usr,M) > 1)
					M.pull = null
					pulling = 0
					walk(M,null)



	..()









