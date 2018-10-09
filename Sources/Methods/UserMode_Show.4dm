//%attributes = {"shared":true}

  // ----------------------------------------------------
  // Anwender (OS): Thomas Maul
  // Datum und Zeit: 26.02.09
  // ----------------------------------------------------
  // Methode: UserMode_Show
  // Displays the user mode
  // 
  // Parameter  -  optional - table number to show
  // Parameter 2 -  optional - true to allow free text execution
  // ----------------------------------------------------

UserMode_Init 
UserMode_ExecuteAll:=False:C215

C_TEXT:C284($name;$useform;$windowtitle)
C_LONGINT:C283($pos;$newtable;$win)

If (Count parameters:C259>0)
	If (($1>=1) & ($1<=Get last table number:C254))
		If (Is table number valid:C999($1))
			$name:=Table name:C256($1)
			$pos:=Find in array:C230(ar_UserMode_TableNames;$name)
			If ($pos>0)
				C_POINTER:C301($ptr)
				$ptr:=ar_UserMode_TablePtrs{$pos}
				$newtable:=Table:C252($ptr)
				If ($newtable#iUserMode_CurrentTable)
					iUserMode_CurrentTable:=$newtable
					  // UserMode_Listbox_Init   //  Bug, reports 1001, should not be called before opening the dialog
					  // removed 2017-10-17
				End if 
			End if 
		End if 
	End if 
End if 

If (Count parameters:C259>1)
	UserMode_ExecuteAll:=$2
End if 

If (iUserMode_CurrentTable>0)
	$useform:="UserMode_Listbox"
	If (Is license available:C714(4D View license:K44:4))
		$useform:="UserMode_ListboxPro"
	End if 
	$windowtitle:=Get localized string:C991("UserMode WindowTitle")
	$win:=Open form window:C675($useform;Plain form window:K39:10;Horizontally centered:K39:1;*)
	DIALOG:C40($useform)
	CLOSE WINDOW:C154($win)
End if 
