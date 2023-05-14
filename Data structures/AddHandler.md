# AddHandler

+ Syntax
```cpp
AddHandler <Event>, <Event handler>;
```
+ Parameters
    + `<Event>`
    
        + Event to which the handler is added. 
        + Event is set as <Expression>.<Event name>, where:
        + `<Expression>` is a custom 1C:Enterprise script expression, the expression result is the object that has the event where the handler is added.
        + `<Event name>` is the event identifier (name).
    + `<Event handler>`
        
        A procedure or function of the event handler. 
        
        Event handler can be a method of a 1C:Enterprise script object. Then `<Event handler>` is set as `<Expression>.<Handler name>`, where:

        + `<Expression>` is a custom 1C:Enterprise script expression, the expression result is the object whose method serves as the event handler.
        + `<Handler name>` is the event handler method name.

        A procedure or function within the visibility scope can also be specified as an event handler. In this case the event handler is specified as the name of that procedure or function.

    
+ Example
```cpp
DataProcessor = DataProcessors.DocumentCheck.Create();
Invoice = Documents.Invoice.CreateDocument();
AddHandler Invoice.OnWrite, DataProcessor.OnDocumentWrite; 

msword = New COMObject("Word.Application");
AddHandler msword.DocumentChange, OnDocumentChange;

Procedure OnDocumentChange()
    Message("Document changed.");
EndProcedure
```