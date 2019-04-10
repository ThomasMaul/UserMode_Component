//%attributes = {}
  // ----------------------------------------------------
  // Anwender (OS): Thomas Maul
  // Datum und Zeit: 26.02.09
  // ----------------------------------------------------
  // Methode: UserMode_Show
  // Internal - handles necessary variable initialisation
  // 
  //
  // Parameter  -  none
  // ----------------------------------------------------

C_LONGINT:C283($maxtables;$i)

C_BOOLEAN:C305(bUserMode_Init)
If (Not:C34(bUserMode_Init))
	bUserMode_Init:=True:C214
	
	$maxtables:=Get last table number:C254
	ARRAY BOOLEAN:C223(ar_UserMode_Show;$maxtables)
	ARRAY BOOLEAN:C223(ar_UserMode_Report;$maxtables)
	ARRAY BOOLEAN:C223(ar_UserMode_Delete;$maxtables)
	ARRAY BOOLEAN:C223(ar_UserMode_Import;$maxtables)
	ARRAY BOOLEAN:C223(ar_UserMode_Export;$maxtables)
	ARRAY BOOLEAN:C223(ar_UserMode_New;$maxtables)
	ARRAY BOOLEAN:C223(ar_UserMode_Modify;$maxtables)
	ARRAY BOOLEAN:C223(ar_UserMode_Execute;$maxtables)
	ARRAY TEXT:C222(ar_UserMode_Forms;$maxtables)
	For ($i;1;$maxtables)
		ar_UserMode_Show{$i}:=True:C214
	End for 
	COPY ARRAY:C226(ar_UserMode_Show;ar_UserMode_Report)
	COPY ARRAY:C226(ar_UserMode_Show;ar_UserMode_Delete)
	COPY ARRAY:C226(ar_UserMode_Show;ar_UserMode_Import)
	COPY ARRAY:C226(ar_UserMode_Show;ar_UserMode_Export)
	COPY ARRAY:C226(ar_UserMode_Show;ar_UserMode_New)
	COPY ARRAY:C226(ar_UserMode_Show;ar_UserMode_Modify)
	COPY ARRAY:C226(ar_UserMode_Show;ar_UserMode_Execute)
	
	UserMode_InitTableNames 
End if 
