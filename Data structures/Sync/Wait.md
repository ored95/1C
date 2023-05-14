# Wait

+ Syntax
```cpp
Await <Expression>;
```
+ Description
    + A conditional keyword. It is a keyword only in procedures and functions marked as `Async`.
    + The `Await` operator is used to wait for `Promise` to complete. It returns a value received from **Wait**. If you apply this operator to a value that is not `Promise`, it will be implicitly converted to `Promise` filled with this value. `Await` stops code execution of a procedure or function that it is a body part of until `Promise` is filled with the value.
    + You can use the `Await` operator only in procedures and functions marked as `Async`.