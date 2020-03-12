C_LONGINT:C283($i)
C_POINTER:C301($ptr;$ptr2)

Case of 
	: (Form event code:C388=On Begin Drag Over:K2:44)
		
		UserMode_Pasteboard 
		
	: (Form event code:C388=On Clicked:K2:4)
		READ ONLY:C145(Table:C252(iUserMode_CurrentTable)->)
		LOAD RECORD:C52(Table:C252(iUserMode_CurrentTable)->)
		READ WRITE:C146(Table:C252(iUserMode_CurrentTable)->)
		ARRAY TEXT:C222($fieldnames;0)
		ARRAY TEXT:C222($fieldcontent;0)
		For ($i;1;Get last field number:C255(Table:C252(iUserMode_CurrentTable)))
			If (Is field number valid:C1000(Table:C252(iUserMode_CurrentTable);$i))
				APPEND TO ARRAY:C911($fieldnames;Field name:C257(iUserMode_CurrentTable;$i))
				APPEND TO ARRAY:C911($fieldcontent;UserMode_ConvertFieldToText (Field:C253(iUserMode_CurrentTable;$i);True:C214))
			End if 
		End for 
		$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"Fieldname")
		$ptr2:=OBJECT Get pointer:C1124(Object named:K67:5;"Fieldcontent")
		  //%W-518.1
		COPY ARRAY:C226($fieldnames;$ptr->)
		COPY ARRAY:C226($fieldcontent;$ptr2->)
		  //%W+518.1
		
	: (Form event code:C388=On Getting Focus:K2:7)
		  //Form.event:=Method called on event
		  //ON EVENT CALL("UserMode_EventHandler")
		
	: (Form event code:C388=On Losing Focus:K2:8)
		  //ON EVENT CALL(Form.event)
		
	: (Form event code:C388=On Unload:K2:2)
		  //ON EVENT CALL(Form.event)
		
End case 