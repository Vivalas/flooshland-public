obj/clothes
	var/slot
	var/resis
	use = 1
	var/tmp/worn = 0
	var/tmp/oname
	layer = MOB_LAYER + 1






obj/clothes/greent
	name = "Green Tunic"
	desc = "A stylin' green tunic!"
	icon = 'up.dmi'
	icon_state = "greent"
	slot = "torso"



	verb/Wear()
		if(!worn)
			for(var/obj/clothes/C in usr)
				if(C.worn)
					if(C.slot == src.slot)
						usr << "\red You already have clothes in that slot!"
						return
			usr.underlays += src
			worn = 1
			oname = name
			name = "[name] ([slot])"


		else
			usr.underlays -= /obj/clothes/greent
			worn = 0
			if(!usr.move)
				usr << "\red You cannot change whilst lying down!"
			name = oname



obj/clothes/redt
	name = "Red Tunic"
	desc = "A stylin' red tunic!"
	icon = 'up.dmi'
	icon_state = "redt"
	slot = "torso"

	verb/Wear()
		if(!worn)
			for(var/obj/clothes/C in usr)
				if(C.worn)
					if(C.slot == src.slot)
						usr << "\red You already have clothes in that slot!"
						return
			usr.underlays += src
			worn = 1
			oname = name
			name = "[name] ([slot])"


		else
			usr.underlays -= /obj/clothes/redt
			worn = 0
			if(!usr.move)
				usr << "\red You cannot change whilst lying down!"
			name = oname


obj/clothes/that
	name = "Top Hat"
	desc = "Only a real gentlemen has one of these!"
	icon = 'up.dmi'
	icon_state = "that"
	slot = "hat"

	verb/Wear()
		if(!worn)
			for(var/obj/clothes/C in usr)
				if(C.worn)
					if(C.slot == src.slot)
						usr << "\red You already have clothes in that slot!"
						return
			usr.underlays += src
			worn = 1
			oname = name
			name = "[name] ([slot])"


		else
			usr.underlays -= /obj/clothes/that
			worn = 0
			if(!usr.move)
				usr << "\red You cannot change whilst lying down!"
			name = oname















mob/var/list/torso
mob/var/list/head
mob/var/list/shoes
mob/var/list/armor