; sprite_tools.asm

;
; Draw 16x16 pixel (2x16 bytes) sprite into screen memory
; Input:
;   IX - pointer to sprite structure
;           - x - 1 byte
;           - y - 1 byte
;           - data_ptr - 2 byte
; Sprite data is interleaved pixel,pixel,attribute,attribute per line
; Uses everything except IYH, which is available as an external counter
;
draw_sprite:

    ; calculate pointer into SCREEN_LINE_POINTERS

    LD  D,0
    LD  E,(IX+1)
    LD  HL,SCREEN_LINE_POINTERS
    ADD HL,DE
    ADD HL,DE

    ; setup sprite data pointer

    LD  A,HIGH(sprite_data)
    ADD A,(IX+2)
    LD  B,A
    LD  C,(IX+3)

    ; setup counter

    LD IYL,16

draw_sprite_row_loop:

    ; enter with HL pointing to the line address
    ; read next line pointer, add in x, and load into DE

    LD  A,(IX+0)    ;x ; wherever we store it
    ADD A,(HL)      ; adds x to low byte, set C
    LD  E,A         ; store the value
    INC HL
    LD  A,0
    ADC A,(HL)      ; adds carry to hight byte
    LD  D,A         ; store the value
    INC HL

    PUSH HL         ; store line pointer for next time

    ; restore sprite pointer to HL

    LD H,B
    LD L,C

    ; setup BC

    LD BC,SCREEN_ADDR_DIFF

    ; copy pixel data

    LDI
    LDI

    ; adjust DE to point $2000-2 btyes ahead, into the attribute screen

    EX  DE,HL
    ADD HL,BC ; = $2000 - 2
    EX  DE,HL

    ; copy the attribute data

    LDI
    LDI

    ; store sprite pointer

    LD B,H
    LD C,L

    ; retrieve line pointer and setup the stack for returning

    POP HL

    ; check the row counter

    DEC IYL
    JR  NZ,draw_sprite_row_loop

    RET ; done


;
; get_screen_line_pointer
; Return a pointer into the screen lines in HL
; E = y
;
get_screen_line_pointer:

    LD  D,0
    LD  HL,SCREEN_LINE_POINTERS
    ADD HL,DE
    ADD HL,DE
    RET

;
; clear_row
; Clear the attributes in the 2 columns from the given line
; IX+0 = x
; A = y
;
clear_row:

    LD E,A
    CALL get_screen_line_pointer

    ; from above
    ; calc attribute line address for row
    ; (HL) = pixel line address

    LD  A,(IX+0)    ; x
    ADD A,(HL)      ; adds x to low byte, set C
    LD  E,A         ; store the value
    INC HL
    LD  A,$20       ; high byte diff between screens
    ADC A,(HL)      ; adds carry to hight byte
    LD  D,A         ; store the value

    LD  A,0
    LD  (DE),A
    INC DE
    LD  (DE),A

    RET

;
; clear_column
; Clear the attributes in the 16 rows x 1 column from the given column
; A = x
; IX+1 = y
;
clear_column:

    LD C,A          ; backup
    LD E,(IX+1)
    CALL get_screen_line_pointer

    LD B,16         ; counter

clear_column_loop:

    ; from above
    ; calc attribute line address for row
    ; (HL) = pixel line address

    LD  A,C         ; x
    ADD A,(HL)      ; adds x to low byte, set C
    LD  E,A         ; store the value
    INC HL
    LD  A,$20       ; high byte diff between screens
    ADC A,(HL)      ; adds carry to hight byte
    LD  D,A         ; store the value
    INC HL          ; ready for next loop

    LD  A,0
    LD  (DE),A

    DJNZ clear_column_loop

    RET




