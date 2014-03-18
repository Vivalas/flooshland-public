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



client
	DblClick(obj/o in view(1))
		if(istype(o,o))

