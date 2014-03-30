mob
	icon = 'floosh.dmi'
	name = "Floosh"
	var/swag = 0
	var/fasty = 0
	var/british = 0
	var/const/floosh = 1
	var/arms = 1
	var/health = 100
	var/move = 1
	var/dead = 0
	var/legs = 1
	var/bleed = 0
	var/step = 0
	var/nt = 0
	var/stuck = 0
	var/equip = "None"
	desc = "A small yellow creature capable of regenerating it's own limbs."
	icon_state = "up"
	proc/ChkLimbs()
		if (!legs)
			src << "\bold\red Your legs have been dismembered from your body!"
			view() << "\bold\red [src]'s legs have been dismembered from their body!"
			src << "You fall over!"
			view() << "[src] falls over!"
		if (!arms)
			src << "\bold\red Your arms have been dismembered from your body!"
			view() << "\bold\red [src]'s arms have been dismembered from their body!"
	proc/ChkGore()
		if(bleed == 1)
			view() << "\red [name] begins to bleed!"
			src << "\red You begin to bleed!"
		if(bleed == 2)
			view() << "\red [name] begins to bleed a lot!"
			src << "\red You begin to bleed a lot!"
		if(bleed >= 3)
			view() << "\red [name] turns limp and pale, as fountains of blood gush out of them!"
			src << "\red Your body goes limp and pale as you bleed profusely, fountains of blood gushing out!"










obj/swagpotion

	icon = 'potionbottle.dmi'
	name = "Swag Potion"
	desc = "A potion that gives the user incredible amounts of swag at a *cough* price."
	use = 1
	verb/Drink()
		if(usr.ChkUse())
			usr.swag = 1
			usr << "\blue You drink a swag potion!"
			view() << "\blue [usr] drinks a swag potion!"
			del src


/*obj/vm
	use = 0
	name = "Vending Machine"
	icon = 'potionbottle.dmi'
	Click()
		set src in view(1)
		if(usr.dead||!usr.arms)
			if(!usr.arms)
				world <<"\blue [usr] attempts to use the machine with his nubby stumps!"
			return

		oview() << "\blue [usr] uses the vending machine!"
		usr << "\blue You use the vending machine!"
		var/obj/O = (/obj/swagpotion)
		var/obj/v = (/obj/vm)
*/ //not ready to implement this yet

obj/DeathPotion
	name = "Death Potion"
	desc = "A potion that is not very good for your health."
	use = 1
	icon = 'potionbottle.dmi'
	verb/Drink()
		if(usr.ChkUse())
			usr << "\blue You drink a potion!"
			view() << "\blue [usr] drinks a Death Potion!"
			usr.Dmg(25)
			usr.Bleed(rand(1,2),rand(8,15))
			del src


obj/blood
	weld = 1
	desc = "A red liquid that is part of most animals' circulatory system."
	use = 0
	icon = 'blood.dmi'
	layer = OBJ_LAYER - 1
	verb/Drink()
		set src in usr.loc
		usr << "\blue You slurp blood off the ground!"
		view() << "\blue [usr] slurps blood off of the ground!"
		del src

mob/proc/ChkUse()
	if(dead|!arms|stun)
		return 0
	return 1

obj
	var/use




obj/bombpotion
	name = "Bomb Potion"
	desc = "A potion that has rather explosive effects."
	use = 1
	icon = 'potionbottle.dmi'
	verb/Drink()
		usr << "\blue You drink a Bomb Potion!"
		view() << "\blue [usr] drinks a Bomb Potion!"
		if(usr.ChkUse())
			usr.Explode()
			del src



obj/Sword
	desc = "A sleek metal object used to slash people open like pinatas!"
	icon = 'sword.dmi'
	icon_state = "normal"
	use = 1

	Eat()
		.=..()
		usr.Bleed(1,10)
		usr.Dmg(1)
		view() << "\red [usr] cuts their mouth on the sword!"


	verb/Equip()
		set name = "Equip/Unequip"
		if(src == usr.equip)
			usr.equip = "None"
			view() << "\red [usr] sheathes their sword!"
			usr.overlays -= 'swordo.dmi'
			return
		if(usr.equip == "None")
			usr.equip = src
			view() << "\red [usr] draws their sword!"
			usr.overlays += 'swordo.dmi'
			return



obj/Spawner
	weld = 1
	name = "Weapon Spawner"
	icon_state = "red"
	var/atom/T
	icon = 'spawner.dmi'
	DblClick()
		set src in view(1)
		if(usr.ChkUse())
			if(!(locate(/obj/Sword) in src.loc))
				if(prob(5))
					new/obj/deathsword(src.loc)
					return
				if(prob(20))
					new/obj/Rifle(src.loc)
					return
				new/obj/Sword(src.loc)


obj/deathsword
	name = "Garnellian Death Sword"
	desc = "A sword produced by the Garnellian Iron Works, very deadly."
	icon = 'sword.dmi'
	icon_state = "death"
	use = 1


	Eat()
		.=..()
		view() << "\red [usr]'s mouth burns and sears, blood spurting out! Their mouth is pulverized by the energy flowing through the sword!"
		usr.Dmg(30)
		usr.Bleed(4,15)

	Lick()
		.=..()
		usr.Explode()
		del src


	verb/Equip()
		set name = "Equip/Unequip"
		if(src == usr.equip)
			usr.equip = "None"
			view() << "\red [usr] sheathes their Garnellian Death Sword"
			usr.overlays -= 'dsword.dmi'
			return
		else
			if(usr.equip == "None")
				usr.equip = src
				view() << "\red [usr] draws their Garnellian Death Sword!"
				usr.overlays += 'dsword.dmi'


mob
	DblClick(mob/M in view(1))
		if(src in view(1))
			if(src == usr)
				if(istype(usr.equip,/obj/deathsword))
					if(usr.ChkUse())
						view() << "\red\bold [usr] stabs themself with a Garnellian Death Sword!"
						src.Dmg(rand(20,70))
						if(prob(40))
							src.Bleed(rand(2,3),20)
						if(!(locate(/obj/blood/) in src.loc)) new/obj/blood(loc)
						return
				if(istype(usr.equip,/obj/Sword))
					if(usr.ChkUse())
						view() << "\red\bold [usr] stabs themself with a sword!"
						src.Dmg(rand(5,20))
						if(prob(10))
							src.Bleed(rand(1,2),10)
						if(!(locate(/obj/blood/) in src.loc)) new/obj/blood(loc)
						return
			if(istype(usr.equip,/obj/deathsword))
				if(usr.ChkUse())
					src.Dmg(rand(20,70))
					if(!(locate(/obj/blood/) in src.loc)) new/obj/blood(loc)
					view() << "\red\bold [usr] slashes [src] with a Garnellian Death Sword!"
					if(prob(40))
						src.Bleed(rand(2,3),20)
			if(istype(usr.equip,/obj/Sword))
				if(usr.ChkUse())
					src.Dmg(rand(5,20))
					if(!(locate(/obj/blood/) in src.loc)) new/obj/blood(loc)
					view() << "\red\bold [usr] slashes [src] with a sword!"
					if(prob(10))
						src.Bleed(rand(1,2),10)


obj/Spawner2
	weld = 1
	name = "Potion Spawner"
	var/atom/T
	icon = 'spawner.dmi'
	icon_state = "blue"
	DblClick()
		set src in view(1)
		if(usr.ChkUse())
			if(!(locate(/obj/bombpotion) in src.loc))
				if(prob(20))
					new/obj/DeathPotion(src.loc)
					return
				if(prob(1))
					new/obj/swagpotion
					return
				new/obj/bombpotion(src.loc)



obj/Rifle
	name = "Rifle(8)"
	icon = 'rifle.dmi'
	desc = "A smooth metal device that fires projectiles at amazing speed!"
	use = 1


	verb/Equip()
		set name = "Equip/Unequip"
		if(src == usr.equip)
			usr.equip = "None"
			view() << "\red [usr] slings their rifle over their shoulder!"
			usr.overlays -= 'rifleo.dmi'
			return
		else
			if(usr.equip == "None")
				usr.equip = src
				view() << "\red [usr] draws their rifle!"
				usr.overlays += 'rifleo.dmi'
	var/ammo = 8
	var/tmp/rel = 0

	verb/Reload()
		if(usr.ChkUse())
			var/start = usr.loc
			usr << "\red You are reloading your rifle, don't move!"
			view() << "\blue [usr] is trying to reload their rifle!"
			rel = 1
			sleep(55)
			if(start <> usr.loc)
				usr << "\red You moved when trying to reload your rifle!"
				view() << "\red\bold [usr] failed to reload their rifle because they moved!"
				rel = 0
				return
			view() << "\red\bold [usr] reloads their rifle!"
			rel = 0
			ammo = 8
			src.name = "Rifle([ammo])"


mob
	Click()
		if(usr.ChkUse())
			if(usr == src)
				return
			if(istype(usr.equip,/obj/Rifle))
				for(var/obj/Rifle/R in usr)
					if(R.rel)
						return
					if(!R.ammo)
						view() << "\red\bold [usr]'s rifle clicks!"
						return
					if(blp(src,usr))
						R.ammo--
						R.name = "Rifle([R.ammo])"
						view() << "\red\bold [usr] shoots at [src] with a rifle, but the shot glances off of the glass!"
						return
					if(prob(60))
						R.ammo--
						src.Dmg(rand(15,30))
						view() << "\red\bold [usr] shoots [src] with their rifle!"
						if(!(locate(/obj/blood/) in src.loc)) new/obj/blood(src.loc)
						R.name = "Rifle([R.ammo])"
						return
					view() << "[usr] misses [src] with their rifle!"
					R.ammo--
					R.name = "Rifle([R.ammo])"
					return

			if(istype(usr.equip,/obj/StunRifle))
				for(var/obj/StunRifle/S in usr)
					if(S.rel)
						return
					if(!S.ammo)
						view() << "\red\bold [usr]'s stun rifle clicks!"
						return
					if(prob(60))
						S.ammo--
						spawn src.stun(100)
						view() << "\red\bold [usr] shoots [src] with their stun rifle!"
						S.name = "Stun Rifle([S.ammo])"
						return
					view() << "[usr] misses [src] with their stun rifle!"
					S.ammo--
					S.name = "Stun Rifle([S.ammo])"
					return
