
; AltSnap 是 Altdrag 软件的替代，后者不更新了。
; AltSnap 提供 move、resize、lower (title 标题栏  roll、unroll 卷起和展开，只剩下一个标题栏)





; ( 
;   ~  1 2 3 左/中/右键    4 5 跳转 alt→  alt←
;     q 左键    W 智能浏览    E 删除  R 回车 T   
;     a←   s↓   D→   f   F 切换任务   g     
;     z 最小化 X 关闭 c  v 粘贴  B 移动窗口
;     Tab +s 标签页 F1 2  3   4   5   6   7

;     u o 屏幕左右边.  ijkl 复现 mousemode.
; }    

; $sc029::send("{sc029}")  ;`
sc029::
{
    Send("{AppsKey}")
    ; Send("{sc029 Up}")     
}
^sc029::Send("^{sc029}")


$+`::Clip("~")      
esc & sc029::Send("{``}")



sc029 & F1::search_with_edge(1)
sc029 & F2::thesis_remove_enter_saladict()
sc029 & F3::voice_text_to_speach("en")
sc029 & F4::voice_text_to_speach("cn")

;  sc029 & F3::
;  sc029 & f::AltTab
 
sc029 & z::Send("#{d}")
sc029 & x::
{   
        repeatTime:=  updateSharedRepeat(" 显示桌面,最小化,最大化,‘恢复大小’, 关闭")
        switch repeatTime
        {
            
        ; if ( WinActive("ahk_exe msedge.exe"))
        ;     Send("^{w}")
        ; else{
        ;     WinClose("A")
        ; }
        case 0:     Send("#{d}")
        case 1:     WinMinimize("A")
        case 2:     WinMaximize("A") 
        case 3:     WinRestore("A")
        case 4:     WinClose("A")
        
        }
    return
}
    



 

sc029 & c::Send("^{c}")
sc029 & V::Send("^{v}")

sc029 & F5::maximizeORrestore()


F3 & n::Run("onenote:https://d.docs.live.net/ff64712bc759b896/文档/雨爽/快速笔记.one#ToDo_FrontPage&section-id={061EB8EC-DE60-4864-B92C-7BC1380657DF}&page-id={C2166799-8231-A942-9101-C8A5CDBE9172}&end")
F3 & m::Run("onenote:https://d.docs.live.net/ff64712bc759b896/文档/雨爽/快速笔记.one#Marathon&section-id={061EB8EC-DE60-4864-B92C-7BC1380657DF}&page-id={6833971E-4DFA-4DA8-8D42-DD9A7C0F47CC}&end")


 
 


sc029 & LShift::  ; 带 shift 的点击
{  
    Send("{LShift Down}{LButton}")
    ; KeyWait("sc029")
    ; Send("{LShift Up}")
    SetTimer () => Send("{LShift Up}"), -750  
}    
;    一松开就取消了 powertoys 的功能, 不能用原来的 Lshift ，。 微软官方的功能检查优先级比 AHK高，不会先通知脚本 shift 放开了，而是先通知 Powertoys "Shift放开”。 
sc029 & Lalt::AltTab
 
; sc029 & LWin::Send("#^{Right}")   ;虚拟桌面
; sc029 & LCtrl::Send("#^{Left}")
sc029 & LWin::VirgoRight()
sc029 & LCtrl::VirgoLeft()
#F1::Send("#^{Left}")
#F2::Send("#^{Right}")

; SC15C & F1::Send("#^{Left}")  RWin 没有用，并且家里的键盘根本没有这个按键，放弃。
; SC15C & F2::Send("#^{Right}")

Esc & F1::
sc029 & 1::  
{  
    global M_altered_wait_click
    M_altered_wait_click := 1
    ToolTip()
    Click("Down")    ; hold down  鼠标左键
    ErrorLevel := !KeyWait("1")
    ErrorLevel := !KeyWait("F1")
    Click("Up")
Return
}    



sc029 & 2::
{  
    Click("Middle  Down")
    ErrorLevel := !KeyWait(2)
    Click("Middle  Up")
Return
}    

Esc & F3::
sc029 & 3::Click("Right")

sc029 & 4::Send("!{left}")
sc029 & 5::Send("!{Right}")

Esc & F2::
sc029 & e::smart_wheelUpDown()
smart_wheelUpDown()
{    
    global XwhereMwas
    global YwhereMwas

    Title := WinGetProcessName("A")   
    ; WinGetPos(&X, &Y, &W, &H, "A")
      ToolTip(return_last_combined_key() )
  
    start_height := YwhereMwas
    while( key(return_last_combined_key()) ){
        
        MouseGetPos(&xpos, &ypos)
        d := ypos - start_height
 
        
        if(  d < -10)
            Send("{WheelUp}")
        else if(  d >  10)
            Send("{WheelDown}")

        Sleep( 150 )
    }
} 

sc029 & -::Send("{WheelLeft}")
sc029 & =::Send("{WheelRight}")
sc029 & Q::
sc029 & a::
;--------------------------------------------------------------------
sc029 & Backspace::
sc029 & Tab::change_to_chn_and_retype()
sc029 & enter::                        ; tilde 
sc029 & CapsLock::                        ; tilde
sc029 & space::change_to_en_and_put_stringSpace()
;--------------------------------------------------------------------


sc029 & R::Send("{enter}")



sc029 & W::Send("{WheelUp}")
sc029 & s::Send("{wheeldown}")

sc029 & t::Send("{Sleep 1000}{t}")
; sc029 & M::enter_mouse_mode()
sc029 & 8::MouseMove(500, 1000)
sc029 & 7::MouseMove(-700, 1100)
sc029 & i::function_my_mouse_momentum(0,-1)  ;↑ y<0 ← x<0 ↓ y>0 → x>0
sc029 & k::function_my_mouse_momentum(0,1)  ;↑ y<0 ← x<0 ↓ y>0 → x>0
sc029 & J::function_my_mouse_momentum(-1,0)  ;↑ y<0 ← x<0 ↓ y>0 → x>0
sc029 & L::function_my_mouse_momentum(1,0)  ;↑ y<0 ← x<0 ↓ y>0 → x>0

 
sc029 & WheelUp::
{  
    WinGetPos(&X, &Y, &W, &H, "A")
    repeatTime:=  updateSharedRepeat(,3)
    switch repeatTime
    {
    case 0:     MouseMove( x+2 , y+2   ) ; 软件左上角的 toolbar位置、屏幕左上角的位置，副屏幕位置。
    case 1:     MouseMove( 561,26 )
    case 2:     MouseMove( -648,696 ) 
                repeatTime:=0
    }
return
}    


sc029 & WheelDown::
{  
    WinGetPos(&X, &Y, &W, &H, "A")
    repeatTime:=  updateSharedRepeat( ,2)
    switch repeatTime
    {
    case 0:     MouseMove( x+w-10 , y+195)  ; 滚动条位置
    case 1:     MouseMove( x+w-5 , y+h-5 ) ;右下角位置
    case 2:     MouseMove( -726, 1150  ) 
                repeatTime:=-1
    }
return
}    


sc029 & P::
{  
    ihOutputVar := InputHook("L3 T1.5 M"), ihOutputVar.Start(), ihOutputVar.Wait(), OutputVar := ihOutputVar.Input
    switch OutputVar
    {
        ; 这里不区分大小写。
    case "R":     switch_to_a_program( ["MuPDF","adobe Acrobat DC","pdf","WPF Office"] )
    case "st":    switch_to_a_program( ["Sticky", "便笺"])
    case "we":    switch_to_a_program( ["微信", "Teams","Zoom", "wechat"])
    case "x":     switch_to_a_program( ["微信", "Teams","Zoom", "wechat"])
    case "t":     switch_to_a_program( ["Command Prompt", "PowerShell","Bash", "Terminal","Terminus","prompt"])   ; win + t/  win + shift + t 有的人可能觉得这个按键挺有用的。 但我用 win + 滚轮 实现了更方便的，就占用了。    terminus 程序名字比较特殊，他可以启动 cmd powershell  WSL，名字会变。
    case "c":     switch_to_a_program( ["Visual Studio Code", "Visual Studio","PyCharm", "Arduino"])  ;IDEs
    case "i":     switch_to_a_program( ["Visual Studio Code"])  ;IDEs
    case "ppt":   switch_to_a_program( ["PowerPoint"]) 
    case "wor":   switch_to_a_program( ["Word","Excel", "OnlyOffice","Libreoffice"])  
    case "e":   switch_to_a_program( ["Edge"],True )
    case "O":   switch_to_a_program( ["OneNote"],True )    ; 一句话打开 Onenote 。  后面这是一键创建新笔记：Run,  onenote-cmd://quicknote?onOpen=typing   。但是没有别的指令，就非常难受。  
    case "Ob":   switch_to_a_program( ["Obsidian"], True )
    case "One":   switch_to_a_program( ["OneCommander"],True )  ;   不能使用文件浏览器,他们没有固定的名字,wintitle 是文件的名字,找不到程序. switch_to_a_program( ["Explorer.EXE", "OneCommander.exe"] , True ) ;程序自带快捷键

   
    }

return
}  


enter_mouse_mode()
{
    BlockInput("On")
    global flag_controlling_mouse
    global speed
    flag_controlling_mouse:=1
    base_speed := "12"
    base_sleep_time:=60
    speed:=base_speed
    ;Keywait, Esc    ;？？
    ToolTip("   鼠标模式 需要运行在管理员模式下 need run `n          “过一段时间重置速度”， 按 ijkl 移动鼠标↑←↓→，会越来越慢（越来越精细），不操作才能加速。`n     也可以用 ~1234 来调整速度…… 其他快捷键： `t`n  单击:: u/f `t 双击 y/g `t 右键 p/r `t 鼠标中键 h/d `t鼠标滚轮 w↑/s↓ `n   "  )

    mouse_Start_time := A_TickCount

    while(true)
        {
        if (key("Esc"))    ; key 函数是 getkeystate 的缩写。如果按键不按下，返回值是 0. if else 结构 那么按下才进入，相当于一个反逻辑。
            break
        ;如果长时间不动就重置速度
                
        if( A_TimeIdlePhysical > 550 or (A_TickCount - mouse_Start_time > 1500))
        {
                mouse_Start_time := A_TickCount
                ToolTip("长时间不动 speed reseted 速度重置了 tilde = " tilde " `n " A_TickCount)
                speed:=base_speed
        }

        tilde:=key("Sc029")
        tab:=key("Tab")
        Win:=key("Win")
        dash:=key("-")
        plus:=key("=")
            q:=key("q")
            w:=key("w")
            e:=key("e")
            r:=key("r")
            t:=key("t")
            y:=key("y")
            u:=key("u")
            i:=key("i")
            o:=key("o")
            p:=key("p")
            a:=key("a")
            s:=key("s")
            d:=key("d")
            f:=key("f")
            g:=key("g")
            h:=key("h")
            j:=key("j")
            k:=key("k")  
            l:=key("l")
            z:=key("z")
            x:=key("x")
            c:=key("c")
            v:=key("v")
            b:=key("b")
            n:=key("n")
            m:=key("m")
        ; 基本按键缩写还是能更快的。

        speed:= base_speed*( 1+ key("Sc029")*(-0.8) + key("1")*(-0.5) + key("Space") + key("2")*(0.5) + key("3")*(0.9) +  key("4") *(1.1) )        

        ; ↑ y<0 ← x<0 ↓ y>0 → x>0
        x:=0
        y:=0 
        if( i )
             y:=-1
        if( j )
            x := "-1"
        if( k )  
            y:=1
        if( l )
            x:=1
        if( i or j or k or l)
        {
            
            TimeLength := A_TickCount - mouse_Start_time
            speed:=Max(speed*Exp((TimeLength/400)*Ln(0.95)),1)
             ToolTip(speed)
            MouseMove(x*speed, y*speed, 100, "R")   ; 100 仅仅是一个默认参数、 R 代表相对移动
        }
        ; else
        ; {
        ; }
          

        if(u or f)
            SendInput("{Click}") ;Click, 1
        if(y or g)
            SendInput("{click 2}")
        if(p or r)
            SendInput("{Click Right}")
        if(h or d)
            SendInput("{Click Middle}")
        if( w)
            SendInput("{Click WheelUp}")
        if( s )
            SendInput("{Click WheelDown}")
        if(key("F4"))
            Send("^w")
        if(Tab)
            Send("!{Esc}")   
        if(q)
            Send("!+{Esc}")
        if(t)
            Send("^{t}")
        if(Win)
            Send("{Win}")
        ; 放大缩小 -= +
            if(dash)  
                Send("^{WheelDown}")
            if(plus)
                Send("^{WheelUp}")
        if( key("Enter") )
            Send("{Enter}")
        ; if(   A_IdleTimePhysical < 200 )   ; 如果有任意键背按下，就是活跃的
            ; sleep_time:=base_sleep_time*10
        if( h or n or dash or plus)
            sleep_time:=base_sleep_time*3   ; 翻页键需要更多反应时间。
        
        Sleep(sleep_time)
        }
    BlockInput("Off")
    ToolTip() 
} 


#HotIf useEnterAsSpace == 1
$space::
{
    Send("{Enter}{Space}")
}

#HotIf


#HotIf M_altered_wait_click == 1
 
$1::
{
    Click("Down")    
    ErrorLevel := !KeyWait( Trim(A_ThisHotkey,"$"))  ; hold down   
    Click("Up")
} 
$2:: 
{
    if (A_PriorHotkey == A_ThisHotkey and A_TimeSincePriorHotkey < 400)
        {
            smart_wheelUpDown()  
            return
        }
     
    Click("Down Middle")    
    ErrorLevel := !KeyWait( Trim(A_ThisHotkey,"$"))  ; hold down  
    Click("Up Middle")
} 
$3::
{
    Click("Down Right")    
    ErrorLevel := !KeyWait( Trim(A_ThisHotkey,"$"))  ; hold down  
    Click("Up Right")
}
4::smart_wheelUpDown()

; $space::
; {
;     Send("{Delete}")
;     clear_mouse_flag_altered()

;     ; global threshold_idle
;     ; ; ToolTip( A_TimeIdleKeyboard "> " threshold_idle)  ; 
;     ; if( flag_idle_space == 1){
;     ;     cn()
;     ;     Send("{BackSpace}")
;     ; }
; }


; d::Send("^{" ThisHotkey "}")

; mouse speed

 
; Up::function_my_mouse_momentum(0,-1)  ;↑ y<0 ← x<0 ↓ y>0 → x>0
; Down::function_my_mouse_momentum(0,1)  ;↑ y<0 ← x<0 ↓ y>0 → x>0
; Left::function_my_mouse_momentum(-1,0)  ;↑ y<0 ← x<0 ↓ y>0 → x>0
; Right::function_my_mouse_momentum(1,0)  ;↑ y<0 ← x<0 ↓ y>0 → x>0

; 应该不包括 ijkl，因为只映射 number 和 Fn ， 还可以打字，没有干扰。
isDirections(key){
    switch key
    {
        case "Up":  return 1
        case "Down":  return 2
        case "Left":  return 3
        case "Right":  return 4
        ; case "i":  return 1
        ; case "j":  return 2
        ; case "k":  return 3
        ; case "w":  return 4
        default:  return 0
    }
}

add_vector_directional(&x,&y,arrow){
    switch arrow
    {
        case 1: y :=  -1
        case 2: y :=  1
        case 3: x :=  -1
        case 4: x :=  1
    }
}

global reset_not_using_K2Ms := 1
global LastX := 0
global LastY := 0
global flag_is_old_key := 0

; mouse speed 不好设置，目前只能大范围跳跃。
; 这个函数多次进入是会“暂停”的，应该用全局变量保存。
; prior 记录根本不准， →↑ 会变成 ↑，必须每次都重新扫描
function_my_mouse_momentum(x,y, keys:="IJKL"   ){  
    global speed
    global Ts
    global LastX
    global LastY
    global reset_not_using_K2Ms
    base_speed := 100
    base_sleep_time := 60
    low_speed_limit := 1
    slow_down_rate := 1600 ; 数字越大衰减越慢。400 合适。
    speed := base_speed
    
    if( keys == "Arrows")
        veg := ["Up", "Down", "Left", "Right"]
    else if( keys == "IJKL")
        veg := ["I", "K", "J", "L"] 
    if( reset_not_using_K2Ms == 1 )
    {
        Ts  := A_TickCount
        ; ToolTip("长 speed reseted `n " A_TickCount)
        speed:=base_speed
    }


    flag := 1
    while( flag ){
        TrueKey := SubStr(A_ThisHotkey, -1)
        ThisKey :=  GetKeyState( TrueKey,'p')
        count := 0
        x :=0
        y := 0
        Loop veg.Length
            {
                if(GetKeyState( veg[A_Index],'p'))
                {
                    add_vector_directional(&x,&y,A_Index)
                    flag := 1
                    count += 1
                }
            }
        if( count == 0)
            {
                flag := 0 
            }
         reset_not_using_K2Ms := 0
        TimeLength := A_TickCount - Ts + 1
        k := Exp(-(TimeLength/  slow_down_rate)) * 00.94   
        speed := Max( speed * k, low_speed_limit) 
        ; ToolTip( speed "`t" count "`n"   GetKeyState( TrueKey,'p') "`n" TrueKey "`n latter_key`n"  ,0,0 )
        MouseMove(x*speed, y*speed, 100, "R")
        

        Sleep(  15)   ;加入循环自己判定，而不是按照 Auto repeat 判断时间间隔。
    }
    SetTimer () =>  ToolTip("R",100,100), -50   ;`这样的计时器是新建的，不会刷新。只有新建一个真的函数才会共享一个变量。 function_flag_mouse
    ; SetTimer () =>  ToolTip("speed reseted"), -50   ;`这样的计时器是新建的，不会刷新。只有新建一个真的函数才会共享一个变量。 function_flag_mouse
    SetTimer(function_flag_mouse,  - 150  )
    SetTimer () =>  ToolTip(), -1050   


}

function_flag_mouse(){
    global reset_not_using_K2Ms := 1
}
  


; 9::Send("{WheelDown}")  2 已经实现了。
; 0::Send("{WheelUp}")

; Fn 按键不能立即触发，已经组成修饰键了，必须松开才触发。
; F1::search_with_edge(1)
; F2::thesis_remove_enter_saladict()
; F3::voice_text_to_speach("en")
; F4::voice_text_to_speach("cn")

; F5::Send("^{a}")
; F6::Send("^{x}")
; F7::Send("^{c}")
; F8::Send("^{v}")

; ------------- 打断思路  弃用---------------
; f::
; {
;     en()
;     clear_mouse_flag_altered() 
;     ; Send("{bs}")   ~f:: 会在错误的时间发送！
;     ToolTip(A_PriorHotkey "     "   ) 
;     ; if( !IsAlpha(A_PriorHotkey))   ;` 没有按键记录器，不能用 proir -hot- key  
;     ;     {
;     ;        
;     ;     }
; }
; J:: 
; {
;     cn()
;     clear_mouse_flag_altered() 
 
; }
; ------------- 打断思路  弃用---------------  rr111

~q::
~w::
~e::
~r::
~t::
~y::
~u::
~i::
~o::
~p::
~a::
~s::

~f::
~g::
~h::
~j::
~k::  
~l::
~b::
~n::
~m::
{
clear_mouse_flag_altered() 
}
#HotIf


global USED_for_math := 0
#HotIf USED_for_math == 1
F9::Send("{Raw}+")
F10::Send("{Raw}−")   ;- −en dash - −em dash −
F11::Send("{Raw}ᐧ")
F12::Send("{Raw}⁄")

#HotIf
