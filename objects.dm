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

	proc/ChkLimbs()
		if (!legs)
			usr << "\bold\red Your legs have been dismembered from your body!"
			usr << "You fall over!"
			oview() << "[usr] falls over!"
		if (!arms)
			usr << "\bold\red Your arms have been dismembered from your body!"

	proc/ChkGore()
		if(usr.bleed == 1)
			oview() << "\red [usr] begins to bleed!"
			usr << "\red You begin to bleed!"
		if(usr.bleed == 2)
			oview() << "\red [usr] begins to bleed a lot!"
			usr << "\red You begin to bleed a lot!"
		if(usr.bleed >= 3)
			oview() << "\red [usr] turns limp and pale, as fountains of blood gush out of them!"
			usr << "\red Your body goes limp and pale as you bleed profusely, fountains of blood gushing out!"

turf/grass
	var/use = 0
	icon = 'grass.dmi'


obj/start
	icon = 'grass.dmi'

obj/swagpotion
	icon = 'potionbottle.dmi'
	name = "Swag Potion"
	desc = "S-w-w-w-w-w-wAG!"
	use = 1
	verb/drink(mob/M)
		if(usr.ChkUse())
			set src in view(1)
			M = src
			usr.swag = 1



obj/vm
	use = 0
	name = "Vending Machine"
	icon = 'potionbottle.dmi'
	Click()
		if(usr.dead||!usr.arms||!src in view(1))
			if(!usr.arms)
				world <<"\blue [usr] attempts to use the machine with his nubby stumps!"
			return

		oview() << "\blue [usr] uses the vending machine!"
		usr << "\blue You use the vending machine!"
		var/obj/O = (/obj/swagpotion)
		var/obj/v = (/obj/vm)

obj/DeathPotion
	use = 1
	icon = 'potionbottle.dmi'
	verb/Drink(mob/M)
		if(usr.ChkUse())
			set src in view(1)
			M = src
			usr << "\blue You drink a potion!"
			usr.Dmg(25)
			usr.Bleed(rand(1,2),rand(8,15))


obj/blood
	use = 0
	icon = 'blood.dmi'

mob/proc/ChkUse()
	if(dead|!arms)
		return 0
	return 1



obj/bombpotion
	use = 1
	icon = 'potionbottle.dmi'

	verb/use(mob/M)
		set src in view(1)
		M = src
		if(usr.ChkUse())
			Explode()


obj
	var/use