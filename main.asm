; Compile with:
;   pasmo -1 --tapbas main.asm ts2068.tap > debug.txt

INCLUDE "macros.asm"

ORG $7800 ; in contended memory, but just for setup

start:

    LD SP,$BFFE     ; setup stack

    CALL setup_interrupts

    ; set border
    LD  A,INK_BLACK
    OUT (254),A

    ; switch to extended colour mode
    LD  A,2
    OUT (255),A

    ; clear screen and attributes
    LD DE,SCREEN_ADDR_DATA
    LD A,0
    CALL fill_screen
    
    LD DE,SCREEN_ADDR_ATTR
    LD A,INK_MAGENTA
    CALL fill_screen

    JP main_loop_inner


INCLUDE "interrupts.asm" ; includes an ORG $8000 statement
INCLUDE "keyboard.asm"

ORG $8200 ; should fit in after the above with a byte to spare

sprite_data: ; align this on a page so we can calc sprite by adding to high byte and just set frame
    INCBIN "bifrost2.bin"

INCLUDE "sprites.asm" ; including sprites next also aligns them to a page
INCLUDE "sprite_tools.asm"

INCLUDE "screen.asm"

INCLUDE "main_loop.asm"

END start ; <-- value/label is the entry point
