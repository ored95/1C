# Basic types

1. `String`
+ Init value
```cpp
// Example 1: line with "" character
msg = "Hello ""Monday""";

// Example 2: multilines
msg = "Today"
      "is"
      "Monday";

// Example 3: multilines
msg = "Today
      |is
      |Monday";
```
+ Operators
```cpp

```
2. `Number`
+ Init value
```cpp
x = 100;
y = -10.25;
```
3. `Date`
+ Init value `YYYY-MM-DD HH:MM:SS [AM/PM optional]`
```cpp
dt1 = '20230514101230';                 // 2023-05-14 10:12:30
dt2 = Date("19840326062421");           // 1984-03-26 06:24:21
dt3 = Date(1984, 03, 26, 06, 24, 21);   // 1984-03-26 06:24:21
```
+ Operators
```cpp
dt0 = Date(2000, 1, 1); // 2000-01-01 00:00:00

// Add one second
dt1 = dt0 + 1;      // 2000-01-01 00:00:01

// Add one minute
dt2 = dt0 + 60;     // 2000-01-01 00:01:00

// Add one hour
dt3 = dt0 + 60*60;  // 2000-01-01 01:00:00

// Add one day
dt4 = dt0 + 24*60*60;   // 2000-01-02 00:00:00

// Subtract two days
dt5 = dt0 - 2*24*60*60; // 1999-12-30 00:00:00

// Add n months?
dt6 = AddMonth(dt0, 6);         // 2000-07-01 00:00:00
dt7 = AddMonth(dt0, -2*12);     // 1998-01-01 00:00:00
```
4. `Boolean`
+ `True` (Истино)
+ `False` (Ложь)

5. `Undefined` (неопределено)