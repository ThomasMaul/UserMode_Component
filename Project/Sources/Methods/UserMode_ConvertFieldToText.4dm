//%attributes = {}
  // ----------------------------------------------------
  // Anwender (OS): Thomas Maul
  // Datum und Zeit: 26.02.09
  // ----------------------------------------------------
  // Methode: UserMode_ConvertFieldToText
  // Internal - return field content as text
  // 
  // Parameter  -
  // $1 = Fieldptr
  // $2= remove 13/9 (optiomal)
  // $0 = textresult
  // ----------------------------------------------------

C_POINTER:C301($fieldptr)
C_LONGINT:C283($fieldtyp)
C_BOOLEAN:C305($controlremove)
C_TEXT:C284($text)

$fieldptr:=$1

$Fieldtyp:=Type:C295($fieldptr->)
$0:=""

$controlremove:=True:C214
If (Count parameters:C259>1)
	$controlremove:=$2
End if 

If ($fieldtyp#Is subtable:K8:11)
	
	Case of 
		: (($fieldtyp=Is alpha field:K8:1) | ($fieldtyp=Is text:K8:3))
			$text:=$fieldptr->
			$text:=Replace string:C233($text;Char:C90(13);" ")
			$0:=Replace string:C233($text;Char:C90(9);" ")
		: (($fieldtyp=Is integer:K8:5) | ($fieldtyp=Is longint:K8:6) | ($fieldtyp=Is real:K8:4))
			$0:=String:C10($fieldptr->)
		: (($fieldtyp=Is date:K8:7))
			$0:=String:C10($fieldptr->;Internal date short:K1:7)
		: (($fieldtyp=Is time:K8:8))
			$0:=String:C10($fieldptr->;HH MM:K7:2)
		: (($fieldtyp=Is boolean:K8:9))
			$0:=String:C10(Num:C11($fieldptr->))
			
	End case 
End if 