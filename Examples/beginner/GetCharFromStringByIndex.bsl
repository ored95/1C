function GetCharFromStringByIndex(val string, val index) export
	return right(left(string, index+1), 1);
endfunction