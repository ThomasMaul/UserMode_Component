C_TEXT:C284($message)
C_LONGINT:C283($a)

If (ar_UserMode_Delete{iUserMode_CurrentTable})
	$a:=Records in set:C195("UserSet")
	$message:=Get localized string:C991("UserMode DeleteAlert")
	$message:=Replace string:C233($message;"$1";String:C10($a))
	$message:=Replace string:C233($message;"$2";Table name:C256(iUserMode_CurrentTable))
	
	CONFIRM:C162($message)  // ("Wollen Sie wirklich "+String($a)+" "+Table name(iUserMode_CurrentTable)+" löschen?")
	If (OK=1)
		USE SET:C118("UserSet")
		DELETE SELECTION:C66(Table:C252(iUserMode_CurrentTable)->)
	End if 
End if 


