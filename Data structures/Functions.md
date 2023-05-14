# Functions

+ Syntax
```cpp
[Async] Function <Function name>([[Val] <Parameter1>[=<DefaultValue>], ... ,[Val] <ParameterN>[=<DefaultValue>]])[Export] 
    //Declarations of local variables;
    // Operators ;
    ...
    Return <Return value>;
    // Operators ;
    ...
EndFunction
```
+ Parameters
    + `Async`
    
        The modifier is applicable only to a function executed on the client. It shows whether a function is asynchronous. An asynchronous function always returns an object of the Promise type. An asynchronous function runs synchronously until the first Await operator. Then the function returns a value of the Promise type and the caller resumes control. Then the current function runs asynchronously. When the result is received, Promise is filled with the received value. If the function throws an exception, it can be caught by the caller.
        
        Asynchronous function parameters are passed as values only (`Val` is added implicitly).
    + `<Function name>`
        
        The function name.
    + `Val`
    
        An optional keyword. The parameter that follows the keyword is passed as a value (changing the value of the formal parameter during the function execution does not affect the actual parameter that is passed at the function call). If this keyword is not specified, the function parameter is passed as a reference (changing the formal parameter value inside the function changes the actual parameter value).
    + `<Parameter1>, ..., <ParameterN>`

        An optional comma-separated list of formal parameters. Formal parameter values must match the values of actual parameters that are passed to the function. This list contains the parameter names that are used in the function text. The list of formal parameters can be empty.
    + `=<DefaultValue>`
        
        An optional default parameter value. You can include parameters with default values anywhere in the list of formal parameters.

    + `Export`
    
        An optional keyword that specifies that this function is accessible from other modules.

+ Code function
    + Declarations of local variables
        
        Declations of local variables that can be referenced in this function only.
    + Operators

        Executable function operators.
    + `Return <Return value>`

        A keyword that ends the function and returns the specified value to the expression where the function is used. 
        
        A return value can be an expression or a variable whose value contains the function call result.

    + `EndFunction`
        
        A mandatory keyword that denotes the end of the function.

+ Description

    The Function keyword denotes the beginning of code fragment that can be called from any point of the module using the `<Function name>` operator with a list of parameters (parentheses are mandatory even if no parameters are passed). If an ordinary application module, managed application module, external connection module, session module, or common module contains the Export keyword in the function declaration, it means that the function is accessible from all other configuration modules.

    The only difference between functions and procedures is that functions return `<Return value>`. The EndFunction keyword denotes the end of the function.
    
    A call to any function in the module text can be registered as a procedure call. It means that it is allowed not to accept a return value from the function.

    The variables declared in the **"Declarations of local variables"** section of the function body are local variables and therefore accessible in this function only (except when they are used as parameters for calling other procedures, functions, or methods).