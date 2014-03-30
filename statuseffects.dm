mob/Move()
	if(swag)
		view() << "\bold Woah! This guy ([src]) must be Captain Swaggins! He walks with pure and utter swag!\n He looks rather ~unstable~ in his current swagifiyed condition"
	..()

mob/proc/Dmg(N)
	health -= N
	src.ChkHlth()






mob/proc/ChkHlth()
	if(health <= 0&&!dead)
		icon = 'corpse.dmi'
		src << "\red\bold You drop dead on to the floor!"
		view() << "\red\bold [src] drops dead onto the floor!"
		dead = 1
		density = 0
		for(var/obj/clothes/C in src)
			C.icon = 'up.dmi'
			C.layer = OBJ_LAYER
		for(var/obj/O in src)
			O.loc = src.loc
		src.equip = "None"
		src.overlays = null
		src.underlays = null
		name = "[name]'s corpse"

	if(dead && health > 0)
		icon = 'floosh.dmi'
		icon_state = "up"
		dead = 0
		view() << "\red\bold [src] has risen from the dead!"
		density = 1



mob/proc/Bleed(br,bs)
	if(!(locate(/obj/blood) in loc)) new/obj/blood(loc)
	var/i
	if(dead)
		return
	bleed = br
	ChkGore()
	for(i=0,i<bs,i++)
		if(dead)
			br = 0
		Dmg(br)
		bleed = br
		sleep(10)
	if(i==bs)
		bleed = 0
		src << "\green You stop bleeding!"
		oview() << "[src] stops bleeding!"




mob/Move()
	if(bleed && !(locate(/obj/blood/) in loc)) new/obj/blood(loc)
	..()






mob/Move()
	if(dead||!legs||stuck||!move)
		return
	..()




mob/proc/Explode()
	for(var/mob/M in view(2))
		M << "\red\bold You are enveloped in a powerful explosion!"
		M.Dmg(rand(25,50))
		if(prob(50))
			M.legs = 0
		if(prob(50))
			M.arms = 0
		M.ChkLimbs()
		if(prob(95))
			spawn() M.Bleed(rand(1,5),15)
		M.overlays = null
		M.equip = "None"
	for(var/turf/T in view(2))
		spawn() new/obj/explode (T)

mob/var/stun
mob/proc/stun(n as num)
		density = 0
		move = 0
		src << "\red\bold You are stunned!"
		view() << "\red [src] has been stunned!"
		icon_state = "ground"
		overlays = null
		equip = null
		underlays = null
		stun = 1
		for(var/obj/clothes/C in src.contents)
				C.icon = 'down.dmi'
				src.underlays += C
		sleep(n)
		src << "\green You recover!"
		stun = 0

mob/admin/verb/stunperson(mob/M)
	M.stun(10)
