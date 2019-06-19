//%attributes = {"invisible":true}
C_LONGINT:C283($key)
$key:=keycode
If ($key#0)
	CALL FORM:C1391(Frontmost window:C447;"UserMode_ListboxEvent";$key)
End if 