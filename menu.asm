GET_REVERSI_MENU:
    data.32 get_reversi_menu_impl
get_reversi_menu_impl:
    mov r0, menu_items_root
    ret

menu_items_root:
    data.8 2                                                      ; number of menus
    data.32 menu_items_game_list data.32 menu_items_game_name     ; pointer to menu list, pointer to menu name
    data.32 menu_items_board_list data.32 menu_items_board_name   ; pointer to menu list, pointer to menu name
menu_items_game_name:
    data.8 4 data.str "Game" data.8 0x00 ; text length, text, null-terminator
menu_items_board_name:
    data.8 5 data.str "Board" data.8 0x00 ; text length, text, null-terminator
menu_items_game_list:
    data.8 1                                 ; number of items
    data.8 10                                ; menu width (usually longest item + 2)
    data.8 8 data.str "New Game" data.8 0x00 ; text length, text, null-terminator
menu_items_board_list:
    data.8 1                                             ; number of items
    data.8 21         ; 1234567890123456789              ; menu width (usually longest item + 2)
    data.8 19 data.str "Toggle Move Preview" data.8 0x00 ; text length, text, null-terminator
