C_TEXT:C284($text)
C_LONGINT:C283($selectedItem)

Case of 
	: (Form event:C388=On Clicked:K2:4)
		If (ar_UserMode_Report{iUserMode_CurrentTable})
			QR REPORT:C197(Table:C252(iUserMode_CurrentTable)->;Char:C90(1);True:C214;True:C214)
		End if 
		
	: (Form event:C388=On Alternative Click:K2:36)
		$text:=Get localized string:C991("UserMode ReportPopup")  //  "Report;Import;Export"
		$selectedItem:=Pop up menu:C542($text)
		
		Case of 
			: ($selectedItem=1)
				If (ar_UserMode_Report{iUserMode_CurrentTable})
					QR REPORT:C197(Table:C252(iUserMode_CurrentTable)->;Char:C90(1);True:C214;True:C214)
				End if 
			: ($selectedItem=2)
				If (ar_UserMode_Import{iUserMode_CurrentTable})
					ARRAY TEXT:C222($tableTitles;0)
					ARRAY LONGINT:C221($tableID;0)
					GET TABLE TITLES:C803($tableTitles;$tableID)
					ARRAY TEXT:C222($newtableTitles;1)
					ARRAY LONGINT:C221($newtableID;1)
					$newtableTitles{1}:=Table name:C256(iUserMode_CurrentTable)
					$newtableID{1}:=iUserMode_CurrentTable
					SET TABLE TITLES:C601($newtableTitles;$newtableID)
					IMPORT DATA:C665("";*)
					SET TABLE TITLES:C601($tableTitles;$tableID)
				End if 
			: ($selectedItem=3)
				If (ar_UserMode_Export{iUserMode_CurrentTable})
					ARRAY TEXT:C222($tableTitles;0)
					ARRAY LONGINT:C221($tableID;0)
					GET TABLE TITLES:C803($tableTitles;$tableID)
					ARRAY TEXT:C222($newtableTitles;1)
					ARRAY LONGINT:C221($newtableID;1)
					$newtableTitles{1}:=Table name:C256(iUserMode_CurrentTable)
					$newtableID{1}:=iUserMode_CurrentTable
					SET TABLE TITLES:C601($newtableTitles;$newtableID)
					EXPORT DATA:C666("";*)
					SET TABLE TITLES:C601($tableTitles;$tableID)
				End if 
		End case 
End case 



