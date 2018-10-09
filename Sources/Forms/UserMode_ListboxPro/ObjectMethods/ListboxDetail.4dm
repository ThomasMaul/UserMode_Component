C_TEXT:C284($type)

Case of 
	: (Form event:C388=On Alternative Click:K2:36)
		C_LONGINT:C283($column;$row)
		C_TEXT:C284($text)
		C_POINTER:C301($columnptr;$ptr)
		LISTBOX GET CELL POSITION:C971(*;"ListBoxDetail";$column;$row;$columnptr)
		$type:=OB Get:C1224($columnptr->{$row};"valueType";Is text:K8:3)
		If ($type="text")
			$text:=OB Get:C1224($columnptr->{$row};"value";Is text:K8:3)
			$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"variableTextEntry")
			$ptr->:=$text
			FORM GOTO PAGE:C247(2)
		End if 
		
	: (Form event:C388=On Clicked:K2:4)
		C_LONGINT:C283($column;$row;$table;$field)
		C_TEXT:C284($text)
		C_POINTER:C301($columnptr;$ptr)
		LISTBOX GET CELL POSITION:C971(*;"ListBoxDetail";$column;$row;$columnptr)
		$type:=OB Get:C1224($columnptr->{$row};"_UC_type";Is text:K8:3)
		Case of 
			: ($type="picture")
				$table:=OB Get:C1224($columnptr->{$row};"_UC_table";Is longint:K8:6)
				$field:=OB Get:C1224($columnptr->{$row};"_UC_field";Is longint:K8:6)
				$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"variablePictureEntry")
				$ptr->:=Field:C253($table;$field)->
				FORM GOTO PAGE:C247(3)
				
			: ($type="object")
				$table:=OB Get:C1224($columnptr->{$row};"_UC_table";Is longint:K8:6)
				$field:=OB Get:C1224($columnptr->{$row};"_UC_field";Is longint:K8:6)
				$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"variableTextEntry")
				$text:=JSON Stringify:C1217(Field:C253($table;$field)->;*)
				$ptr->:=$text
				FORM GOTO PAGE:C247(2)
				
			: ($type="blob")
				$table:=OB Get:C1224($columnptr->{$row};"_UC_table";Is longint:K8:6)
				$field:=OB Get:C1224($columnptr->{$row};"_UC_field";Is longint:K8:6)
				$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"variableTextEntry")
				BASE64 ENCODE:C895(Field:C253($table;$field)->;$text)
				$ptr->:=$text
				FORM GOTO PAGE:C247(2)
		End case 
End case 
