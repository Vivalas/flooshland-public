turf/Dirt
	icon = 'grass.dmi'
	icon_state = "dirt"
	desc = "A brown powder that makes up the majority of Flooshland."
	verb/Eat()
		set src in view(0)
		if(usr.ChkUse())
			if(usr.z == 11)
				return
			if(istype(get_step(src, UP), /turf/f))
				usr << "\blue You try to dig out the dirt but there is something hard underneath!"
				return
			usr << "\blue You scoop handfuls of dirt from the ground and shove them in your mouth!"
			view() << "\blue [usr] is scooping [src] from the ground and eating it!"
			if(usr.z <> 11)
				new /turf/Dexit (locate(src.x,src.y,src.z + 1))
			new /turf/Hole (src)
	verb/Lick()
		set src in view(0)
		if(usr.ChkUse())
			usr << "\blue You lick the dirt!"
			view() << "\blue [usr] licks the dirt!"

	proc/Grow()
		sleep(50)
		new /turf/Tree  (loc)


turf/f/fwall
	name = "Flooshium Wall"
	icon = 'grass.dmi'
	icon_state = "fwall"
	desc = "A sleek shiny white polished metal wall. Made out of the extremely strong alloy flooshium."
	density = 1
	opacity = 1






turf/f/ffloor
	name = "Flooshium Floor"
	icon = 'grass.dmi'
	icon_state = "ffloor"
	desc = "A sleek blue floor that is smooth to the touch."

turf/f/fdoor
	name = "Flooshium Door"
	icon = 'grass.dmi'
	icon_state = "fdoor"
	desc = "A sleek door that has to be opened using a lever."
	density = 1
	layer = MOB_LAYER + 1
	var/inop = 0
	var/in1
	var/in2
	var/secure
	var/list/authlist
	authlist = list("vivalas")
	proc/change()
		if(!density)
			density = 1
			icon_state = "fdoor"
			view() << "\blue [name] slides shut with a whir!"
			return
		if(density)
			density = 0
			icon_state = "fdooropen"
			view() << "\blue [name] slides open with a whir!"
			return

	Click()
		if(inop)
			return
		if(secure)
			if(usr.ckey in authlist)
				change()
				view() << "\green *ACCESS GRANTED*: [usr]"
				return
			else
				view() << "\red *ACCESS DENIED*: [usr]"
				return
		else
			change()


	fbdoor
		name = "Flooshium Blast Door"
		icon = 'grass.dmi'
		icon_state = "fbdoor"
		desc = "A strong impenetrable door."
		density = 1
		opacity = 1
		inop = 1
		layer = MOB_LAYER + 1

		change()
			if(!density)
				opacity = 1
				density = 1
				icon_state = "fbdoor"
				view() << "\blue [name] clamps shut with a hiss!"
				return
			if(density)
				density = 0
				opacity = 0
				icon_state = "fbdooropen"
				view() << "\blue [name] hisses open!"
				return







turf/f/fglass
	name = "Flooshium Glass"
	icon = 'grass.dmi'
	icon_state = "fglass"
	desc = "A sleek black glass that is nearly indestructable, but temporairily opens and closes for bullets. It is made out of the alloy Flooshium."
	density = 1

turf/var/ini

obj/Lever
	desc = "A lever made out of Flooshium."
	icon = 'grass.dmi'
	icon_state = "lever"
	use = 0
	var/ini
	Click()
		if(usr.ChkUse())
			if(icon_state == "lever")
				icon_state = "lever2"
			else
				icon_state = "lever"

			for(var/turf/f/fdoor/f in world)
				if(f.ini == src.ini)
					f.change()
			for(var/turf/f/fdoor/fbdoor)
				if(fbdoor.ini == src.ini in world)
					fbdoor.change()





turf/grass
	name = "Grass"
	icon_state = "grass"
	desc = "Lush green wavy grass!"
	var/use = 0
	icon = 'grass.dmi'
	verb/Eat()
		if(usr.ChkUse())
			set src in view(0)
			usr << "\blue You pull grass out of the ground and eat it!"
			view() << "\blue [usr] must be crazy! They hungrily pull tufts of grass out of the ground and stuff it in their mouth!"
			new /turf/Dirt (src)
	verb/Lick()
		set src in view(0)
		usr << "\blue You lick the grass!"
		view() << "\blue [usr] licks the grass! What is wrong with them?"


turf/Tree
	density = 1
	desc = "A tree of flooshy proportions."
	icon = 'grass.dmi'
	icon_state = "tree"
	var/wood = 4
	DblClick()
		if(usr.ChkUse() && src in view(1))
			if(istype(usr.equip,/obj/Axe))
				view() << "\blue [usr] chops the tree!"
				wood -= 1
				new/obj/Wood(usr)
				if(!wood)
					new /turf/grass (src)
					new /obj/tseeds (usr)
					if(prob(50))
						new /obj/tseeds (src)



turf/wwall
	name = "Wooden Wall"
	icon = 'grass.dmi'
	icon_state = "wwall"
	desc = "A sturdy wooden wall."
	density = 1
	opacity = 1

turf/wfloor
	name = "Wooden Floor"
	icon = 'grass.dmi'
	icon_state = "wfloor"
	desc = "A sturdy wooden floor."

turf/wdoor
	name = "Wooden Door"
	icon = 'grass.dmi'
	icon_state = "wdoor"
	desc = "A sturdy wooden door."
	density = 1
	layer = MOB_LAYER + 1
	var/in1
	var/in2
	var/secure
	var/list/authlist
	authlist = list("vivalas")
	proc/change()
		if(!density)
			density = 1
			icon_state = "wdoor"
			view() << "\blue [name] slides shut with a whir!"
			return
		if(density)
			density = 0
			icon_state = "wdooropen"
			view() << "\blue [name] slides open with a whir!"
			return

	Click()
		if(secure)
			if(usr.ckey in authlist)
				change()
				view() << "\green *ACCESS GRANTED*: [usr]"
				return
			else
				view() << "\red *ACCESS DENIED*: [usr]"
				return
		else
			change()
turf/wglass
	name = "Wooden Window"
	icon = 'grass.dmi'
	icon_state = "wglass"
	desc = "A sturdy wooden opening."
	density = 1

turf/s/swall
	name = "Stone Wall"
	icon = 'grass.dmi'
	icon_state = "swall"
	desc = "A wall of solid stone, don't expect to be able to eat through this!"
	density = 1
	opacity = 1
	DblClick()
		if(usr.ChkUse() && istype(usr.equip,/obj/PickA) && src in view(1))
			view() << "\blue [usr] is picking away at the wall!"
			var/start = usr.loc
			sleep(25)
			if(usr.ChkUse() && usr.move && usr.loc == start && istype(usr.equip,/obj/PickA))
				new /turf/s/sfloor (src)

turf/s/sfloor
	name = "Stone Floor"
	icon = 'grass.dmi'
	icon_state = "sfloor"
	desc = "A smooth sleek floor made out of rock."
	DblClick()

		if(usr.ChkUse() && istype(usr.equip,/obj/PickA) && src in view(1))
			view() << "\blue [usr] is picking away at the floor!"
			var/start = usr.loc
			sleep(50)
			if(usr.ChkUse() && istype(usr.equip,/obj/PickA) && usr.loc == start)
				if(usr.z == 11)
					return
				if(istype(get_step(src, UP), /turf/f))
					usr << "\blue You try to pick out the stone but there is something hard underneath!"
					return

				if(usr.z <> 11)
					var/turf/Dexit/D = new(locate(src.x,src.y,src.z + 1))
					var/turf/Hole/H = new(src)
					D.icon_state = "s_holeexit"
					H.icon_state = "s_hole"