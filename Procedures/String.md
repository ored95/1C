# String functions

1. `Left(<Line>, <CountOfCharacters>)`
+ Selects first characters of the string from left.
```cpp
InitialName = Left(Employee.Name, 1);
InitialPatronymic = Left(Employee.Patronymic, 1);
FullName = Employee.Name + " "
    + InitialName + "." 
    + InitialPatronymic + ".";
```
2. `Right(<Line>, <CountOfCharacters>)`
+ Selects first characters of the string from left.
```cpp
// Let the automobile number is set as x999xx99 in the fixed assets catalog,
// where two last numbers represent the region code.
// Let's receive the region code from the number.
RegionCode = Right(BasicMeans.StateNumber, 2);
```
3. `TrimL(<Line>)`
+ Removes insignificant characters spaces to the left of the first significant character in a string.
```cpp
Name3Print = TrimL(Article.Name);
```
4. `TrimR(<Line>)`
+Removes insignificant characters to the right of the last significant character in a string.
```cpp
Name4Print = TrimR(Article.Name);
```
5. `TrimAll(<Line>)`
+ Removes insignificant characters to the left of the first significant character and trailing spaces to the right of the last significant character in a string.
```cpp
Name5Print = TrimAll(Article.Name);
```
6. `StrLen(<Line>)`
+ Obtains the number of characters in a string.
```cpp
DescriptionLength = StrLen(Article.Name);
```
7. `StrFind(<Line>, <SearchSubstring>, [<SearchDirection>], [<StartIndex>], [<EntryNumber>])`
+ Return the position of the first character of the found substring. Character numbering in a string starts from 1. If a string does not contain the specified substring, returns 0.
+ Optional parameters:
    + `<SearchDirection>`: `FromBegin`, `FromEnd`
    + `<StartIndex>`: `1` by default
    + `<EntryNumber>`: Specifies the entry number of the substring being searched for in the initial string, `1` by default
```cpp
If StrFind(Employee.Name, "John") > 0 Then
    Message(Employee.Name + ", code = " + Employee.Code);
EndIf;
```
8. `StrReplace(<Line>, <SearchSubstring>, <ReplaceSubstring>)`
+ Finds all occurrences of the search substring in the source string and replaces them with the value of the Replace substring.
```cpp
Result = StrReplace(Nomenclature.Name, "_", " ");
```
9. `StrStartsWith(<String>, <SearchString>)`
+ Determines that a string begins with the specified substring.
```cpp
StrStartsWith("hello", "he");   // True
```
10. `StrEndsWith(<String>, <SearchString>)`
+ Determines if the string ends with the specified substring.
```cpp
StrStartsWith("hello.", ",");   // False
```
11. `StrLineCount(<Line>)`
+ Counts the number of lines in a multiline string. Lines of a multiline string are separated by line break characters (`Chars.LF`). If there are no characters after the last line break character, it is ignored.
```cpp
For X = 1 To StrLineCount(SourceText) Do 
    ... 
EndDo;
```
12. `StrGetLine(<Line>, <LineNumber>)`
+ Obtains a line of a multi-line string by its number.
```cpp
For Counter = 1 To StrLineCount(InitialText) Do
    CurRow = StrGetLine(InitialText, Counter);
    ...
EndDo;
```
12. `StrCompare(<String1>, <String2>)`
+ Returns:
    + `-1` - the first string is smaller than the second one.
    + `1` - the first string is bigger than the second one.
    + `0` - the first string is equal to the second one.
13. `StrSplit(<String>, <Separator>, [<IncludeBlank>])`
+ Splits a string into parts according using the specified delimiter.
+ `<IncludeBlank>`: Shows if it is required to include the empty strings which can result from a separation of a source string while calculating the result. By default, `True` is set.
14. `StrConcat(<Strings>, [<Separator>])`
+ Merges an array of strings passed into a single string with the specified delimiter.
+ `<Separator>`: The string that will be inserted between merged strings. If no parameter is set, the strings will be merged together.
15. `Mid(<Line>, <InitialNumber>, <CountOfCharacters>)`
+ Selects a character string beginning with `<InitialNumber>` character, `<CountOfCharacters>` characters total.
```cpp
// let the automobile number is set as x999xx99 in the fixed assets catalog,
// where two last numbers represent the region code.
// Let's receive the numeric part of number.
FiguresOfNumber = Mid(BasicMeans.StateNumber, 2, 3);
```
16. `Upper(<Line>)`
+ Converts all characters in a string to upper case.
```cpp
StateNumber = Upper(BasicMeans.StateNumber);
```
17. `Lower(<Line>)`
+ Converts all characters in a string to lower case.
```cpp
StateNumber = Lower(BasicMeans.StateNumber);
```
18. `NStr(<InitialString>, <LanguageCode>)`
+ Gets a string in the current user language or in the specified language from a set of strings in different languages available in the configuration.
```cpp
Message(NStr("en = 'Good evening!'; ru = 'Добрый вечер!'"));
```
19. `StringWithNumber(<SourceString>, <Number>, <NumericValueType>, <NumberFormatString>)`
+ Generates a number presentation for the specified locale code and number parameters.
+ `<SourceString>`: A string that contains 6 word forms for each numeral, separated by semicolons.
```cpp
// This example displays the number of days left until the New Year.
String = StringWithNumber("; %1 day; ; ; ; %1 days",   
    DaysUntilNewYear,   
    NumericValueType.Cardinal,   
    "L=en");   
String = String + " left until New Year's Day";    
// Results:
// "1 day left until New Year's Day" 
// "8 days left until New Year's Day"
```
20. `StrTemplate(<Template>, <Value1-Value10>)`
+ Inserts parameters into string by number.
    + If the string contains two `%` characters in a row (`%%`), they are regarded as a single percent character, no matter if there is a number immediately after the characters or not.
    + The *"Insufficient actual parameters"* exception is generated if the parameters are not sufficient to fill in the `%N` parameter template.
    + The *"Too many parameters"* exception is generated if there are too many parameters to be inserted into template.
```cpp
StrTemplate("Data error in line %1 (%2 type required)", 2, "Date");
```
