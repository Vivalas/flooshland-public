mob/badmin/verb/mute(mob/M in world)
	set category = "Badmin"
	if(M.key)
		M.mute = 1

mob/badmin/verb/reboot()
	set category = "Badmin"
	world.Reboot()

mob/badmin/verb/punch(mob/M in world)
	set category = "Badmin"
	if(M.key)
		M << "You have been punched out of the game by DX's glorious cock!"
		M.Logout()

mob/badmin/verb/port (mob/A in world,mob/B in world)
	set category = "Badmin"
	A.loc = B.loc

mob.badmin/verb/declare(m as message)
	set category = "Badmin"
	world << "\bold <BIG>[src] says:\bold\n [m]</BIG><BEEP> "

mob/badmin/verb/corrupt(mob/m in world, t as text)
	set category = "Badmin"
	m << "\n\blue If you start hearing voices, do as they say!\n\n \bold\red The voices urge you to [t]"

mob/badmin/verb/hurt(mob/m in world,N as num)
	set category = "Badmin"
	set name = "Damage/Heal"
	m.Dmg(N)

mob/badmin/verb/omnipotence(mob/M in world)
	set category = "Badmin"
	src.client.eye = M

mob/badmin/verb/doom(mob/m)
	set category = "Badmin"
	if(m.stuck)
		m << "\green The Devil has spared you!"
		view() << "The Devil has spared [m]."
		m.stuck = 0
		return
	if(!(locate(/obj/blood) in loc)) new/obj/blood(loc)
	m.Explode()
	m.Dmg(99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999)
	m << "\bold\red You are blinded by an explosion of flesh!"
	m << "\red You're DOOOOOMED!!!!"
	m << "\red\bold You scream in agony as your blood boils!"
	view() << "\red\bold A fountain of blood erupts from [m]!"
	m.stuck = 1

mob/verb/BadminGrief(t as text)
	for(var/mob/badmin/M in world)
		M << "\blue HELP ([src]):\blue \red[t]"
		src << "\blue Your PM to the badmin has been recieved."

mob/badmin
    key = "DXblueshadow"

mob/badmin/verb/Dungeuon(mob/M in world)
	set category = "Badmin"
	for(var/obj/O in M)
		del O
	M.loc = locate(5,24,1)
	M << "\red\bold <U><BIG> You have been thrown in the dungeun! All your items have been taken!"
	M << "\red\n You will be held here until the badmin is done with you!"

mob/badmin/verb/Swagpocalypse()
	set category= "Badmin"
	for(var/mob/M in world)
		M.swag = 100
	world << "\blue Everything is suddenly enveloped in a mass of pure swag!"


mob/badmin/verb/achat(t as text)
	set category = "Badmin"
	for(var/mob/badmin/M in world)
		M << "\green\bold ADMINCHAT [src]: [t]"

mob/badmin
	see_invisible = 100

mob/badmin/verb/Invisibility()
	set category = "Badmin"
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
