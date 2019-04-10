//%attributes = {}
  // ----------------------------------------------------
  // Anwender (OS): Thomas Maul
  // Datum und Zeit: 26.02.09
  // ----------------------------------------------------
  // Methode: UserMode_Pasteboard
  // Internal - set's current selection in Pasteboard
  // 
  // Parameter  -  none
  // ----------------------------------------------------


C_LONGINT:C283($i;$fieldcounter;$fieldcounter)
C_TEXT:C284($result;$field)
C_POINTER:C301($tableptr)

COPY SET:C600("UserSet";"$myset")

  //create a longint array with the sorted record numbers of the current selection, so we can
  // do a kind of Use Set("UserSet") while keeping the sort order
ARRAY LONGINT:C221($curSelSorted;0)
LONGINT ARRAY FROM SELECTION:C647(Table:C252(iUserMode_CurrentTable)->;$curSelSorted)
BOOLEAN ARRAY FROM SET:C646($Setarray;"UserSet")
For ($i;1;Size of array:C274($curSelSorted))
	If (Not:C34($Setarray{$curSelSorted{$i}}))
		$curSelSorted{$i}:=-1
	End if 
End for 
ARRAY LONGINT:C221($UseSelection;0)
For ($i;1;Size of array:C274($curSelSorted))
	If ($curSelSorted{$i}>=0)
		APPEND TO ARRAY:C911($UseSelection;$curSelSorted{$i})
	End if 
End for 

CUT NAMED SELECTION:C334(Table:C252(iUserMode_CurrentTable)->;"UserSet_OldSelection")
CREATE SELECTION FROM ARRAY:C640(Table:C252(iUserMode_CurrentTable)->;$UseSelection)

$result:=""
ARRAY POINTER:C280($arrptr;0)
ARRAY TEXT:C222($listt1;0)
ARRAY TEXT:C222($listt2;0)
ARRAY POINTER:C280($arrptr2;0)
ARRAY POINTER:C280($arrptr3;0)
ARRAY BOOLEAN:C223($arrbool;0)

LISTBOX GET ARRAYS:C832(*;"Listbox";$listt1;$listt2;$arrptr;$arrptr2;$arrbool;$arrptr3)
$fieldcounter:=Size of array:C274($arrptr)

For ($i;1;$fieldcounter)
	$field:=Field name:C257($arrptr{$i})
	If ($i=$fieldcounter)
		$result:=$result+$field+Char:C90(13)+Char:C90(10)
	Else 
		$result:=$result+$field+Char:C90(9)
	End if 
End for 

FIRST RECORD:C50(Table:C252(iUserMode_CurrentTable)->)
While (Not:C34(End selection:C36(Table:C252(iUserMode_CurrentTable)->)))
	
	For ($i;1;$fieldcounter)
		$field:=UserMode_ConvertFieldToText ($arrptr{$i})
		If ($i=$fieldcounter)
			$result:=$result+$field+Char:C90(13)+Char:C90(10)
		Else 
			$result:=$result+$field+Char:C90(9)
		End if 
	End for 
	
	NEXT RECORD:C51(Table:C252(iUserMode_CurrentTable)->)
End while 

SET TEXT TO PASTEBOARD:C523($result)

USE NAMED SELECTION:C332("UserSet_OldSelection")
COPY SET:C600("$myset";"userset")
UNLOAD RECORD:C212(Table:C252(iUserMode_CurrentTable)->)