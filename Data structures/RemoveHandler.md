# Remove handler

+ Syntax
```cpp
RemoveHandler <Event>, <Event handler>;
```
+ Parameters
    + `<Event>`
        + Event whose handler is removed. 
        + The event is specified as `<Expression>.<Event name>`, where:
            + `<Expression>` is a custom 1C:Enterprise script expression, the expression result is the object that has the event where the handler is removed.
            + `<Event name>` is the event identifier (name).
    + `<Event handler>`
        + A procedure or function of the event handler.  
        + Event handler can be a method of a 1C:Enterprise script object. Then `<Event handler>` is set as `<Expression>.<Handler name>`, where:
            + `<Expression>` is a custom 1C:Enterprise script expression, the expression result is the object whose method serves as the event handler.
            + `<Handler name>` is the event handler method name.
        + A procedure or function within the visibility scope can also be specified as an event handler. In this case the event handler is specified as the name of that procedure or function.

+ Description

    Removes an event handler. When an event handler is removed, the check that the number of event parameters matches the number of method parameters is performed.

+ Example
```cpp

RemoveHandler Invoice.OnWrite, DataProcessor.OnWriteDocument;
```