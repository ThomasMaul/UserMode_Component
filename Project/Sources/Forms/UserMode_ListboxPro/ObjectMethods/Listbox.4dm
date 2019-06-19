C_LONGINT:C283($i;$fieldtyp)
C_BOOLEAN:C305($dontpostvalue;$changelineheight)
C_POINTER:C301($ptr;$ptr2)

Case of 
	: (Form event:C388=On Begin Drag Over:K2:44)
		
		UserMode_Pasteboard 
		
	: (Form event:C388=On Clicked:K2:4)
		READ ONLY:C145(Table:C252(iUserMode_CurrentTable)->)
		LOAD RECORD:C52(Table:C252(iUserMode_CurrentTable)->)
		READ WRITE:C146(Table:C252(iUserMode_CurrentTable)->)
		ARRAY TEXT:C222($fieldnames;0)
		ARRAY OBJECT:C1221($fieldcontent;0)
		For ($i;1;Get last field number:C255(Table:C252(iUserMode_CurrentTable)))
			If (Is field number valid:C1000(Table:C252(iUserMode_CurrentTable);$i))
				
				  // handle 4D View Pro Object Array
				CLEAR VARIABLE:C89($itemObject)
				C_OBJECT:C1216($itemObject)
				$Fieldtyp:=Type:C295(Field:C253(iUserMode_CurrentTable;$i)->)
				$dontpostvalue:=False:C215
				$changelineheight:=False:C215
				Case of 
					: ($fieldtyp=Is real:K8:4)
						OB SET:C1220($itemObject;"valueType";"real")
						
					: (($fieldtyp=Is integer:K8:5) | ($fieldtyp=Is longint:K8:6))
						OB SET:C1220($itemObject;"valueType";"integer")
						
					: (($fieldtyp=Is date:K8:7))
						OB SET:C1220($itemObject;"valueType";"date")
						
					: (($fieldtyp=Is boolean:K8:9))
						OB SET:C1220($itemObject;"valueType";"boolean")
						
					: ($fieldtyp=Is alpha field:K8:1)
						OB SET:C1220($itemObject;"valueType";"text")
						
					: ($fieldtyp=Is text:K8:3)
						OB SET:C1220($itemObject;"valueType";"text")
						OB SET:C1220($itemObject;"alternateButton";True:C214)
						$changelineheight:=True:C214
						
						
					: ($fieldtyp=Is time:K8:8)
						OB SET:C1220($itemObject;"valueType";"time")
						
					: ($fieldtyp=Is picture:K8:10)
						OB SET:C1220($itemObject;"valueType";"event")
						OB SET:C1220($itemObject;"label";Get localized string:C991("UserMode EditPicture"))
						OB SET:C1220($itemObject;"_UC_table";iUserMode_CurrentTable)
						OB SET:C1220($itemObject;"_UC_field";$i)
						OB SET:C1220($itemObject;"_UC_type";"picture")
						$dontpostvalue:=True:C214
						
					: ($fieldtyp=Is object:K8:27)
						OB SET:C1220($itemObject;"valueType";"event")
						OB SET:C1220($itemObject;"label";Get localized string:C991("UserMode EditObject"))
						OB SET:C1220($itemObject;"_UC_table";iUserMode_CurrentTable)
						OB SET:C1220($itemObject;"_UC_field";$i)
						OB SET:C1220($itemObject;"_UC_type";"object")
						$dontpostvalue:=True:C214
						
					: ($fieldtyp=Is BLOB:K8:12)
						OB SET:C1220($itemObject;"valueType";"event")
						OB SET:C1220($itemObject;"label";Get localized string:C991("UserMode EditBlob"))
						OB SET:C1220($itemObject;"_UC_table";iUserMode_CurrentTable)
						OB SET:C1220($itemObject;"_UC_field";$i)
						OB SET:C1220($itemObject;"_UC_type";"blob")
						$dontpostvalue:=True:C214
				End case 
				
				If (Not:C34(OB Is empty:C1297($itemObject)))
					If (Not:C34($dontpostvalue))
						OB SET:C1220($itemObject;"value";Field:C253(iUserMode_CurrentTable;$i)->)
					End if 
					APPEND TO ARRAY:C911($fieldnames;Field name:C257(iUserMode_CurrentTable;$i))
					APPEND TO ARRAY:C911($fieldcontent;$itemObject)
					
					If ($changelineheight)
						  // with v16 we could set now the size of the row to 3-5 lines...
						  // LISTBOX SET ROW HEIGHT(*;"ListboxDetail";size of array($fieldnames);80)
					End if 
				End if 
			End if 
		End for 
		
		$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"Fieldname")
		$ptr2:=OBJECT Get pointer:C1124(Object named:K67:5;"Fieldcontent")
		  //%W-518.1
		COPY ARRAY:C226($fieldnames;$ptr->)
		COPY ARRAY:C226($fieldcontent;$ptr2->)
		  //%W+518.1
		
	: (Form event:C388=On Getting Focus:K2:7)
		Form:C1466.event:=Method called on event:C705
		ON EVENT CALL:C190("UserMode_EventHandler")
		
	: (Form event:C388=On Losing Focus:K2:8)
		ON EVENT CALL:C190(Form:C1466.event)
		
	: (Form event:C388=On Unload:K2:2)
		ON EVENT CALL:C190(Form:C1466.event)
		
End case 