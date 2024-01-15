; interrupts.asm
; Interrupt setup and handling code
; Based on https://chuntey.wordpress.com/2013/10/02/how-to-write-zx-spectrum-games-chapter-17/

ORG $8000   ; <-- needs to be put here

interrupt_table DS  257,$81

; setup interrupts
; this is 9 bytes long, meaning there are a spare
;   119 bytes between here and the interupt handler
setup_interrupts:
    DI              ; interrupts off as a precaution.
    LD  A,$80       ; high byte of pointer table location.
    LD  I,A         ; set high byte.
    IM  2           ; select interrupt mode 2.
    EI
    RET

;ORG $8181
; to prove the 119 bytes thing
interrupt_space DS  117 ; <- because we put wait_for_vblank in here...

wait_for_vblank:
    
    HALT
    RET

; TODO Maybe the interrupt should start by jumping back to the start of
;   the 119 bytes, to compact this into something we can put whole into
;   an included file

; TODO Maybe nominate a macro name to drop into the 119 byte space. Not
;   that I can see this file being reused in a way which means it cannot
;   just be edited when needed

interrupt_im2:
    ;PUSH    HL
    PUSH    AF
    ;LD      HL,SCREEN
    ;LD      A,(HL)
    ;XOR     $FF
    ;LD      (HL),A

    ;LD  A,VBLANK_COUNT
    ;INC A
    ;LD  VBLANK_COUNT,A

    POP     AF
    ;POP     HL
    EI
    RETI