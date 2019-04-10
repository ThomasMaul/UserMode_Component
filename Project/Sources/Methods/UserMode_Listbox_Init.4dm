//%attributes = {}
  // ----------------------------------------------------
  // Anwender (OS): Thomas Maul
  // Datum und Zeit: 26.02.09
  // ----------------------------------------------------
  // Methode: UserMode_Listbox_init
  // Internal - switches table. Called in on Load and from popup
  // 
  //
  // Parameter  -  none
  // ----------------------------------------------------

C_POINTER:C301($tableptr;$fieldptr;$headerptr)
C_LONGINT:C283($countfields;$counter;$fieldID;$typ)
C_TEXT:C284($name)


If (Is table number valid:C999(iUserMode_CurrentTable))
	$tableptr:=Table:C252(iUserMode_CurrentTable)
	CREATE EMPTY SET:C140($tableptr->;"UserSet")
	
	UserModeFormula:=""
	
	If (ar_UserMode_Modify{iUserMode_CurrentTable})
		READ WRITE:C146($tableptr->)
	Else 
		READ ONLY:C145($tableptr->)
	End if 
	ALL RECORDS:C47($tableptr->)
	
	LISTBOX DELETE COLUMN:C830(*;"Listbox";1;LISTBOX Get number of columns:C831(*;"Listbox"))
	LISTBOX SET TABLE SOURCE:C1013(*;"Listbox";iUserMode_CurrentTable)
	
	$countfields:=Get last field number:C255(iUserMode_CurrentTable)
	$counter:=1
	$fieldid:=1
	C_POINTER:C301($NilPtr)
	While (($fieldid<=$countfields) & ($counter<50))
		If (Is field number valid:C1000(iUserMode_CurrentTable;$fieldid))
			$Fieldptr:=Field:C253(iUserMode_CurrentTable;$fieldid)
			$typ:=Type:C295($Fieldptr->)
			If (($typ#Is picture:K8:10) & ($typ#Is BLOB:K8:12))
				  //$Headerptr:=Get pointer("Header"+String($counter))
				  //$Headerptr->:=0
				LISTBOX INSERT COLUMN:C829(*;"ListBox";$counter;"Field"+String:C10($counter);$Fieldptr->;"Header"+String:C10($counter);$NilPtr)
				OBJECT SET TITLE:C194(*;"Header"+String:C10($counter);Field name:C257($Fieldptr))
				OBJECT SET ENTERABLE:C238(*;"Field"+String:C10($counter);False:C215)
				$counter:=$counter+1
			End if 
		End if 
		$fieldid:=$fieldid+1
	End while 
	
	  // Button handling
	If (ar_UserMode_Delete{iUserMode_CurrentTable})
		OBJECT SET ENABLED:C1123(*;"UserMode_DeleteButton";True:C214)
	Else 
		OBJECT SET ENABLED:C1123(*;"UserMode_DeleteButton";False:C215)
	End if 
	If ((ar_UserMode_Report{iUserMode_CurrentTable}) | (ar_UserMode_Import{iUserMode_CurrentTable}) | (ar_UserMode_Export{iUserMode_CurrentTable}))
		OBJECT SET ENABLED:C1123(*;"UserMode_ReportButton";True:C214)
	Else 
		OBJECT SET ENABLED:C1123(*;"UserMode_ReportButton";False:C215)
	End if 
	If (ar_UserMode_Execute{iUserMode_CurrentTable})
		OBJECT SET ENABLED:C1123(*;"UserMode_ExecuteButton";True:C214)
	Else 
		OBJECT SET ENABLED:C1123(*;"UserMode_ExecuteButton";False:C215)
	End if 
	
	If (Not:C34(ar_UserMode_New{iUserMode_CurrentTable}))
		OBJECT SET ENABLED:C1123(*;"UserMode_NewButton";False:C215)
	Else 
		$name:=ar_UserMode_Forms{iUserMode_CurrentTable}
		If ($name="")
			$name:="UserMode"
			ar_UserMode_Forms{iUserMode_CurrentTable}:=$name
		End if 
		If (UserMode_IsFormExisting ($name))
			OBJECT SET ENABLED:C1123(*;"UserMode_NewButton";True:C214)
		Else 
			ar_UserMode_Modify{iUserMode_CurrentTable}:=False:C215
			OBJECT SET ENABLED:C1123(*;"UserMode_NewButton";False:C215)
		End if 
		
	End if 
End if 