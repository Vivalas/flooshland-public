mob/Stat()
	var/legsme = "Yes"
	var/armsme = "Yes"

	if(!legs)
		legsme = "No"

	if(!arms)
		armsme = "No"


	if(statpanel("Status"))
		stat("Health:",health)
		stat("Arms?",armsme)
		stat("Legs?",legsme)
		stat("Bleeding Rate:",bleed)

	statpanel("Inventory",contents)


mob/verb/PickUp(obj/O in view(1))
	set name = "Pick Up"
	if(O.use)
		O.loc = src.contents



obj
	DblClick()
		if(use)
			loc = src.contents


mob/verb/Say(m as text)
	set desc = "Enter what you want to say to those in sight!"
	if(!dead)
		view() << "\bold [src]\bold , \"[m]\""

mob/verb/OOC(m as text)
	set desc = "Enter what you want to transmit on the OOC channel!"
	if(!mute)
		view() << "\bold\cyan [src]: [m]"
	else
		src << "\red You have been muted!"

mob/verb/me(m as text)
	set desc = "Enter what you want to emote!"
	if(!dead)
		view() << "\bold [src]\bold [m]"

mob
	var/mute


mob/admin
	key = "vivalas"


mob/admin/verb/mute(mob/M in world)
	if(M.key)
		M.mute = 1

mob/admin/verb/reboot()
	world.Reboot()

mob/admin/verb/kick(mob/M in world)
	if(M.key)
		M << "You have been kicked from the game."
		M.Logout()


mob/admin/verb/teleport(mob/A in world,mob/B in world)
	A.loc = B.loc



mob/admin/verb/repop()
	world.Repop()



mob/admin/verb/announce(m as message)
	world << "\bold <BIG>[src] says:\bold\n [m]</BIG><BEEP> "



