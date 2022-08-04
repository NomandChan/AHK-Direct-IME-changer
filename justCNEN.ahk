Capslock::
{ 
    SetCapsLockState("AlwaysOff")
    ; clear_mouse_flag_altered()
    ; Send("{Esc}")
    ;  vim user ↑↑↑ 
    en()
}
RAlt::cn()
~Esc::en()


en(mode := "postmessage"){
     PostMessage 0x0050, 0, 0x4090409,, "A"  ; 0x0050 is WM_INPUTLANGCHANGEREQUEST.


}
        
cn(mode := "postmessage"){
    PostMessage 0x0050, 0, 0x8040804,, "A"  
             ; 0x4040404 是繁体中文！，简体中文的编号是什么  0x8040804
    

}