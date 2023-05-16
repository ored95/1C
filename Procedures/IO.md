# Input / Output functions

## Input
1. `InputString(<String>, [<Tooltip>], [<Length>], [<Multiline>])`
```cpp
Text = "";
ToolTip = "Enter notificatioin text";
If InputString(Text, ToolTip, 0, True) Then
    // Store notification text
EndIf;
```
2. `InputValue(<Value>, <Description>, <Type>)`
```cpp
var data;
arr = new Array;
arr.Add(Type("Number"));
arr.Add(Type("String"));
arr.Add(Type("Date"));
QN = new NumberQualifiers(12, 2, AllowedSign);
QS = new StringQualifiers(20);
QD = new DateQualifiers(ЧастиДаты.Дата);
TypeDesc = new TypeDescription(arr, QN, QS, QD);
If InputValue(data, "Input values below", TypeDesc) Then
    // process with data
    Message(data);
EndIf;
```

## Output
1. `DoMessageBox(<MessageText>, [<Timeout>], [<Title>])`
```cpp
DoMessageBox("Select a document!", 10);
```
2. `Message(<MessageText>, <Status>)`
```cpp
Message("Selected SKU is out of the stock!", MessageStatus.Important);
```
3. UserNotifications
```cpp
// show notification
ShowUserNotification("something ...");
```
