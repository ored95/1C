Function ExtractNumbersFromString(str) export
   
   words = StrExtractWords(str);
   nums = New Array;
   For Each word in words Do
	   num = IsNum(word);
	   If num <> Undefined Then
		   nums.Add(num);
	   EndIf;
   EndDo;
   Return nums;
   
EndFunction
