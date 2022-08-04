


XButton1::Send("{XButton1}")  ; the "back" on the mouse.
XButton1 & Tab::     
End & PgUp::
{
    ; AltTabMenu()
    Send("!{Esc}")   ; 这会卡在两个程序之间，挺好的。  而 ！+Tab 会一直倒腾。   
    ; Sleep(100)
    SHOW_Shake()
}

XButton1 & CapsLock::       
End & home::
{
    ; ShiftAltTab
    Send("!+{Esc}")
    SHOW_Shake()
}
End & delete::WinRotate("left")
End & PgDn::WinRotate("right")


End & Tab:: Send("#{Tab}")
XButton1 & p::
End & Space::Send("{Media_Play_Pause}")


; End::Send("{End}")
End:: 
{
    CoordMode("ToolTip", "Screen")
    stringToolT := "
(
    win + number 指定数字切换。    
    + wasd = ↑←↓→ 窗口管理
T 沙拉查词  V wechat !+{w}
x 关闭 & Space/delete::{Media_Play_Pause}
& Tab::#{Tab}")    & PgUp\PgDn::!+{Esc}
)"

if(A_ScreenHeight == 1920) ;横屏 的时候是 1080*1920
{
    ToolTip(stringToolT,98,1862,1)
    ToolTip("1          2          3         4          5         6          7         8          9         0",108,1832,2)
}
else if( A_ScreenWidth == 1920)
    ToolTip(stringToolT,98,1008,1)
    ToolTip("1          2          3         4          5         6          7         8          9         0",108,1008,2)
}
End Up::
{
    Send("{End}")
    ToolTip
    ToolTip(,,,2)
    ToolTip(,,,3)
}
~End & <::Send("!+{Esc}")  ; 这两个竟然不生效,但是确实改变了这个按键的触发时间,所以需要保留。
~End & >::Send("!{Esc}")


End & s::Send("#{Down}") 
End & a::Send("#{Left}") 
End & w::Send("#{Up}") 
End & d::Send("#{Right}") 

XButton1 & s::Send("#{Down}") 
XButton1 & a::Send("#{Left}") 
XButton1 & w::Send("#{Up}") 
XButton1 & d::Send("#{Right}") 
XButton1 & t::Send("!{d}") ; 沙拉查词
XButton1 & v::Send("^!+{w}") ; 微信
XButton1 & x::Send("!{F4}")  ; 关闭窗口
XButton1 & q::Send("^{PgUp}")  ; 标签页
XButton1 & e::Send("^{PgDn}")  ; 标签翻页
;                               Tab  发送 切换程序。 alt tab。caps 发送逆 Tab


; win + number
End & 1::Send("#{" SubStr(A_ThisHotkey, 7, 1) "}")   
End & 2::Send("#{" SubStr(A_ThisHotkey, 7, 1) "}") 
End & 3::Send("#{" SubStr(A_ThisHotkey, 7, 1) "}") 
End & 4::Send("#{" SubStr(A_ThisHotkey, 7, 1) "}") 
End & 5::Send("#{" SubStr(A_ThisHotkey, 7, 1) "}") 
End & 6::Send("#{" SubStr(A_ThisHotkey, 7, 1) "}") 
End & 7::Send("#{" SubStr(A_ThisHotkey, 7, 1) "}") 
End & 8::Send("#{" SubStr(A_ThisHotkey, 7, 1) "}") 
End & 9::Send("#{" SubStr(A_ThisHotkey, 7, 1) "}") 
End & 0::Send("#{" SubStr(A_ThisHotkey, 7, 1) "}")  


XButton1 & 1::Send("#{" SubStr(A_ThisHotkey, 12, 1) "}")   
XButton1 & 2::Send("#{" SubStr(A_ThisHotkey, 12, 1) "}") 
XButton1 & 3::Send("#{" SubStr(A_ThisHotkey, 12, 1) "}") 
XButton1 & 4::Send("#{" SubStr(A_ThisHotkey, 12, 1) "}") 
XButton1 & 5::Send("#{" SubStr(A_ThisHotkey, 12, 1) "}") 
XButton1 & 6::Send("#{" SubStr(A_ThisHotkey, 12, 1) "}") 
XButton1 & 7::Send("#{" SubStr(A_ThisHotkey, 12, 1) "}") 
XButton1 & 8::Send("#{" SubStr(A_ThisHotkey, 12, 1) "}") 
XButton1 & 9::Send("#{" SubStr(A_ThisHotkey, 12, 1) "}") 
XButton1 & 0::Send("#{" SubStr(A_ThisHotkey, 12, 1) "}")  ; win + number


Lwin  & delete::Send("!{F4}") 


; Ralt & x::Send("!{F4}")      
 ; Win  Power Toys 修改以后，AHK 识别的位置还是原来的，所以 win 这一套这么写。 ;   但是和 win + x 自己的菜单冲突。  在 explorer 上面使用“关闭”就是关机了。2
Ralt & Esc::Send("!{Esc}") ; 不改的话 会有 bug。
Ralt & q::Send("{Media_Play_Pause}#{3}")   
Ralt & Sc029::Send("{Media_Play_Pause}") 

; !z::Send("^{" SubStr(A_ThisHotkey,-1) "}")
; !x::Send("^{" SubStr(A_ThisHotkey,-1)  "}")
; !c::Send("^{" SubStr(A_ThisHotkey,-1)  "}")
; !v::Send("^{" SubStr(A_ThisHotkey,-1)  "}")
; !s::Send("^{" SubStr(A_ThisHotkey,-1)  "}")
; !f::Send("^{" SubStr(A_ThisHotkey,-1)  "}")



; ALT 数字这套方案想得太简单了，和vscode 冲突！
;  不如直接 esc + symbol = 半角符号
; !9::ClipL("（）")
; !'::ClipL("“”")
; !SC02B::Clip("、")
; >!,::ClipL("《》")
; ![::ClipL("【】")
; >!.::Send("{Right}")
; <!,::Clip("，")
; ; <!.::Clip("。")  sc034 句号不能直接用。
; <!sc034::Clip("。")  
; <!SC027::Clip("：")
; >!SC027::Clip("；")



; ::,,::Clip(" ，")
; ::..::Clip("。")
; :://::Clip("？")
; ::\\::Clip("、")
; ::;;::Clip("；")
; ::''::ClipL("‘’")
; ::""::ClipL("“”")
; ::MM::Clip("：")
; ::((::ClipL("（）")
; ::!!::Clip("！")
; ::6..::Clip("……")



Esc & sc033::Clip_with_Enter(",")
Esc & sc034::Clip_with_Enter(".")
Esc & SC035::Clip_with_Enter("/")
Esc & SC02B::Clip_with_Enter("\")
Esc & SC027::Clip_with_Enter(";")
Esc & m::Clip_with_Enter(":")
Esc & SC028::Clip_with_Enter("`"")  ; apostrophe ""
Esc & a::Clip_with_Enter("'")  ;accent sign; prime   ''
Esc & [::Clip_with_Enter("[")
Esc & ]::Clip_with_Enter("]")
Esc & 9::Clip_with_Enter("(")
Esc & 0::Clip_with_Enter(")")
Esc & 6::Clip_with_Enter("^")


; 临时切到 英文符号，写markdown 方便一些。 中→英文→中文
Clip_with_Enter(text)
{
    Send("^{.}")
    Send(Text)
    Send("^{.}")


}









^End::Send("^{Tab}")

^Home::Send("^+{Tab}")

!Esc::Send("^!{Esc}")
SHOW_Shake()
{
    Sleep(200)
    WinGetPos(&X, &Y, &W, &H, "A")
    if(W==0 or H == 0)
        {
            W:= 1000
            H:=1000
        }
    ax := X+W/2
    ay := Y+H/2
    ToolTip(A_DDDD "  " A_Hour ":" A_Min,ax,ay)
    SetTimer () =>  ToolTip(), -650 

}

Shake(){
    WinGetPos(&X, &Y, &W, &H, "A")
    if(W==0 or H == 0)
        {
            W:= 1000
            H:=1000
        }
    ax := X+W/2
    ay := Y+H/2
    MouseMove(ax, ay)
    WinGetPos(&X, &Y, &W, &H, "A")
    if(W==0 or H == 0)
        {
            W:= 1000
            H:=1000
        }
    ax := X+W/2
    ay := Y+H/2
    MouseMove(ax, ay)
    ; MouseMove(ax+100, ay+100,100)
    Loop 20
     ; Change this value to control how long the mouse will shake. Each loop will be one left movement and one right.
    {
        MouseMove( 100, 50, 100, "R")
        Sleep 15 ; Adjust these sleep values to control how quickly the mouse moves left to right. from my own testing I would not recommend you go less than 2. Else you likely will "loose" inputs due to the mouse moving too fast.
        MouseMove( -100, -50, 100, "R")
        Sleep 15
        }
}
; ahk 自带的函数h::AltTabMenu  
; n::AltTab
; m::ShiftAltTab


; 分号 冒号 等不要改,容易在 hotstring 里面出现! 改成热键就记录不了!
; 直接使用 波浪号，效果出奇的好。`n


 



; !a::Send("!{left}")
; !d::Send("!{Right}")

!F4::Send("!{F4}")

; RAlt::cn("forced")    ; 会变成菜单焦点。
; RShift::cn("forced")     这也不行，会直接不能作为修饰按键。
; RAlt & space::change_to_en_and_put_stringSpace()

;!q 不要占用，word 要用！


; 两处之间快速跳跃
End & F1::
{
    repeatTime:=  updateSharedRepeat(, 2)
        switch repeatTime
        {
        case 0:     Send("!{left}")
        case 1:     Send("!{Right}")
        }
    return
}

; 三处之间快速跳跃
End & F2::
{
    repeatTime:=  updateSharedRepeat(,  3)
        switch repeatTime
        {
        case 0:     Send("!{left}")
        case 1:     Send("!{left}") 
        case 2:     Send("!{Right 2}")
        }
    return
}

sc029 & up::
sc029 & h::
End & Up::ScrollCurrentWindow("{WheelUp}")
End & WheelUp::ScrollCurrentWindow("{WheelUp}")

sc029 & down::
sc029 & n::
End & Down::ScrollCurrentWindow("{WheelDown}")
End & WheelDown::ScrollCurrentWindow("{WheelDown}")

ScrollCurrentWindow(AC){

    WinGetPos(&X, &Y, &W, &H, "A")
    MouseMove(X+W*0.75, Y+H*0.75)
    ; Click()
    Send(AC)
}

F1::
{
    Send("{BackSpace}")
    Sleep(750)
    
    While( GetKeyState("F1","P"))
        {
            Send("{BackSpace}")
            Sleep(50)
        }


}



showHelp()
{
        ToolTip "
        (
            Esc  特殊字符、上标、unicode ↑↑ 小字体  `n       滚轮变 Tab 通用的下一页
            F1   特殊字符的 ↓↓ 下标 unicode  `n      滚轮变  onenote 的专门的分区下一页^{PgDn}     
            F2    滚轮变 下一页  {PgDn} 空格加滚轮也是.                         
            F3  winSpy; Help
            F4  F1~F4  都设置成输入数学公式的
            F5 
            F6   B 保存文本到 1   c 手动输入内容 x 选择保存路径 s 选择保存文件名为指定 d  选择保存文件名为程序名称(pdf)  `n 滚轮变 superscript underscri        `N 排版功能 capslock & F6::   F6 & d 
            F7  网页相关 7/8 搜索东西/复制并 i 上线， u 下线。 F7+F12睡眠， `n  youtube  baidu ab 站点. e= email; F7+w 是笔记软件的文件连接；`n + 数字是保留本来 ctrl+ 数字的的功能
            F8  pomodoro 
            F9  保护原有功能(ctrl 占用)
            F10 
            F11 F11 AHK 相关的了- 脚本禁用、重载，退出等等。 & r::Reload   ; 暂停脚本。 `n f::KeyHistory 控制窗口  全屏 F11&F10 但不如win+↑   F11 & r::Reload  
            F12  awindows.Length 相关的了- Sleep 睡眠、锁定并睡眠p Media_Play_Pause 890 stop previous next ； `n   滚轮和 - + 变音量 . F12 backspace 静音   F12 t::用脚本同步电脑的时间.(需要管理员权限)

            窗口置顶  tilde 或 ti、tl = ` & F1,  !F1::   #F1::
            空格 Space ： z = 隐藏窗口； 很多的  切换程序:2 Obsidian w:OneDrive r:PDF d:沙拉查词 s
        )"
} 
 
$F2::
$F3::
$F4::
$F5::
$F6::
$F7::
$F8::
$F9::
$F10::
$F11::
$F12::
{ 
    the_key := Trim(ThisHotkey,"$")
    Send( "{" the_key "}" )
    ToolTip
}

$^Esc::
$^F1::
$^F2::
$^F3::
$^F4::
$^F5::
$^F6::
$^F7::
$^F8::
$^F9::
$^F10::
$^F11::
$^F12::
{ 
    the_key := Trim(ThisHotkey,"$^")
    ; ToolTip(the_key)
    ; Send( "^{" the_key "}" )
    Send( "^{" the_key "}" )
    ; ToolTip
}

; - { when: always, accept: Control+F12, select: .next }
;       - { when: always, accept: Control+F11, select: .next }
;       - { when: always, accept: Control+F10, toggle: ascii_mode }
;       - { when: always, accept: Control+F9,  toggle: ascii_mode }
;       - { when: always, accept: Control+F8,  toggle: ascii_mode }
;       - { when: always, accept: Control+F7,  




esc & k::
!U::
Esc & Up::
Esc & WheelUp::Send("^+{Tab}")  ; 在 vscode 里面需要安装ctrl 才有下拉选单，这么发送就没有这个功能了。


esc & j::
!I::
Esc & Down::
Esc & WheelDown::Send("^{Tab}")





; 第二级 页面翻页
;alt + 上下只有 onenote 会用. 太少用了,不如换成翻页.
 ; F2 & WheelUp::Send,!{Up}
; F2 & WheelDown::Send("!{Down}")


F1 & J::
F1 & Up::
F1 & WheelUp::Send("^{PgUp}")

F1 & K::
F1 & Down::
F1 & WheelDown::Send("^{PgDn}")

F2 & K::
F2 & Up::
F2 & WheelUp::Send("{PgUp}")
F2 & J::
F2 & Down::
F2 & WheelDown::Send("{PgDn}")

; 最好是网络地址
; F3 & s::Run("C:\Program Files\AutoHotkey\awindows["py"].ahk")
F3 & h::Run("C:\Users\Administrator\OneDrive\代码\AHK\AutoHotkey64.exe")   
F3 & w::Run("https://www.jianshu.com/p/d5f2117fb329")   ; word help
F3 & F1::Run("onenote:https://d.docs.live.net/ff64712bc759b896/文档/雨爽/快速笔记.one#ToDo_FrontPage&section-id={061EB8EC-DE60-4864-B92C-7BC1380657DF}&page-id={C2166799-8231-A942-9101-C8A5CDBE9172}&end")
F3 & F2::Run("obsidian://open?vault=Shaun&file=ZettleDaily%2F2022-05-11")
F3 & 1::Run("onenote:https://d.docs.live.net/ff64712bc759b896/文档/雨爽/快速笔记.one#Marathon&section-id={061EB8EC-DE60-4864-B92C-7BC1380657DF}&page-id={6833971E-4DFA-4DA8-8D42-DD9A7C0F47CC}&end")
F3 & 2::Run("obsidian://open?vault=SNN&file=2%20%E7%8C%9C%E6%B5%8B%E3%80%81%E8%A6%81%E5%AE%9E%E7%8E%B0%E7%9A%84%E6%A8%A1%E5%9E%8B%2F2%20%E7%8C%9C%E6%B5%8B%E3%80%81%E8%A6%81%E5%AE%9E%E7%8E%B0%E7%9A%84%E6%A8%A1%E5%9E%8B")   ; Obsidian 
F3 & 3::Run("obsidian://open?vault=SNN&file=3%20List%20of%20Options%2F3%20List%20of%20Options")

F3 & 5::Run("obsidian://open?vault=SNN&file=5%20%E6%90%9C%E7%BD%97%E6%9D%A5%E7%9A%84%E7%BB%86%E7%A2%8E%E3%80%81%E6%9D%82%E4%B9%B1%2F5%20%E6%90%9C%E7%BD%97%E6%9D%A5%E7%9A%84%E7%BB%86%E7%A2%8E%E3%80%81%E6%9D%82%E4%B9%B1")
F9 & f::SendPlay("^{f}")



;--------Onenote   情况下，这些生效-----------------------------------------------------------------Onenote 没有对应专门的 exe --------------------
; ; edge 浏览器。
; ; #IfWinActive ahk_exe msedge.exe
; ; 特殊的行为。
#HotIf WinActive("ahk_exe ApplicationFrameHost.exe")   ;  Onenote 等 软件  
F2::Send("^+{n}")   ;清空格式，resetFonts
F4::    ;	Onenote 复制链接，复制 指向段落的连接。（指向页面和指向段落的菜单不一样，设置指向段落更好，rbutton tab 四个↓ ）  #IfWinActive ahk_exe ApplicationFrameHost.exe  就是onnote
{  
    Send("{Rbutton}")
    Sleep(200)
    Send("{tab}")
    Sleep(200)
    Send("{down 1}")    ;不选择文字，剪切复制不能选择，只按1下选第三个“复制 指向段落的连接” 
    Send("{enter}")
    return
}    

; F9::Send("{Raw}+")
; F10::Send("{Raw}−")   ;- −en dash - −em dash −
; F11::Send("{Raw}ᐧ")
; F12::Send("{Raw}⁄")
#HotIf

#HotIf WinActive("ahk_exe zotero.exe")   ;  Onenote 等 软件  
F2::voice_text_to_speach()
F3::voice_text_to_speach()
#HotIf

f7 & z::  ; 文字 OCR 或者 PDF 复制下来,最后都会有多余的空格
{  
Send("{Down}{End}")
Send("{Delete}")
Send("{space}")
return
}

F11 & Delete::func_wordpress_change_to_soft_enter()
F11 & d::func_wordpress_change_to_soft_enter()
F11 & Space::Send("{⠀}")    ;insert blank that you can't see, but still can be underlined.




; ; 需要重复的不适合 hotstring.
F6 & WheelUp::func_superscript_text()
F6 & WheelDown::func_underscript_text()
 ;交给 ditto 复制粘贴就行了。有更多的文本处理选择。

 ;但 ditoo 是纯文本的，不方便排便一大堆有链接的目录。
F6 & g::Send("{End}{Delete}{End}") ;排版用  pdf 多余的回车。 
F6 & b::Send("{End}{Down}") ;排版用  pdf 多余的回车。 
; F6 & v::Text_only_paste()   ;交给 ditto 复制粘贴就行了。有更多的文本处理选择。
; F6 & F5::thesis_remove_enter_saladict() 
; F6 & space::adds_two_space_before_and_after()   ; 这个功能 OBSIDIAN 笔记软件的 盘古插件有这个功能，

; F6 & 6::voice_text_to_speach()  ; ` & F1 鼠标
F6 & F4::Pause5Seconds()    ; 暂停脚本。



; F7 & i::url_go("http://10.1.88.4/")
F12 & u:: go_school_offline()
F12 & I::go_school_online()
F12 & r::Reload


F7 & F12::SetTimer(GotoSleep,-300)

 F7 & y::url_go("https://www.youtube.com/")
F7 & b::url_go("https://www.baidu.com/")
F7 & g::url_go("https://www.google.com.hk/webhp?hl=zh-CN&sourceid=cnhp&gws_rd=ssl")
F7 & l::url_go("https://www.bilibili.com/")
F7 & a::url_go("https://www.acfun.cn/")
F7 & d::url_go("https://duckduckgo.com/")
F7 & o::url_go("https://www.olevod.com/")
F7 & e::url_go("https://mail.google.com/mail/u/0/")



F9 & 1::Send("^{1}")
F9 & 2::Send("^{2}")
F9 & 3::Send("^{3}")
F9 & 4::Send("^{4}")
F9 & 5::Send("^{5}")
F9 & 6::Send("^{6}")
F9 & 7::Send("^{7}")
F9 & 8::Send("^{8}")
F9 & 9::Send("^{9}")
F9 & 0::Send("^{0}")


F12 & 7::
F12 & delete::SetTimer(GotoSleep,-3000)
    ; Sleep/Suspend: 不要直接进入睡眠，这样脚本会有 BUG，建议设置一个 timer ，过一会睡眠

GotoSleep()
{  
DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
    ; Hibernate:
    ;DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 0)
Return

; Lock and sleep
}
F12 & l::
{  
    Run("rundll32.exe user32.dll,LockWorkStation")
    Sleep(1000)
    ; Sleep/Suspend:
    DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
    ; Hibernate:
    ;DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 0)
    Return
;上标 superscript  ;wordpress enchance 增强富文本上下标功能。
}    


F12 & WheelDown::Send("{Volume_Down}")
F12 & WheelUp::Send("{Volume_Up}")
F12 & BackSpace::Send("{Volume_Mute}")


    ;分号 和 p 控制视频的播放:
F12 & SC027::
F12 & p::Send("{Media_Play_Pause}")
F12 & Space::Send("{Media_Play_Pause}")
F12 & 8::Send("{Media_Stop}")
F12 & 9::Send("{Media_Prev}")
F12 & 0::Send("{Media_Next}")
F12 & -::Send("{Volume_Down}")
F12 & =::Send("{Volume_Up}")


; F12 & z::SendInput("/")

F12 & t::
{  
If (A_IsAdmin)       ;- I'm 'admin' so it works
   {
    ; RunAs, Administrator    ;  w32tm /resync 可以强制更新windows 时间。
    Run("*runas cmd")
    ErrorLevel := WinWait("Administrator: C:\awindows.Length\System32\cmd.exe", , 3) , ErrorLevel := ErrorLevel = 0 ? 1 : 0
    ;  这两个打字会有问题:  SendRaw, w32tm /resync        SendInput, w32tm /resync
    ; send % "w32tm " chr( 47 ) "resync" 这种方式也不行. 那只能用剪切板了.
    Clip("w32tm /resync")
    Send("{Enter}")
   }
else
   MsgBox("ADMIN=" A_IsAdmin)
return
}    
; F12 & i::Run("`"msedge.exe www.google.com/ --new-window`"")

;Run "msedge.exe http://10.1.88.4 --new-window"

; F11 & f::KeyHistory
; F11 & r::Reload


; F9 & s::Start_Listen_window_change()



; Start_Listen_window_change(){
; ; Gui +LastFound 
; hWnd := WinExist()
; DllCall( "RegisterShellHookWindow", UInt,Hwnd )
; MsgNum := DllCall( "RegisterWindowMessage", Str,"SHELLHOOK" )
; OnMessage( MsgNum, "ShellMessage" )
; Return
; }



; ShellMessage( wParam,lParam )
; {
;  WinGetTitle(title, ahk_id %lParam%)
;  If (wParam=4) { ;
;   ToolTip WinActivated`n%Title%
;   sleep 1000
;   ToolTip
;  }
; }
