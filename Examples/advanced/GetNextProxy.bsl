Function GetNextProxy()
	
	ServerName = "https://www.proxy-list.download";
	URL = "api/v1/get?type=https&anon=transparent&country=NL";
	
	HTTPRequest = New HTTPRequest(URL);
	Connection = New HTTPConnection(ServerName);
	Res = Connection.Get(HTTPRequest);
	ResStr = Res.GetBodyAsString();
	
	StringsArray = New Array();
	LineCount = StrLineCount(ResStr);

	if LineCount <= UsedProxiesCount Then
		Return Undefined;	
	EndIf;

	For StrNum = 1 To LineCount Do
		Str = StrReplace(StrGetLine(ResStr, StrNum), Chars.CR, "");
		StringsArray.Add(StrSplit(Str, ":"));
	EndDo;
	
	ProxyIP = StringsArray[UsedProxiesCount][0];
	ProxyPort = Number(StringsArray[UsedProxiesCount][1]);
	Proxy = New InternetProxy(False);
	Proxy.Set("https", ProxyIP, ProxyPort, "", "", False);
	UsedProxiesCount = UsedProxiesCount + 1;
	Return Proxy;

EndFunction