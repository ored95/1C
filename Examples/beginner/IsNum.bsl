//
// return number value if parsed, else Undefined
//
Function IsNum(str) export
   Try
      x = Number(str);
      Return x;
   Except
      Return Undefined;
   EndTry
EndFunction
