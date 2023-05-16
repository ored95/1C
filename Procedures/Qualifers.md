# TypeDescription
```cpp
// Создание описателя типов для таблицы значений

КЧ = Новый КвалификаторыЧисла(12,2);
КС = Новый КвалификаторыСтроки(20);
Массив = Новый Массив;
Массив.Добавить(Тип("Строка"));
ОписаниеТиповС = Новый ОписаниеТипов(Массив, , КС);
Массив.Очистить();
Массив.Добавить(Тип("Число"));
ОписаниеТиповЧ = Новый ОписаниеТипов(Массив, , ,КЧ);

// Создание таблицы значений 

ТаблицаЗначений = Новый ТаблицаЗначений;
// добавим в таблицу значений три колонки

ТаблицаЗначений.Колонки.Добавить("Отдел",ОписаниеТиповС,"Отдел",20);
ТаблицаЗначений.Колонки.Добавить("Сотрудник",ОписаниеТиповС,
        "Фамилия сотрудника",20);
ТаблицаЗначений.Колонки.Добавить("Оклад",ОписаниеТиповЧ,"Оклад",10);
```

## 1. NumberQualifiers
+ Syntax: `New QualifiersNumber(<NumberDigits>, <NumberDigitsDecimalPart>, <ValidSign>)`
+ Options
    + `<NumberDigits>`: optional
    + `<NumberDigitsDecimalPart>`: optional
    + `<AllowedSign>`: `AllowedSign.Any` (by default), `AllowedSign.Nonnegative`
+ Example
    ```cpp
    QN = new NumberQualifiers(10, 2, AllowedSign.Nonnegative);
    ```
## 2. StringQualifiers
+ Syntax: `New StringQualifiers(<Length>, <MaxLength>)`
+ Options
    + `<Length>`: optional
    + `<MaxLength>`: optional
+ Example
    ```cpp
    QS = new StringQualifiers(10);
    ```
## 3. DateQualifiers
+ Syntax: `New DateQualifiers(<DateFractions>)`
+ Options
    + `<DataFractions>`
        + `Date`
        + `Time`
        + `DateTime`
+ Example
    ```cpp
    QS = new DateQualifiers(10, 2, AllowedSign.Nonnegative);
    ```
