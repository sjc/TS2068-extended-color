; macros.asm
; Useful macros and other definitions

SCREEN_ADDR     EQU $4000
ATTRIBUTES_ADDR EQU $5800

; TS2048

SCREEN_ADDR_DATA    EQU SCREEN_ADDR
SCREEN_ADDR_ATTR    EQU $6000

SCREEN_ADDR_DIFF    EQU 8192

SCREEN_LENGTH   EQU 6144

; Border

BORDER_BLACK    EQU 0
BORDER_BLUE     EQU 1
BORDER_RED      EQU 2
BORDER_MAGENTA  EQU 3
BORDER_GREEN    EQU 4
BORDER_CYAN     EQU 5
BORDER_YELLOW   EQU 6
BORDER_WHITE    EQU 7

set_border MACRO colour
    LD  A,colour
    OUT (254),A
ENDM

; Attributes

FLASH   EQU 1 << 7
BRIGHT  EQU 1 << 6

INK_BLACK   EQU 0
INK_BLUE    EQU 1
INK_RED     EQU 2
INK_MAGENTA EQU 3
INK_GREEN   EQU 4
INK_CYAN    EQU 5
INK_YELLOW  EQU 6
INK_WHITE   EQU 7

PAPER_BLACK     EQU 0 << 3
PAPER_BLUE      EQU 1 << 3
PAPER_RED       EQU 2 << 3
PAPER_MAGENTA   EQU 3 << 3
PAPER_GREEN     EQU 4 << 3
PAPER_CYAN      EQU 5 << 3
PAPER_YELLOW    EQU 6 << 3
PAPER_WHITE     EQU 7 << 3

; Check data alignment

check_at_page_start MACRO
    IF LOW($)
        .WARNING Not at the start of a page
    ENDIF
ENDM

check_does_not_cross_page MACRO label
    IF ($/256) - (label/256)
        .WARNING Crosses page at $
    ENDIF
ENDM
