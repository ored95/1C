// BSLLS-off
// External Processing
// Ctrl + S as hello.epf
// Ctrl + O in user mode to open *.epf files

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	hour = hour(currentdate());
	msg = "Добрый день, " + username() + "!";
	if hour < 12 then
		msg = "Доброе утро, " + username() + "!";
	elsif hour > 19 then
		msg = "Добрый вечер, " + username() + "!";
	endif;
	DoMessageBox(msg);
	Отказ = True;	// hide form
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	// do nothing
КонецПроцедуры
