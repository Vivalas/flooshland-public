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
	var/atom/T
	icon = 'spawner.dmi'
	icon_state = "green"
	DblClick()
		set src in view(1)
		if(usr.ChkUse())
			if(!(locate(/obj/Axe) in src.loc))
				new/obj/Axe(src.loc)