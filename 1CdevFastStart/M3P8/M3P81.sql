ВЫБРАТЬ РАЗЛИЧНЫЕ
	РеализацияТоваров.Контрагент,
	1 КАК Покупатель
ПОМЕСТИТЬ Покупатели
ИЗ
	Документ.РеализацияТоваров КАК РеализацияТоваров
;

////////////////////////////////////////////////////////////////////////////////
ВЫБРАТЬ РАЗЛИЧНЫЕ
	ПоступлениеТоваров.Контрагент,
	1 КАК Поставщик
ПОМЕСТИТЬ Поставщики
ИЗ
	Документ.ПоступлениеТоваров КАК ПоступлениеТоваров
;

////////////////////////////////////////////////////////////////////////////////
ВЫБРАТЬ
	Покупатели.Покупатель,
	Поставщики.Поставщик,
	Контрагенты.Ссылка
ПОМЕСТИТЬ АктивныеКонтрагенты
ИЗ
	Справочник.Контрагенты КАК Контрагенты
		ЛЕВОЕ СОЕДИНЕНИЕ Покупатели КАК Покупатели
		ПО Контрагенты.Ссылка = Покупатели.Контрагент
		ЛЕВОЕ СОЕДИНЕНИЕ Поставщики КАК Поставщики
		ПО Контрагенты.Ссылка = Поставщики.Контрагент
ГДЕ
	НЕ Контрагенты.ЭтоГруппа
;

////////////////////////////////////////////////////////////////////////////////
ВЫБРАТЬ
	АктивныеКонтрагенты.Ссылка КАК Наименование,
	АктивныеКонтрагенты.Покупатель КАК Покупатель,
	АктивныеКонтрагенты.Поставщик КАК Поставщик
ИЗ
	АктивныеКонтрагенты КАК АктивныеКонтрагенты