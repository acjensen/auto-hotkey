;;; Horizontal scroll while holding shift key

#Singleinstance Force

#IfWinActive ahk_class XLMAIN ; For MS Excel
    +WheelUp::
    SetScrollLockState, On
    SendInput {Left}
    SetScrollLockState, Off
    Return
    +WheelDown::
    SetScrollLockState, On
    SendInput {Right}
    SetScrollLockState, Off
    Return

#IfWinNotActive ahk_class XLMAIN ; For non-Excel applications
    +WheelUp::  ; Scroll left.
    ControlGetFocus, fcontrol, A
    Loop 4  ; <-- Increase this value to scroll faster.
        SendMessage, 0x114, 0, 0, %fcontrol%, A  ; 0x114 is WM_HSCROLL and the 0 after it is SB_LINELEFT.
    return
    +WheelDown::  ; Scroll right.
    ControlGetFocus, fcontrol, A
    Loop 4  ; <-- Increase this value to scroll faster.
        SendMessage, 0x114, 1, 0, %fcontrol%, A  ; 0x114 is WM_HSCROLL and the 1 after it is SB_LINERIGHT.
    return