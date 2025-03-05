    opton
    push [END_CURRENT_TASK]
    jmp main

#include "main.asm"
#include "menu.asm"
#include "binding_addresses.asm"
#include "fox32.def.asm"

MILLIS:
     data.32 millis_impl
millis_impl:
     in r0, 0x80000706
     ret
