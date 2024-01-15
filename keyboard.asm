; keyboard.asm
; Keyboard routines

;
; Keyboard buffer
; Define length to use elsewhere. 4 is good for key controls, 1 should
;   work if you just want to detect single key presses.
; eg.
;   KEY_BUFFER_LENGTH   EQU 4
;

KEY_BUFFER_LENGTH   EQU 1   ; should be okay if we're only interested in single key presses

KEY_BUFFER  DS  KEY_BUFFER_LENGTH   ; we'll read up to this many characters

;
; Read keyboard
; Based on https://www.chibiakumas.com/z80/platform.php#LessonP6
; Out:
;   A - number of keys read, up to KEY_BUFFER_LENGTH
;   KEY_BUFFER - keys
; Uses:
;   Everything including A', but not IY
;

; TODO: will this be small enough to fit into the gap between the
;   interrupt table and the interrupt code?
;   currently: 91 bytes (inc buffer and keymap)
;   so could be moved into the space above...

read_keyboard:
    LD  DE,KEY_BUFFER
    LD  HL,KEYMAP
    LD  IXL,0   ; count of keys read
    LD  B,$FE   ; %11111110
    LD  C,$FE

read_keyboard_loop:
    IN  A,(C)
    LD  IXH,5   ; 5 bits to check

read_keyboard_check_bit:
    RRA
    JR  C,read_keyboard_check_done
    EX  AF,AF'
    LD  A,(HL)                  ; write key found into the buffer
    LD  (DE),A
    INC DE
    INC IXL                     ; could do this comparing E to LOW(KEY_BUFFER+KEY_BUFFER_LENGTH)
    LD  A,KEY_BUFFER_LENGTH
    CP  IXL
    JR  Z,read_keyboard_done
    EX  AF,AF'

read_keyboard_check_done:
    INC HL
    DEC IXH
    JR  NZ,read_keyboard_check_bit

read_keyboard_next:
    SCF
    RL  B
    JR  C,read_keyboard_loop    ; until we shift out the 0

read_keyboard_done:
    LD  A,IXL                   ; number of keys read
    RET

SFT EQU 1
ENT EQU 2
SPC EQU 3
SYM EQU 4

KEYMAP  DB SFT,"Z","X","C","V"  ; bits 0-1-2-3-4 so they're in order for shifting
        DB "A","S","D","F","G"
        DB "Q","W","E","R","T"
        DB "1","2","3","4","5"
        DB "0","9","8","7","6"
        DB "P","O","I","U","Y"
        DB ENT,"L","K","J","H"
        DB SPC,SYM,"M","N","B"

;
; Read a single key without unwanted repeat
; Out:
;   A - the key read
; Uses:
;   assume everything
;

KEY_DOWN DB 0   ; current key down, or 0

wait_for_key_change:

    ; setup KEY_DOWN with the current state of the keyboard

    CALL read_keyboard
    CP  0
    JR  Z,wait_for_key_change_init
    LD  A,(KEY_BUFFER)

wait_for_key_change_init:

    LD  (KEY_DOWN),A

wait_for_key_change_wait:

    HALT

    CALL read_keyboard
    CP  0
    JR  Z,wait_for_key_change_init  ; no key down, which may be a change, so store it

    LD  A,(KEY_DOWN)                ; new key
    LD  B,A
    LD  A,(KEY_BUFFER)              ; existing key (or 0)
    CP  B
    JR  Z,wait_for_key_change_wait  ; same key is still down

    ; key has changed, return with it in A

    RET
