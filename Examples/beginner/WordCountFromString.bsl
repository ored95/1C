function WordCountFromString(val str) export
	//
	// Available since version 8.3.6. only
	// return strsplit(str, " ", False).count();
	//
	count = 0;
	i = 0;
	while True do
		while i <> strlen(str) and GetCharFromStringByIndex(str, i) = " " do
			Inc(i);
		enddo;
		if i = strlen(str) then
			break;
		endif;
		Inc(count);
		while i <> strlen(str) and GetCharFromStringByIndex(str, i) <> " " do
			Inc(i);
		enddo;
	enddo;
	return count;

endfunction