	;; start loop 
switch_dino_ctr: defb $00   ;; switch colors every 10 loops

startHere:
	call 3503           ; ROM routine - clears screen, opens chan 2.

	ld hl, videoUpdateList_local    ; hl is the address of where to add bytes to the update list
	
	
	call drawDINO
	call drawGameX
	call drawJUMPO
	;call drawScore
	
	call drawPromote

	;call drawTrex
	
	
startingLoop:	
       
        ld a, (switch_dino_ctr)
        inc a
        cp $ff
        jr nz, startingLoop_switchcolorend

startingLoop_switchcolor:
        ld a, (trex1+2)
        xor 3
        ld (trex1+2), a
        ld (trex2+2), a
        ld (trex3+2), a
        ld (trex4+2), a
        
        ld a, 0
startingLoop_switchcolorend:
        ld (switch_dino_ctr), a
        call drawTrex_forinit


	ld bc,63486         ; keyboard row 1-5/joystick port 2.
       	in a,(c)            ; see what keys are pressed.
       	rra                 ; outermost bit = key 1.
       	jr c, multi_player_game_start        ; it's being pressed, move left.

        ld a,2
        ld (trex1+2), a
        ld (trex2+2), a
        ld (trex3+2), a
        ld (trex4+2), a
        
	jp init_game

multi_player_game_start:
	
	ld bc,63486         ; keyboard row 1-5/joystick port 2.
       	in a,(c)            ; see what keys are pressed.
       	rra                 ; outermost bit = key 1.
	rra			; key 2
       	;push af             ; remember the value.
       	jr c, startingLoop        ; it's being pressed, move left.

        ld a,2
        ld (trex1+2), a
        ld (trex2+2), a
        ld (trex3+2), a
        ld (trex4+2), a

	jp init_game_multi



;; Game loop
include "gameLoop.s"
include "multiGameLoop.s"

drawDINO:

        ld bc, GameTitleDINO
        ld (attrByteAddress), bc

	ld hl, GameTitleDINO+1                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0807
        ld (charCellCoord), hl
        call copyCharCellAndAttrByteToScreen

	ld hl, GameTitleDINO+9                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0808
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameTitleDINO+17                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0809
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameTitleDINO+25                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $080A
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToScreen
	
	ld hl, GameTitleDINO+33                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $080B
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameTitleDINO+41                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $080C
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameTitleDINO+49                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $080D
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameTitleDINO+57                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $080E
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameTitleDINO+65                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0907
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameTitleDINO+73                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0908
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameTitleDINO+81                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0909
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameTitleDINO+89                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $090a
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameTitleDINO+97                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $090b
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameTitleDINO+105                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $090c
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameTitleDINO+113                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $090d
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameTitleDINO+121                     ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $090e
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameTitleDINO+129                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0a07
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameTitleDINO+137                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0a08
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameTitleDINO+145                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0a09
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameTitleDINO+153                     ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0A0A
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameTitleDINO+161                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0a0b
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameTitleDINO+169                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0a0c
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameTitleDINO+177                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0a0d
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameTitleDINO+185                     ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0a0e
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToScreen

	ret

drawGameX:
	ld hl, GameTitleX+1                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0b09
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        ld (attrByte), a
        call copyCharCellAndAttrByteToScreen

	ld hl, GameTitleX+9                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0b0a
        ld (charCellCoord), hl
        call copyCharCellAndAttrByteToScreen

	ld hl, GameTitleX+17                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0B0B
        ld (charCellCoord), hl
        call copyCharCellAndAttrByteToScreen

	ld hl, GameTitleX+25                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0c09
        ld (charCellCoord), hl
        call copyCharCellAndAttrByteToScreen
	
	ld hl, GameTitleX+33                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0c0a
        ld (charCellCoord), hl
        call copyCharCellAndAttrByteToScreen

	ld hl, GameTitleX+41                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0c0b
        ld (charCellCoord), hl
        call copyCharCellAndAttrByteToScreen

	ld hl, GameTitleX+49                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0d09
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameTitleX+57                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0d0a
        ld (charCellCoord), hl
        call copyCharCellAndAttrByteToScreen

	ld hl, GameTitleX+65                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0d0b
        ld (charCellCoord), hl
        call copyCharCellAndAttrByteToScreen

	ret

	
drawJUMPO:
	ld hl, GameJumpo+1                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0b0c
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        ld (attrByte), a
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+9                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0b0d
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+17                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0b0e
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+25                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0b0f
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen
	
	ld hl, GameJumpo+33                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0B10
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+41                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0B11
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+49                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0B12
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+57                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0B13
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+65                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0B14
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+73                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0B15
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+81                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0B16
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+89                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0B17
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+97                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0C0C
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+105                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0c0d
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+113                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0c0e
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+121                     ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0c0f
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+129                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0C10
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+137                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0C11
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+145                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0C12
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+153                     ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0C13
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+161                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0C14
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+169                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0C15
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+177                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0C16
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+185                     ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0C17
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+193                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0d0c
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+201                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0D0D
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+209                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0d0e
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+217                     ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0d0f
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+225                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0D10
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+233                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0D11
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+241                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0D12
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+249                     ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0D13
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+257                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0D14
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+265                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0D15
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+273                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0D16
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen

	ld hl, GameJumpo+281                     ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0D17
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToScreen


	ret



drawPromote:
	ld a,2              		; upper screen
       	call 5633              		; open channel
       	ld de,promote_single        	; address of string
       	ld bc,eostr2-promote_single  	; length of string to print
       	call 8252           		; print our string
	ret



GameTitleDINO: 
	defb 2		
	
	defb $00, $00, $FF, $FF, $CC, $CC, $CC, $CC
	defb $00, $00, $FF, $FF, $0C, $0C, $03, $03
	defb $00, $00, $03, $03, $C3, $C3, $33, $33
	defb $00, $00, $F3, $F3, $33, $33, $33, $33
	defb $00, $00, $C0, $C0, $F0, $F0, $30, $30
	defb $00, $00, $30, $30, $30, $30, $33, $33
	defb $00, $00, $3F, $3F, $C0, $C0, $00, $00
	defb $00, $00, $F0, $F0, $CC, $CC, $33, $33
	
	defb $CC, $CC, $CC, $CC, $CC, $CC, $CC, $CC
	defb $03, $03, $03, $03, $03, $03, $03, $03
	defb $33, $33, $33, $33, $33, $33, $33, $33
	defb $33, $33, $33, $33, $33, $33, $33, $33
	defb $CC, $CC, $33, $33, $0C, $0C, $03, $03
	defb $33, $33, $33, $33, $F3, $F3, $33, $33
	defb $00, $00, $00, $00, $00, $00, $00, $00
	defb $33, $33, $33, $33, $33, $33, $33, $33
	
	defb $CC, $CC, $CC, $CC, $FF, $FF, $00, $00
	defb $03, $03, $0C, $0C, $FF, $FF, $00, $00
	defb $33, $33, $C3, $C3, $03, $03, $00, $00
	defb $33, $33, $33, $33, $F3, $F3, $00, $00
	defb $00, $00, $00, $00, $00, $00, $00, $00
	defb $F3, $F3, $F0, $F0, $30, $30, $00, $00
	defb $00, $00, $C0, $C0, $3F, $3F, $00, $00
	defb $33, $33, $CC, $CC, $F0, $F0, $00, $00

GameTitleX:
	defb 2		
	defb $FF, $FF, $CC, $CC, $33, $33, $0C, $0C
	defb $00, $00, $00, $00, $00, $00, $C0, $C0
	defb $FF, $FF, $CC, $CC, $30, $30, $C0, $C0
	defb $03, $03, $00, $00, $03, $03, $0C, $0C
	defb $33, $33, $CC, $CC, $33, $33, $C0, $C0
	defb $00, $00, $00, $00, $00, $00, $C0, $C0
	defb $33, $33, $CC, $CC, $FF, $FF, $00, $00
	defb $00, $00, $00, $00, $00, $00, $00, $00
	defb $30, $30, $CC, $CC, $FF, $FF, $00, $00

GameJumpo:
	defb 2	
	defb $00, $00, $00, $00, $00, $00, $00, $00
	defb $00, $00, $0F, $0F, $0C, $0C, $0C, $0C
	defb $00, $00, $CC, $CC, $CC, $CC, $CC, $CC
	defb $00, $00, $03, $03, $03, $03, $03, $03
	defb $00, $00, $F3, $F3, $33, $33, $33, $33
	defb $00, $00, $C0, $C0, $F0, $F0, $30, $30
	defb $00, $00, $03, $03, $0F, $0F, $33, $33
	defb $00, $00, $F3, $F3, $33, $33, $33, $33
	defb $00, $00, $FC, $FC, $33, $33, $33, $33
	defb $00, $00, $C0, $C0, $30, $30, $33, $33
	defb $00, $00, $3F, $3F, $C0, $C0, $00, $00
	defb $00, $00, $F0, $F0, $CC, $CC, $33, $33

	defb $00, $00, $00, $00, $00, $00, $00, $00
	defb $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C	
	defb $CC, $CC, $CC, $CC, $CC, $CC, $CC, $CC
	defb $03, $03, $03, $03, $03, $03, $03, $03
	defb $33, $33, $33, $33, $33, $33, $33, $33
	defb $CC, $CC, $33, $33, $0C, $0C, $03, $03
	defb $33, $33, $C3, $C3, $C3, $C3, $03, $03
	defb $33, $33, $33, $33, $33, $33, $33, $33
	defb $33, $33, $33, $33, $33, $33, $3C, $3C
	defb $33, $33, $33, $33, $33, $33, $C3, $C3	
	defb $00, $00, $00, $00, $00, $00, $00, $00
	defb $33, $33, $33, $33, $33, $33, $33, $33

	defb $00, $00, $0C, $0C, $03, $03, $00, $00
	defb $0C, $0C, $0C, $0C, $FF, $FF, $00, $00
	defb $CC, $CC, $CC, $CC, $03, $03, $00, $00
	defb $03, $03, $03, $03, $FF, $FF, $00, $00
	defb $33, $33, $33, $33, $C3, $C3, $00, $00
	defb $03, $03, $00, $00, $00, $00, $00, $00
	defb $03, $03, $03, $03, $03, $03, $00, $00
	defb $33, $33, $33, $33, $F3, $F3, $00, $00	
	defb $30, $30, $30, $30, $F0, $F0, $00, $00
	defb $03, $03, $00, $00, $00, $00, $00, $00
	defb $00, $00, $C0, $C0, $3F, $3F, $00, $00
	defb $33, $33, $CC, $CC, $F0, $F0, $00, $00



videoUpdateList_local: equ $a000  
promote_single: defb 22,1,2,'Start single player game'
promote_single1: defb 22,2,8,'Press *1*'
promote_single2: defb 22,3,2,'Start multi-player game'
promote_single3: defb 22,4,8,'Press *2*'
developer: defb 22,17,2,'Developers:'
name1: defb 22,19,2,'Yuhan Dai'
name2: defb 22,20,2,'Kareem Moussa'
name3: defb 22,21,2,'Nicolas Lama-Solet'
eostr2:  equ $
