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
		move = 0
		src << "\red\bold You drop dead on to the floor!"
		view() << "\red\bold [src] drops dead onto the floor!"
		dead = 1




mob/proc/Bleed(br,bs)
	new/obj/blood(src.loc)
	bleed = br
	src.ChkGore()
	var/i
	for(i=0,i<bs,i++)
		if(dead)
			br = 0
		src.Dmg(br)
		sleep(10)
	if(i==bs)
		br = 0
		bleed = 0
		src << "\green You stop bleeding!"
		oview() << "[src] stops bleeding!"




mob/Move()
	if(bleed && !(locate(/obj/blood/) in loc)) new/obj/blood(loc)
	..()






mob/Move()
	if(dead||!legs||stuck)
		return
	..()




mob/proc/Explode()
	src << "\red\bold You are enveloped in a powerful explosion!"
	src.Dmg(rand(25,50))
	if(prob(50))
		src.legs = 0
	if(prob(50))
		src.arms = 0
	src.ChkLimbs()
	if(prob(95))
		spawn() src.Bleed(rand(1,5),15)

	for(var/mob/M in view(2))
		if(M == src)
			continue

	src << "\red\bold You are enveloped in a powerful explosion!"
	src.Dmg(rand(25,50))
	if(prob(50))
		src.legs = 0
	if(prob(50))
		src.arms = 0
	src.ChkLimbs()
	if(prob(95))
		spawn() src.Bleed(rand(1,5),15)

