//
// Функция возвращает массив с элементами типа Соответствие, 
// где, ключ соответствия это номер колонки, а значение - значение колонки
//
&AtClient
Функция ПрочитатьCSV(ИмяФайла, КоличествоКолонок, Разделитель=";", КоличествоПервыхСтрокПропустить = 0)
	
	ЧтениеТекста = Новый ЧтениеТекста(ИмяФайла, КодировкаТекста.UTF8 ,,,Ложь);
	
	Рез = Новый Массив;
	ОписаниеТиповСтрока = Новый ОписаниеТипов("Строка");
		
	НомерСтроки = 1;
	Стр = ЧтениеТекста.ПрочитатьСтроку();
	Пока Стр <> Неопределено Цикл
		Если НомерСтроки < 1 + КоличествоПервыхСтрокПропустить Тогда
			Стр = ЧтениеТекста.ПрочитатьСтроку();
			НомерСтроки = НомерСтроки + 1;
			Продолжить;
		КонецЕсли; 
		
		СтрокаТЗ = Новый Соответствие();
		Рез.Добавить(СтрокаТЗ);
		
		Для НомерКолонки = 1 По КоличествоКолонок Цикл
			СтрокаТЗ.Вставить(НомерКолонки, "");
		КонецЦикла;
		
		НомерПоля = 0;
		Пока Стр <> "" Цикл
			Токен = "";
			ПозицияРазделителя = Найти(стр, Разделитель);
			ПозицияОткрКавычек = Найти(стр, """");
			//"";""
			Если ПозицияОткрКавычек > 1 И Сред(стр, ПозицияОткрКавычек-1, 1) <> Разделитель Тогда
				ПозицияОткрКавычек = 0;
			КонецЕсли;
			Если (ПозицияРазделителя > ПозицияОткрКавычек ИЛИ ПозицияРазделителя = 0) И ПозицияОткрКавычек > 0 Тогда
				// начинающееся с кавычек читаем до тех пор
				Токен = Лев(Стр, ПозицияОткрКавычек);
				Стр = Сред(Стр, ПозицияОткрКавычек+1);
				ПозицияДляПоискаЗакрКавычек = 1;
				ПозицияЗакрКавычек = 0;
				Пока ПозицияЗакрКавычек = 0 Цикл
					Если СтрДлина(Стр) >= ПозицияДляПоискаЗакрКавычек Тогда
					ПозицияЗакрКавычек = СтрНайти(Стр, """",,ПозицияДляПоискаЗакрКавычек);
					КонецЕсли;
					
					Если ПозицияЗакрКавычек > 0 И Сред(Стр,ПозицияЗакрКавычек + 1, 1) = """" Тогда
						ПозицияДляПоискаЗакрКавычек = ПозицияЗакрКавычек + 2;
						ПозицияЗакрКавычек = 0;
						Продолжить; //это просто экранированная кавычка, а не кавычка закрывающее поле
					ИначеЕсли ПозицияЗакрКавычек > 0 Тогда
						Прервать;
					Иначе
						Токен = Токен + Стр + Символы.ПС;
						НомерСтроки = НомерСтроки + 1;
						Стр = ЧтениеТекста.ПрочитатьСтроку();
						Если Стр = Неопределено Тогда
							Стр = "";
							Прервать; // файл закончился, закрывающую кавычку не нашли
						КонецЕсли; 		
						ПозицияДляПоискаЗакрКавычек = 1; // ищем с начала новой, полученной строки
					КонецЕсли;
										
				КонецЦикла;
				
				Если СтрДлина(Стр) > ПозицияЗакрКавычек Тогда 
					ПозицияРазделителя=СтрНайти(Стр, Разделитель,,ПозицияЗакрКавычек + 1);
				Иначе
					ПозицияРазделителя = 0;
				КонецЕсли;
			КонецЕсли;
			
			Если ПозицияРазделителя>0 Тогда
				Токен = Токен + Лев(Стр, ПозицияРазделителя-1);
				Стр = Сред(Стр, ПозицияРазделителя+1);
			Иначе
				Токен = Токен + Стр; // разделитель не нашли, добавляем оставшуюся часть строки
				Стр = ""; // строка полностью обработана
			КонецЕсли;
			
			// Уберем экранирующие кавычки у поля, если они там были
			Если Лев(Токен, 1) = """" Тогда
				Токен = Сред(Токен, 2);
				Токен = ?(Прав(Токен, 1) = """", Лев(Токен, СтрДлина(Токен)-1), Токен);
			КонецЕсли;
						
			// убираем двойные кавычки 
			Токен = СтрЗаменить(Токен, """""", """");
			
			НомерПоля = НомерПоля + 1;
			Если НомерПоля > КоличествоКолонок Тогда
				Прервать;
			КонецЕсли;
			СтрокаТЗ[НомерПоля-1] = Токен;
			
		КонецЦикла;
		НомерСтроки = НомерСтроки + 1;
		Стр = ЧтениеТекста.ПрочитатьСтроку();
	КонецЦикла;
	
	ЧтениеТекста.Закрыть();
	
	Возврат Рез;

КонецФункции