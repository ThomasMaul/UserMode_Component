//%attributes = {}
C_LONGINT:C283($key;$Ct;$oldct;$sortedby;$i)
C_TEXT:C284($newkey;$query)


$key:=$1

$ct:=Milliseconds:C459
$newkey:=Char:C90($key)
$oldct:=Num:C11(Form:C1466.ms)
If ($oldct#0)
	If (($oldct+1000)>$ct)
		$newkey:=Form:C1466.test+$newkey
	End if 
End if 
Form:C1466.test:=$newkey
Form:C1466.ms:=$ct

ARRAY TEXT:C222($column;0)
ARRAY TEXT:C222($header;0)
ARRAY POINTER:C280($varptr;0)
ARRAY POINTER:C280($headerptr;0)
ARRAY BOOLEAN:C223($columnvisible;0)
ARRAY POINTER:C280($columnstyle;0)

LISTBOX GET ARRAYS:C832(*;"Listbox";$column;$header;$varptr;$headerptr;$columnvisible;$columnstyle)
$sortedby:=0
For ($i;1;Size of array:C274($headerptr))
	If (($headerptr{$i}->)#0)
		$sortedby:=$i
	End if 
End for 

If ($sortedby#0)
	If (Form:C1466.test#"")
		$query:=Form:C1466.test+"@"
		SET QUERY DESTINATION:C396(Into set:K19:2;"UserSet")
		QUERY SELECTION:C341(Table:C252(iUserMode_CurrentTable)->;$varptr{$sortedby}->;=;$query)
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		OBJECT SET SCROLL POSITION:C906(*;"Listbox";*)
	End if 
End if 