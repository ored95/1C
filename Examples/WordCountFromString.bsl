Процедура ПриНачалеРаботыСистемы()
	//Hello();
	str = "";
	if inputstring(str) then
		msg = "Строка содержит " + WordCountFromString(str) + " слов";
		DoMessageBox(msg);
	endif;
КонецПроцедуры

procedure inc(number, ops=1)
	number = number + ops;
endprocedure

procedure dec(number, ops=1)
	number = number - ops;
endprocedure

function getChar(val string, val index)
	return right(left(string, index+1), 1);
endfunction

function WordCountFromString(val str)
	// return strsplit(str, " ", False).count();
	count = 0;
	i = 0;
	while True do
		while i <> strlen(str) and getChar(str, i) = " " do
			inc(i);
		enddo;
		if i = strlen(str) then
			break;
		endif;
		inc(count);
		while i <> strlen(str) and getChar(str, i) <> " " do
			inc(i);
		enddo;
	enddo;
	return count;
endfunction

procedure Hello()
	username = UserName();
	currentDate = CurrentDate();
	helloMsg = "Добрый день, " + username + "! Сегодня " + currentDate + ". Хорошего рабочего дня!";
	DoMessageBox(helloMsg, 10);
endprocedure


