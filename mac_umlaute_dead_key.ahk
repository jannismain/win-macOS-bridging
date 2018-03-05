!u:: 
   StringCaseSense, On 
   Input, SingleKey, L1, {LControl}{RControl}{LAlt}{RAlt}{LWin}{RWin}{AppsKey}{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{Left}{Right}{Up}{Down}{Home}{End}{PgUp}{PgDn}{Del}{Ins}{BS}{Capslock}{Numlock}{PrintScreen}{Pause},2
   if SingleKey = a 
      Send, ä 
   if SingleKey = A 
      Send, Ä 
   if SingleKey = u 
      Send, ü 
   if SingleKey = U 
      Send, Ü 
   if SingleKey = o 
      Send, ö 
   if SingleKey = O 
      Send, Ö
   if SingleKey = s
      Send, ß
   StringCaseSense, Off 
Return