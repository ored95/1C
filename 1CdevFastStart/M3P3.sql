ВЫБРАТЬ
	Сотрудники.ФИО,
	Сотрудники.ДатаРождения,
	Сотрудники.Наименование
ИЗ
	Справочник.Сотрудники КАК Сотрудники
ГДЕ
	&ТекущаяДата МЕЖДУ 
		ДОБАВИТЬКДАТЕ(ДОБАВИТЬКДАТЕ(Сотрудники.ДатаРождения, ГОД, РАЗНОСТЬДАТ(Сотрудники.ДатаРождения, &ТекущаяДата, ГОД)), ДЕНЬ, -&КБД) И
		ДОБАВИТЬКДАТЕ(Сотрудники.ДатаРождения, ГОД, РАЗНОСТЬДАТ(Сотрудники.ДатаРождения, &ТекущаяДата, ГОД))
	ИЛИ
	&ТекущаяДата МЕЖДУ 
		ДОБАВИТЬКДАТЕ(ДОБАВИТЬКДАТЕ(Сотрудники.ДатаРождения, ГОД, РАЗНОСТЬДАТ(Сотрудники.ДатаРождения, &ТекущаяДата, ГОД) + 1), ДЕНЬ, -&КБД) И
		ДОБАВИТЬКДАТЕ(Сотрудники.ДатаРождения, ГОД, РАЗНОСТЬДАТ(Сотрудники.ДатаРождения, &ТекущаяДата, ГОД) + 1)
