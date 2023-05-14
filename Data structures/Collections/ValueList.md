# ValueList
+ `[Rus]` СписокЗначений

Iteration through collection using `For each ... In ... Do` operator is available to object. Collection items are retrieved during iteration. Access to collection item is possible using `[...]` operator. Item index (starting from `0`) is passed as an argument.

## Constructor
```cpp
list = New ValueList;
```

## Methods
1. `Add(<Value>, <Representation>, <CheckMark>, <Picture>)`
```cpp
Selection = Catalogs.PriceTypes.Select();
While Selection.Next() Do
    PriceTypesList.Add(Selection.Ref, Selection.Markup, True);
EndDo;
```
2. `CheckItems(<Title>)`
+ Return True indicates that the OK button is depressed in the check dialog; otherwise it is False.
```cpp
If PriceTypesList.CheckItems("Types of prices marked for deletion.") Then 
    For each Item In PriceTypesList Do
        If Item.Check Then
            Item.Value.GetObject().
            SetDeletionMark(True);
        EndIf;
    EndDo;
Else
    Message("UNMARKING types of prices for deletion.");
EndIf;
```
3. `CheckItemsAsync(<Title>)`
+ The promise execution result if the OK button was clicked is ValueList whose items were marked, if the Cancel button was clicked, the result is Undefined.

4. `ChooseItem(<Title>, <Item>)`
+ If the user cancels selection, the Undefined value is returned.

5. `ChooseItemAsync(<Title>, <Item>)`
+ The promise execution result is the selected item or Undefined if a user selected nothing.

6. `Clear`
+ Clears a list of values by deleting all items from it.
```cpp
PriceTypesList.Clear();
```
7. `Copy`
+ Creates a copy of the list of values.
```cpp
ListCopy = PriceTypesList.Copy();
```
8. `Count`
+ Obtains the number of items in a list of values.
```cpp
Message("Total types of prices: " + PriceTypesList.Count());
```
9. `Delete(<Item>)`
+ Deletes an item from the list of values.
```cpp
// Deleting by index in the list
PriceTypesList.Delete(0);

// Deleting by item
FoundItem = PriceTypesList.FindByValue(SelValue);
If FoundItem <> Undefined Then
    PriceTypesList.Delete(FoundItem);
Else
    Message("Value not found!");
EndIf;
```
10. `FillChecks(<CheckMarkValue>)`
+ Marks all items in a list of values.
```cpp
//  Mark for all lines
List.FillChecks(True);

//  Unmark all lines
List.FillChecks(False);
```
11. `FindByID(<ID>)`
+ If nothing is found, Undefined value is returned.

12. `FindByValue(<SoughtValue>)`
+ If none of the objects contains the search value, the value Undefined is returned.
```cpp
If ListBox1.FindByValue(SelValue) = Undefined Then
    Message("Value not found!");
EndIf;
```
13. `Get(<Index>)`
+ Obtains the value for the index. Works like the operator [].

14. `IndexOf`
+ Index of a specified item in the list of values. If none is found, returns -1
```cpp
LineNumber = List.IndexOf(CurrentListElement);
```
15. `Insert(<Index>, <Value>, <Representation>, <CheckMark>, <Picture>)`
+ Inserts a new item at the position in the list of values corresponding to the specified index. Return new list of values item.
```cpp
PriceTypesList.Add("All extra charges",, True);
SelectionOfPriceTypes = Catalogs.PriceTypes.Select();
While SelectionOfPriceTypes.Next() Do
    PriceTypesList.Insert(0, SelectionOfPriceTypes.Ref, 
                            SelectionOfPriceTypes.Markup, False);
EndDo;
```
16. `LoadValues(<ArrayOfValues>)`
+ You can use it to load a list of values from the passed array. All previous list items are deleted.
```cpp
PriceTypesList.LoadValues(ItemsArray);
```
17. `Move(<Item>, <Offset>)`
+ Shifts an item the specified number of positions forward or backward within a list of values.
```cpp
// Move the first item "down"
List.Move(0,1);
```
18. `ShowCheckItems(<NotifyOnCloseDescription>, <Title>)`
+ Interactively marks or unmarks items in a list of values.
```cpp
Notification = New CallbackDescription("AfterItemSelection", ThisObject);
PriceTypesList.ShowCheckItems(Notification, "Price types to be deleted.");
//...

AtClient
Procedure AfterItemSelection(List, Parameters) Export
    If List = Undefined Then
        Message("Mark for deletion of price types is cancelled.");
    Else
        For Each Item from List Do
            If Item.Check Then
                Item.Value.GetObject().
                SetDeletionMark(True);
            EndIf;
        EndDo;
    EndIf;
EndProcedure
```
19. `ShowChooseItem(<NotifyOnCloseDescription>, <Title>, <Item>)`
+ Opens a window for interactively selecting one of the elements in a list of values.
```cpp
Notification = New CallbackDescription("AfterItemSelection", ThisObject);
PriceTypesList.ShowChooseItem(Notification, "Select type of prices.");
//...

&AtClient
Procedure AfterItemSelection(ItemSelection, ListOfParameters) Export
    If ItemSelection = Undefined Then
        Message("Type of prices not selected.");
    Else
        SelectedValue = ItemSelection.Value;
    EndIf;
EndProcedure
```
20. `SortByPresentation(<Direction>)`
+ Sorts the list of values in ascending or descending alphabetical order according to the item representations that make up the list.
```cpp
PriceTypesList.SortByPresentation(SortDirection.Desc);
```
21. `SortByValue(<Direction>)`
+ Sorts the list of values in ascending or descending order by item value.
```cpp
PriceTypesList.SortByValue(SortDirection.Asc);
```
22. `UnloadValues`
+ Creates an array and copies item values from the list of values to it.
```cpp
ItemsArray = PriceTypesList.UnloadValues();
```