# Try catch

+ Syntax
```cpp
Try
    // Try operators
Except
    // Exception operators
[Raise;]
    // Exception operators
EndTry;
```

+ Description
    + The `Try` operator manages the code execution based on errors (exceptions) that arise during module execution, and defines how these exceptions are handled. Errors (exceptions) originate from module runtime errors. User-defined exceptions are not supported.
    + If a runtime error occurs during the execution of an operator sequence, the execution of the operator that caused the error is stopped, and the control is passed to the first operator from the exception handling operator sequence. The control is passed even if the error is caused by an operator within a procedure or function called from a `Try` operator. If an error occurs in a procedure or function, the procedure or function is terminated and its local variables are destroyed. This is true for any nesting level of a procedure or function call. Once an exception operator sequence is executed, the control is passed to the operator following the `EndTry` keyword. If the `Try` operator sequence is executed without errors, the exception operator sequence is skipped, and the control is also passed to the operator following the `EndTry` keyword.
    + `Try–Except–EndTry` clauses can be nested. If an exception is raised, the control is passed to the handler that contains the Try operator where the error occurred. If a `Raise` operator is called in the exception operator sequence of this handler, the control is passed to the exception handler one level higher, and so on. If there is no exception handler on a higher level, the exception is handled at the system level and the module execution is stopped.
    + In 1C:Enterprise language, modules are to be compiled prior to execution. If a module text contains errors, the module cannot be compiled and an exception is raised. This exception is fatal; it cannot be caught and handled in the `Try–Except–EndTry` clause, so finally it leads to an application crash. Any 1C:Enterprise language execution error that occurs during the module initialization (execution of the module body) also leads to a fatal exception. A 1C:Enterprise application stops after this error because the object that owns the module is not initialized.