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
	DblClick(obj/O in view(1))
		if(O.use&&usr.ChkUse())
			O.loc = usr.contents

	DblClick(obj/O in usr.contents)
		if(O.use&&usr.ChkUse())