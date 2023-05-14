# Map
+ [Ru] Словарь
+ Collection elements: [KeyAndValue](./KeyAndValue.md)

## Constructor
```cpp
// by default
ProcessingParameters = New Map;

// base on fixed map
mp = New Map(<FixedMap>);
```
## Methods
1. `Insert(<Key>, <Value>)`
+ You can use it to set a value of correspondence item by key. If an item with the transferred key value exists, its value is replaced; otherwise a new item is added. If `<Value>` is not specified, `Undefined` will be set.
```cpp
ProcessingParameters = New Map;
ProcessingParameters.Insert("Beginning date", BeginDate);
ProcessingParameters.Insert("End date", EndDate);
```
2. `Delete(<Key>)`
+ Deletes the mapping element with the given key.
```cpp
AvailableDimensions = New Map;
For IndexOf = 0 To ReportBuilder.AvailableFields.Count()-1 Do
    Field = ReportBuilder.AvailableFields[IndexOf];
    If Field.Dimension Then
        AvailableDimensions.Insert(Field.Name, Field.Presentation);
    EndIf;
EndDo;

For IndexOf = 0 To ReportBuilder.RowDimensions.Count()-1 Do
    Dimension = ReportBuilder.RowDimensions[IndexOf];
    AvailableDimensions.Delete(Dimension.Name);
EndDo;

For IndexOf = 0 To ReportBuilder.ColumnDimensions.Count()-1 Do
    Dimension = ReportBuilder.ColumnDimensions[IndexOf];
    AvailableDimensions.Delete(Dimension.Name);
EndDo;
```
3. `Count()`
+ Obtains number of mapping elements.
```cpp
ProcessingParameters.Count();
```
4. `Get(<Key>)`
+ Obtains value by key. Works like the operator []. Return Value of an element of map or `Undefined` if the key is not specified.
5. `Clear()`
+ Deletes all mapping elements.
```cpp
ProcessingParameters.Clear();
```