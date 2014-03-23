mob/Stat()
	var/legsme = "Yes"
	var/armsme = "Yes"

	if(!legs)
		legsme = "No"

	if(!arms)
		armsme = "No"


	if(statpanel("Status"))
		stat("Health:",health)
		stat("Equipped:",equip)
		stat("Arms?",armsme)
		stat("Legs?",legsme)
		stat("Bleeding Rate:",bleed)


	statpanel("Inventory",usr.contents)



mob/verb/PickUp(obj/O in view(1))
	set name = "Pick Up"
	if(O in view(1))
		if(O.use)
			if(usr.ChkUse())
				if(locate(/obj/Rifle) in usr)
					if(istype(O,/obj/Rifle))
						usr << "\red You can only hold one of each weapon at a time!"
						return
				if(locate(/obj/Sword) in usr)
					if(istype(O,/obj/Sword))
						usr << "\red You can only hold one of each weapon at a time!"
						return
				if(locate(/obj/deathsword) in usr)
					if(istype(O,/obj/deathsword))
						usr << "\red You can only hold one of each weapon at a time!"
						return
				O.loc = usr
				view() << "\blue [usr] picks up a [O]"




obj
	DblClick()
		if(src in view(1))
			if(src.use)
				if(usr.ChkUse())
					if(locate(/obj/Rifle) in usr)
						if(istype(src,/obj/Rifle))
							usr << "\red You can only hold one of each weapon at a time!"
							return
					if(locate(/obj/Sword) in usr)
						if(istype(src,/obj/Sword))
							usr << "\red You can only hold one of each weapon at a time!"
							return
					if(locate(/obj/deathsword) in usr)
						if(istype(src,/obj/deathsword))
							usr << "\red You can only hold one of each weapon at a time!"
							return
					loc = usr
					view() << "\blue [usr] picks up a [src]"





mob/verb/Say(m as text)
	set category = "Chat"
	set desc = "Enter what you want to say to those in sight!"
	if(!dead)
		view() << "\bold [src]\bold says, \"[m]\""

mob/verb/OOC(m as text)
	set category = "Chat"
	set desc = "Enter what you want to transmit on the OOC channel!"
	if(!mute)
		view() << "\bold\cyan OOC [src]: [m]"
	else
		src << "\red You have been muted!"

mob/verb/me(m as text)
	set category = "Chat"
	set desc = "Enter what you want to emote!"
	if(!dead)
		view() << "\bold [src]\bold [m]"

mob
	var/mute


mob/admin
	key = "vivalas"


mob/admin/verb/mute(mob/M in world)
	set category = "Admin"
	if(M.key)
		M.mute = 1

mob/admin/verb/reboot()
	set category = "Admin"
	world.Reboot()

mob/admin/verb/kick(mob/M in world)
	set category = "Admin"
	if(M.key)
		M << "You have been kicked from the game."
		M.Logout()


mob/admin/verb/teleport(mob/A in world,mob/B in world)
	set category = "Admin"
	A.loc = B.loc



mob/admin/verb/repop()
	set category = "Admin"
	world.Repop()



mob/admin/verb/announce(m as message)
	set category = "Admin"
	world << "\bold <BIG>[src] says:\bold\n [m]</BIG><BEEP> "



mob/admin/verb/influence(mob/m in world, t as text)
	set category = "Admin"
	m << "\n\blue If an administrator tell you to do something, you should get to doing it!\n\n \bold\red You think [t]"



mob/admin/verb/hurt(mob/m in world,N as num)
	set category = "Admin"
	set name = "Damage/Heal"
	m.Dmg(N)


mob/admin/verb/omnipotence(mob/M in world)
	set category = "Admin"
	src.client.eye = M



mob/admin/verb/smite(mob/m)
	set category = "Admin"
	if(m.stuck)
		m << "\green The gods have spared you!"
		view() << "The gods have spared [m]."
		m.stuck = 0
		return
	m.Dmg(10)
	m << "\bold\red You are blinded by a blinding flash of light!"
	m << "\red Thou art smitten!"
	m << "\red\bold You are solidfied as your body turns to stone!"
	view() << "\red\bold A bolt of lightning lances down at [m]!"
	m.stuck = 1



mob/verb/Help(t as text)
	for(var/mob/admin/M in world)
		M << "\blue HELP ([src]):\blue \red[t]"


mob/admin/verb/achat(t as text)
	set category = "Admin"
	for(var/mob/admin/M in world)
		M << "\green\bold ADMINCHAT [src]: [t]"


mob/admin/verb/pm(mob/M in world, t as text)
	set category = "Admin"
	M << "\red\bold PM from Administrator\red \blue [src]\blue\bold : [t]"

mob/verb/Who()
	src << "\bold Active Players:\n"
	for(var/mob/M in world)
		if(M.key)
			if(M.client)
				src << "[M.name]"



mob/verb/Adminwho()
	src << "\bold Active Administrators:\n"
	for(var/mob/admin/M in world)
		if(M.key)
			if(M.client)
				src << "[M.name]"




mob/verb/Examine(atom/O in view())
	set category = null
	src << "\bold This is [O]\n\n\blue [O.desc]"

mob/verb/SetName(T as text)
	set name = "Set Name"
	set desc = "Choose your name!"
	if(src.nt == 1)
		src << "\red You can only set your name once!"
		return
	src.name = "[T] ([src.key])"
	src.nt++


mob/verb/liedown()
	set name = "Lie Down/Get Up"
	if(usr.ChkUse())
		if(!density)
			density = 1
			stuck = 0
			usr << "You stand up."
			view() << "[src] stands up!"
			icon_state = "up"


		else
			density = 0
			stuck = 1
			usr << "You lie down!"
			view() << "[src] lies down!"
			icon_state = "ground"
			usr.overlays = null
			usr.equip = "None"

mob/verb/Respawn()
	if(dead)
		if(key == "Vivalas")
			var/mob/admin/A = new(locate(1,1,1))
			A.res = 1
			res = 1
			A.name = usr.key
			client.mob = A
			return
		var/mob/M = new(locate(1,1,1))
		M.res = 1
		res = 1
		M.name = usr.key
		client.mob = M
	if(!dead)
		usr << "You are not currently dead!"

mob
	var/tmp/res


mob/verb/Sleep(n as num)
	set desc = "Enter how long you want to sleep, in seconds. Sleeping regenerates health and limbs. (Not reversable!)"
	view() << "\blue [usr] goes to sleep!"
	density = 0
	move = 0
	icon_state = "ground"
	client.eye = null
	usr.equip = "None"
	usr.overlays = null
	var/i
	for(i=0,i<n,i++)
		sleep(10)
		if(prob(50))
			if(health < 100)
				health++
		if(prob(5)&&!arms)
			usr << "\green Your arms grow back!"
			view() << "\blue [usr]'s arms grow back!"
			arms = 1
		if(prob(5)&&!legs)
			usr << "\green Your legs grow back!"
			view() << "\blue [usr]'s legs grow back!"
			legs = 1
		if(i == n)
			break

	density = 1
	move = 1
	icon_state = "up"
	client.eye = usr
	view() << "\blue [usr] wakes up!"

mob/admin
	see_invisible = 100

mob/admin/verb/Invisibility()
	set category = "Admin"
	if(!invisibility)
		invisibility = 50
		density = 0
		view() << "\blue [usr] vanishes from sight!"
		return
	else
		density = 1
		invisibility = 0
		view() << "\blue [usr] materializes!"
		return


obj
	DblClick()
		if(usr.ChkUse())
			if(src in view(1))
				loc = usr.loc
				usr.overlays = null
				usr.equip = "None"

mob/admin/verb/cleanup(n as num)
	set category = "Admin"
	if(n == 1)
		world << "\bold\blue Deleting all corpses in 5 seconds! Respawn now!"
		sleep(10)
		world << "\blue\bold Deleting all corpses in 4 seconds!"
		sleep(10)
		world << "\bold\blue Deleting all corpses in 3 seconds!"
		sleep(10)
		world << "\bold\blue Deleting all corpses in 2 seconds!"
		sleep(10)
		world << "\bold\blue Deleting all corpses in 1 second!"
		sleep(10)
		world << "\bold\blue Deleting all corpses! May cause lag!"
		for(var/mob/M in world)
			if(M.dead)
				del M
		return
	if(n == 2)
		world << "\bold\blue Deleting all blood in the world! May cause lag!"
		for(var/obj/blood/B in world)
			del B
		return



