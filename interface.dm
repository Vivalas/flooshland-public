mob/Stat()
	var/legsme = "Yes"
	var/armsme = "Yes"

	if(!legs)
		legsme = "No"

	if(!arms)
		armsme = "No"


	if(statpanel("Status"))
		stat("Health:",health)
		stat("Arms?",armsme)
		stat("Legs?",legsme)
		stat("Bleeding Rate:",bleed)

	if(statpanel("Inventory"))
		stat("Hr",contents)



mob/verb/PickUp(obj/O in view(1))
	set name = "Pick Up"
	if(O.use)
		O.loc = usr.contents



obj
	DblClick()
		if(use)
			loc = usr.contents