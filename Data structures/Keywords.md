# Keywords

1. `Var`
+ `[Ru]` Перем
+ This operator is used for explicit variable declaration.
+ Version: `Var <Variable name 1> [[Export] [, <Variable name 2> [Export], ...]`
2. `New`
+ `[Ru]` Новый
+ This operator is used for explicit variable declaration.
+ Versions

    #1. `New <Type ID>[(<Param1>, <Param2>, ...)]`

    #2. `New(<Type>[, <ConstructorParameters>])`

```cpp
// Example 1
SaveList = New Structure;
DataStorage = New ValueStorage(SaveList);

// Example 2
ValueType = Type("StringQualifiers");
Parameters = New Array(2);
Parameters[0] = 20;
Parameters[1] = AllowedLength.Variable;
StrQual = New(ValueType, Parameters);
```

3. Conditional expression
+ Logical operators
```cpp
=, <>, <, <=, >, >=
and (И)
or  (ИЛИ)
not (НЕ)
```
+ Syntax
```cpp
if <Logical expression> then
    // Operators
[elsif  <Logical expression> then]
    // Operators
[else]
    // Operators
endif;

// RU
Если ... Тогда
    ...
ИначеЕсли ... Тогда
    ...
Иначе
    ...
КонецЕсли;
```
+ Example
```cpp
// Example 1
if 1 > 2 then
    Message("1 > 2");
else
    Message("1 < 2");
    if 1 = 2 then
        Message("Not OK");
    endif;
endif;

// Example 2: operator ?(..., ..., ...)
msg = ?(UserName() <> "admin", "guest", "boss");
```
4. Loop
+ Syntax 1
```cpp
For <Variable name> = <Expression 1> To <Expression 2> Do
    // Operators
    [Break;]
    // Operators
    [Continue;]
    // Operators
EndDo;
```
+ Syntax 2
```cpp
For Each <Variable name 1> In <Variable name 2> Do
    // Operators
    [Abort;]
    // Operators
    [Continue;]
    // Operators
EndDo;
```
+ Syntax 3
```cpp
While <Logical expression> Do
    // Operators
    [Break;]
    // Operators
    [Continue;]
    // Operators
EndDo;
```

5. Module program structure
```cpp
var variable1;    // explanation
var variable2;    // explanation
...
var variableN;    // explanation

procedure ProcedureName1(...)
    ...
endprocedure;

function FunctionName1(...)
    ...
endfunction;
...
procedure ProcedureNameM(...)
    ...
endprocedure;

function FunctionNameM(...)
    ...
endfunction;

// operators with variables, functions or procedures
...
```