;Intuitively use Magic Keyboard under Windows as macOS User

If not A_IsAdmin
{
   Run *RunAs "%A_ScriptFullPath%"
   ExitApp
}

; UMLAUTE ON INTERNATIONAL KEYBOARD

;--CONTROL+OPT+<letter> sends Umlaut (If using international keyboard as german)
;--If this is broken, use ANSI encoding and copy characters from https://de.wikipedia.org/wiki/Umlaut
!o::Send ö
!+O::Send Ö
!u::Send ü
!+u::Send Ü
!a::Send ä
!+a::Send Ä
!s::Send ß

;--Dead-Key on Alt+u (native macOS/iOS behaviour)
;!u:: 
;   StringCaseSense, On 
;   Input, SingleKey, L1, {LControl}{RControl}{LAlt}{RAlt}{LWin}{RWin}{AppsKey}{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{Left}{Right}{Up}{Down}{Home}{End}{PgUp}{PgDn}{Del}{Ins}{BS}{Capslock}{Numlock}{PrintScreen}{Pause},2
;   if SingleKey = a 
;      Send, ä 
;   if SingleKey = A 
;      Send, Ä
;   if SingleKey = u 
;      Send, ü 
;   if SingleKey = U 
;      Send, Ü 
;   if SingleKey = o 
;      Send, ö 
;   if SingleKey = O 
;      Send, Ö
;   if SingleKey = s
;      Send, ß
;   StringCaseSense, Off 
;Return


; CMD + Backslash sends DELETE in Explorer, deletes whole line of text everywhere else
#IfWinActive ahk_class ExploreWClass
#BS::Send {Del}
!BS::Send {Del}
#IfWinActive ahk_class CabinetWClass
#BS::Send {Del}
!BS::Send {Del}
#IfWinActive
#BS::Send {LShift down}{Home}{LShift Up}{Del}
!BS::Send {LCtrl down}{BS}{LCtrl up}

; CMD+Enter should behave like CTRL+Enter
#Enter::
Keywait Lwin
Send, {LCtrl down}{Enter}{LCtrl up}
return


;following section mimics command-q and command-w
;behaviour to close windows
;note these had to be disabled below for the
;command to ctrl key remaps
#w::Send {ctrl down}{F4}{ctrl up}
^w::return
#q::!F4

;CMD + SPACE
;TODO: Find way to disable single LWin press without breaking other LWin mappings!
#Space::Send {LWin}

;following section remaps alt-arrow and command-arrow

;--OSX NAVIGATION AND SELECTION WITH CMD
#Up::Send {Lctrl down}{Home}{Lctrl up}
#Down::Send {Lctrl down}{End}{Lctrl up}
#+Up::Send {ctrl down}{shift down}{Home}{shift up}{ctrl up}
#+Down::Send {ctrl down}{shift down}{End}{shift up}{ctrl up}
#Left::Send {Home}
#Right::Send {End}
#+Left::Send {shift down}{Home}{shift up}
#+Right::Send {shift down}{End}{shift up}
;--OSX NAVIGATION AND SELECTION WITH ALT
!Left::Send {ctrl down}{Left}{ctrl up}
!Right::Send {ctrl down}{Right}{ctrl up}
!+Left::Send {ctrl down}{shift down}{Left}{shift up}{ctrl up}
!+Right::Send {ctrl down}{shift down}{Right}{shift up}{ctrl up}

;--Remap Alt-Left and Alt-Right to CTRL to provide access to certain shortcuts
^Left::Send {alt down}{Left}{alt up}
^Right::Send {alt down}{Right}{alt up}

;remap CMD+Tab to ALT+Tab App Switcher
; NOTE: Reverse Direction by pressing Shift does not work with CMD+Tab
<#Tab::AltTab

;following section remaps command key to control key affects all number and letter keys
; NOTE: some keys (like winkey-l and winkey-d) need to be remapped a differeny way otherwise autohotkey will not take over
; NOTE: Without "Send", some apps might not recognize remapped keys.
#a::Send ^a
#b::Send ^b
#+b:: Send ^+b
#c::Send ^c
#d::Send ^d 
#+d::Send ^+d
#e::Send ^e
#+e::Send ^+e
#f::Send ^f
#+f::Send ^+f
#g::Send ^g
#+g::Send ^+g
#h::Send ^h
#+h::Send ^+h
#i::Send ^i
#+i::Send ^+i
#j::Send ^j
#+j::Send ^+j
#k::Send ^k
#+k::Send ^+k
;TODO: Make Win+l _not_ lock Windows (below does _not_ work!)
; #l::Send {LCtrl down}{l}{LCtrl up} 
#m::Send ^m
#+m::Send ^+m
#n::Send ^n
#+n::Send ^+n
#o::Send ^o
#+o::Send ^+o
#p::Send ^p
#+p::Send ^+p
; #q::^q ;disabled --remapped to alt-F4 instead
#r::Send ^r
^r::Send #r ; remap "Run..." Shortcut to CTRL+R
#s::Send ^s
#t::Send ^t
#+t::Send ^+t
#u::Send ^u
#v::Send ^v
;#w::^w ;disabled --remapped to ctrl-F4 instead
#x::Send ^x
#+x::Send ^+x
#y::Send ^y
#+y::Send ^+y
#z::Send ^z 
#+z::Send ^+z
; #z::Send {LCtrl down}{z}{LCtrl up}


#1::Send ^1
#2::Send ^2
#3::Send ^3
#4::Send ^4
#5::Send ^5
#6::Send ^6
#7::Send ^7
#8::Send ^8
#9::Send ^9
#0::Send ^0
#/::Send ^/
#.::Send ^.
#,::Send ^,
#=::Send ^=

; DISABLE CTRL-KEYS REPLACED ABOVE
; Disabling CTRL+u/a/o/s somehow prevents the umlaut-replacement from working...
;^a::return
;^b::return
;^c::return
;^d::return
;^e::return
;^f::return
;^g::return
;^h::return
;^i::return
;^j::return
;^k::return
;^m::return
;^n::return
;^r::return
;^t::return
;^v::return
;^x::return
;^y::return
;^z::return
;^1::return
;^2::return
;^3::return
;^4::return
;^5::return
;^6::return
;^7::return
;^8::return
;^9::return
;^0::return
;^Up::return
;^Down::return
;^Left::return
;^Right::return
;^+Up::return
;^+Down::return
;<^BS::return
;^=::return
;^+=::return
;^/::return

; NOT USED

; ; REMAPS CTRL-LEFT-CLICK TO CMD AND REPLICATES OSX CTRL-CLICK RIGHT-CLICK
; LWIN & LBUTTON::send {ctrl down}{LButton}{ctrl up}
; RWIN & LBUTTON::send {ctrl down}{LButton}{ctrl up}
; CTRL & LBUTTON::send {RButton}

; ;personal.ahk
; !^Right::send, #^{Right down}{Right up}
; !^Left::send, #^{Left down}{Left up}

; ; THIS HOTKEY PRESERVES MS WORD INDENT FUNCTIONALITY FROM OSX
; ^+Left::Send {shift down}{alt down}{Left}{shift up}{alt up}
; ^+Right::Send {shift down}{alt down}{Right}{shift up}{alt up}

; ; PRESERVES ADDITIONAL MS WORD FORMATTING FUNCTIONALITY FROM OSX
; #+=::^+=
; #=::^=