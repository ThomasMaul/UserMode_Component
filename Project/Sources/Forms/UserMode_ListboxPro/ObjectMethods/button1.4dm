C_LONGINT:C283($column;$row;$table;$field)
C_POINTER:C301($columnptr;$ptr)
C_TEXT:C284($text;$type)
LISTBOX GET CELL POSITION:C971(*;"ListBoxDetail";$column;$row;$columnptr)
$type:=OB Get:C1224($columnptr->{$row};"valueType";Is text:K8:3)
Case of 
	: ($type="text")
		$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"variableTextEntry")
		$text:=$ptr->
		OB SET:C1220($columnptr->{$row};"value";$text)
		FORM GOTO PAGE:C247(1)
		
	: ($type="event")
		$type:=OB Get:C1224($columnptr->{$row};"_UC_type";Is text:K8:3)
		If ($type="object")
			$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"variableTextEntry")
			$text:=$ptr->
			$table:=OB Get:C1224($columnptr->{$row};"_UC_table";Is longint:K8:6)
			$field:=OB Get:C1224($columnptr->{$row};"_UC_field";Is longint:K8:6)
			Field:C253($table;$field)->:=JSON Parse:C1218($text;Is object:K8:27)
			FORM GOTO PAGE:C247(1)
		End if 
End case 