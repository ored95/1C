Function StrExtractWords(Val str) Export
	
	words = New Array;
	i = 0;
	word = "";
	While i < strlen(str) Do
		c = GetCharFromStringByIndex(str, i);
		If c <> " " Then
			While i < strlen(str) AND c <> " " Do
				word = word + c;
				Inc(i);
				c = GetCharFromStringByIndex(str, i);
			EndDo;
			words.Add(word);
			word = "";
		Else
			Inc(i);
		EndIf;
	EndDo;
	Return words;

EndFunction;