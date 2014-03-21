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

	statpanel("Inventory",usr.contents)



mob/verb/PickUp(obj/O in view(1))
	set name = "Pick Up"
	if(O.use)
		O.loc = src.contents



obj
	DblClick()
		if(use&&usr.ChkUse())
			loc = usr


obj
	Click()
		if(src in usr)
			loc = usr.loc




mob/verb/Say(m as text)
	set category = "Chat"
	set desc = "Enter what you want to say to those in sight!"
	if(!dead)
		view() << "\bold [src]\bold , \"[m]\""

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



mob/verb/help(t as text)
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
			src << "[M.name]"



mob/verb/adminwho()
	src << "\bold Active Administrators:\n"
	for(var/mob/admin/M in world)
		if(M.key)
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

