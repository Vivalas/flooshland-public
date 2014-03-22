mob/Login()
	if(loc&&!res)
		usr << "Welcome back to the game!"
		world << "\bold [usr.key] has reconnected!"
		..()

	if(res)
		res = 0
		..()

	if(!loc)
		usr.loc = locate(1,1,1)
		world << "\bold [usr] has joined the game!"

mob/Logout()
	if(res)
		..()
	if(!res)
		world << "\bold [usr.key] has left the game! :("

mob/Login()
	usr << "<FONT SIZE=4><U>\blue FLOOSHLAND</FONT><U>\blue \n \bold Welcome to flooshland! The game is still under heavy development, but this is it's first official stress test!\n"
	..()

