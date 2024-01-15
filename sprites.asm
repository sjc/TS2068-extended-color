; sprites.asm
; TS2068 high resolution colour sprite tools

DYNAMIC_SPRITE_COUNT    EQU 8
DYNAMIC_SPRITE_SIZE     EQU 5

ACTION_LEFT_0   EQU 0
ACTION_LEFT_1   EQU 1
ACTION_RIGHT_0  EQU 2
ACTION_RIGHT_1  EQU 3
ACTION_UP_0     EQU 4
ACTION_UP_1     EQU 5
ACTION_DOWN_0   EQU 6
ACTION_DOWN_1   EQU 7

;
; sprite struct:
;   x
;   y
;   sprite_id
;   frame
;   [dynamic] action
;


; if we page-align the sprite data, we can use a sprite index
;   eg. if all sprites have 4 frames
;       - sprite_id can be added to the high byte
;       - frame * 64 (or stored as *64) is the low byte

STATIC_SPRITE_COUNT     EQU 24
STATIC_SPRITE_SIZE      EQU 4

static_sprites_0:

    DB  4, 32,0,0
    DB 12, 32,4,0
    DB 20, 32,0,0
    
    DB  6, 48,2,0
    DB 14, 48,6,0
    DB 22, 48,2,0

    DB  8, 64,4,0
    DB 16, 64,0,0
    DB 24, 64,4,0

    DB 10, 80,6,0
    DB 18, 80,2,0
    DB 26, 80,6,0

    DB  4, 96,4,0
    DB 12, 96,0,0
    DB 20, 96,4,0

    DB  6,112,6,0
    DB 14,112,2,0
    DB 22,112,6,0

    DB  8,128,0,0
    DB 16,128,4,0
    DB 24,128,0,0

    DB 10,144,2,0
    DB 18,144,6,0
    DB 26,144,2,0

static_sprites_1:

    DB  6, 32,1,0
    DB 14, 32,5,0
    DB 22, 32,1,0

    DB  8, 48,3,0
    DB 16, 48,7,0
    DB 24, 48,3,0

    DB 10, 64,5,0
    DB 18, 64,1,0
    DB 26, 64,5,0

    DB  4, 80,3,0
    DB 12, 80,7,0
    DB 20, 80,3,0

    DB  6, 96,5,0
    DB 14, 96,1,0
    DB 22, 96,5,0

    DB  8,112,7,0
    DB 16,112,3,0
    DB 24,112,7,0

    DB 10,128,1,0
    DB 18,128,5,0
    DB 26,128,1,0

    DB  4,144,7,0
    DB 12,144,3,0
    DB 20,144,7,0

dynamic_sprites_0:
    DB  0,  0, 0,128, ACTION_RIGHT_0
    DB 28,  0, 1,128, ACTION_DOWN_0
    DB 28, 28, 2,128, ACTION_DOWN_0
    DB 28, 56, 3,128, ACTION_DOWN_0
    DB 28, 84, 4,128, ACTION_DOWN_0
    DB 28,112, 5,128, ACTION_DOWN_0
    DB 28,140, 6,128, ACTION_DOWN_0
    DB 20,160, 7,128, ACTION_LEFT_0

    DS 24 ; remainder of 64 byte space / padding

static_sprites_2:

    DB  8, 32,2,0
    DB 16, 32,6,0
    DB 24, 32,2,0

    DB 10, 48,4,0
    DB 18, 48,0,0
    DB 26, 48,4,0

    DB  4, 64,2,0
    DB 12, 64,6,0
    DB 20, 64,2,0

    DB  6, 80,4,0
    DB 14, 80,0,0
    DB 22, 80,4,0

    DB  8, 96,6,0
    DB 16, 96,2,0
    DB 24, 96,6,0

    DB 10,112,0,0
    DB 18,112,4,0
    DB 26,112,0,0

    DB  4,128,6,0
    DB 12,128,2,0
    DB 20,128,6,0

    DB  6,144,0,0
    DB 14,144,4,0
    DB 22,144,0,0

static_sprites_3:

    DB 10, 32,3,0
    DB 18, 32,7,0
    DB 26, 32,3,0
    
    DB  4, 48,1,0
    DB 12, 48,5,0
    DB 20, 48,1,0
    
    DB  6, 64,3,0
    DB 14, 64,7,0
    DB 22, 64,3,0

    DB  8, 80,5,0
    DB 16, 80,1,0
    DB 24, 80,5,0

    DB 10, 96,7,0
    DB 18, 96,3,0
    DB 26, 96,7,0

    DB  4,112,5,0
    DB 12,112,1,0
    DB 20,112,5,0

    DB  6,128,7,0
    DB 14,128,3,0
    DB 22,128,7,0

    DB  8,144,1,0
    DB 16,144,5,0
    DB 24,144,1,0

dynamic_sprites_1:

    DB 30,176, 4,128, ACTION_LEFT_1
    DB  2,176, 5,128, ACTION_UP_1
    DB  2,148, 6,128, ACTION_UP_1
    DB  2,120, 7,128, ACTION_UP_1
    DB  2, 92, 5,128, ACTION_UP_1
    DB  2, 64, 6,128, ACTION_UP_1
    DB  2, 36, 7,128, ACTION_UP_1
    DB 10, 16, 7,128, ACTION_RIGHT_1

