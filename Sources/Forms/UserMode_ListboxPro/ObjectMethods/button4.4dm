C_LONGINT:C283($column;$row)
C_POINTER:C301($columnptr;$ptr)
C_TEXT:C284($text;$type)
LISTBOX GET CELL POSITION:C971(*;"ListBoxDetail";$column;$row;$columnptr)
$type:=OB Get:C1224($columnptr->{$row};"valueType";Is text:K8:3)
If ($type="text")
	$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"variableTextEntry")
	$text:=$ptr->
	OB SET:C1220($columnptr->{$row};"value";$text)
	FORM GOTO PAGE:C247(1)
End if 