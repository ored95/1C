// Общие модули + Вызов сервера
Функция ИнформацияОДокументе(Ссылка) Экспорт
	
	Возврат "Документ Номер = " + Ссылка.Номер + ", Дата = " + Ссылка.Дата;
	
КонецФункции

// Документ: Поступление товаров
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Сообщить(ОбщиеФункцииСервера.ИнформацияОДокументе(Объект.Ссылка));
КонецПроцедуры

// Документ: Реализация товаров
&НаКлиенте
Процедура ПриОткрытии(Отказ)
	Сообщить(ОбщиеФункцииСервера.ИнформацияОДокументе(Объект.Ссылка));
КонецПроцедуры