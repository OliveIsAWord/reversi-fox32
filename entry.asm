    opton
    mov [MILLIS], millis_impl
    push [END_CURRENT_TASK]
    jmp main

#include "main.asm"
#include "binding_addresses.asm"
#include "fox32.def.asm"

MILLIS:
     data.32 0
millis_impl:
     in r0, 0x80000706
     ret
