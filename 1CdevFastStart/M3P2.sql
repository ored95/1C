ВЫБРАТЬ
	РеализацияТоваровТовары.Номенклатура,
	РеализацияТоваровТовары.Количество,
	РеализацияТоваровТовары.Сумма,
	ВЫБОР
		КОГДА РеализацияТоваровТовары.Сумма > 10000
			ТОГДА "Опт"
		ИНАЧЕ ВЫБОР
				КОГДА РеализацияТоваровТовары.Сумма < 5000
					ТОГДА "Розница"
				ИНАЧЕ "Мелкий опт"
			КОНЕЦ
	КОНЕЦ КАК ТипЗакупки,
	РеализацияТоваровТовары.Ссылка
ИЗ
	Документ.РеализацияТоваров.Товары КАК РеализацияТоваровТовары