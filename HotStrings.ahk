      
; *不需要结束字符触发、x 是命令模式、o 是忽略最后添加的空格。  
; ? (question mark): The hotstring will be triggered even when it is inside another word; that is, when the character typed immediately before it is alphanumeric. For example, if :?:al::airline is a hotstring, typing "practical " would produce "practicairline ". Use ?0 to turn this option back off.
;#Hotstring EndChars -()[]{}:;'"/\,.?!`n `t
#HotString EndChars `t.-
#HotString o k50  ;  omitted ending space     




Esc & 2::²    ;;这个上标太常用了
Esc & 0::₀   
Esc & w::func_superscript_text()
Esc & s::func_underscript_text()
Esc & f::ᶠ ; f 只有上标没有下标。




:oC:/0::⁄/／
:oC:/1::⁄
:oC:lt::≤  ; less than
:oC:<=::≤  ; less than
:oC:>=::≥    ;greater than, 
:oC:gt::≥    ;greater than, 



Esc & n::Send("ᵃᵅᵃᵇᶜᵈᵉᶠᵍʰⁱʲᵏˡᵐⁿᵒᵖʳˢᵗᵘᵛʷˣʸᶻ")       ;上标 superscript 特殊字母的 abcd=>>ᵃᵇᶜᵈᵉᶠᵍʰⁱʲᵏˡᵐⁿᵒᵖʳˢᵗᵘᵛʷˣʸᶻ   https://en.wikipedia.org/wiki/Unicode_subscripts_and_superscripts
Esc & u::Send("ₐₑₕᵢⱼₖₗₘₙₒₚᵣₛₜᵤᵥₓ")
F1 & i::ᵢ 
F1 & n::ₙ 


:o:*.::ᐧ      ; small multiply    ᐧᐧᐧᐧᐧᐧᐧᐧ
:o:*x::×     ; multiply
:o:/::÷     ; devide 
; :o:8::*     ; 无 shift 能方便很多。 
; :o:=::+     ; 无 shift 能方便很多。
; :o:-::-     ------===   **9   9   0   9   0         



::par::∂
::partial::∂
 ; 1⁄1 2/2 3／3  三种除法
::int:: ∫
::inf:: ∞ 
::infinity:: ∞

::sqrt:: √

:oC:+-::± 
:oC:!=::≠ 
:oC:~=::≈
:oC:y=::≈
:oC:-.::->

:oC:1/2::½
:oC:1/4::¼ 
:oC:1/4::¼ 


::half:: ½
::quater:: ¼
::variesas::∝
::neq::  ≠


::nabla::𝛁          ;nabla。
::del::𝛁    ;nabla 又叫 del
::sum:: Σ ;大写 s 加 撇号也行。
::vec:: ⃗  ;vector 向量箭头 可能显示不出来
::tilde::{Sc029}
::semicolon::SC027
::fx::f(x)
::Fx::F(x)
::fx'::f'(x)
::fx''::f⁽²⁾(x)
::fx2::f(x)²
::belong:: x ∈ (0,∞)   ;belong 属于  


;自定义短语 αβγδκλμνξπρρστυφχψωθ
;( ⁰ ¹ ² ³ ⁴ ⁵ ⁶ ⁷ ⁸ ⁹ ⁺⁻⁼ ⁽ ⁾ ₀ ₁ ₂ ₃ ₄ ₅ ₆ ₇ ₈ ₉ ₊ ₋ ₌ ₍ ₎ ),
;a full superscript Latin lowercase alphabet except q ( ᵃ ᵇ ᶜ ᵈ ᵉ ᶠ ᵍ ʰ ⁱ ʲ ᵏ ˡ ᵐ ⁿ ᵒ ᵖ ʳ ˢ ᵗ ᵘ ᵛ ʷ ˣ ʸ ᶻ ),
;a limited uppercase Latin alphabet ( ᴬ ᴮ ᴰ ᴱ ᴳ ᴴ ᴵ ᴶ ᴷ ᴸ ᴹ ᴺ ᴼ ᴾ ᴿ ᵀ ᵁ ⱽ ᵂ ),
;a few subscripted lowercase letters ( ₐ ₑ ₕ ᵢ ⱼ ₖ ₗ ₘ ₙ ₒ ₚ ᵣ ₛ ₜ ᵤ ᵥ ₓ ),
;and some Greek  letters ( ᵅ ᵝ ᵞ ᵟ ᵋ ᶿ ᶥ ᶲ ᵠ ᵡ ᵦ ᵧ ᵨ ᵩ ᵪ ). 
; 候选无冲突： engs chns  vywr vw    yw不行  https://www.thefreedictionary.com/words-containing-uio

;---------------------------------- 
::email::c15601360539@gmail.com


::nb::🐮🍺
::stars::✶★☆✯ ⭐️⭐ 🌟✨✸✹
;---------------------------------


::jiji::基极
::jidjji::集电极
::bji:: 基极
::cji:: 集电极
::eji:: 发射极
::gji:: 栅极
::dji:: 漏极
::sji:: 源极

::proxy1::set http_proxy=http://127.0.0.1:7890`nset https_proxy=http://127.0.0.1:7890`n
:x:proxy2::Send("set http_proxy=http://127.0.0.1:7890`nset https_proxy=http://127.0.0.1:7890`n")
:x:proxy3::Send("{Raw}set http_proxy=http://127.0.0.1:7890`nset https_proxy=http://127.0.0.1:7890`n")
:x:runproxy::Run(A_ScriptDir "\Batch\cmdproxy.bat")





Capslock & Up::↑
Capslock & Down::↓
Capslock & Left::←
Capslock & Right::→
Capslock & =::⟷
:oC:defs::⟺ ≝ ⟸ ⟾  
   ; laplace transform
   ;  Fourier transform
   ;  Z transform
:oC:laplace::ℒ ℱ 𝒵




                      

F4 & m::Send("✶ * ᵀ") ;transpose of a Matrix convolution 卷积 Adjugate matrix  


F4 & o::Send("∪")  ;union
F4 & 7::Send("∩")   ;intersection

F4 & s::
{
    repeatTime:=  updateSharedRepeat(" bar letter,Greeks,curly,integral,summation,brackets,bracckets 2,sets,arrows")
        switch repeatTime
        {
            case 0:     Send("{Raw}oterh letters with bar:`nA̅ B̅ C̅ D̅ a̅ b̅ c̅ d̅ α̅ β̅ γ̅ δ̅ ε̅  x̅  X̅ y̅ ĀāḆḇḎḏĒēḠḡH̱ẖĪīḴḵḺḻṈŌōṞṟṮṯŪūX̱x̱ȲȳẔẕ")
            case 1:   Send("Captical/Greek supersprits and suberscripts:`nᴬ ᴮ ᴰ ᴱ ᴳ ᴴ ᴵ ᴶ ᴷ ᴸ ᴹ ᴺ ᴼ ᴾ ᴿ ᵀ ᵁ ⱽ ᵂ ᵅ ᵝ ᵞ ᵟ ᵋ ᶿ ᶥ ᶲ ᵠ ᵡ ᵦ ᵧ ᵨ ᵩ ᵪ")
            case 2:     Send("{Raw}see more A𝐀𝐴𝑨𝖠𝗔𝘈𝘼𝒜𝓐𝕬𝙰𝔸 curly letters, calligraphy script, Bold Italic  at wiki : https://en.wikipedia.org/wiki/Mathematical_Alphanumeric_Symbols")
            case 3:    Send("{Raw}∫∬∭⨌∱⨑∲∳  ∮∯∰")
            case 4:    Send("{Raw}summation and integral `n⎲⎳⌠⌡")
            case 5:    Send("{Raw}brackets:`n ⎛⎝⎜⎝⎧⎨⎪⎩")
            case 6:    Send("{Raw}ction bracket:`n⎛`n⎨`n⎪`n⎩")
            case 7:    Send("{Raw}϶∀∁∃∄∅∈∉∵∴")
            case 8:    Send("emoji ⇐⇑⇒⇓⇔⇕⇖⇗⇘⇙ 💫 ⭐️ 🌟 ✨ ⚡️ ☄️ 💥 🔥 🌪 🌈 ☀️ 🌤 ⛅️ ☁️ 🌦 🌧 ⛈ 🌩 🌨 ❄️ ☃️ ⛄️ 🌬 💨 💧 💦 ☔️ ☂️ 🌊 🌫✔️❌♠️♥️♦️♣️")
        }
    return
}





; 添加C 代表区分大小写，这样能完整的映射希腊大小写字母。  但是这样占用按键太多了. ;; ; ΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩ https://en.wikipedia.org/wiki/Beta_Code

; :oC:a::α ; lower case alpha
; :oC:b::β ; lower case beta
; :oC:c::ξ ; lower case xi
; :oC:d::δ ; lower case delta
; :oC:e::ε ; lower case epsilon
; :oC:f::φ ; lower case phi
; :oC:g::γ ; lower case gamma
; :oC:h::η ; lower case eta
; :oC:i::ι ; lower case iota
; :oC:k::κ ; lower case kappa
; :oC:l::λ ; lower case lambda
; :oC:m::μ ; lower case mu
; :oC:n::ν ; lower case nu
; :oC:o::ο ; lower case omicron
; :oC:p::π ; lower case pi
; :oC:q::θ ; lower case theta  , θ (think, birthday, south)
; :oC:ql::ð ; ð voiced th (the, father, them)   
; :oC:r::ρ ; lower case rho
; :oC:s::σ ; lower case sigma
; :oC:t::τ ; lower case tau
; :oC:u::υ ; low er case upsilon
; :oC:w::ω ; lower case omega
; :oC:x::χ ; lower case chi
; :oC:y::ψ ; lower case psi
; :oC:z::ζ ; lower case zeta

; :oC:A::Α ; capital alpha
; :oC:B::Β ; capital beta
; :oC:C::Ξ ; capital xi
; :oC:D::Δ ; capital delta
; :oC:E::Ε ; capital epsilon
; :oC:F::Φ ; capital phi
; :oC:G::Γ ; capital gamma
; :oC:H::Ε ; capital eta
; :oC:I::Ι ; capital iota
; :oC:K::Κ ; capital kappa
; :oC:L::Λ ; capital lambda
; :oC:M::Μ ; capital mu
; :oC:N::Ν ; capital nu
; :oC:o::Ο ; capital omicron
; :oC:P::Π ; capital pi
; :oC:Q::Θ ; capital theta
; :oC:R::Ρ ; capital rho
; :oC:S::Σ ; capital sigma
; :oC:T::Τ ; capital tau
; :oC:U::Υ ; capital upsilon
; :oC:W::Ω ; capital omega
; :oC:X::Χ ; capital chi
; :oC:Y::Ψ ; capital psi
; :oC:Z::Ζ ; capital zeta
:oC:greeksall::Send("{Raw}ΑαΒβΓγΔδΕεΖζΗηΘθΙιΚκΛλΜμΝνΞξΟοΠπΡρΣσςΤτΥυΦφΧχΨψΩω")
;直接使用上下标的 unicode码。¹²³₁₂₃     ;⁰ ¹ ² ³ ⁴ ⁵ ⁶ ⁷ ⁸ ⁹ ⁺⁻⁼ ⁽ ⁾   上标 superscript


;  https://en.wikipedia.org/wiki/Unicode_subscripts_and_superscripts
:oC:u+::⁺ ; capital capital zetaRaw
:oC:u-::⁻
:oC:u=::⁼
:oC:u(::⁽
:oC:u)::⁾

:oC:u1::¹ 
:oC:u2::²
:oC:u3::³
:oC:u4::⁴
:oC:u5::⁵
:oC:u6::⁶
:oC:u7::⁷
:oC:u8::⁸
:oC:u9::⁹ 
:oC:u0::⁰ 

;-------------   下标 subscript
:oC:d+::₊ 
:oC:d-::₋ 
:oC:d=::₌ 
:oC:d(::₍ 
:oC:d)::₎

:oC:d1::₁ 
:oC:d2::₂ 
:oC:d3::₃  
:oC:d4::₄ 
:oC:d5::₅ 
:oC:d6::₆ 
:oC:d7::₇ 
:oC:d8::₈ 
:oC:d9::₉ 
:oC:d0::₀ 
;-------------   下标 subscript  

; *不需要结束字符触发、x 是命令模式、o 是忽略最后添加的空格。  
; ? (question mark): The hotstring will be triggered even when it is inside another word; that is, when the character typed immediately before it is alphanumeric. For example, if :?:al::airline is a hotstring, typing "practical " would produce "practicairline ". Use ?0 to turn this option back off.

; #HotString *oCx    
; ::FD::en()
; ::DF::cn()
; ::JK::en()
; ::KJ::cn()

#HotString *oCx?    
::SDF::change_to_chn_and_retype()    ; 想要重复利用，就得让短的编码不能及时触发。
::FDS::change_to_en_and_put_stringSpace()
::DAW::delete_a_word()
::DTE::delete_from_here_to_end_of_the_line()   ; to end
::DTL::delete_one_line()         ; the line




