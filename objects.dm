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
		if(src.bleed == 1)
			view() << "\red [src] begins to bleed!"
			src << "\red You begin to bleed!"
		if(src.bleed == 2)
			view() << "\red [src] begins to bleed a lot!"
			src << "\red You begin to bleed a lot!"
		if(src.bleed >= 3)
			view() << "\red [src] turns limp and pale, as fountains of blood gush out of them!"
			src << "\red Your body goes limp and pale as you bleed profusely, fountains of blood gushing out!"






turf/grass
	desc = "Lush green wavy grass!"
	var/use = 0
	icon = 'grass.dmi'
	verb/Eat()
		if(usr.ChkUse())
			set src in usr.loc
			usr << "\blue You pull grass out of the ground and eat it!"
			view() << "\blue [usr] must be crazy! They hungrily pull tufts of grass out of the ground and stuff it in their mouth!"

	verb/Lick()
		set src in usr.loc
		usr << "\blue You lick the grass!"
		view() << "\blue [usr] licks the grass! What is wrong with them?"




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
	verb/Eat()
		if(usr.ChkUse())
			usr << "\blue You gnaw on the potion's bottle!"
			view() << "\blue [usr] gnaws on the swag potion!"


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
	verb/Eat()
		if(usr.ChkUse())
			usr << "\blue You gnaw on the potion's bottle!"
			view() << "\blue [usr] gnaws on the Death Potion!"


obj/blood
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
	if(dead|!arms)
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
		view() << "\blue [use] drinks a Bomb Potion!"
		if(usr.ChkUse())
			usr.Explode()
			del src

	verb/Eat()
		if(usr.ChkUse())
			usr << "\blue You gnaw on the potion's bottle!"
			view() << "\blue [usr] gnaws on the Bomb Potion!"



obj/Sword
	desc = "A sleek metal object used to slash people open like pinatas!"
	icon = 'sword.dmi'
	icon_state = "normal"
	use = 1

	verb/Lick()
		if(usr.ChkUse())
			usr << "\blue You lick the sword!"
			view() << "\blue [usr] licks the sword with passion!"


	verb/Eat()
		if(usr.ChkUse())
			usr << "\blue You bite the sword!"
			view() << "\blue [usr] bites the sword!"
			usr << "\red You cut your mouth! Ouch!"
			view() << "\red [usr] cuts their mouth! Ouch!"
			usr.Bleed(1,12)

	verb/Equip()
		if(src == usr.equip)
			usr.equip = "None"
			view() << "\red [usr] sheathes their sword!"
			return
		else
			usr.equip = src
			view() << "\red [usr] draws their sword!"


mob
	DblClick(mob/M in view(1))
		if(src == usr)
			if(istype(usr.equip,/obj/Sword))
				if(usr.ChkUse())
					view() << "\red\bold [usr] stabs themself with a sword!"
					src.Dmg(rand(5,20))
					if(prob(10))
						src.Bleed(rand(1,2),10)
					if(!(locate(/obj/blood/) in src.loc)) new/obj/blood(loc)
					return
		if(istype(usr.equip,/obj/Sword))
			if(usr.ChkUse())
				src.Dmg(rand(5,20))
				if(!(locate(/obj/blood/) in src.loc)) new/obj/blood(loc)
				view() << "\red\bold [usr] slashes [src] with a sword!"
				if(prob(10))
					src.Bleed(rand(1,2),10)


obj/Spawner
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
				new/obj/Sword(src.loc)


obj/deathsword
	name = "Garnellian Death Sword"
	desc = "A sword produced by the Garnellian Iron Works, very deadly."
	icon = 'sword.dmi'
	icon_state = "death"
	use = 1

	verb/Lick()
		if(usr.ChkUse())
			usr << "\blue You lick the Garnellian Death Sword"
			view() << "\blue [usr] licks the Garnellian Death Sword with passion!"
			usr.Explode()
			del src


	verb/Eat()
		if(usr.ChkUse())
			usr << "\blue You bite the sword!"
			view() << "\blue [usr] bites the sword!"
			usr << "\red Your mouth burns and sears, and blood spurts out!"
			view() << "\red [usr]'s mouth is pulverised by the Garnellian Death Sword as he bites it!"
			usr.Bleed(5,15)

	verb/Equip()
		if(src == usr.equip)
			usr.equip = "None"
			view() << "\red [usr] sheathes their Garnellian Death Sword"
			return
		else
			usr.equip = src
			view() << "\red [usr] draws their Garnellian Death Sword!"


mob
	DblClick(mob/M in view(1))
		if(src == usr)
			if(istype(usr.equip,/obj/deathsword))
				if(usr.ChkUse())
					view() << "\red\bold [usr] stabs themself with a Garnellian Death Sword!"
					src.Dmg(rand(20,70))
					if(prob(40))
						src.Bleed(rand(2,3),20)
					if(!(locate(/obj/blood/) in src.loc)) new/obj/blood(loc)
					return
		if(istype(usr.equip,/obj/deathsword))
			if(usr.ChkUse())
				src.Dmg(rand(20,70))
				if(!(locate(/obj/blood/) in src.loc)) new/obj/blood(loc)
				view() << "\red\bold [usr] slashes [src] with a sword!"
				if(prob(40))
					src.Bleed(rand(2,3),20)


obj/Spawner2
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