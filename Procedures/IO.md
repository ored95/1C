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

## Output
1. `DoMessageBox(<MessageText>, [<Timeout>], [<Title>])`
```cpp
DoMessageBox("Select a document!", 10);
```
2. `Message(<MessageText>, <Status>)`
```cpp
Message("Selected SKU is out of the stock!", MessageStatus.Important);
```
