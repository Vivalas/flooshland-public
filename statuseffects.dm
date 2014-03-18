mob/Move()
	if(swag)
		view() << "\bold Woah! This guy ([src]) must be Captain Swaggins! He walks with pure and utter swag!\n He looks rather ~unstable~ in his current swagifiyed condition"
	..()

mob/proc/Dmg(N)
	health -= N
	usr.ChkHlth()






mob/proc/ChkHlth()
	if(health <= 0&&!dead)
		icon = 'corpse.dmi'
		move = 0
		usr << "\red\bold You drop dead on to the floor!"
		oview() << "\red\bold [usr] Drops dead onto the floor!"
		dead = 1




mob/proc/Bleed(br,bs)
	new/obj/blood(usr.loc)
	bleed = br
	usr.ChkGore()
	var/i
	for(i=0,i<bs,i++)
		if(dead)
			br = 0
		usr.Dmg(br)
		sleep(10)
	if(i==bs)
		br = 0
		bleed = 0
		usr << "\green You stop bleeding!"
		oview() << "[usr] stops bleeding!"




mob/Move()
	if(bleed && !(locate(/obj/blood/) in loc)) new/obj/blood(loc)
	..()






mob/Move()
	if(dead||!legs)
		return
	..()




proc/Explode()
	var/mob/M
	for(M in view(2))
		M << "\red\bold You are enveloped in a powerful explosion!"
		usr.Dmg(rand(25,50))
		if(prob(50))
			usr.legs = 0
		if(prob(50))
			usr.arms = 0
		usr.ChkLimbs()
		if(prob(95))
			M.Bleed(rand(1,5),15)

