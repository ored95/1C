// Поступление товаров: получение остаток при реализации события ПриАктивацииСтроки()

&НаСервереБезКонтекста
Функция ТоварыПриАктивизацииСтрокиНаСервере(Товар)
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ОстаткиНоменклатурыОстатки.Номенклатура,
		|	ОстаткиНоменклатурыОстатки.КоличествоОстаток
		|ИЗ
		|	РегистрНакопления.ОстаткиНоменклатуры.Остатки КАК ОстаткиНоменклатурыОстатки
		|ГДЕ
		|	ОстаткиНоменклатурыОстатки.Номенклатура = &Товар";
	
	Запрос.УстановитьПараметр("Товар", Товар);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Выборка = РезультатЗапроса.Выбрать();
	
	Пока Выборка.Следующий() Цикл
		
		Возврат Выборка.КоличествоОстаток;
		
	КонецЦикла;
	
КонецФункции


&НаКлиенте
Процедура ТоварыПриАктивизацииСтроки(Элемент)
	
	Номенклатура = Элементы.Товары.ТекущиеДанные.Номенклатура;
	
	Остаток = ТоварыПриАктивизацииСтрокиНаСервере(Номенклатура);
	
КонецПроцедуры
