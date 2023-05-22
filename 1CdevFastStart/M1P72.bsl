&AtServer
Procedure ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	MonthsOfYear();
	
EndProcedure

&AtServer
Procedure MonthsOfYear(_year=2023)
	vtab = New ValueTable;
	vtab.Columns.Add("Month");
	vtab.Columns.Add("NumberDays");
	
	totalDays = (date(_year, 12, 31) - date(_year-1, 12, 31)) / 86400;	// 24 * 60 * 60
	
	row = vtab.Add(); row["Month"] = "Jan"; row["NumberDays"] = 31;
	row = vtab.Add(); row["Month"] = "Feb"; row["NumberDays"] = ?(totalDays = 366, 29, 28);
	row = vtab.Add(); row["Month"] = "Mar"; row["NumberDays"] = 31;
	row = vtab.Add(); row["Month"] = "Apr"; row["NumberDays"] = 30;
	row = vtab.Add(); row["Month"] = "May"; row["NumberDays"] = 31;
	row = vtab.Add(); row["Month"] = "Jun"; row["NumberDays"] = 30;
	row = vtab.Add(); row["Month"] = "Jul"; row["NumberDays"] = 31;
	row = vtab.Add(); row["Month"] = "Aug"; row["NumberDays"] = 31;
	row = vtab.Add(); row["Month"] = "Sep"; row["NumberDays"] = 30;
	row = vtab.Add(); row["Month"] = "Oct"; row["NumberDays"] = 31;
	row = vtab.Add(); row["Month"] = "Nov"; row["NumberDays"] = 30;
	row = vtab.Add(); row["Month"] = "Dec"; row["NumberDays"] = 31;
	
	Message("NumberDays of the " + _year + " year is " + vtab.Total("NumberDays"));
EndProcedure

&AtServer
Procedure YearПриИзмененииНаСервере()
	MonthsOfYear(Year);
EndProcedure

&AtClient
Procedure YearПриИзменении(Элемент)
	YearПриИзмененииНаСервере();
EndProcedure
