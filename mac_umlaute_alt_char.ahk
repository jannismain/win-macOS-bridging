; admin is needed for the remapping to work in Google Chrome
If not A_IsAdmin
{
   Run *RunAs "%A_ScriptFullPath%"
   ExitApp
}

!o::Send ö
+!O::Send Ö
!u::Send ü
+!u::Send Ü
!a::Send ä
+!a::Send Ä
!s::Send ß
