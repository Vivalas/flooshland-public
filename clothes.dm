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

obj/clothes/sglass
	name = "Sunglasses"
	desc = "Rightfully deems the wearer to be badass."
	icon = 'up.dmi'
	icon_state = "sglass"
	slot = "eyes"

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
			usr.underlays -= /obj/clothes/sglass
			worn = 0
			if(!usr.move)
				usr << "\red You cannot change whilst lying down!"
			name = oname

obj/clothes/pjacket
	name = "Police Uniform"
	desc = "The only way to shout one-liners."
	icon = 'up.dmi'
	icon_state = "pjacket"
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
			usr.underlays -= /obj/clothes/pjacket
			worn = 0
			if(!usr.move)
				usr << "\red You cannot change whilst lying down!"
			name = oname

obj/clothes/phat
	name = "Police Hat"
	desc = "Completes the looks."
	icon = 'up.dmi'
	icon_state = "phat"
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
			usr.underlays -= /obj/clothes/phat
			worn = 0
			if(!usr.move)
				usr << "\red You cannot change whilst lying down!"
			name = oname

obj/clothes/Handcuffs
	desc = "Badboys badboys, watcha gonna do?"
	icon = 'up.dmi'
	icon_state = "hcuffs"
	slot = "restraints"

	verb/Wear()
		if(!worn)
			for(var/obj/clothes/C in usr)
				if(C.worn)
					if(C.slot == src.slot)
						usr << "\red You already have clothes in that slot!"
						return
			src.underlays += src
			worn = 1
			oname = name
			name = "[name] ([slot])"
			src.restraint = 1


		else
			usr.underlays -= /obj/clothes/hcuffs
			worn = 0
			if(!usr.move)
				usr << "\red You cannot change whilst lying down!"
			name = oname


/* Acceptable slots are: hat, eyes, overwear, torso, shoes

Only use these slots whilst creating clothes.


Exceptions for uniques like handcuffs.

*/












