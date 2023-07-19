// BSLLS-off
// Форма: обработка праздника
// Form: holiday processing

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Message("Привет!");	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	date = CurrentDate();
	dd = day(date);
	mm = month(date);
	yy = year(date);
	
	remainingDays = (date(yy, 12, 31) - date(yy, mm, dd)) / 86400;
	Message("До нового года осталось " + remainingDays + " дней");
КонецПроцедуры

&НаКлиенте
Процедура Рассчитать(Команда)
	date = currentdate();
	dd = day(date);
	mm = month(date);
	yy = year(date);
	
	remainingDays = (ДатаРождения - date(yy, mm, dd)) / 86400;
	msg = "До Вашего дня рождения осталось " + remainingDays + " дней";
	if remainingDays = 0 then
		msg = "Сегодня Ваш день родждения";
	elsif remainingDays < 0 then
		msg = "Ваш день рождения уже прошёл " + -remainingDays + " дней назад";
	endif;
	Message(msg);
КонецПроцедуры

