# Raise

+ Syntax
```cpp
// type 1
Raise <Expression>;
// type 2
Raise ([Expression]), [Category], [Code], [AdditionalInformation], [Reason]);
```
+ Parameters
    + `<Expression>`
    
        The expression calculation result is converted into a string that is used as an exception description.
    + `Category` *(optional)*
        
        + Type: ErrorCategory.
        + Specifies an error category. The category will be displayed to a user.  
        + Default value: Undefined.

        + The following error categories are not allowed:
            - AllErrors
            - OtherError
            - ScriptCompileError
            - ScriptRuntimeError
            - ExceptionRaisedFromScript
    + `Code` *(optional)*
        + Default value: Empty String
    
        Specifies an error code that can be used in error handlers to classify exceptions.
    + `AdditionalInformation` *(optional)*
        + Default value: Empty String
        
        Additional information about an error to be generated.
    + `Reason` *(optional)*
        + Type: ErrorInfo

    
+ Example
```cpp
Raise("Error on client with category", ErrorCategory.ConfigurationError, "error.client.config", "error.client.config additional info");
```