obj/Axe
	desc = "For cutting trees, not flooshes."
	use = 1
	icon = 'sword.dmi'
	icon_state = "axe"

	verb/Lick()
		if(usr.ChkUse())
			usr << "\blue You lick the axe!"
			view() << "\blue [usr] licks an axe!"
	verb/Eat()
		if(usr.ChkUse())
			usr << "\blue You gnaw on the axe!"
			view() << "\blue [usr] gnaws on an axe!"

	verb/Equip()
		set name = "Equip/Unequip"
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
		var/choice = input("Choose what to craft.","Crafting") in list("Wall","Door","Window","Floor")
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


obj/tseeds
	name = "Tree Seeds"
	use = 1
	desc = "Small vessels of life that can grow into trees!"
	icon = 'grass.dmi'
	icon_state = "seeds"
	verb/Eat()
		if(usr.ChkUse())
			view() << "\blue [usr] eats some tree seeds!"
			usr << "\blue You eat some tree seeds."
			del src
	verb/Lick()
		if(usr.ChkUse())
			usr << "\blue You lick some tree seeds!"
			view() << "\blue [usr] licks some tree seeds! Yuck!"

	verb/Plant(turf/Dirt/D in view(1))
		if(usr.ChkUse())
			view() << "\blue [usr] plants some tree seeds!"
			if(!istype(D,/turf/Dirt))
				return
			D.Grow()
			del src


obj/Spawner3
	name = "Tool"
	icon = 'spawner.dmi'
	icon_state = "green"
	DblClick()
		set src in view(1)
		if(usr.ChkUse())
			if(!(locate(/obj/Axe) in src.loc))
				new/obj/Axe(src.loc)

turf/Hole
	icon = 'grass.dmi'
	icon_state = "hole"
	desc = "A dark hole that leads to the depths below."
	Entered()
		usr.loc = locate(src.x,src.y,2)

turf/dwall
	name = "Dirt Wall"
	icon = 'grass.dmi'
	icon_state = "dwall"
	desc = "A solid wall made out of packed dirt!"
	density = 1
	opacity = 1
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
		usr.loc = locate(src.x,src.y,1)

obj/explode
	name = "Explosion"
	icon  = 'grass.dmi'
	icon_state = "explosion"
	layer = MOB_LAYER + 1
	New()
		sleep(10)
		del src


