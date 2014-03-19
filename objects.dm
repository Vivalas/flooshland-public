mob
	icon = 'floosh.dmi'
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
	desc = "A small yellow creature capable of regenerating it's own limbs."

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



obj/swagpotion

	icon = 'potionbottle.dmi'
	name = "Swag Potion"
	desc = "A potion that gives the user incredible amounts of swag at a *cough* price."
	use = 1
	verb/drink(mob/M)
		set src in view(1)
		if(M.ChkUse())
			M.swag = 1
			spawn(rand(150,9000)) M.Explode()

obj/vm
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

obj/DeathPotion
	desc = "A potion that is not very good for your health."
	use = 1
	icon = 'potionbottle.dmi'
	verb/Drink(mob/M)
		set src in view (1)
		if(M.ChkUse())
			M << "\blue You drink a potion!"
			M.Dmg(25)
			M.Bleed(rand(1,2),rand(8,15))


obj/blood
	desc = "A red liquid that is part of most animals' circulatory system."
	use = 0
	icon = 'blood.dmi'

mob/proc/ChkUse()
	if(dead|!arms)
		return 0
	return 1

obj
	var/use




obj/bombpotion
	desc = "A potion that has rather explosive effects."
	use = 1
	icon = 'potionbottle.dmi'
	verb/drink(mob/M)
		set src in view(1)
		if(M.ChkUse())
			M.Explode()


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
