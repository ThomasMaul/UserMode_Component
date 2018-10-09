//%attributes = {}

  // ----------------------------------------------------
  // Anwender (OS): Thomas Maul
  // Datum und Zeit: 02.03.09
  // ----------------------------------------------------
  // Methode: UserMode_IsFormExisting
  // Internal
  // checks if Form is existing, if yes it is used as new input form
  //
  // Parameter
  // $1 = form name
  // $0 = true/false
  // ----------------------------------------------------

ARRAY TEXT:C222($arr_Names;0)
FORM GET NAMES:C1167(Table:C252(iUserMode_CurrentTable)->;$arr_Names;$1)  // update for v14
$0:=(Size of array:C274($arr_Names)>0)
