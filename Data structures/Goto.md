# Goto
+ **Unrecommended**
+ Example
```cpp
While True Do
    For every Element Of ElementArray Do
        If Condition(Element) Then
            Goto ~ExitDoubleLoop;
        EndIf;
        ...
    EndDo;
EndDo;
        
~ExitDoubleLoop:
// continue calculations
```