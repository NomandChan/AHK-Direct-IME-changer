
# AHK 直接切换中英文 Swtich Input Method & Type Greek symbols


## 直接切换中文、英文的方法！ 使用 windows 的接口

使用 windows 接口 不用任何设置、不用快捷键！
```
RAlt::PostMessage, 0x50, 0, 0x4090409,, A
LAlt::PostMessage, 0x50, 0, 0x8040804,, A
```
发挥你们的创造力！自己打造智能切换的输入法。例如每次碰  ~Esc:: 都调用这个，就能愉快👌🏻使用 VIM 了

↑↑↑
参考： http://tll.tl/zh/
↑↑↑
這兩行的功能是將::前的按鍵，右Alt或左Alt定義成後面的功能，也就是將現在的鍵盤配置切換為中文(0x4040404)或英文(0x4090409)。同理，你也可以設定成自己想要的任何按鍵（例如，Capslock、LWin、LCtrl、AppsKey）。用這種方式重新指定修飾鍵（Modifier，也就是Alt、Ctrl這類要和其他按鍵組合才有功能的鍵）並不會破壞其他快速鍵，因此相當於是鍵盤多了一個快捷鍵。  ; 0x4040404 是繁体中文！，简体中文的编号是 0x8040804

别的键盘布局可以通过这个函数查看！
```
checkCurrentKeyboardLayout() {
    ThreadId := DllCall("User32.dll\GetWindowThreadProcessId", "Ptr", WinExist("A"), "Ptr", 0, "UInt")

    hCurrentKBLayout := DllCall("User32.dll\GetKeyboardLayout", "UInt", ThreadId, "Ptr")
    msgbox(hCurrentKBLayout)
    return
    }
```

# 下面的都过时了，是 AHK V1 的代码，没什么参考价值了。
写这么多，只适合我自己；只有一点学习分享价值，还是放在这留着吧……
AHK 可玩性太高了，可以通过任意的按键进行功能组合、调用程序，但我心心念念的功能就是切换输入法。学会这个两年之久，终于让我找到了直接切换的方法。我写过无数逻辑切换的方法，麻烦死了。


## Functions AHK V1 script:
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
具体实现很细节，请见 script 2 
For non-english users, it's a pain to type formula and text simutaneously, juggling between them is already annoying for bilinguals and IME is getting in the way. So I made this script to make life easier by using rarely used Capslock to switch language, move typing point and making hotstring and quick replacement for math symbols, greek letters, and selfdefined unicode strings. <br>
&emsp;将 CapsLock 变废为宝，把长按\短按大写锁定变成切换语言的功能，是中文用户必不可少的自定义；将希腊字母，上下标映射到组合键和快捷键上，而且当用户掌握以后，可以自行添加符号“ ℱℒ𝒵” 等。 再加上组合键、快捷方式，使键盘顺手不少，（甚至用于账号密码保存）。这个脚本是我自己每天都使用的，希望这篇文章帮助大家打开新世界。<br>

