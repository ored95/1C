// Общие модули \ Общие функции сервера
Функция ПолучитьСписокБлижайшихДнейРождения() Экспорт
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	Сотрудники.ФИО,
		|	Сотрудники.ДатаРождения,
		|	Сотрудники.Наименование
		|ИЗ
		|	Справочник.Сотрудники КАК Сотрудники
		|ГДЕ
		|	&ТекущаяДата МЕЖДУ
		|		ДОБАВИТЬКДАТЕ(ДОБАВИТЬКДАТЕ(Сотрудники.ДатаРождения, ГОД, РАЗНОСТЬДАТ(Сотрудники.ДатаРождения, &ТекущаяДата, ГОД)), ДЕНЬ, -&КБД) И
		|		ДОБАВИТЬКДАТЕ(Сотрудники.ДатаРождения, ГОД, РАЗНОСТЬДАТ(Сотрудники.ДатаРождения, &ТекущаяДата, ГОД))
		|	ИЛИ
		|	&ТекущаяДата МЕЖДУ 
		|		ДОБАВИТЬКДАТЕ(ДОБАВИТЬКДАТЕ(Сотрудники.ДатаРождения, ГОД, РАЗНОСТЬДАТ(Сотрудники.ДатаРождения, &ТекущаяДата, ГОД) + 1), ДЕНЬ, -&КБД) И
		|		ДОБАВИТЬКДАТЕ(Сотрудники.ДатаРождения, ГОД, РАЗНОСТЬДАТ(Сотрудники.ДатаРождения, &ТекущаяДата, ГОД) + 1)";
	
	// КБД - констант количества ближайших дней
	// min = 0, max = 365, 5 by default
	КБД = Константы.КБД.Получить();
	ТекущаяДата = Дата(Год(ТекущаяДата()), Месяц(ТекущаяДата()), День(ТекущаяДата()));
	
	Запрос.УстановитьПараметр("КБД", КБД);
	Запрос.УстановитьПараметр(")ТекущаяДата", ТекущаяДата);	//  '2023.12.31'); //
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Результат = "В ближайшие " + Строка(КБД) + " дни нет рождения никаких сотрудников";
	Если НЕ РезультатЗапроса.Пустой() Тогда
		Запись = РезультатЗапроса.Выбрать();
		Результат = "Сотрудники с днем рождения в ближайшие " + Строка(КБД) + " дни" + Символы.ПС;
		Номер = 1;
		Пока Запись.Следующий() Цикл
			Результат = Результат + Строка(Номер) + ". ";
			Результат = Результат + Строка(Запись.ФИО) + " (";
			Результат = Результат + Строка(День(Запись.ДатаРождения)) + "/";
			Результат = Результат + Строка(Месяц(Запись.ДатаРождения)) + ")" + Символы.ПС;
			Номер = Номер + 1;
		КонецЦикла;
	КонецЕсли;
	
	Возврат Результат;
КонецФункции

// Модуль управляемого приложения
Процедура ПриНачалеРаботыСистемы()
	Предупреждение(ОбщиеФункцииСервера.ПолучитьСписокБлижайшихДнейРождения());
КонецПроцедуры

