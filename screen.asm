; screen.asm
; Helpful screen stuff

; A - value to fill with
; DE - screen to clear
; usues: HL,BC
fill_screen:
    LD   H,D     ; copy DE->HL
    LD   L,E
    LD   (DE),A
    INC  DE
    LD   BC,SCREEN_LENGTH-1
    LDIR
    RET

SCREEN_LINE_POINTERS:
    DW 16384 ; line 0, row 0
    DW 16640 ; line 0, row 1
    DW 16896 ; line 0, row 2
    DW 17152 ; line 0, row 3
    DW 17408 ; line 0, row 4
    DW 17664 ; line 0, row 5
    DW 17920 ; line 0, row 6
    DW 18176 ; line 0, row 7
    DW 16416 ; line 1, row 0
    DW 16672 ; line 1, row 1
    DW 16928 ; line 1, row 2
    DW 17184 ; line 1, row 3
    DW 17440 ; line 1, row 4
    DW 17696 ; line 1, row 5
    DW 17952 ; line 1, row 6
    DW 18208 ; line 1, row 7
    DW 16448 ; line 2, row 0
    DW 16704 ; line 2, row 1
    DW 16960 ; line 2, row 2
    DW 17216 ; line 2, row 3
    DW 17472 ; line 2, row 4
    DW 17728 ; line 2, row 5
    DW 17984 ; line 2, row 6
    DW 18240 ; line 2, row 7
    DW 16480 ; line 3, row 0
    DW 16736 ; line 3, row 1
    DW 16992 ; line 3, row 2
    DW 17248 ; line 3, row 3
    DW 17504 ; line 3, row 4
    DW 17760 ; line 3, row 5
    DW 18016 ; line 3, row 6
    DW 18272 ; line 3, row 7
    DW 16512 ; line 4, row 0
    DW 16768 ; line 4, row 1
    DW 17024 ; line 4, row 2
    DW 17280 ; line 4, row 3
    DW 17536 ; line 4, row 4
    DW 17792 ; line 4, row 5
    DW 18048 ; line 4, row 6
    DW 18304 ; line 4, row 7
    DW 16544 ; line 5, row 0
    DW 16800 ; line 5, row 1
    DW 17056 ; line 5, row 2
    DW 17312 ; line 5, row 3
    DW 17568 ; line 5, row 4
    DW 17824 ; line 5, row 5
    DW 18080 ; line 5, row 6
    DW 18336 ; line 5, row 7
    DW 16576 ; line 6, row 0
    DW 16832 ; line 6, row 1
    DW 17088 ; line 6, row 2
    DW 17344 ; line 6, row 3
    DW 17600 ; line 6, row 4
    DW 17856 ; line 6, row 5
    DW 18112 ; line 6, row 6
    DW 18368 ; line 6, row 7
    DW 16608 ; line 7, row 0
    DW 16864 ; line 7, row 1
    DW 17120 ; line 7, row 2
    DW 17376 ; line 7, row 3
    DW 17632 ; line 7, row 4
    DW 17888 ; line 7, row 5
    DW 18144 ; line 7, row 6
    DW 18400 ; line 7, row 7
    DW 18432 ; line 8, row 0
    DW 18688 ; line 8, row 1
    DW 18944 ; line 8, row 2
    DW 19200 ; line 8, row 3
    DW 19456 ; line 8, row 4
    DW 19712 ; line 8, row 5
    DW 19968 ; line 8, row 6
    DW 20224 ; line 8, row 7
    DW 18464 ; line 9, row 0
    DW 18720 ; line 9, row 1
    DW 18976 ; line 9, row 2
    DW 19232 ; line 9, row 3
    DW 19488 ; line 9, row 4
    DW 19744 ; line 9, row 5
    DW 20000 ; line 9, row 6
    DW 20256 ; line 9, row 7
    DW 18496 ; line 10, row 0
    DW 18752 ; line 10, row 1
    DW 19008 ; line 10, row 2
    DW 19264 ; line 10, row 3
    DW 19520 ; line 10, row 4
    DW 19776 ; line 10, row 5
    DW 20032 ; line 10, row 6
    DW 20288 ; line 10, row 7
    DW 18528 ; line 11, row 0
    DW 18784 ; line 11, row 1
    DW 19040 ; line 11, row 2
    DW 19296 ; line 11, row 3
    DW 19552 ; line 11, row 4
    DW 19808 ; line 11, row 5
    DW 20064 ; line 11, row 6
    DW 20320 ; line 11, row 7
    DW 18560 ; line 12, row 0
    DW 18816 ; line 12, row 1
    DW 19072 ; line 12, row 2
    DW 19328 ; line 12, row 3
    DW 19584 ; line 12, row 4
    DW 19840 ; line 12, row 5
    DW 20096 ; line 12, row 6
    DW 20352 ; line 12, row 7
    DW 18592 ; line 13, row 0
    DW 18848 ; line 13, row 1
    DW 19104 ; line 13, row 2
    DW 19360 ; line 13, row 3
    DW 19616 ; line 13, row 4
    DW 19872 ; line 13, row 5
    DW 20128 ; line 13, row 6
    DW 20384 ; line 13, row 7
    DW 18624 ; line 14, row 0
    DW 18880 ; line 14, row 1
    DW 19136 ; line 14, row 2
    DW 19392 ; line 14, row 3
    DW 19648 ; line 14, row 4
    DW 19904 ; line 14, row 5
    DW 20160 ; line 14, row 6
    DW 20416 ; line 14, row 7
    DW 18656 ; line 15, row 0
    DW 18912 ; line 15, row 1
    DW 19168 ; line 15, row 2
    DW 19424 ; line 15, row 3
    DW 19680 ; line 15, row 4
    DW 19936 ; line 15, row 5
    DW 20192 ; line 15, row 6
    DW 20448 ; line 15, row 7
    DW 20480 ; line 16, row 0
    DW 20736 ; line 16, row 1
    DW 20992 ; line 16, row 2
    DW 21248 ; line 16, row 3
    DW 21504 ; line 16, row 4
    DW 21760 ; line 16, row 5
    DW 22016 ; line 16, row 6
    DW 22272 ; line 16, row 7
    DW 20512 ; line 17, row 0
    DW 20768 ; line 17, row 1
    DW 21024 ; line 17, row 2
    DW 21280 ; line 17, row 3
    DW 21536 ; line 17, row 4
    DW 21792 ; line 17, row 5
    DW 22048 ; line 17, row 6
    DW 22304 ; line 17, row 7
    DW 20544 ; line 18, row 0
    DW 20800 ; line 18, row 1
    DW 21056 ; line 18, row 2
    DW 21312 ; line 18, row 3
    DW 21568 ; line 18, row 4
    DW 21824 ; line 18, row 5
    DW 22080 ; line 18, row 6
    DW 22336 ; line 18, row 7
    DW 20576 ; line 19, row 0
    DW 20832 ; line 19, row 1
    DW 21088 ; line 19, row 2
    DW 21344 ; line 19, row 3
    DW 21600 ; line 19, row 4
    DW 21856 ; line 19, row 5
    DW 22112 ; line 19, row 6
    DW 22368 ; line 19, row 7
    DW 20608 ; line 20, row 0
    DW 20864 ; line 20, row 1
    DW 21120 ; line 20, row 2
    DW 21376 ; line 20, row 3
    DW 21632 ; line 20, row 4
    DW 21888 ; line 20, row 5
    DW 22144 ; line 20, row 6
    DW 22400 ; line 20, row 7
    DW 20640 ; line 21, row 0
    DW 20896 ; line 21, row 1
    DW 21152 ; line 21, row 2
    DW 21408 ; line 21, row 3
    DW 21664 ; line 21, row 4
    DW 21920 ; line 21, row 5
    DW 22176 ; line 21, row 6
    DW 22432 ; line 21, row 7
    DW 20672 ; line 22, row 0
    DW 20928 ; line 22, row 1
    DW 21184 ; line 22, row 2
    DW 21440 ; line 22, row 3
    DW 21696 ; line 22, row 4
    DW 21952 ; line 22, row 5
    DW 22208 ; line 22, row 6
    DW 22464 ; line 22, row 7
    DW 20704 ; line 23, row 0
    DW 20960 ; line 23, row 1
    DW 21216 ; line 23, row 2
    DW 21472 ; line 23, row 3
    DW 21728 ; line 23, row 4
    DW 21984 ; line 23, row 5
    DW 22240 ; line 23, row 6
    DW 22496 ; line 23, row 7
