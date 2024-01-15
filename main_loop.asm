


main_loop:



main_loop_inner:

    CALL wait_for_vblank
    LD IX,dynamic_sprites_0
    CALL draw_dynamic_sprites

    CALL wait_for_vblank
    LD IX,dynamic_sprites_1
    CALL draw_dynamic_sprites
    
    CALL wait_for_vblank
    LD IX,static_sprites_0
    CALL draw_static_sprites

    CALL wait_for_vblank
    LD IX,static_sprites_1
    CALL draw_static_sprites

    CALL wait_for_vblank
    LD IX,static_sprites_2
    CALL draw_static_sprites

    CALL wait_for_vblank
    LD IX,static_sprites_3
    CALL draw_static_sprites

    JP main_loop_inner

;
; draw_dynamic_sprites
; Move and draw a batch of sprites, updating their animation frame
; XI = address of first in batch
;
draw_dynamic_sprites:

    LD IYH,DYNAMIC_SPRITE_COUNT

draw_dynamic_sprites_loop:

    ; TODO cleanup

    LD A,(IX+4)
    CP ACTION_RIGHT_0
    JP Z,action_right_0
    CP ACTION_RIGHT_1
    JP Z,action_right_1
    CP ACTION_DOWN_0
    JP Z,action_down_0
    CP ACTION_DOWN_1
    JP Z,action_down_1
    CP ACTION_LEFT_0
    JP Z,action_left_0
    CP ACTION_LEFT_1
    JP Z,action_left_1
    CP ACTION_UP_0
    JP Z,action_up_0
    CP ACTION_UP_1
    JP Z,action_up_1

draw_dynamic_sprites_action_done:

    CALL draw_sprite
    
    LD  A,(IX+3)
    ADD A,64
    LD  (IX+3),A

    LD  A,DYNAMIC_SPRITE_SIZE      ; sprite_info page-aligned and < 256 bytes total
    ADD A,IXL
    LD  IXL,A

    DEC IYH
    JP NZ,draw_dynamic_sprites_loop

    RET


;
; When changing mode, load value into IX+4 and IX+5, so that when we
;   enter the routine below we will have this in A, which we can use
;   as a check for whick adjacent cells to clean up
;

;
; move one column to the right until column 28
;
action_right_0:

    LD  A,(IX+0)
    CALL clear_column

action_right_0_clear_done:

    LD  A,(IX+0)
    INC A
    LD  (IX+0),A
    CP  28 ; move to last-but-one column
    JP  NZ,draw_dynamic_sprites_action_done
    LD  (IX+4),ACTION_DOWN_0
    JP  draw_dynamic_sprites_action_done

;
; move one column to the right until column 30
;
action_right_1:

    LD  A,(IX+0)
    CALL clear_column

action_right_1_clear_done:

    LD  A,(IX+0)
    INC A
    LD  (IX+0),A
    CP  30 ; move to last-but-one column
    JP  NZ,draw_dynamic_sprites_action_done
    LD  (IX+4),ACTION_DOWN_1
    JP  draw_dynamic_sprites_action_done

;
; move one line down until line 160
;
action_down_0:

    LD  A,(IX+1)
    CALL clear_row

action_down_0_clear_done:

    LD  A,(IX+1)
    INC A
    LD  (IX+1),A
    CP  160
    JP  NZ,draw_dynamic_sprites_action_done
    LD  (IX+4),ACTION_LEFT_0
    JP  draw_dynamic_sprites_action_done

;
; move one line down until line 176
;
action_down_1:

    LD  A,(IX+1)
    CALL clear_row

action_down_1_clear_done:

    LD  A,(IX+1)
    INC A
    LD  (IX+1),A
    CP  176
    JP  NZ,draw_dynamic_sprites_action_done
    LD  (IX+4),ACTION_LEFT_1
    JP  draw_dynamic_sprites_action_done

;
; move one column to the left until column 0
;
action_left_0:

    LD  A,(IX+0)
    INC A
    CALL clear_column

action_left_0_clear_done:

    LD  A,(IX+0)
    DEC A
    LD  (IX+0),A
    JP  NZ,draw_dynamic_sprites_action_done
    LD  (IX+4),ACTION_UP_0
    JP  draw_dynamic_sprites_action_done

;
; move one column to the left until column 2
;
action_left_1:

    LD  A,(IX+0)
    INC A
    CALL clear_column

action_left_1_clear_done:

    LD  A,(IX+0)
    DEC A
    LD  (IX+0),A
    CP  2
    JP  NZ,draw_dynamic_sprites_action_done
    LD  (IX+4),ACTION_UP_1
    JP  draw_dynamic_sprites_action_done

;
; move up until line 0
;
action_up_0:

    LD  A,(IX+1)
    ADD A,15
    CALL clear_row

action_up_0_clear_done:

    LD  A,(IX+1)
    DEC A
    LD  (IX+1),A
    JP  NZ,draw_dynamic_sprites_action_done
    LD  (IX+4),ACTION_RIGHT_0
    JP  draw_dynamic_sprites_action_done

;
; move up until line 16
;
action_up_1:

    LD  A,(IX+1)
    ADD A,15
    CALL clear_row

action_up_1_clear_done:

    LD  A,(IX+1)
    DEC A
    LD  (IX+1),A
    CP  16
    JP  NZ,draw_dynamic_sprites_action_done
    LD  (IX+4),ACTION_RIGHT_1
    JP  draw_dynamic_sprites_action_done


;
; draw_static_sprites
; Draw a batch of static sprites and update their frame
; XI = address of first in batch
;
draw_static_sprites:

    LD IYH,STATIC_SPRITE_COUNT

draw_static_sprites_loop:

    CALL draw_sprite

    LD  A,(IX+3)
    ADD A,64
    LD  (IX+3),A

    LD  A,STATIC_SPRITE_SIZE      ; sprite_info page-aligned and < 256 bytes total
    ADD A,IXL
    LD  IXL,A

    DEC IYH
    JP NZ,draw_static_sprites_loop

    RET
