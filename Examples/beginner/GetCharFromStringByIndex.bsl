Function GetCharFromStringByIndex(val string, val index) export
   // return right(left(string, index+1), 1);
   Return Mid(string, index+1, 1);
Endfunction
