
# AHK-Swtich Input Method & Type Greek symbols
Two functions are implemented in this script:
* Quick switch between English keyboard and Chinese/Japanese/Korean IME. It detect Language code, tap CAPSLOCK to select English and long press it to CTRL+SHIFT(or anything you want).
* Caps+ wasd to help type point moving, q/e for delete leftward/rightward. Caps+ B for bold.
* Hotstrings to type math unicode symbole (see below).
<br>

To type Greek letters, "α", just a + \` , Σ for S and \`,; To type your email: dontclick@gmail.com for email\`,  ½ ← half\`, ∫ ← integral\`.  ;<br>
Type superscript/underscript unicode math equation:  " y̅ = C₁eʳ¹ᵗ + C₂eʳ²ᵗ+ C₃eʳ³ᵗ" by pressing Combo keys “Esc +3456rty” or "F1 +123rt" <br>
To change language, there are two logic presented in script 2. Toggle or designate language. In toggling logic, press Caps is simply control+shift. In designate logic, tap to select ENG and long press to selcet CHN.  <br>
To move insertion point by "CAPS + wasd". Script 2 is more responsive but need run in Administrator mode: it detect double tap, recording keys and times like another keyboard is running in your physical keyboard; Script 1 is much more easier to understand (and not great)<br>






&emsp;
大小写键用来切换输入法，光这一点就值得用😃，脚本内还有了很多数学、短语、希腊字符的快速输入方法，快速切换输入环境、输入特殊字符，用上就是赚到。<br>

<br>You just found a treasure. AHK can automatize everything, using it to edit HTML webpages, store codelet, quick typing phone numbers and address, and control windows programs and mouse.(which is too complicated to be included in here).the AHK built in function are easy/good to use. <br>
## AHK setting up
Install AHK → create txt and copy it → change .txt suffix to .ahk → run it


## How to use this 脚本基本功能
* CapsLock to swtich language 用来切换中文英文。 <br>
* hotstring :( something and a end character )快捷键：字母(letter of string)+ \`撇号得到希腊字母和数字上下标，例如：a+\` → α，c + \` →ξ  ，C+\`→Ξ   <br>
* Combo keys :组合键 ： ESC +1234  → 数字上标：  ¹²³⁴ ；数字下标F1 + 1234-=[]  →    ₁₂₃₄₋₌₍₎  <br>
* text selecting funcion: Caps + wasd to move with typing, Caps + Space + wasd to rapidly move. (advanced mode is in script 2 and need administrator mode to run it)

<br><br>

                   字母，加撇\` →→ 希腊字母 ;单词加撇 →→ 常用短语，例如 
                       email+结束符\`得到自定义短语： cmyistu@gmail.com。 
                        字母+结束符\`得到希腊字母：   a+\`→ α    S+\` →Σ    x+ \` → χ    half+ \` →  ½   quater + Tab → ¼
                   组合键用来输入上下标，例如       Esd + 123 → ¹²³    F1+123 → ₁₂₃  Esc + e →ᵉ   

<br>
安装 AHK （文末） → 新建 txt，复制脚本进去 → 改文件名后缀为 .ahk → 运行。<br>
&emsp;输入希腊字符的方式是，hotstring+结束符，结束符是 tab 或 撇号。hotstring 最方便了，让你用说话的同时输入特殊符号，相当于一个自己写的输入法。输入这些让人头疼的数学符号，在 AHK 的帮助下,unicode 也可以完成很多数学公式的展示，这种方式不需要复杂的插件支持，人人都可以复制粘贴，非常方便。 <br>
&emsp; The apostrophe end character was space or enter by default AHK setting, but I changed it to Tab and \` (either of them), cuz it's already used by Chinese IME. <br>
展示一下 Unicode 输入公式是什么样的：
<br><br>

    Σⁿ₀ αₙ  =   Σⁿ₀ 1／n²  

    f(ε)= ∫ᵇₐ f(x)dx ／|b-a|

    ∫ᵇₐ f(x)g(x)dx = f(ε) ∫ᵇₐ g(x)dx , ε∈(a,b)

    f'(x)／1+f(x)² ← d arctan f(x)

    X~χ² (n)  X∼N(μ₁+μ₂,√(σ²₁+σ²₂))

    Variance[H(N,M,n)]=nᐧ(M⁄n)ᐧ(1-M⁄N)ᐧ(N-n)／(N-1)

    ↑←↓→⁰ αk3¹λοπ⁹   
    ⁺⁻⁼ ⁽ ⁾ ₀ ₁ ₂ ₃⁺⁻ᐧ／÷×-+≠≡≈≝≤≥∂∞∘∫∫∂∮∯∇  ◠◡ ), ᵘ ᵛ ʷ ˣ ʸ ᶻ ᴮ ᴰ ᴱ ( ₐ ₑ ₕ ᵢ ⱼ ₖ ₗ ₘ ₙ  ᵅ ᵝ ᵞ ᵟ ᵋ ᶿ ᶥ ᶲ ᵠ ᵡ ᵦ ᵧ ᵨ ᵩ ᵪ ).

<br><br><br><br><br>
&emsp;还有很多符号和语法，更详细的说明请见我的网站：https://nomand-chan.xyz/autohotkey%e8%84%9a%e6%9c%ac/
具体实现很细节，请见 script 2 
For non-english users, it's a pain to type formula and text simutaneously, juggling between them is already annoying for bilinguals and IME is getting in the way. So I made this script to make life easier by using rarely used Capslock to switch language, move typing point and making hotstring and quick replacement for math symbols, greek letters, and selfdefined unicode strings. <br>
&emsp;将 CapsLock 变废为宝，把长按\短按大写锁定变成切换语言的功能，是中文用户必不可少的自定义；将希腊字母，上下标映射到组合键和快捷键上，而且当用户掌握以后，可以自行添加符号“ ℱℒ𝒵” 等。 再加上组合键、快捷方式，使键盘顺手不少，（甚至用于账号密码保存）。这个脚本是我自己每天都使用的，希望这篇文章帮助大家打开新世界。<br>

&emsp;考虑到网络因素，附加上 AutoHotkey_1.1.33.02_setup 的安装方式：<br>
链接：https://pan.baidu.com/s/1JSarNM9XYON0rMu5y4XEvQ  <br>
提取码：h2l7  <br>

## 
Full-width characters 全角切换：astutecat/autofullwidth<br>
Mouse Gesture Using AHK : Pyonkichi's Mouse Gesture<br>
Mouse Gesture Using C# APP: WGestures 鼠标手势，免费软件，颜值很高、功能很棒。<br>
