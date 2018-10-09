//%attributes = {"invisible":true}
ARRAY BOOLEAN:C223(ar_UserMode_Show;0)
ARRAY BOOLEAN:C223(ar_UserMode_Report;0)
ARRAY BOOLEAN:C223(ar_UserMode_Delete;0)
ARRAY BOOLEAN:C223(ar_UserMode_Import;0)
ARRAY BOOLEAN:C223(ar_UserMode_Export;0)
ARRAY BOOLEAN:C223(ar_UserMode_New;0)
ARRAY BOOLEAN:C223(ar_UserMode_Modify;0)
ARRAY BOOLEAN:C223(ar_UserMode_Execute;0)
ARRAY TEXT:C222(ar_UserMode_Forms;0)
ARRAY TEXT:C222(ar_UserMode_TableNames;0)
ARRAY POINTER:C280(ar_UserMode_TablePtrs;0)

C_BOOLEAN:C305(bUserMode_Init;UserMode_ExecuteAll)
C_LONGINT:C283(iUserMode_CurrentTable)
C_TEXT:C284(UserModeFormula;UserModeCode)

C_LONGINT:C283(UserMode_Show ;$1)
C_BOOLEAN:C305(UserMode_Show ;$2)

C_TEXT:C284(UserMode_IsFormExisting ;$1)
C_BOOLEAN:C305(UserMode_IsFormExisting ;$0)

C_POINTER:C301(UserMode_Forms ;$1)

C_TEXT:C284(UserMode_ConvertFieldToText ;$0)
C_POINTER:C301(UserMode_ConvertFieldToText ;$1)
C_BOOLEAN:C305(UserMode_ConvertFieldToText ;$2)

C_POINTER:C301(UserMode_Access ;$2)
C_TEXT:C284(UserMode_Access ;$1)