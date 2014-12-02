#define MAGIC_BASE 50


proc/Ticker()
	while(1)
		for(var/mob/M in world)
			if(M.key)
				if(!M.atonement)
					continue //no mana fro you you muggle you
				M.Magick()
		sleep(10)

mob
	var

		magic_xp = 0
		level = 0
		mana = 0
		atonement
		max_mana = 0
		level_threshold = 0

		datum/spell_holder/spells



	proc/Set_Threshold()
		if(!level||!atonement)
			return //this shouldn't happen, panic now

		var/nl = 50
		var/i
		var/add_on = MAGIC_BASE

		for(i=1,i<level,i++)
			add_on *= 2
			nl += add_on

		return nl


	proc/Level_Up()
		level++
		level_threshold = Set_Threshold()
		max_mana = 150 * level

	proc/Gain_Exp(var/N)
		magic_xp += N
		if(magic_xp >= level_threshold)
			src << "\blue You feel enlightened.."
			Level_Up()

	proc/Magick()
		mana = min(mana + level,max_mana)

	proc/CastSpell()
		set name = "Cast Spell"
		set category = "Magic"

		var/spell = input("Choose spell to cast.") in spells.spells



		if(atonement != spell:alignment)
			src << "\red You are not educated in the ways of [spell:alignment]"
			return
		if(mana <= spell:mana_cost)
			src << "\red You feel to weak to cast this spell."
			return
		Gain_Exp(rand(spell:min_xp,spell:max_xp))
		mana -= spell:mana_cost

		spell:Cast(src)




	proc/Init_Magic()
		level = 1
		max_mana = 150
		mana = 150
		level_threshold = 50

		verbs += /mob/proc/CastSpell


	proc/Add_Spell(var/datum/spell/S)
		spells.spells += new S
		src << "\blue You have learned the [S] spell!"


datum/spell_holder
	var/mob/holder
	var/list/spells = list()


datum/spell
	var/name
	var/min_xp = 0
	var/max_xp = 0
	var/alignment
	var/mana_cost = 0

	proc/Cast()


datum/spell/handsup
	name = "Put Yo Hands Up"
	min_xp = 15
	max_xp = 25
	alignment = "Floosh"
	mana_cost = 50

	Cast(mob/M)
		viewers(M) << "\blue [M] does a dang good mofo dance, and I ain't talkin' bout chicken an' gravy BIATCH!"
		for(var/mob/MO in view(M))
			viewers(MO) << "\bold [MO] puts dem hands up!"


datum/spell/hurt
	name = "Hurt Spell"
	min_xp = 15
	max_xp = 35
	alignment = "Death"
	mana_cost = 60

	Cast(mob/M)
		var/choice = input(M,"Choose a target.") in view(M) as mob
		if(!istype(M,/mob)) return
		viewers(M) << "\red\bold [M] casts a spell of harm on [choice]!"
		choice:Dmg(rand(10,60))
		choice << "<font size = 5><font color=red>YOU ARE ENVELOPED IN THROES OF PAIN!"


datum/spell/bleed
	name = "Bleed Spell"
	min_xp = 20
	max_xp = 50
	alignment = "Death"
	mana_cost = 80

	Cast(mob/M)
		var/choice = input(M,"Choose a target.") in view(M) as mob
		if(!istype(M,/mob)) return
		viewers(M) << "\red\bold [M] casts a spell of bleeding on [choice]!"
		spawn choice:Bleed(rand(2,5),rand(10,30))
		choice << "<font size = 5><font color=red>YOU FEEL LIKE BLEEDING! MIGHT AS WELL BLEED!!"


datum/spell/bounty
	name = "HOLLA HOLLA BIG DOLLA"
	min_xp = 40
	max_xp = 60
	alignment = "Floosh"
	mana_cost = 90

	Cast(mob/M)
		viewers(M) << "\blue [M] is the fo shnizzle, ya know? Less give him some big dolla!"
		viewers(M) << "<font size = 5><font color = yellow>HOLLA HOLLA BIG DOLLA"

		for(var/turf/T in view(M,5))
			if(prob(10))
				if(prob(5))
					new/obj/swagpotion(T)
					continue
				if(prob(5))
					new/obj/deathsword(T)
					continue
				if(prob(5))
					new/obj/clothes/sglass(T)
					continue
				if(prob(5))
					new/obj/Rifle(T)
					continue
				new/obj/Sword(T)
datum/sphere
	var/name
	var/list/starting_spells = list()


	proc/Add_Spells(mob/M)
		if(M.atonement == name)
			M << "\blue You area already wise in the ways of [name]!"
			return
		if(!M.spells) M.spells = new/datum/spell_holder
		for(var/i in starting_spells)
			var/io = new i
			M.spells.spells += io
			M << "\blue You have learned the [io:name] spell!"
		M << "\green You are now wise in the ways of [name]!"

		M.Init_Magic()
		M.atonement = name



datum/sphere/floosh
	name = "Floosh"

	starting_spells = list(/datum/spell/handsup,/datum/spell/bounty)


datum/sphere/death
	name = "Death"

	starting_spells = list(/datum/spell/hurt,/datum/spell/bleed)