; admin is needed for the remapping to work in Google Chrome
If not A_IsAdmin
{
   Run *RunAs "%A_ScriptFullPath%"
   ExitApp
}

!o::Send �
+!O::Send �
!u::Send �
+!u::Send �
!a::Send �
+!a::Send �
!s::Send �
