set_current_disk_id:
    pop rfp
    pop r0 ; id u8
    call [0x81c]
    jmp rfp

yield_task:
    pop rfp
    call [0xa28]
    jmp rfp

end_current_task:
    pop rfp
    jmp [0xa18]

allocate_memory:
    pop rfp
    pop r0 ; size usize
    call [0xb10]
    push r0
    jmp rfp

free_memory:
    pop rfp
    pop r0 ; ptr void^
    call [0xb14]
    jmp rfp

new_window:
    pop rfp
    pop r0 ; window Window^
    pop r1 ; title u8^
    pop r2 ; width u16
    pop r3 ; height u16
    pop r4 ; x_position u16
    pop r5 ; y_position u16
    pop r6 ; menu_bar void^
    pop r7 ; widgets void^
    call [0xc10]
    jmp rfp

destroy_window:
    pop rfp
    pop r0 ; window Window^
    call [0xc14]
    jmp rfp

get_next_window_event:
    pop rfp
    pop r0 ; window Window^
    call [0xc1c]
    push r7 ; .parameter_6 u32
    push r6 ; .parameter_5 u32
    push r5 ; .parameter_4 u32
    push r4 ; .parameter_3 u32
    push r3 ; .parameter_2 u32
    push r2 ; .parameter_1 u32
    push r1 ; .parameter_0 u32
    push r0 ; .event_type u32
    jmp rfp

start_dragging_window:
    pop rfp
    pop r0 ; window Window^
    call [0xc30]
    jmp rfp

write:
    pop rfp
    pop r1 ; file File^
    pop r2 ; source u8^
    pop r0 ; len usize
    call [0xd20]
    jmp rfp

get_rom_version:
    pop rfp
    call [0xf0040000]
    push r2 ; .patch u32
    push r1 ; .minor u32
    push r0 ; .major u32
    jmp rfp
