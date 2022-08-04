;  不涉及循环的调用函数，只修改 Caps 和 comma



; ^\::change_to_chn_and_retype()



; caps+ wasd 控制文本上下左右，qe 左删除右删除， r/f 回到开始回到结尾，uo一样.`n b 打开大学锁定、 T/G更改副文本上标和下标（鼠标滚轮一样）。 zxcv → 撤销、删除一行、回车、软回车


;--------------------这部分最好不同步， ， 和 caps 分开。
PrintScreen & 1::Send("^{left}")
PrintScreen & 2::check_calc_space_and_skip_bar("↓↓")
PrintScreen & 3::check_calc_space_and_skip_bar("↑↑")
CapsLock & RShift::SetCapsLockState("AlwaysOn")
PrintScreen::Send("{" A_ThisHotKey "}")



PrintScreen & BackSpace::                        ; comma
Capslock & BackSpace::change_to_chn_and_retype()
PrintScreen & Enter::  
Capslock & Enter::change_to_en_and_put_stringSpace()

;---------------------------------LHS------------------------------
;  逗号 向右偏移的键位。   hjkl ←↓↑→    d↑ f↓ 
;    ALT Q 最近两处跳跃，A home/end 两处跳跃
;                   c 清除修饰键 v              B和N back next 跳转。 m:enter




PrintScreen & a::Send( modifier "{left}")
PrintScreen & w::SendInput(modifier "{up}")
PrintScreen & s::SendInput(modifier "{down}")
PrintScreen & d::SendInput(modifier "{right}")



PrintScreen & t::Send(modifier "{PgUp}")
PrintScreen & g::Send(modifier "{PgDn}")
PrintScreen & r::Send("{Enter}")


PrintScreen & q::Send(modifier "{bs}")
PrintScreen & e::Send(modifier "{delete}")

PrintScreen & f::
{  
    repeatTime:=  updateSharedRepeat(,2)
    switch repeatTime
    {
        case 0:     send("{end}")
        case 1:     send("{home}")

   }
return
}    


PrintScreen & LShift::global modifier .= "+"
PrintScreen & LCtrl::global modifier .= "^"
PrintScreen & LAlt::global modifier .= "!"
PrintScreen & Lwin::global modifier .= "#"
PrintScreen & c::global modifier := ""
PrintScreen & V::Text_only_paste()


;---------------------------RHS------------------------







; 右边半区负责框选    hjkl ←↓↑→

PrintScreen & u::Send("^+{Left}")
PrintScreen & o::Send("^+{Right}")
PrintScreen & j::Send("^{Left}")
PrintScreen & l::Send("^{Right}")
PrintScreen & i::Send("+{up}")
PrintScreen & k::Send("+{down}")

PrintScreen & m::Send("{BackSpace}")
PrintScreen & .::Send("{enter}")  ; 必须用 sc 代码
PrintScreen & sc034::Send("{enter}")  ;  




PrintScreen & N::Send("!{right}")
PrintScreen & b::Send("!{left}") ; 前后跳转最有用了，重新定义一下更好用。


; 对输入法莫大的提升，不去选数字而是利用 GUI 选择。  （ IME 确定是 回车，其他非方向的情况下是空格。）
PrintScreen & space::
{  
    if( A_PriorHotkey == "PrintScreen & s" or A_PriorHotkey == "PrintScreen & a" or A_PriorHotkey == "PrintScreen & d" or A_PriorHotkey == "PrintScreen & w" or ( A_PriorHotkey == "PrintScreen & space" And A_TimeSincePriorHotkey < 1000))
        Send("{Space}")
    else {
        Send("{enter}")   ; space 智能一点：只有方向键选择以后，需要空格确定而不是回车。
    }
return
}    



PrintScreen & WheelUp::Send("{PgUp}")
PrintScreen & WheelDown::Send("{PgDn}")






;---------------------------------LHS------------------------------
;  逗号 向右偏移的键位。   hjkl ←↓↑→    d↑ f↓ 
;    ALT Q 最近两处跳跃，A home/end 两处跳跃
;                   c 清除修饰键 v              B和N back next 跳转。 m:enter




Capslock & a::Send( modifier "{left}")
Capslock & w::SendInput(modifier "{up}")
Capslock & s::SendInput(modifier "{down}")
Capslock & d::SendInput(modifier "{right}")



Capslock & t::Send(modifier "{PgUp}")
Capslock & g::Send(modifier "{PgDn}")
Capslock & r::Send("{Enter}")


Capslock & q::Send(modifier "{bs}")
Capslock & e::Send(modifier "{delete}")

Capslock & f::
{  
    repeatTime:=  updateSharedRepeat(,2)
    switch repeatTime
    {
        case 0:     send("{end}")
        case 1:     send("{home}")

   }
return
}    


Capslock & LShift::global modifier .= "+"
Capslock & LCtrl::global modifier .= "^"
Capslock & LAlt::global modifier .= "!"
Capslock & Lwin::global modifier .= "#"
Capslock & c::global modifier := ""
Capslock & V::Text_only_paste()
Capslock & p::Send("{Media_Play_Pause}")



;---------------------------RHS------------------------

; 右边半区负责框选    hjkl ←↓↑→

Capslock & u::Send("^+{Left}")
Capslock & o::Send("^+{Right}")
Capslock & j::Send("^{Left}")
Capslock & l::Send("^{Right}")
Capslock & i::Send("+{up}")
Capslock & k::Send("+{down}")

Capslock & m::Send("{BackSpace}")
Capslock & .::Send("{enter}")  ; 必须用 sc 代码
Capslock & sc034::Send("{enter}")  ;  



Capslock & N::Send("!{right}")
Capslock & b::Send("!{left}") ; 前后跳转最有用了，重新定义一下更好用。

; 不去选数字而是利用 GUI 选择。  （ IME 确定是 回车，其他非方向的情况下是空格。）
Capslock & space::
{  
    ;And A_TimeSincePriorHotkey < 1000
    if( A_PriorHotkey == "Capslock & s" or A_PriorHotkey == "Capslock & a" or A_PriorHotkey == "Capslock & d" or A_PriorHotkey == "Capslock & w" or  A_PriorHotkey == "Capslock & space" )
         Send("{Space}")
    else {
        Send("{Space}")   ; space 智能一点：只有方向键选择以后，需要空格确定而不是回车。
    } 
return
}    



Capslock & WheelUp::Send("{PgUp}")
Capslock & WheelDown::Send("{PgDn}")





