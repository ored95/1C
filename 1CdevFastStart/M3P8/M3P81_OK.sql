ВЫБРАТЬ РАЗЛИЧНЫЕ
	РеализацияТоваров.Контрагент.Ссылка КАК Контрагент,
	"Поставщик" КАК Статус,
	РеализацияТоваров.Контрагент.Код КАК Код,
	РеализацияТоваров.Контрагент.Наименование КАК Наименование,
	РеализацияТоваров.Контрагент.Представление КАК Представление
ПОМЕСТИТЬ НеПрочих
ИЗ
	Документ.РеализацияТоваров КАК РеализацияТоваров

ОБЪЕДИНИТЬ ВСЕ

ВЫБРАТЬ РАЗЛИЧНЫЕ
	ПоступлениеТоваров.Контрагент.Ссылка,
	"Покупатель",
	ПоступлениеТоваров.Контрагент.Код,
	ПоступлениеТоваров.Контрагент.Наименование,
	ПоступлениеТоваров.Контрагент.Представление
ИЗ
	Документ.ПоступлениеТоваров КАК ПоступлениеТоваров
;

////////////////////////////////////////////////////////////////////////////////
ВЫБРАТЬ РАЗЛИЧНЫЕ
	Контрагенты.Ссылка КАК Контрагент,
	"Прочие" КАК Статус,
	Контрагенты.Код,
	Контрагенты.Наименование,
	Контрагенты.Представление
ПОМЕСТИТЬ Прочие
ИЗ
	Справочник.Контрагенты КАК Контрагенты,
	НеПрочих КАК НеПрочих
ГДЕ
	НЕ Контрагенты.ЭтоГруппа
	И НЕ Контрагенты.Ссылка В
				(ВЫБРАТЬ РАЗЛИЧНЫЕ
					НеПрочих.Контрагент
				ИЗ
					НеПрочих КАК НеПрочих)
;

////////////////////////////////////////////////////////////////////////////////
ВЫБРАТЬ
	НеПрочих.Контрагент КАК Контрагент,
	НеПрочих.Статус КАК Статус,
	НеПрочих.Код КАК Код,
	НеПрочих.Наименование КАК Наименование,
	НеПрочих.Представление КАК Представление
ИЗ
	НеПрочих КАК НеПрочих

ОБЪЕДИНИТЬ ВСЕ

ВЫБРАТЬ
	Прочие.Контрагент,
	Прочие.Статус,
	Прочие.Код,
	Прочие.Наименование,
	Прочие.Представление
ИЗ
	Прочие КАК Прочие