obj/magicPotion
	icon = 'potionbottle.dmi'
	name = "Magic Potion"
	desc = "Ooh.. seems magical!"
	use = 1

	verb/Drink()
		if(usr.ChkUse())
			var/datum/sphere/floosh/F = new
			F.Add_Spells(usr)
			usr << "\blue You drink a magic potion."
			usr << "\blue\bold YOU FEEL MAGICAL OH FUCK!"
			view() << "\blue [usr] drinks a swag potion."
			del src


obj/magicPotiondeath
	icon = 'potionbottle.dmi'
	name = "Magic Potion of Death"
	desc = "Ooh.. seems evil!"
	use = 1

	verb/Drink()
		if(usr.ChkUse())
			var/datum/sphere/death/F = new
			F.Add_Spells(usr)
			usr << "\blue You drink an evil potion."
			usr << "\red\bold YOU FEEL EVIL OH FUCK!"
			view() << "\blue [usr] drinks an evil potion."
			del src



obj/godrelic
	name = "Relic of Arkchkrobble the Great"
	desc = "Oh snap, it's gettin' real!"
	use = 1
	icon = 'objects.dmi'
	icon_state = "relic"


	Lick()
		..()
		usr << "<font size = 8><font color=blue>YOU FEEL ALMIGHTY!"
		view(usr) << "\bold  [usr] TREMBLES WITH POWER"


		usr.health = 1000

		var/datum/sphere/death/D = new
		D.Add_Spells(usr)
		usr.level = 20
		usr.Level_Up()
