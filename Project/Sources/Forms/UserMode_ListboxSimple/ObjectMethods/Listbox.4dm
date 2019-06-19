Case of 
	: (Form event:C388=On Begin Drag Over:K2:44)
		
		UserMode_Pasteboard 
		
	: (Form event:C388=On Getting Focus:K2:7)
		Form:C1466.event:=Method called on event:C705
		ON EVENT CALL:C190("UserMode_EventHandler")
		
	: (Form event:C388=On Losing Focus:K2:8)
		ON EVENT CALL:C190(Form:C1466.event)
		
	: (Form event:C388=On Unload:K2:2)
		ON EVENT CALL:C190(Form:C1466.event)
		
		
End case 