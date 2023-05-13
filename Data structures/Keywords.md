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