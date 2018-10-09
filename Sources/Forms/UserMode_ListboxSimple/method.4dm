C_TEXT:C284($name;$text1;$text2;$text3;$who;$t)
C_LONGINT:C283($pos;$mylong)

Case of 
	: (Form event:C388=On Load:K2:1)
		UserMode_Init   // should have been done already...
		UserMode_Listbox_Init 
		
		If (iUserMode_CurrentTable>0)
			$name:=Table name:C256(iUserMode_CurrentTable)
			$pos:=Find in array:C230(ar_UserMode_TableNames;$name)
			If ($pos>0)
				ar_UserMode_TableNames:=$pos  // popup
			Else 
				ar_UserMode_TableNames:=1
			End if 
		End if 
		
	: (Form event:C388=On Close Box:K2:21)
		CANCEL:C270
		
	: (Form event:C388=On Double Clicked:K2:5)
		If (ar_UserMode_Modify{iUserMode_CurrentTable})
			If (UserMode_IsFormExisting (ar_UserMode_Forms{iUserMode_CurrentTable}))
				CUT NAMED SELECTION:C334(Table:C252(iUserMode_CurrentTable)->;"UserMode_memory")
				READ WRITE:C146(Table:C252(iUserMode_CurrentTable)->)
				USE SET:C118("UserSet")
				If (Locked:C147(Table:C252(iUserMode_CurrentTable)->))
					LOAD RECORD:C52(Table:C252(iUserMode_CurrentTable)->)
				End if 
				
				If (Locked:C147(Table:C252(iUserMode_CurrentTable)->))
					LOCKED BY:C353(Table:C252(iUserMode_CurrentTable)->;$mylong;$text1;$text2;$text3)
					$name:=Table name:C256(iUserMode_CurrentTable)
					$who:=$text1+"/"+$text2+" ("+$text3+")"
					$t:=Get localized string:C991("UserMode Locked")
					$t:=Replace string:C233($t;"$1";$name)
					$t:=Replace string:C233($t;"$2";$who)
					CONFIRM:C162($t)
					If (OK=1)
						LOAD RECORD:C52(Table:C252(iUserMode_CurrentTable)->)  // record lost by confirm redraw
						ONE RECORD SELECT:C189(Table:C252(iUserMode_CurrentTable)->)
						READ ONLY:C145(Table:C252(iUserMode_CurrentTable)->)
						DISPLAY SELECTION:C59(Table:C252(iUserMode_CurrentTable)->)
						READ WRITE:C146(Table:C252(iUserMode_CurrentTable)->)
					End if 
				Else 
					MODIFY RECORD:C57(Table:C252(iUserMode_CurrentTable)->;*)
				End if 
				USE NAMED SELECTION:C332("UserMode_memory")
			End if 
		End if 
End case 