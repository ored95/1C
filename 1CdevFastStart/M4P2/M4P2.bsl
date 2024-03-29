// РеализацияТоваров: Команд ПроверкаДокумента

&НаКлиенте
Процедура ОбработкаКоманды(ПараметрКоманды, ПараметрыВыполненияКоманды)
	
	ВыполнитьПроверкуДокумента(ПараметрКоманды);
	
КонецПроцедуры

&НаСервере
Процедура ВыполнитьПроверкуДокумента(Ссылка)
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	РеализацияТоваровТовары.Номенклатура,
		|	РеализацияТоваровТовары.Цена,
		|	РеализацияТоваровТовары.НомерСтроки
		|ПОМЕСТИТЬ Реализация
		|ИЗ
		|	Документ.РеализацияТоваров.Товары КАК РеализацияТоваровТовары
		|		ЛЕВОЕ СОЕДИНЕНИЕ Документ.РеализацияТоваров КАК РеализацияТоваров
		|		ПО РеализацияТоваровТовары.Ссылка = РеализацияТоваров.Ссылка
		|ГДЕ
		|	РеализацияТоваров.Ссылка = &Ссылка
		|;
		|
		|////////////////////////////////////////////////////////////////////////////////
		|ВЫБРАТЬ
		|	РозничныеЦеныСрезПоследних.Номенклатура,
		|	РозничныеЦеныСрезПоследних.Цена
		|ПОМЕСТИТЬ Текущая
		|ИЗ
		|	РегистрСведений.РозничныеЦены.СрезПоследних КАК РозничныеЦеныСрезПоследних
		|;
		|
		|////////////////////////////////////////////////////////////////////////////////
		|ВЫБРАТЬ
		|	Реализация.НомерСтроки,
		|	Реализация.Номенклатура,
		|	Реализация.Цена
		|ИЗ
		|	Реализация КАК Реализация
		|		ПОЛНОЕ СОЕДИНЕНИЕ Текущая КАК Текущая
		|		ПО Реализация.Номенклатура = Текущая.Номенклатура
		|ГДЕ
		|	Реализация.Цена <= Текущая.Цена";
	
	Запрос.УстановитьПараметр("Ссылка", Ссылка);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Если РезультатЗапроса.Пустой() Тогда
	
		Сообщить("Ошибок в документе нет!");
	
	Иначе
		
		Выборка = РезультатЗапроса.Выбрать();
	
		Пока Выборка.Следующий() Цикл
			
			Сообщить("Цена номенклатуры "+Выборка.Номенклатура+" в строке "+Строка(Выборка.НомерСтроки)+" ниже текущей цены по прайс-листу");	
			
		КонецЦикла;
		
	КонецЕсли; 

КонецПроцедуры
 