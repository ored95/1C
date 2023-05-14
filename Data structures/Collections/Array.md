# Map
+ [Ru] Массив

## Constructor
```cpp
// By number of elements
Array1 = New Array;         // array contains no elements
Array2 = New Array(10, 2);  // array contains 10 elements, each of them is an array of 2 elements

// base on fixed array
a = New Array(<Array>);
```
## Methods
1. `Add(<Value>)`
+ Adds an element to the end of the array.
```cpp
Array.Add("First");
Array.Add("Second");
```
2. `Insert(<Index>, <Value>)`
+ Inserts a value into an array using a specified index. If `<Value>` is not specified, a value of `Undefined` type will be added.
```cpp
Array.Insert(0, "First");
```
3. `Delete(<Index>)`
+ Deletes a value from an array using a specified index. 
+ Note: if the specified index is greater than `UBound`, then no actions are performed and the "Index outside array bounds" message is not displayed.
```cpp
Array.Delete(4);
```
4. `Find(<Value>)`
+ Searches for an array item by item name. If the element is found, its index comes back. If nothing is found, `Undefined` value is returned.
5. `Get(<Index>)`
+ Obtains the value for the index. Works like the operator [].
```cpp
ProcessingParameters.Clear();
```
6. `Set(<Index>, <Value>)`
+ You can use it to specify a value by index. Works like the operator [].
```cpp
ProcessingParameters.Clear();
```
7. `Count()`
+ use to get the number of elements in the array.
```cpp
NumberOfElements = Array.Count();
```
8. `UBound()`
+ Obtains the maximum index of an array element.
```cpp
For IndexOf = 0 to Array.UBound() Do
    Array[IndexOf] = Array[IndexOf] + 1;
EndDo;
```
9. `Clear()`
+ Deletes all values from the array.
```cpp
StringsArray.Clear();
```