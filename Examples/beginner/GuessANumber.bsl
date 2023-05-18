Procedure GuessANumber()
	Rn = new RandomNumberGenerator(632);
	n = Rn.RandomNumber(1, 1000);
	
	ans = -1;
	time = 0;
	While ans <> n Do
		InputValue(ans, "Type a number: ", Type("Number"));
		time = time + 1;
		if ans < n then
			ShowUserNotification("Your number is too small");
		elsif ans > n then
			ShowUserNotification("Your number is too big");
		endif;
	EndDo;
	
	Message("You got it! " + n + " is an correct answer, guess times (" + time + ")"); 
EndProcedure
