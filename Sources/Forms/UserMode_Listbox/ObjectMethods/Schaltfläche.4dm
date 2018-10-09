C_TEXT:C284($message;$value)
C_POINTER:C301($ptr;$ptr2;$fieldptr)
C_LONGINT:C283($i;$pos;$fieldtyp)

READ WRITE:C146(Table:C252(iUserMode_CurrentTable)->)
LOAD RECORD:C52(Table:C252(iUserMode_CurrentTable)->)
If (Locked:C147(Table:C252(iUserMode_CurrentTable)->))
	$message:=Get localized string:C991("UserMode Locked")
	ALERT:C41($message)
Else 
	
	$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"Fieldname")
	$ptr2:=OBJECT Get pointer:C1124(Object named:K67:5;"Fieldcontent")
	
	ARRAY TEXT:C222($fieldnames;Get last field number:C255(Table:C252(iUserMode_CurrentTable)))
	For ($i;1;Size of array:C274($fieldnames))
		If (Is field number valid:C1000(Table:C252(iUserMode_CurrentTable);$i))
			$fieldnames{$i}:=Field name:C257(iUserMode_CurrentTable;$i)
		End if 
	End for 
	
	For ($i;1;Size of array:C274($ptr->))
		$pos:=Find in array:C230($fieldnames;$ptr->{$i})
		If ($pos>0)
			
			  // assign field value
			$fieldptr:=Field:C253(iUserMode_CurrentTable;$i)
			$Fieldtyp:=Type:C295($fieldptr->)
			$value:=$ptr2->{$i}
			
			If ($fieldtyp#Is subtable:K8:11)
				
				Case of 
					: (($fieldtyp=Is alpha field:K8:1) | ($fieldtyp=Is text:K8:3))
						If ($fieldptr->#$value)
							$fieldptr->:=$value
						End if 
					: (($fieldtyp=Is integer:K8:5) | ($fieldtyp=Is longint:K8:6) | ($fieldtyp=Is real:K8:4))
						If ($fieldptr->#Num:C11($value))
							$fieldptr->:=Num:C11($value)
						End if 
					: (($fieldtyp=Is date:K8:7))
						If ($fieldptr->#Date:C102($value))
							$fieldptr->:=Date:C102($value)
						End if 
					: (($fieldtyp=Is time:K8:8))
						If ($fieldptr->#Time:C179($value))
							$fieldptr->:=Time:C179($value)
						End if 
					: (($fieldtyp=Is boolean:K8:9))
						$fieldptr->:=Num:C11($value)
				End case 
			End if 
			
		End if 
		
	End for 
	
	SAVE RECORD:C53(Table:C252(iUserMode_CurrentTable)->)
End if 
