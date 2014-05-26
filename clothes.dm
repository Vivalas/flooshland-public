obj/clothes
	var/slot
	var/resis
	use = 1
	var/tmp/worn = 0
	var/tmp/oname
	layer = MOB_LAYER + 1






obj/clothes/greent
	name = "Green Tunic"
	oname = "Green Tunic"
	desc = "A stylin' green tunic!"
	icon = 'up.dmi'
	icon_state = "greent"
	slot = "torso"



	verb/Wear()
		if(!usr.ChkUse())
			return
		if(!usr.move)
			return
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
	oname = "Red Tunic"
	desc = "A stylin' red tunic!"
	icon = 'up.dmi'
	icon_state = "redt"
	slot = "torso"

	verb/Wear()
		if(!usr.ChkUse())
			return
		if(!usr.move)
			return
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
	oname = "Top Hat"
	desc = "Only a real gentlemen has one of these!"
	icon = 'up.dmi'
	icon_state = "that"
	slot = "hat"

	verb/Wear()
		if(!usr.ChkUse())
			return
		if(!usr.move)
			return
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
	oname = "Sunglasses"
	desc = "Rightfully deems the wearer to be badass."
	icon = 'up.dmi'
	icon_state = "sglass"
	slot = "eyes"

	verb/Wear()
		if(!usr.ChkUse())
			return
		if(!usr.move)
			return
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
	oname = "Police Uniform"
	desc = "The only way to shout one-liners."
	icon = 'up.dmi'
	icon_state = "pjacket"
	slot = "torso"

	verb/Wear()
		if(!usr.ChkUse())
			return
		if(!usr.move)
			return
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
	oname = "Police Hat"
	desc = "Completes the looks."
	icon = 'up.dmi'
	icon_state = "phat"
	slot = "hat"

	verb/Wear()
		if(!usr.ChkUse())
			return
		if(!usr.move)
			return
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
mob/var/restrained = 0


obj/clothes/handcuffs
	oname = "handcuffs"
	desc = "Badboys badboys, watcha gonna do?"
	icon = 'up.dmi'
	icon_state = "hcuffs"
	slot = "restraints"
	verb/use(mob/M in view(1))
		if(!usr.ChkUse())
			return
		if(M.restrained)
			usr << "\blue [M] is already handcuffed!"
			return
		if(worn)
			return
		view() << "\red\bold [usr] is trying to handcuff [M]!"
		var/start = usr.loc
		var/start2 = M.loc
		sleep(50)
		if(start == usr.loc && start2 == M.loc && !worn && usr.ChkUse() && usr.move)
			view() << "\red\bold [M] has been handcuffed by [usr]!"
			name = "[name] ([slot])"
			M.restrained = 1
			M.overlays = null
			M.equip = null
			loc = M
	verb/Wear()
		if(usr.restrained)
			goto rem
		if(!usr.ChkUse())
			return
		if(!usr.move)
			usr << "\red You cannot change whilst lying down!"
		if(!worn)
			for(var/obj/clothes/C in usr)
				if(C.worn)
					if(C.slot == src.slot)
						usr << "\red You already have clothes in that slot!"
						return

			worn = 1
			oname = name
			name = "[name] ([slot])"
			usr.restrained = 1
			usr.overlays = null
			usr.equip = "None"
			return





		:rem
			if(usr.dead)
				return
			var/start = usr.loc
			if(!usr.move)
				usr << "\red You cannot change whilst lying down!"
			usr << "\red You are removing your handcuffs, don't move!"
			view() << "\blue [usr] is trying to remove their handcuffs!"
			sleep(300)
			if(start <> usr.loc)
				return
			view() << "\red\bold [usr] removes their handcuffs!"

			worn = 0
			usr.restrained = 0
			name = oname



/* Acceptable slots are: hat, eyes, overwear, torso, shoes

Only use these slots whilst creating clothes.


Exceptions for uniques like handcuffs.

*/












