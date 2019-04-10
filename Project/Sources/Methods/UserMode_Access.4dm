//%attributes = {"shared":true}

  // ----------------------------------------------------
  // Anwender (OS): Thomas Maul
  // Datum und Zeit: 26.02.09
  // ----------------------------------------------------
  // Methode: UserMode_Access
  // Allows to specify the Access rights
  // 
  // Parameter  
  // $1 = Access Tag
  // valid: Show, report, Delete, Import, Export, New, Modify, Execute
  // $2 = ptr to boolean array (based on table numbers)
  // ----------------------------------------------------

UserMode_Init 

If (Count parameters:C259=2)
	If ((Type:C295($1)=Is text:K8:3) | (Type:C295($1)=Is string var:K8:2) | (Type:C295($1)=Is alpha field:K8:1))
		If (Type:C295($2)=Is pointer:K8:14)
			If (Type:C295($2->)=Boolean array:K8:21)
				  //%W-518.1
				Case of 
					: ($1="Show")
						COPY ARRAY:C226($2->;ar_UserMode_Show)
						ARRAY BOOLEAN:C223(ar_UserMode_Show;Get last table number:C254)
						UserMode_InitTableNames 
					: ($1="report")
						COPY ARRAY:C226($2->;ar_UserMode_Report)
						ARRAY BOOLEAN:C223(ar_UserMode_Report;Get last table number:C254)
					: ($1="Delete")
						COPY ARRAY:C226($2->;ar_UserMode_Delete)
						ARRAY BOOLEAN:C223(ar_UserMode_Delete;Get last table number:C254)
					: ($1="Import")
						COPY ARRAY:C226($2->;ar_UserMode_Import)
						ARRAY BOOLEAN:C223(ar_UserMode_Import;Get last table number:C254)
					: ($1="Export")
						COPY ARRAY:C226($2->;ar_UserMode_Export)
						ARRAY BOOLEAN:C223(ar_UserMode_Export;Get last table number:C254)
					: ($1="New")
						COPY ARRAY:C226($2->;ar_UserMode_New)
						ARRAY BOOLEAN:C223(ar_UserMode_New;Get last table number:C254)
					: ($1="Modify")
						COPY ARRAY:C226($2->;ar_UserMode_Modify)
						ARRAY BOOLEAN:C223(ar_UserMode_Modify;Get last table number:C254)
					: ($1="Execute")
						COPY ARRAY:C226($2->;ar_UserMode_Execute)
						ARRAY BOOLEAN:C223(ar_UserMode_Execute;Get last table number:C254)
				End case 
				  //%W+518.1
			End if 
		End if 
	End if 
End if 