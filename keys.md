基本：A,^, !q,!←→, +      唤出窗口：#,  +#N
本软件自定义： !, !#        特殊插件、功能：^W

Sc029  ····	tilde ~	SC035	/   forward slash   sc033	逗号    sc034 句号 	 SC02B 	\ 非标准键盘, backslash     028='
semicolon	SC027		  SC028	  引号，（双引号没有SC 码      
; ctrl +k,ctrl+s 是让 VSCode 显示快捷键设置页面。

 分号 冒号 等不要改,容易在 hotstring 里面出现! 改成热键就记录不了!
SC02B & enter::clip("\n")
SC02B & Tab::clip("\t")
SC02B  & sc033::clip("/")




[;常用按键最好不整重复，现在是等待逻辑，干扰之前的输入     
        需要特殊的编码 ;
## 重复按键
  repeatTime:=  updateSharedRepeat(" 最大化,关闭,min,‘恢复’")
        switch repeatTime
        {
        case 1:     if ( WinActive("ahk_exe msedge.exe"))
                    Send("^{w}")
                else{
                    WinClose("A")
                }
        case 0:     WinMaximize("A") 
        case 2:     WinMinimize("A")
        case 3:     WinRestore("A")
        }
    return


# AHK 循环列表
list    switch_to_a_program(titile_names,     

switch_to_a_program( ["沙拉查词","Salad", "Sticky"])
直接使用就行  titile_names[1]   
    for index, element in titile_names ; Enumeration is the recommended approach in most cases.   
    {



 Ctrl_+ Tab 切换标签页和 Ctrl + pagedown 在大部分软件里面功能都是一样的。   但是 OneNote 分的更细，pgdn/up 用于切换 pages。
 就是说有五种种翻页方式：标签页翻页、页面翻页、PageUp/down 正常翻一页、ctrl+home/end 文件头尾和鼠标滚轮翻一点点翻。
 对于双手的情况，ESC + 滚轮 或者 ESC + jk 可以满足习惯。
 对于单手的情况，还是用 ctrl+tab 吧。 


ctrl + 上下 在 vs 里面是"预览",也就是文字编辑不动,却可以看别处.   但是在 OneNote 里面,就是大段的上下,作用完全不一样.


; 有双击冲突的符号: :: VSCODE [[ OBSIDIAN // 写作   \\ 文件地址
;  注释最好多加一个功能, 直接复用 ^/ double



垃圾箱，不想用的函数




;#]::fun/ c_display_wintitle()
; #, 原本是预览桌面，没啥用。
; #g::  game bar 录像没法关闭，用不了 .. #h voice typer.



; 尝试检测屏幕上是否有 IME 的候选框，结论是 输入法 IME 每次弹出窗口的进程号都是新的，虽然有递增的规律，但是不同窗口的号不一样，程序判断太难，实现不了。
list_all(){
    ; Gui, New
    DetectHiddenWindows(false)
    owindows := WinGetList(,,,)
    awindows := Array()
    windows := owindows.Length
    For v in owindows
    {   awindows.Push(v)
    }
    ret := 0
    r := awindows.Length . "个程序"  . "`n"
    ; Tooltip, %windows%
    
    Loop awindows.Length
    {
        r .= awindows[A_Index] . "`t"
        wt := WinGetTitle("ahk_id " id)
        r .= ahk_id . "`t"
        r .= wt . "`t"
        r .= "..." . "`n"
    }
    ; `↓↓↓ 现实所有 wintitle 不为空的程序名. 但是 IME 没有考虑这个, 名字是空白.                 
    ; Loop %windows%
    ; {
    ;     id := windows%A_Index%
    ;     WinGetTitle wt, ahk_id %id%
    ;     if (wt == ""){   ;wt ==  "dummyLayeredWnd"   不知
    ;         Continue
    ;         ret += 1
    ;     }
    ;     r .= wt . "`n"
    ; }
    ; Gui +LastFound  

    ogcMyText.Value := r
    ; Gui, Show
    ;  Tooltip, %r%
    return ret
}


检测窗口程序的 ID
check_ids()
{
oWindowID := WinGetList(,,,)
aWindowID := Array()
WindowID := oWindowID.Length
For v in oWindowID
{   aWindowID.Push(v)
}
Loop aWindowID.Length {
cWindow := aWindowID[A_Index]
Title := WinGetTitle("ahk_id " cWindow)
Message := Message "`n" Title
} 
MsgBox("List of Visible awindows.Length , " Message)
}

; if WinExist("ahk_class Notepad") or WinExist("ahk_class" . ClassName)
;     WinActivate  ; 使用最近找到的窗口。


文件读写
; 这种文件写入不方便和其他程序沟通
func_write_string_to_a_file(){
    Send("^{c}")
    the_clipboard:= A_Clipboard

    ;trust your cloud drive.
    SetWorkingDir(A_ScriptDir "\Q")
    exe_name:=get_ahk_exe_name()
    file_name:=get_ahk_title_name()

    ; pdf 文件会很烦，它的程序名字会这样：
    ; 2001 Temporal and spatial coding in the rat vibrissal system .pdf and 2 more pages - Personal - Microsoft​ Edge
    ; 或者是这样:
    ; isaacson2011 How Inhibition Shapes Cortical Activity.pdf - 3/13 (92 dpi)
    ; 只要翻页程序名字会不一样,所以需要做一些裁剪.

    Title := WinGetTitle("A")
    FoundPos := InStr(Title, ".pdf")
    if ( FoundPos = 0 ){
        location_file:= Title . ".md"
    }    
    else{
        OutputVar := SubStr(Title, 1, -1*(FoundPos))
        location_file:= OutputVar . ".md"
    }
    ; location_file := "..\文档\QuickNotes" . location_file
    ; MsgBox, FoundPos %FoundPos%  `n 最终位置 %location_file% `n %Title%
    FileEncoding("UTF-8")  ; UTF 8 是包括中文的。 ; 如果不加， md 文件特别容易乱码。（我不知道怎么给 md 文件 加 BOM，我不太懂文件编码，但这一定是最简单的方法）
    FileAppend(the_clipboard "`n", location_file)  ;     文件名不要加引号，否则识别不出来。

    SoundBeep(1000, 100)
    ToolTip(location_file " 已经写入。")
    A_Clipboard:= the_clipboard
    SetTimer(RemoveToolTip,-1000)
    }
func_write_inputbox(){
    SetWorkingDir(A_ScriptDir "\..\文档\QuickNotes")
    exe_name:=get_ahk_exe_name()
    file_name:=get_ahk_title_name()
    ;InputBox, UserInput, Quick Notes, It will be added, Hide, 200, 200,0,0
    location_file:= exe_name ".md"
    IB := InputBox("It will be added to " location_file, "Quick Notes", "w200 h150 x900 y900"), UserInput := IB.Value, ErrorLevel := IB.Result="OK" ? 0 : IB.Result="CANCEL" ? 1 : IB.Result="Timeout" ? 2 : "ERROR"
    FileAppend(UserInput "`n", location_file)
    }


更简单的复制粘贴
take_notes( program){
    ; freeze_clipboard()
    
    the_clipboard:= A_Clipboard
    Send("^{c}")
    Sleep(100)
    switch_to_a_program( [ program] ) ； 换成切换程序坏借鉴
    Sleep(200)
    Send("{Enter}")
    Send("^{v}")
    Sleep(100)
    Send("!{Tab}")
    A_Clipboard := the_clipboard
}


; A_IdleTimePhysical 在快捷键出发的时候一定会被置零, 不实用了,需要自己记录几秒之前的状态.   get_idle_time_before_this_key(t) t 取正值, t 越大取得时间越远. 
get_idle_time_before_this_key(*){
    global TimeIdleKeyboardArray
    global index_Time 
    global maxValue_Time

    get_i := mod(index_Time - 3+ maxValue_Time , maxValue_Time)
    ; ToolTip, %get_i%  index_Time =%index_Time%
    return TimeIdleKeyboardArray[get_i] 
    ; 
}


;  启动 exe 。run 这个指令需要用需要添加到环境变量里面。不在里面的话是运行不了的，而且这个必须是文件名一模一样。 快速启动大法 win + R 。
Open_and_switch_to_a_program(titile_name,program_exe, software_has_the_need_to_hide_prompt := "false"){
        ; Msgbox, %titile_name%   %program_exe%  debug   winactive 默认找程序不行，需要指定 第二个模式，包含 title 就能切换过去，不死板地匹配。
    
        SetTitleMatchMode(2)
        ; WinActivate, %titile_name%,,2
    if WinExist(titile_name)
    {
        WinActivate()
    }
    else
    {
        Run(program_exe)
        ; 千万不要使用 runwait，那个是等他结束了
        ErrorLevel := WinWait(titile_name) , ErrorLevel := ErrorLevel = 0 ? 1 : 0
        ; SoundBeep, 2500,200
    if ( software_has_the_need_to_hide_prompt = "true")   ; 第三个参数时可选的，默认不隐藏。
        func_hide_scoop_shim()
    }
    }
    func_hide_scoop_shim(){
        ; scoop 这个软件的副作用，不用 scoop 管理器可以不加这句话。   shim “垫片” 过渡程序并不消失，但是 terminus bug 更重，连 shim 都不能关闭。
        ; 我知道了更深的原因，发过 GUI 的同学都知道， CLI 用来输出一些开发过程用的文字。但因为正常打开软件，标准输出是没有窗口的，所以那个黑窗口不存在。我们 run 却提供了一个 stdout 和 stderr 窗口。
        ; 但是如何把标准流 弄到 null 里面我不太会,  ; RunWait, %program_exe% "">nul"",  , Max ??   干脆隐藏这个窗口就算了.
        ; 错误的解决方法： run  最后的参数  max 改成 hide。真的藏起来了，但对于正常程序是真的找不到了。愚蠢的方法
    SetTitleMatchMode(2)
    SetTitleMatchMode("slow")
    ; 不要用 IfWinExist
    WinExist("scoop\shims")
            WinHide()
        ; WinClose
    ; hide 最终只多出一个 2.0 MB 的程序， cpu 占用是 0% ，隐藏不渲染就不占用 cpu。除非开发人员像我一样话唠， stdout/err 很多，但是估计隐藏起来话多也影响不大，hide 是可以接受的方法。 run program >nul 没有成功。
}



F11 & a::all_program()
all_program(){
    DetectHiddenWindows(false)
    owindows := WinGetList(,,,)
    awindows := Array()
    windows := owindows.Length
    For v in owindows
    {   awindows.Push(v)
    }
    Loop awindows.Length
    {
        id := awindows[A_Index]
        wt := WinGetTitle("ahk_id " id)
        r .= wt . "`t"
    }
    ToolTip(r)
}
;

List(listName,integer)
    {
    Loop Parse, listName, "|"
    {
    If (integer = A_Index) {
    returnValue := A_LoopField
    }
    }
    return returnValue
}


Language_code_on_GUI_Eng1_Chinese2_tray_icon(){
 ; 假设你的任务栏是白色，在“语言栏”下方取几个点。如果全是白色，那么说明没有检测到“中”这个字下面的黑色，那么就是“英”
; 0xEEEEEE is white，白色色。因为不同输入法 GUI 字体不一样，多试几个点。黑色不一定是纯的 000000，
CoordMode("Pixel", "Screen")
color1 := PixelGetColor(14, 945, "Slow")
color2 := PixelGetColor(14, 946, "Slow")
color3 := PixelGetColor(15, 943, "Slow")
color4 := PixelGetColor(16, 946, "Slow")
;tooltip, %color1% %color2% %color3% %color4%, 14,945,2
if( is_white(color1) and is_white(color2) and is_white(color3) and is_white(color4))
    return 1   ;全是白色，没有检测到“中”这个字下面的黑色，那么就是“英”
else
    return 2
}
is_white(vv){
if(vv = 0xBEBEBE or vv = 0xEEEEEE or  vv = 0xFFFFFF)
    return 1
else
    return 0
}
is_black(vv){
if(is_white(vv))
    return 0
else
    return 1
}

; 但是上一个方法只能针对固定宽度的任务栏，有的用户不会缩到最小，而且大家的桌面都不太一样，所以写一个稍微智能点的方法。
Language_code_GUI_Eng1_Chin2_tray_icon_AHK_line_search(){
global IME_icon_position_x
global IME_icon_position_y
; REMOVED: SetBatchLines, -1
CoordMode("Pixel", "Screen")
mark1:=0
mark2:=0
; 因为桌面都不太一样，所以写一个稍微智能点的方法。
; version 2
; 那么做一个行扫描，对“中”“英”最底下那行扫描，判断两组黑点的位置区别，可以判断中英文输入法状态。
; 以下四个位置选择一个。矩形搜索只需要左上和右下两个点。
;如果你的任务栏是放下面（默认位置）
;leftup_x:=  1692    ; 自己量一下！！  1739  1692 都有可能，用 ahk 的 window spy查看。
leftup_x:=  1733    ; 用 ahk 的 window spy查看。
;leftup_y:=   1062   ; leftup_y:=   1067  1062
leftup_y:=   1065   ; leftup_y:=   1067
rightdown_x:=  1780
rightdown_y:=   1067

;如果你的任务栏是放上面
;leftup_x:=  1739
;leftup_y:=   26
;rightdown_x:=  1777
;rightdown_y:=   26
;如果的任务栏在左侧（ 1080p 屏幕的第 944 行）。 对于任务栏放在屏幕左右的情况，由于它们宽度不是固定的，需要扫描范围大一点。
;leftup_x:=  0
;leftup_y:=  944
;rightdown_x:= 450
;rightdown_y:= 945
;debug
;mousemove ,  %leftup_x%, %leftup_y%
mark1x:=0
mark1y:=0
mark2x:=0
mark2y:=0
; 我这个算法分成两次 search，“英”扫到左下角和右下角的距离，撇和衲，距离合适则是“英”这个字。如果不是合适的距离（过远），那么就是扫到别的东西了，可以判断是“中”字。
IME_icon_position_x:=leftup_x
IME_icon_position_y:=leftup_y
ErrorLevel := !PixelSearch(&mark1x, &mark1y, leftup_x, leftup_y, rightdown_x, rightdown_y, 0x000000, 200, "Fast")
if ErrorLevel
    {
        return 8
;MsgBox, 111That color was not found in the specified region.
    }
;debug
;mousemove ,  %mark1x%, %mark1y%
start2:= mark1x + 7
ErrorLevel := !PixelSearch(&mark2x, &mark2y, start2, leftup_y, rightdown_x, rightdown_y, 0x000000, 200, "Fast")
if ErrorLevel
    {
        return 8
;MsgBox, 111That color was not found in the specified region.
    }
    mark2x:=99999
distance:= Abs(mark2x - mark1x)
;debug
;mousemove ,  %mark2x%, %mark2y%
;Tooltip, IME= search two strokes in character`n  ……%mark1x%  %mark2x%, 200 , 980
SetTimer(RemoveToolTip,-3000)



if(  distance< 18 ) {   ;  18 > distance >5  符合"英"字最低下分开的两部分，能判断是英文。如果中文状态，只会扫描到了中字最下面一点。
    return 1
}
else{
    return 2
    }
}

F5 & n::cycle_through_programs("n")
cycle_through_programs(the_key)
{
      Send("#{Tab}")
      ErrorLevel := !KeyWait(the_key, "T0.7")
      while(ErrorLevel = 1)
      {
      Send("{Right}")
      ErrorLevel := !KeyWait(the_key, "T0.7")
      }
      Send("{enter}")
  return
}


sc029 & C:: ; 快速移动鼠标位置
{  
    while( key("c")){
        WinGetPos(&X, &Y, &W, &H, "A")
        MouseGetPos(&xpos, &ypos)
        Sleep(50)
        MouseGetPos(&xpos2, &ypos2)
        vectorx:= (xpos2 - xpos)*5
        vectory:= (ypos2 - ypos)*5
        MouseMove(vectorx, vectory, 100, "R")
        MouseGetPos(&xpos3, &ypos3)
        ToolTip(xpos3 " " ypos3)
    ; 屏幕的中心, 副屏幕是负数.
    ; MouseMove, 500, 1000
    ; MouseMove, -700, 1100
;    if(A_PriorHotkey != "sc029 & b")
;         MouseMove, 500, 1000
;     else {
;         MouseMove, -700, 1100
;     }
    ; BlockInput, Mousemove
    ; KeyWait, B
    ; BlockInput, MouseMoveOff
    }
Return
}    


; AutoHotkey v1.1 到 V2 改得太多太麻烦了  删除！
F5 & /::func_wait_my_secondary_command_Length_2()
func_wait_my_secondary_command_Length_2(){
    ; InputHook vs. Input (v1) 改得太多太麻烦了删除！
    ; ih := InputHook("L2 T10","{enter}.{esc}{tab}"), ihUserInput.Start(), ihUserInput.Wait(), UserInput := ihUserInput.Input
    ; ih.Start()
    ; ih.Wait()
    
    ;     switch ErrorLevel
    ;     {
    ;     case "Max":
    ;         MsgBox, You entered "%UserInput%", which is the maximum length of text.
    ;         return
    ;     case "Timeout":
    ;         MsgBox, You entered "%UserInput%" at which time the input timed out.
    ;         return
    ;     case "NewInput":
    ;         return
    ;     default:
    ;         if InStr(ErrorLevel, "EndKey:")
    ;         {
    ;             MsgBox, You entered "%UserInput%" and terminated the input with %ErrorLevel%.
    ;             return
    ;         }
    ;     }

    ;     switch ih.Input
    ;     {
    ;         case "dd":   delete_one_line()
    ;         case "de":   delete_from_here_to_end_of_the_line()
    ;         case "fl":   Send("{backspace 3}Florida")
    ;         case "ca":   Send(", {backspace 3}California")
    ;         ; case "ho":   Run, Explorer  C:\awindows.Length\System32\drivers\etc

            

    ;     }
}



; 每次空格都不能对齐新的一页，这个功能搜索黑色文字的像素，跳过空白区域。（直到有黑色的东西）
check_blank_space_and_skip(){

    if (WinExist("A")){
        Title := WinGetTitle()
        Class := WinGetClass()
        Proc := WinGetProcessName()
        flag := 1
        ; ToolTip(Title  "`n"   Title   "`n" Proc)
        if(   Proc == "zotero.exe"){
            while (flag){
                PixelSearch(  &outx,&outy, 143,184,944,200,0x000000,150)
                if( outx == ""){   ; 找黑色，没找到就是空字符串，白色，应该跳过白色区域。
                    Send("{WheelDown}")
                    flag := 1
                    ; ToolTip( outx "   {WheelDown}    " outy , 143,184)
                }
                else
                    flag := 0
            }  
            
        }                       
    }
}
; ebebeb 灰色， zotero 页面直接的分割线，用于找到一页的开始。
; ffffff 白色，000000 黑色。

check_blank_space_and_skip_up(){

    if (WinExist("A")){
        Title := WinGetTitle()
        Class := WinGetClass()
        Proc := WinGetProcessName()
        flag := 1
        ; ToolTip(Title  "`n"   Title   "`n" Proc)
        if(   Proc == "zotero.exe"){
            
            while (flag){
                PixelSearch(  &outx,&outy, 143,184,944,300,0x000000,150) ; 找黑色
                if( outx != ""){     ; 白色
                    Send("{WheelUp 2}")
                    flag := 1
                    Sleep(200)
                    ; SoundBeep()
                }
                else
                    flag := 0

            }  
            
        }                       
    }
}


    if (WinExist("A")){
        Title := WinGetTitle()
        Class := WinGetClass()
        Proc := WinGetProcessName()
        ; ToolTip(Title  "`n"   Title   "`n" Proc)
        if(   Proc == "zotero.exe"){
            
            if( xpos == W -1){
                MouseMove( -20, 0, 50, "R")
                ToolTip( xpos)
            }
        }                       
    }


$1::
{
    global M_altered_wait_click
    if( M_altered_wait_click ==0)
        {
            Send("1")
        }
    else if( M_altered_wait_click == 1)
        {
        Click("Down")    
        ErrorLevel := !KeyWait("1")  ; hold down  
        Click("Up")
    }
}

$2::
{
    global M_altered_wait_click
    if( M_altered_wait_click ==0)
        {
            Send("2")
        }
    else if( M_altered_wait_click == 1)
        {
        Click("Down Middle")    
        ErrorLevel := !KeyWait("2")  ; hold down  
        Click("Up Middle")
    }
}
$3::
{
    global M_altered_wait_click
    if( M_altered_wait_click ==0)
        {
            Send("3")
        }
    else if( M_altered_wait_click == 1)
        {
        Click("Down Right")    
        ErrorLevel := !KeyWait("3")  ; hold down  
        Click("Up Right")
    }
}

; mouse speed 
; 这个函数多次进入是会“暂停”的，应该用全局变量保存。
; prior 记录根本不准， →↑↑ 会变成 ↑，必须每次都重新扫描
function_my_mouse_momentum(x,y){  
    global speed
    global Ts
    global LastX
    global LastY
    global remap_arrow2m_not_using
    base_speed := "90"
    base_sleep_time := 60
    speed := base_speed
    

    if( remap_arrow2m_not_using == 1 )
    {
        Ts  := A_TickCount
        ToolTip("长时间不动 speed reseted 速度重置了  `n " A_TickCount)
        speed:=base_speed
    }


 
    ThisKey :=  GetKeyState( A_ThisHotKey,'p')


    ;加入循环自己判定，而不是按照 Auto repeat 判断时间间隔。
    ; ToolTip(speed "`n"  GetKeyState( A_ThisHotkey,'p') "`n" A_ThisHotkey)
    while( ThisKey ){
        ThisKey :=  GetKeyState( A_ThisHotKey,'p')
        type := isDirections(A_PriorHotkey)
        if(  type  ){
            if(GetKeyState( A_PriorHotkey,'p'))
                add_vector_directional(&x,&y,type)
        } 
        
        TimeLength := A_TickCount - Ts + 1
        k := Exp(-(TimeLength/800)) * 0.94   ; 数字越大衰减越慢。400 合适。
        speed := Max( speed * k,10)
        ToolTip( speed "`n"   GetKeyState( A_ThisHotKey,'p') "`n" A_ThisHotKey "`n latter_key`n"  A_PriorHotkey GetKeyState( A_PriorHotkey,'p')  ,0,0 )
        MouseMove(x*speed, y*speed, 100, "R")
        remap_arrow2m_not_using := 0

        Sleep(10)
    }
    SetTimer () =>  ToolTip("speed reseted"), -550   ;`这样的计时器是新建的，不会刷新。只有新建一个真的函数才会共享一个变量。 function_flag_mouse
    SetTimer(function_flag_mouse,  -500  )
    SetTimer () =>  ToolTip(), -1050   


}
smart_wheelUpDown()
{    
    Title := WinGetProcessName("A")   ;模仿按住中间浏览的操作. 
      ;更具鼠标的位置发送滚轮上下.
      ToolTip(return_last_combined_key() )
  
    while( key(return_last_combined_key()) ){
        
        WinGetPos(&X, &Y, &W, &H, "A")
        MouseGetPos(&xpos, &ypos)
        ;  relative to current window
        ; d := Min( Abs(Y + 50 -ypos  ) , Abs( Y+H - 150 - ypos)  )
 
        ; relative to whole screen
        d := Min( Abs(  0 -ypos  ) , Abs( A_ScreenHeight - ypos)  )
        sleep_time := Min( 500, 2 + 500*d/H)
        
        if ( xpos < X or xpos > X+W or ypos < Y or ypos > Y+H){
            Click()
        }
        if( ypos > Y- H*0.3 and ypos < Y + H*0.55)
            Send("{WheelUp}")
        else if( ypos > Y+ H*0.55 and ypos < Y+ H*1.3 )
            Send("{WheelDown}")

        Sleep(sleep_time)
    }
} 