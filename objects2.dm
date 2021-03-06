obj/Axe
	desc = "For cutting trees, not flooshes."
	use = 1
	icon = 'sword.dmi'
	icon_state = "axe"

	verb/Equip()
		set name = "Equip/Unequip"
		if(!usr.ChkUse())
			return
		if(!usr.move)
			return
		if(src == usr.equip)
			usr.equip = "None"
			view() << "\red [usr] sheathes their axe!"
			usr.overlays -= 'axeo.dmi'
			return
		else
			if(usr.equip == "None")
				usr.equip = src
				view() << "\red [usr] draws their axe!"
				usr.overlays += 'axeo.dmi'

obj/Wood
	use = 1
	desc = "Used for building."
	icon = 'grass.dmi'
	icon_state = "wood"

	verb/Craft()
		if(!usr.ChkUse())
			return
		if(!usr.move)
			return
		var/choice = input("Choose what to craft.","Crafting") in list("Wall","Door","Window","Floor","Ramp")
		if(choice == "Wall")
			view() << "\blue [usr] builds a wall!"
			new /turf/wwall (usr.loc)
			del src
			return
		if(choice == "Door")
			view() << "\blue [usr] builds a door!"
			new /turf/wdoor (usr.loc)
			del src
			return
		if(choice == "Window")
			view() << "\blue [usr] builds a window!"
			new /turf/wglass (usr.loc)
			del src
			return
		if(choice == "Floor")
			view() << "\blue [usr] builds a floor!"
			new /turf/wfloor (usr.loc)
			del src
			return
		if(choice == "Ramp")
			view() << "\blue [usr] builds a ramp!"
			new /obj/Ramp (usr.loc)
			del src
			return


obj/tseeds
	name = "Tree Seeds"
	use = 1
	desc = "Small vessels of life that can grow into trees!"
	icon = 'grass.dmi'
	icon_state = "seeds"
	edible = 1
	verb/Plant(turf/Dirt/D in view(1))
		if(usr.ChkUse())
			view() << "\blue [usr] plants some tree seeds!"
			if(!istype(D,/turf/Dirt))
				return
			invisibility = 101
			name = null
			del src


obj/Spawner3
	weld = 1
	name = "Tool"
	icon = 'spawner.dmi'
	icon_state = "green"
	DblClick()
		set src in view(1)
		if(usr.ChkUse())
			if(!(locate(/obj/Axe) in src.loc))
				if(prob(50))
					new/obj/PickA(src.loc)
					return
				new/obj/Axe(src.loc)

turf/Hole
	icon = 'grass.dmi'
	icon_state = "hole"
	desc = "A dark hole that leads to the depths below."
	Entered()
		if(src.z == 11)
			return
		usr.loc = locate(src.x,src.y,src.z + 1)

turf/dwall
	name = "Dirt Wall"
	icon = 'grass.dmi'
	icon_state = "dwall"
	desc = "A solid wall made out of packed dirt!"
	density = 1
	opacity = 1
	layer = MOB_LAYER + 1
	verb/Eat()
		set src in view(1)
		if(usr.ChkUse())
			usr << "\blue You scoop dirt out of the wall and eat it!"
			view() << "\blue [usr] eats dirt out of the wall!"
			new /turf/Dirt(src)

turf/Dexit
	desc = "A passage to the surface!"
	name = "Exit"
	icon = 'grass.dmi'
	icon_state = "holeexit"
	Entered()
		usr.loc = locate(src.x,src.y,src.z - 1)

obj/explode
	weld = 1
	name = "Explosion"
	icon  = 'grass.dmi'
	icon_state = "explosion"
	layer = MOB_LAYER + 1
	New()
		sleep(10)
		del src


obj/Crate
	icon = 'objects.dmi'
	icon_state = "crate"
	desc = "A shiny metal box to fill with junk!"
	var/open
	verb/toggle()
		set src in view(1)
		set name = "Open/Close"
		if(usr.ChkUse())
			if(open)
				icon_state = "crate"
				open = 0
				for(var/obj/O in loc)
					if(O <> src)
						if(O.use)
							O.loc = src
			else
				icon_state = "crateo"
				for(var/obj/O in src.contents)
					O.loc = loc
				open = 1


obj/Spawner4
	weld = 1
	name = "Clothes Spawner"
	icon_state = "purple"
	var/atom/T
	icon = 'spawner.dmi'
	DblClick()
		set src in view(1)
		if(usr.ChkUse())
			if(!(locate(/obj/clothes) in src.loc))
				if(prob(5))
					new/obj/clothes/that(src.loc)
					return
				if(prob(25))
					new/obj/clothes/greent(src.loc)
					return
				new/obj/clothes/redt(src.loc)

obj/Ramp
	name = "Lift"
	weld = 1
	desc = "For moving objects up and down!"
	use = 0
	icon = 'objects.dmi'
	icon_state = "ramp"
	Click()
		for(var/obj/O in src.loc)
			if(O == src)
				continue
			if(z <> 1)
				if(locate(/obj/Ramp/) in locate(x,y,z - 1))
					view() << "\blue [usr] hoists [O] up the lift!"
					flick("rampup",src)
					flick("rampup",/obj/Ramp)
					O.loc = locate(x,y,z - 1)
					return
			if(z <> 11)
				if(locate(/obj/Ramp/) in locate(x,y,z + 1))
					view() << "\blue [usr] lowers [O] down the lift!"
					flick("rampdown",/obj/Ramp)
					O.loc = locate(x,y,z + 1)
					return



obj/StunRifle
	use = 1
	name = "Stun Rifle(4)"
	desc = "Pssh, what cop uses a taser these days!"
	icon = 'objects.dmi'
	icon_state = "stunrifle"


	verb/Equip()
		set name = "Equip/Unequip"
		if(!usr.ChkUse())
			return
		if(!usr.move)
			return
		if(src == usr.equip)
			usr.equip = "None"
			view() << "\red [usr] slings their stun rifle over their shoulder!"
			usr.overlays -= 'stuno.dmi'
			return
		else
			if(usr.equip == "None")
				usr.equip = src
				view() << "\red [usr] draws their stun rifle!"
				usr.overlays += 'stuno.dmi'
	var/ammo = 4
	var/tmp/rel = 0

	verb/Reload()
		if(usr.ChkUse())
			var/start = usr.loc
			usr << "\red You are reloading your stun rifle, don't move!"
			view() << "\blue [usr] is trying to reload their stun rifle!"
			rel = 1
			sleep(55)
			if(start <> usr.loc)
				usr << "\red You moved when trying to reload your stun rifle!"
				view() << "\red\bold [usr] failed to reload their stun rifle because they moved!"
				rel = 0
				return
			view() << "\red\bold [usr] reloads their stun rifle!"
			rel = 0
			ammo = 4
			src.name = "Stun Rifle([ammo])"


obj/PickA
	name = "Pickaxe"
	desc = "A tool for cutting into rock, the 'ol fashioned way."
	use = 1
	icon = 'sword.dmi'
	icon_state = "picka"

	verb/Equip()
		set name = "Equip/Unequip"
		if(!usr.ChkUse())
			return
		if(!usr.move)
			return
		if(src == usr.equip)
			usr.equip = "None"
			view() << "\red [usr] sheathes their pick!"
			usr.overlays -= 'picko.dmi'
			return
		else
			if(usr.equip == "None")
				usr.equip = src
				view() << "\red [usr] draws their pick!"
				usr.overlays += 'picko.dmi'


