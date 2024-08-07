C_TEXT:C284($message; $text)
C_LONGINT:C283($selectedItem; $form)
C_POINTER:C301($ptr)

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		If (ar_UserMode_Execute{iUserMode_CurrentTable})
			EDIT FORMULA:C806(Table:C252(iUserMode_CurrentTable)->; UserModeFormula)
			If (OK=1)
				$ptr:=Table:C252(iUserMode_CurrentTable)
				
				If (Records in set:C195("UserSet")#Records in table:C83($ptr->))
					USE SET:C118("UserSet")
				End if 
				//EXECUTE FORMULA(UserModeFormula)
				
				CREATE EMPTY SET:C140($ptr->; "LockedSet")
				APPLY TO SELECTION:C70($ptr->; EXECUTE FORMULA:C63(UserModeFormula))
				If (Records in set:C195("LockedSet")#0)
					$message:=Get localized string:C991("UserMode Locked")
					ALERT:C41($message)
					USE SET:C118("LockedSet")
				End if 
			End if 
			
		End if 
		
	: (Form event code:C388=On Alternative Click:K2:36)
		If (UserMode_ExecuteAll)
			$text:=Get localized string:C991("UserMode ExecutePopup")  //  "Apply Formula; Execute Code"
			$selectedItem:=Pop up menu:C542($text)
		Else 
			$selectedItem:=1
		End if 
		
		Case of 
			: ($selectedItem=1)  // same as on clicked
				If (ar_UserMode_Execute{iUserMode_CurrentTable})
					EDIT FORMULA:C806(Table:C252(iUserMode_CurrentTable)->; UserModeFormula)
					If (OK=1)
						$ptr:=Table:C252(iUserMode_CurrentTable)
						
						If (Records in set:C195("UserSet")#Records in table:C83($ptr->))
							USE SET:C118("UserSet")
						End if 
						//EXECUTE FORMULA(UserModeFormula)
						
						CREATE EMPTY SET:C140($ptr->; "LockedSet")
						APPLY TO SELECTION:C70($ptr->; EXECUTE FORMULA:C63(UserModeFormula))
						If (Records in set:C195("LockedSet")#0)
							$message:=Get localized string:C991("UserMode Locked")
							ALERT:C41($message)
							USE SET:C118("LockedSet")
						End if 
					End if 
					
				End if 
				
			: ($selectedItem=2)  // code
				$form:=Open form window:C675("UserMode_Code")
				DIALOG:C40("UserMode_Code")
				CLOSE WINDOW:C154($form)
				
		End case 
End case 