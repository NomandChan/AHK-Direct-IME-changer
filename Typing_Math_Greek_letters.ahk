
;script 2, advanced version, need run in administrator mode.
; enhanced text selecting funcion. Quick typing and editing is the same
;-------------------------Caps + wasd  to move ------------------------
;                      Q              W             E              R 
;                backspace     ↑(!)          delete        home(!)     
;                      A              S              D             F 
;                    ←(!)           ↓(!)              →(!)        end(!)         
;                      Z               X              C             V 
;          redo (ctrl+z)        cut            copy      paste           
;--------------------Caps + Space + wasd to rapidly move---------------------------------


; The hotstring and and formula typing Greek letters example is in the readme on the website. (superscripts and undersccripts)
; Press Caps change the language, caps + B to turn on capital.

; another function is manipulating text, Caps + wasd to navigate, adding Alt to jumping-select words.





;it's modern and intuitive. Same settings to the righ hand "7890 uiop jkl; m,./" .


;Environment settings 环境设置
#NoEnv 
#Warn  
SendMode Input 
SetWorkingDir %A_ScriptDir% 


;Tracking variable settings 环境设置
global Current_IME_State:= 1    ;✨1 is  Eng, 2 is Chinese,  (IMEs are too complicated and way too bloated to extract the key info we need, so we better track the states by ourself. )✨
global Current_IME_Is_half_width:= 0  ;✨ "1" is full-width input mode, "0" is normal. ✨
global using_keyboard_controlling_mouse:=0                                                                                                                                                                                                            
global using_shift_to_help_typing_in_Chinese:=1 
global n_mouse_move_momentum:=0  
global Caps_Times:= 0        ; 没啥用，这里可以删。用几个变量为脚本增加一些功能，但是这些功能都太复杂，例如点 3 次某个键， 点 4 次某个键，触发什么什么功能，需要变量来记录。但最后我都删了，因为自己都记不住。
global StartTime:= 0

SetCapsLockState, AlwaysOff  
;-------------------------------------------------------------------------------------------------------------




;自定义短语 αβγδκλμνξπρρστυφχψωθ
;( ⁰ ¹ ² ³ ⁴ ⁵ ⁶ ⁷ ⁸ ⁹ ⁺⁻⁼ ⁽ ⁾ ₀ ₁ ₂ ₃ ₄ ₅ ₆ ₇ ₈ ₉ ₊ ₋ ₌ ₍ ₎ ), 
;a full superscript Latin lowercase alphabet except q ( ᵃ ᵇ ᶜ ᵈ ᵉ ᶠ ᵍ ʰ ⁱ ʲ ᵏ ˡ ᵐ ⁿ ᵒ ᵖ ʳ ˢ ᵗ ᵘ ᵛ ʷ ˣ ʸ ᶻ ), 
;a limited uppercase Latin alphabet ( ᴬ ᴮ ᴰ ᴱ ᴳ ᴴ ᴵ ᴶ ᴷ ᴸ ᴹ ᴺ ᴼ ᴾ ᴿ ᵀ ᵁ ⱽ ᵂ ), 
;a few subscripted lowercase letters ( ₐ ₑ ₕ ᵢ ⱼ ₖ ₗ ₘ ₙ ₒ ₚ ᵣ ₛ ₜ ᵤ ᵥ ₓ ), 
;and some Greek letters ( ᵅ ᵝ ᵞ ᵟ ᵋ ᶿ ᶥ ᶲ ᵠ ᵡ ᵦ ᵧ ᵨ ᵩ ᵪ ).

#UseHook On

; https://en.wikipedia.org/wiki/Beta_Code
; 详情如何使用请见 https://github.com/scullion/greek.ahk/blob/master/greek.ahk
; 简单地说，字母加esc 底下的撇号，例如c~ 会自动变成 ξ ，a~ 变成α ，G~大写 shift g ` 变成 Γ

#Hotstring EndChars `t``
; 上一句话将 空格触发变成了 tab 和 撇好触发 hotstring。 例如 hotstring 是 a，那么 a~ （加的撇号）会变成 α  , k~ κ l~ λ  见 ahk 的官网， #Hotstring EndChars -()[]{}:;'"/\,.?!`n `t  结束符设置什么都行。
; 添加o 代表最后的撇号、Tab会被省略。
; 添加C 代表区分大小写，这样能完整的映射希腊大小写。

:oC:a::α ; lower case alpha
:oC:b::β ; lower case beta
:oC:c::ξ ; lower case xi
:oC:d::δ ; lower case delta
:oC:e::ε ; lower case epsilon
:oC:f::φ ; lower case phi
:oC:g::γ ; lower case gamma
:oC:h::η ; lower case eta
:oC:i::ι ; lower case iota
:oC:k::κ ; lower case kappa
:oC:l::λ ; lower case lambda
:oC:m::μ ; lower case mu
:oC:n::ν ; lower case nu
:oC:o::ο ; lower case omicron
:oC:p::π ; lower case pi
:oC:q::θ ; lower case theta
:oC:r::ρ ; lower case rho
:oC:s::σ ; lower case sigma
:oC:t::τ ; lower case tau
:oC:u::υ ; lower case upsilon
:oC:w::ω ; lower case omega
:oC:x::χ ; lower case chi
:oC:y::ψ ; lower case psi
:oC:z::ζ ; lower case zeta

; ΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩ

:oC:A::Α ; capital alpha
:oC:B::Β ; capital beta
:oC:C::Ξ ; capital xi
:oC:D::Δ ; capital delta
:oC:E::Ε ; capital epsilon
:oC:F::Φ ; capital phi
:oC:G::Γ ; capital gamma
:oC:H::Ε ; capital eta
:oC:I::Ι ; capital iota
:oC:K::Κ ; capital kappa
:oC:L::Λ ; capital lambda
:oC:M::Μ ; capital mu
:oC:N::Ν ; capital nu
:oC:o::Ο ; capital omicron
:oC:P::Π ; capital pi
:oC:Q::Θ ; capital theta
:oC:R::Ρ ; capital rho
:oC:S::Σ ; capital sigma
:oC:T::Τ ; capital tau
:oC:U::Υ ; capital upsilon
:oC:W::Ω ; capital omega
:oC:X::Χ ; capital chi
:oC:Y::Ψ ; capital psi
:oC:Z::Ζ ; capital zeta

;加入 10ms 延迟，对慢速的电脑来说，输入长字符串不会出现问题。
:ok10:-::━━━━━━
:ok10:par:: ∂ 
:ok10:partial:: ∂ 
:ok10:divider:: ／ 
:ok10:fraction:: ⁄   ; 1⁄1 2/2 3／3  注意三种除法的区别，第三种可读性最高。
:ok10:fra::⁄
:ok10:int:: ∫ 
:ok10:integral:: ∫∬∭⨌∱⨑∲∳  ∮∯∰
:ok10:sets::϶∀∁∃∄∅∈∉∵∴ ⎲⎳⌠⌡
:ok10:inf:: ∞
:ok10:infinity:: ∞
:ok10:neq::  ≠ 
:ok10:sqrt:: √ 
:ok10:half:: ½ 
:ok10:quater:: ¼ 
:ok10:plusminus:: ±
:ok10:plmi:: ±
:ok10:12:: ½  
:ok10:14:: ¼  
:ok10:variesas::∝
:ok10:nabla::𝛁          ;nabla 是 电磁场中常用的运算符。
:ok10:del::𝛁    ;nabla 又叫 del
:ok10:sum:: Σ ;大写 s 加 撇号也行。
:ok10:vec:: ⃗  ;vector 向量箭头 可能显示不出来

:ok10:email::c15601360539@gmail.com
:ok10:youxiang::15601360539@163.com
:ok10:mima::john_cenam

:ok10:qq::14xxxxxxxxxxxxxxxxxxxxxxxxxxx5
:ok10:shouji::156xxxxxxxxxxxxxxxxxxxxxxxxxxxq12
:ok10:dizhi::北京市石景山区xxxxxxxxxxxxxxxxxxxxxxxxxxx
:ok10:k4::44xxxxxxxxxxxxxxxxxxxxxxxxxxx4
:ok10:k6::w67112348111119e7890
:ok10:sfz::110107xxxxxxxxxxxxxxxxxxxxxxxxxxx3
:ok10:jiji::基极
:ok10:jidianji::集电极
:ok10:bji:: 基极
:ok10:cji:: 集电极
:ok10:eji:: 发射极
:ok10:gji:: 栅极
:ok10:dji:: 漏极
:ok10:sji:: 源极



;⁰ ¹ ² ³ ⁴ ⁵ ⁶ ⁷ ⁸ ⁹ ⁺⁻⁼ ⁽ ⁾   上标 superscript   ; esc 在我的脚本里是上标的意思，F1 对应下标很好记。更简单的选择是，直接使用上下标的 unicode码。¹²³₁₂₃
Esc & 0::⁰
Esc & 1::¹
Esc & 2::²
Esc & 3::³
Esc & 4::⁴
Esc & 5::⁵
Esc & 6::⁶
Esc & 7::⁷
Esc & 8::⁸
Esc & 9::⁹
; 很难去按组合热键, 三个键的组合键，esc+ shift +  = 不等于 esc+ "+",  doesn't work
Esc & \::⁺
Esc & f9::⁺
Esc & f10::⁻
Esc & f11::ᐧ
Esc & f12::／
Esc & ,::≤            ;less than
Esc & .::≥            ;greater than
F1 & f9::+
F1 & f10::-
F1 & f11::×
F1 & f12::÷

Esc & -::⁻
Esc & =::⁼
Esc & [::⁽
Esc & ]::⁾


;abcd=>>ᵃᵇᶜᵈᵉᶠᵍʰⁱʲᵏˡᵐⁿᵒᵖʳˢᵗᵘᵛʷˣʸᶻ 上标 superscript 
Esc & a::Send,ᵃᵅ       ;'a' and 'α' in one place is due to we don't have much combination of keys to use.
Esc & b::ᵇ
Esc & c::ᶜ
Esc & d::ᵈ
Esc & e::ᵉ
Esc & f::ᶠ	
Esc & g::ᵍ
Esc & h::ʰ
Esc & i::ⁱ
Esc & j::ʲ
Esc & k::ᵏ
Esc & l::ˡ
Esc & m::ᵐ
Esc & n::ⁿ
Esc & o::ᵒ
Esc & p::ᵖ
Esc & r::ʳ
Esc & s::ˢ
Esc & t::ᵗ
Esc & u::ᵘ
Esc & v::ᵛ
Esc & w::ʷ
Esc & x::ˣ
Esc & y::ʸ
Esc & z::ᶻ
;-------------₀ ₁ ₂ ₃ ₄ ₅ ₆ ₇ ₈ ₉ ₊ ₋ ₌ ₍ ₎   下标 subscript
F1 & 0::₀
F1 & 1::₁
F1 & 2::₂
F1 & 3::₃
F1 & 4::₄
F1 & 5::₅
F1 & 6::₆
F1 & 7::₇
F1 & 8::₈
F1 & 9::₉
; 很难去按组合热键, 三个键的组合键，f1+ shift +  = 不等于 f1+ "+",  doesn't work
F1 & \::₊
F1 & -::₋ 
F1 & =::₌ 
F1 & [::₍
F1 & ]::₎ 

;abcd=>>ₐₑₕᵢⱼₖₗₘₙₒₚᵣₛₜᵤᵥₓ  下标 subscript
F1 & a::ₐ
F1 & e::ₑ
F1 & h::ₕ
F1 & i::ᵢ
F1 & j::ⱼ
F1 & k::ₖ
F1 & l::ₗ
F1 & m::ₘ
F1 & n::ₙ
F1 & o::ₒ
F1 & p::ₚ
F1 & r::ᵣ
F1 & s::ₛ
F1 & t::ₜ
F1 & u::ᵤ
F1 & v::ᵥ
F1 & x::ₓ
F1 & z::Send,ᴬ ᴮ ᴰ ᴱ ᴳ ᴴ ᴵ ᴶ ᴷ ᴸ ᴹ ᴺ ᴼ ᴾ ᴿ ᵀ ᵁ ⱽ ᵂ ᵅ ᵝ ᵞ ᵟ ᵋ ᶿ ᶥ ᶲ ᵠ ᵡ ᵦ ᵧ ᵨ ᵩ ᵪ  ;三个组合键的代码不好写，请各位自己铺开快捷键。


 
;→ ←↑↓    ┷ ┯⟾⟹⟺ ⟸
Esc & Up::↑
Esc & Down::↓
Esc & Left::←
Esc & Right::→
F1 & Up::⟺
F1 & Down::≝
F1 & Left::⟸
F1 & Right::⟾
F1 & /::⁄
Esc & /::⁄
F2 & l::Send,ℒ    ; laplace transform
F2 & f::Send,ℱ    ;  Fourier transform
F2 & z::Send,𝒵    ;  Z transform 
;see more A𝐀𝐴𝑨𝖠𝗔𝘈𝘼𝒜𝓐𝕬𝙰𝔸 curly letters, calligraphy script, Bold Italic  at wiki : https://en.wikipedia.org/wiki/Mathematical_Alphanumeric_Symbols
F2 & x::Send,X̅    ;  capital X bar
F2 & Left::Send,⟷
F2 & Right::Send,⟷

F3 & a::Send,Ā
F3 & b::Send,B̅
F3 & c::Send,C̅
F3 & d::Send,D̅
F3 & x::Send,x̅X̅    ;  x bar 
F3 & y::Send,y̅Ȳ  ;  y bar
F3 & u::Send,∪  ;union
F3 & i::Send,∩   ;intersection

:ok10:bars::A̅ B̅ C̅ D̅ a̅ b̅ c̅ d̅ α̅ β̅ γ̅ δ̅ ε̅  x̅  X̅ y̅ ĀāḆḇḎḏĒēḠḡH̱ẖĪīḴḵḺḻṈŌōṞṟṮṯŪūX̱x̱ȲȳẔẕ


 

;-------------------------------------------------------------------------------------------------------------
Insert & Tab::Send,{Home}{Space 4}{Down}  ;code indent
Insert & delete::func_wordpress_change_to_soft_enter()
Insert & End::Send,{Down}{End}          ;配合上一个函数使用
Insert & ]::SetTimer, Right_func, 1500  
Insert & [::SetTimer, Left_func, 1500 
Insert & Space::
Esc & Space::Send,{⠀}    ;insert blank that you can't see, but still can be underlined.
:ok10:fx::f(x)
:ok10:Fx::F(x)
:ok10:fx'::f'(x)
:ok10:fx''::f⁽²⁾(x)
:ok10:fx2::f(x)²
:ok10:shuyu:: x ∈ (0,∞)   ;belong 属于
:ok10:nb::🐮🍺


Insert & s::    ;求和 双行 Summation double line formula prefab
Send, ⎲ ∞         xⁿ⁺² +{Enter}⎳n=0     n ᐧ (n{+}2)
Sleep,600
Send,{Up}
Sleep,100
Send,{Space 12}{⠀}
Sleep,100
Send,{Home}{Right 8}{Shift down}{End}{Shift up}
Sleep,500
Send ^u
return

Insert & i::Send, ⌠x        f(u)     du =+{Enter}⌡0    x ᐧ (x{+}2)    ;积分 integral formula prefab
Insert & 1::    ;下划线 underline formula prefab
Send,{Space 6}{1}{Space 6}{⠀}   ;insert blanks  . finally I can underline in Onenote, thank god.
Sleep,100
Send,{Home}{Right 8}{Shift down}{End}{Shift up}
Sleep,500
Send ^u
return

; 一个比较对齐了的双行分式
Insert & f::Send,    1        ᐧ    1       =       1          ᐧ     1 ⠀   +{Enter}  1{-}u²        u{+}1         (u{+}1)²          u{-}1⠀ 
; onenote 没有置中的快捷键，所以我弄几个置中、置左、置右的 alt 组合快捷键。
Insert & w::
func_onenote_center()
Send,{Enter}
return
Insert & e::
func_onenote_center()
Send,{right}
sleep, 200
Send,{Enter}
return
Insert & r::
func_onenote_center()
Send,{right}
sleep, 200
Send,{right}
sleep, 200
Send,{Enter}
return

;√  ∞ Σ ∫  ⇑  ⇒  ⇓  ⇐ ↔⇔→⇒
;≠≡≈≝≤≥   ∂
;∞∘∫∫∂∮∯∇  ◠◡ 
;__⭜ ‾‾⭝        ⮨⮪⮩⮫⮬⮭⮮⮯   some arraw donesn't show in text editor, but it's ok in web browser and notebook.
;🠬 🠮 🠭 🠯  ⇐⇑⇒⇓⇔⇕⇖⇗⇘⇙ 
;⯬⯭⯮⯯ ⬎⬏⬐⬑ ⟹ ⇑
;;⮠ ⮢ ⮡ ⮣ ⮥⮤ ⮧ ⮦ ◜◟◝◞
;↑↓←→↖↙↘↗  → ←↑↓
;⟵⟶⟷⟸⟹⟺⟻⟼⟽⟾┷┯┠ ┨  ╋ ━ ┃
;  ╲╱╱╲
;​ ←←here is zero-width space, is it cool? it's there but you can't seem it. 
;∫　　　ｘ²　　　∫　　　ｘ²　　　　　∫　　ａ²　　　　　　　　　　　　　　　　
;∫━━━━━━━━━━ ＝∫━━━━━━━━━━━ 　＋∫　━━━━━━━━━━━ 
;∫　　　ｘ²　　　∫√（ｘ²＋ａ²）　　　∫　√（ｘ²＋ａ²）
;:sets::϶∀∁∃∄∅∈∉∵∴ ⎲⎳⌠⌡

Esc::Send,{Esc} ;  keep basic functions
F2::Send,{F2}    ;
F1::Send,{F1}    ;  


;--------------------------------------------------------------------------------------------------------------------------------------------------
~CapsLock::    ; 使用cap 瞬间短按是轮流切换、较短是英文、长按对应中文。同时，还支持指定切换： 
BlockInput, On
isCaps_pressing := false
isSpace_pressing := false
Start_time := A_TickCount 
Pressing_Caps_TimeLength := 0
Loop
{
	Sleep, 90
	isCaps_pressing := GetKeyState("CapsLock", "P")
	Pressing_Caps_TimeLength := A_TickCount - Start_time
	isSpace_pressing := GetKeyState("Space", "P") 
	;ToolTip, In the loop of CAPSLOCK!!`npriorKey = %A_PriorKey% `t number =%A_Index%  `nisCaps_pressing = %isCaps_pressing% isSpace_pressing = %isSpace_pressing%`n`n Start_time =%Start_time% Pressing time = %Pressing_Caps_TimeLength%  , 100, 150    
;----------------- Caps +Space + wasd.. to select ----------------------------
	if(isSpace_pressing){
		if( GetKeyState("A", "P"))
			CSa()
		if( GetKeyState("S", "P"))
			CSs()
		if( GetKeyState("D", "P"))
			CSd()
		if( GetKeyState("W", "P"))
			CSw()
		if( GetKeyState("R", "P"))
			CSr()
		if( GetKeyState("F", "P"))
			CSf()
		if( (isCaps_pressing = 0)   and  (isSpace_pressing = 1))
			dont_select_anymore(A_PriorKey)
		continue
	}
;----------------- Caps + wasd..     to move   ↑←↓→ ----------------------------
	if( GetKeyState("A", "P"))
		Ca()
	if( GetKeyState("S", "P"))
		Cs()
	if( GetKeyState("D", "P"))
		Cd()
	if( GetKeyState("F", "P"))
		Cf()
	if( GetKeyState("W", "P"))
		Cw()
	if( GetKeyState("R", "P"))
		Cr()
}
Until (isCaps_pressing = 0) ; AHK don't use "==" to compare boolean.

;-----------------  Switching language  ----------------------------
	if( A_PriorKey = "Capslock" ){   ;filter other combination of keys.
		if (Pressing_Caps_TimeLength < 500) {
			Function_Set_Language(9)  ;翻转中英文。2中文，1 英文 ;para in : Current_IME_State "9" to toggle, "1" to English,   "2" to Chinese, 
		}
		else if (Pressing_Caps_TimeLength < 1000) {   ;(英文的按键时长要 大于 200 且 小于400ms,中文 <1000ms）
			Function_Set_Language(1)
			SoundBeep, 1560, 100  ; sound frequency 3000hz，duration 100ms
		}	
		else if (Pressing_Caps_TimeLength < 1500) {
			Function_Set_Language(2)   ;代码中 IME 2 中文，  1 英文
		}
		else  {
			Send,{LButton}
		}
	}
	else {
		ToolTip, 您使用了其他组合键，将不触发切换语言功能。 , 100, 150
	}

	if(Current_IME_State==1){
		ToolTip, The IME is English `n You have been holding CapsLock %Pressing_Caps_TimeLength%ms 。`n  , 1500, 500   
	}
	else{
		ToolTip, 输入法为中文状态   `n 您按住大写锁定键时长%Pressing_Caps_TimeLength% 毫秒 。`n  , 1600, 550
	}


SetTimer, RemoveToolTip, -1000
BlockInput, Off
return


CapsLock & B::SetCapsLockState, AlwaysOn     ;cap+[、]、B是中、英、大写指定切换。
CapsLock & 5::SetCapsLockState, On   
CapsLock & 6::SetCapsLockState, Off
CapsLock & [::Function_Set_Language(2)    ;切换并指定为中文 para in : Current_IME_State "9" to toggle, "1" to English,   "2" to Chinese, 
CapsLock & ]::Function_Set_Language(1)   ;切换并指定为英文
 CapsLock & `::
CapsLock & N::Func_toggle_Full_half_width(9)    ;全半角切换


CapsLock & e::Ce()  
CapsLock & q::cq()
CapsLock & '::Send,{"}   
CapsLock & SC02B::Send,{|}  ;backslash and |


;上标 superscript  ;wordpress enchance 增强富文本上下标功能。 
CapsLock & T::       
SC027 & T::  
Send,{Shift down}{Left}{Shift up}
Send,{Ctrl down}{Shift down}={Shift up}{Ctrl up} 
Send,{Left}
return
CapsLock & G::       
SC027 & G::  
Send,{Shift down}{Left}{Shift up}
Send,{Ctrl down}={Ctrl up} 
Send,{Left}
return



+SC027::Send,{:}   ;保护";"原来的功能   ;分号不是常用按键，需要一个特殊的编码  semicolon is "SC027"。
*SC027::Send,{SC027}   ;保护";"原来的功能  



;------------------------------  functions -----------------------
;wordpress 文字修改，这个是添加软回车，wordpress  需要一整块的文字，
func_wordpress_change_to_soft_enter(){           
Send,{End}
Sleep, 50
Send,{delete}
Sleep, 50
Send,{Shift down}{Enter}{Shift up}{End}
return
}
Right_func:
Send,{Right}
return
Left_func:
Send,{Left}
return

;Abandoned
;CapsLock & c::
;using_shift_to_help_typing_in_Chinese:=using_shift_to_help_typing_in_Chinese=1?0:1   
;ToolTip, 开关shift功能，用 shift 组合键帮忙打中文。`n 当前状态%using_shift_to_help_typing_in_Chinese%, 100, 150
;SetTimer, RemoveToolTip, -5000
;return

;clipboard text replace, failing function. 暂时放弃，处理剪切板里的文字挺麻烦的。
;SC027 & m::replace_enter_to_soft_enter()   ;
;replace_enter_to_soft_enter(){        ;这个有点问题，字符串替换不行，函数不能用。
;SoundBeep, 3000, 100  ;频率3000hz，时长100ms
;Send {Ctrl Down}c{Ctrl Up}
;Clipboard := StrReplace(Clipboard, "`r`n", "xxxxx")
;Send {Ctrl Down}v{Ctrl Up}
;return
;}
;最后两点忠告：1）千万不要修改tab的功能，很影响使用！ 分号和大写锁定，insert 这几个键平常都不太用，比较好改。  2） space 改完以后也会变得软绵绵的，（弹起后才会触发，反应非常慢，找了很多地方都解决不了），千万不要改这个按键。
;大写锁定复用了很多次：1）短按重映射大写锁定为切换语言；较长按下去 caps (200-400 ms) ，用来指定切换到英文（而不是轮流切换），长按 caps  (400-1000 ms) 是切换到中文。caps + B 指定切换到英文大写 CAPITAL . <br>
;toggle insert mode with notification. But insert mode in win 10 is not usable; only old software support it. In Office Word you need to go to option and turn it on.
Capslock & Insert:: 
GetKeyState, InsertState, Insert, T
If InsertState = U ;If insert is off 
{ 
MsgBox, 260, , Are you sure you want to enable insert?, 5 
} 
If InsertState = D ;If insert is on 
{ 
MsgBox, 4, , Are you sure you want to disable insert?, 5 
} 
IfMsgBox No 
return 
else IfMsgBox Timeout 
return 
Else 
Send {Insert} 
return


delete_one_line(){
Send,{Home}{Shift down}{End}{Shift up}
Sleep,1
Send,{BackSpace}  ;删除一行，而不是删除所有文字，功能挺顺手的。
return
}

Func_flip_IME_state(){
;Func_alt_shift()
Func_ctrl_space()
;Send,{Ctrl}
}


; 用系统的切换语言
Func_alt_shift(){
Send, {Alt down}{Shift}{Alt up}
}
Func_ctrl_shift(){
    Send, {Ctrl down}{Shift}{Ctrl up}
    return 0
}
; 用 ime的切换语言,
Func_ctrl_space(){
Send, {Ctrl down}{Space}{Ctrl up}
    return 0
}
;全角半角切换。
Func_flip_Full_width(){
Send, +{Space}
    return 0
}



; This is simple enough. We track IME state by ourself.
; If the state in the program doesn't synchronize to the real IME state, just make them the same using mouse clicks.

;para in : Current_IME_State "9" to toggle, "1" to English,   "2" to Chinese, 
;para out: no output, everything is stored in global varibles.

Function_Set_Language(target_state) {
	SetCapsLockState, AlwaysOff   ;turn off Captitals
	Func_toggle_Full_half_width(0)  ;turn off Full-width characters.
	if ( target_state <>Current_IME_State ){  ; 9 ≠ 1 and 9 ≠ 2 ，一定会接环只有想要切换的语言和当前语言不同的时候才切换。  
	Func_flip_IME_state()
	Current_IME_State := 3-Current_IME_State    ;jump between 1,2
	}
	else{ ;nothing changes
	}
Return 0
}

;(for ascii art) 
; para in :  Current_IME_Is_half_width: "0" for normal and "1" to Full-width Unicode .
;para out:   no output, everything is stored in global varibles.
Func_toggle_Full_half_width(target_HF){
	if ( target_HF <>Current_IME_Is_half_width ){
	Func_flip_Full_width() 
	Current_IME_Is_half_width := 1-Current_IME_Is_half_width  ;jump between 0,1
	}
	else{ ;nothing changes
	}
Return 0
}


RemoveToolTip:
ToolTip
return

function_my_mouse_momentum(x,y){  ;↑ y<0 ← x<0 ↓ y>0 → x>0
	if(A_TimeSincePriorHotKey<150){
	n_mouse_move_momentum += 15
	}
	else{
	n_mouse_move_momentum=32
	}
	MouseMove, x*n_mouse_move_momentum, y*n_mouse_move_momentum, 100, R

	;GetKeyState, state, Capslock
	;vari_a:=GetKeyState("Up")
	;ToolTip, %vari_a% , 100, 150
	;if (state = "D")
	;    ToolTip, %state% , 100, 150

}

type(speed, str){
  SetKeyDelay, %speed%
  Send, %str%
}

func_onenote_center(){
Send,{Alt}
sleep, 200
Send,{Down}
sleep, 200
Send,{Left}
sleep, 200
Send,{Left}
sleep, 200
Send,{Left}
sleep, 200
Send,{Left}
sleep, 200
Send,{Left}
sleep, 200
Send,{Left}
sleep, 200
Send,{Left}
sleep, 200
Send,{Enter}
sleep, 200
}

;-------------------------
; ^ = Ctrl  + = Shift   +{Enter}  {Home}   {End}     {Left}  {Up} Send,{Left}   {Backspace}  {Delete}   ^{Z} ^{Delete}         
;^+{Left}   ^+{Right}        delete_one_line()   
Ca(){
Send,{Left}
}
Cs(){
Send,{Down}
}
Cd(){
Send,{Right}
}
Cf(){
Send,{End}
}
Cr(){
Send,{Home}   
}
Cq(){
Send,{Backspace}    
}
Cw(){
Send,{Up}
}
Ce(){
Send,{Delete}       
}

CSq(){
Send,{Backspace}   
}
CSw(){
Send,{Shift down}{Up}{Shift up} 
}
CSe(){
Send,{Delete}    
}
CSr(){
Send,{Shift down}{Home}{Shift up}
}
CSa(){
Send,{Shift down}{Ctrl down}{Left}{Ctrl up}{Shift up}
}
CSs(){
Send,{Shift down}{Down}{Shift up} 
}
CSd(){
Send,{Shift down}{Ctrl down}{Right}{Ctrl up}{Shift up}  
}
CSf(){
Send,{Shift down}{End}{Shift up}
}
dont_select_anymore(Last_key){   ;if you know how the windows decide where the insertion point will be after selecting texts, you will know this is simplified.
if( Last_key = "a" or Last_key = "w" or Last_key = "r")
Send,{Left}
if( Last_key = "s" or Last_key = "d" or Last_key = "f")
Send,{Right}

}
