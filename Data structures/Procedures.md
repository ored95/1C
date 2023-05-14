# Procedures

+ Syntax
```cpp
[Async] Procedure <Procedure name>([[Val] <Parameter1> [=<DefVal>], ... ,[Val] <ParameterN> [=<DefVal>]])[Export] 
    // Declarations of local variables;
    // Operators;
    ...
    [Return;]
    // Operators;
    ...
EndProcedure
```
+ Parameters
    + `Async`
    
        The modifier is applicable only to a procedure executed on the client. It shows whether a procedure is asynchronous. An asynchronous procedure runs synchronously until the first Await operator or until its normal completion. After first Await, the caller resumes control. Then the current procedure runs asynchronously.
        
        Asynchronous function parameters are passed as values only (`Val` is added implicitly).
    + `<Procedure name>`
        
        The procedure name.
    + `Val`
    
        An optional keyword. The parameter that follows the keyword is passed as a value (changing the value of the formal parameter during the procedure execution does not affect the actual parameter that is passed at the procedure call). If this keyword is not specified, the procedure parameter is passed as a reference (changing the formal parameter value inside the procedure changes the actual parameter value).
    + `<Parameter1>, ..., <ParameterN>`

        An optional comma-separated list of formal parameters. Formal parameter values must match the values of actual parameters that are passed to the function. This list contains the parameter names that are used in the function text. The list of formal parameters can be empty.
    + `=<DefVal>`
        
        An optional default parameter value. You can include parameters with default values anywhere in the list of formal parameters.

    + `Export`
    
        An optional keyword that specifies that this procedure is accessible from other modules.

+ Code procedure
    + Declarations of local variables
        
       Declations of local variables that can be referenced in this procedure only.
    + Operators

        Executable procedure operators.
    + `Return`

        An optional keyword that ends the procedure and returns to the code point where the procedure was called.

    + `EndProcedure`
        
        A mandatory keyword that identifies the end of procedure. 
        Returns to the code point where the procedure was called.

+ Description

    The `Procedure` keyword denotes the beginning of code fragment that can be called from any point of the module using the `<Procedure_name>` operator with a list of parameters (parentheses are mandatory, even if no parameters are passed). If an ordinary application module, application module, or common program module contains the `Export` keyword in the procedure declaration, it means that the procedure is accessible from all other configuration modules.

    When the `Return` operator is executed, the procedure ends and returns control to the point of call. If procedure text does not contain the `Return` operator, an implicit `Return` operator is executed after the last executable operator. The `EndProcedure` operator denotes the end of the procedure.
    
    A call to any function in the module text can be registered as a procedure call. It means that it is allowed not to accept a return value from the function.

    The variables declared in the **local variable declaration area** of the procedure body are local variables and therefore accessible in this procedure only (except when they are used as parameters for calling other procedures or functions).