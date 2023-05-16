# Numberic functions

1. `Exp`
2. `Log`
3. `Log10`
4. `Pow`
5. `Sin`
6. `Cos`
7. `Tan`
8. `Sqrt`
9. `Int`
```cpp
MaxBuy = Int(TotalCurrentAvailability / Price);
```
10. `Round`
```cpp
// Round the price to hundreds of rubles
RoundedPrice = Round(Price, -2);

// Round the price to kopecks
RoundedPrice = Round(Price, 2);
```
11. `SquaredEuclidean`
+ The distance between two objects is calculated by the formula: `D = sum( Wi * (Xi - Yi)^2)`, where `Xi`, `Yi` are object attribute values, `Wi` is a weight coefficient. `i` is the attribute number, from `1` to `n`, where `n` is the number of attributes.