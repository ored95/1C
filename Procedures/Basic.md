# Basic functions

1. `UserName()`
+ `[Ru]` ИмяПользователя
+ Receives name of user indicated which launching the program.
```cpp
CurrentUser = UserName();
```
2. `CurrentDate()`
+ `[Ru]` ТекущаяДата
+ Determines current (system) date on the computer.
```cpp
If StartDate = '00010101000000' Then
    StartDate = BegOfMonth(CurrentDate());
EndIf; 
If EndDate = '00010101000000' Then
    EndDate = EndOfMonth(CurrentDate());
EndIf;
```