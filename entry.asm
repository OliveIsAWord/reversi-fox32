    opton
    push end_current_task
    jmp main

null:
    pop rfp
    push 0
    jmp rfp

#include "main.asm"
#include "fox32rom.def.asm"
; #include "fox32os.olea.asm"
