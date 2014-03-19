mob/Login()
	if(loc)
		usr << "Welcome back to the game!"
		world << "\bold [usr.key] has reconnected!"
	else
		usr.loc = locate(1,1,1)
		world << "\bold [usr] has joined the game!"

mob/Logout()
	world << "\bold [usr.key] has left the game! :("



