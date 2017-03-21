	;; start loop 

startHere:
	call 3503           ; ROM routine - clears screen, opens chan 2.

	ld hl, videoUpdateList_local    ; hl is the address of where to add bytes to the update list
	
	
	call drawDINO
	call drawGameX
	call drawJUMPO
	;call drawScore
	
	call drawPromote

	call drawTrex
	
	
startingLoop:	

	
	ld bc,63486         ; keyboard row 1-5/joystick port 2.
       	in a,(c)            ; see what keys are pressed.
       	rra                 ; outermost bit = key 1.
       	;push af             ; remember the value.
       	jr c, multi_player_game_start        ; it's being pressed, move left.

	jp init_game

multi_player_game_start:
	
	ld bc,63486         ; keyboard row 1-5/joystick port 2.
       	in a,(c)            ; see what keys are pressed.
       	rra                 ; outermost bit = key 1.
	rra			; key 2
       	;push af             ; remember the value.
       	jr c, startingLoop        ; it's being pressed, move left.

	jp init_game_multi



;; Game loop
include "gameLoop.s"
include "multiGameLoop.s"

drawDINO:
	ld hl, GameTitleDINO+1                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0708
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        ld (attrByte), a
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameTitleDINO+9                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0808
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameTitleDINO+17                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0908
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameTitleDINO+25                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0A08
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToUpdateList
	
	ld hl, GameTitleDINO+33                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0B08
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameTitleDINO+41                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0C08
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameTitleDINO+49                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0D08
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameTitleDINO+57                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0E08
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameTitleDINO+65                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0709
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameTitleDINO+73                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0809
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameTitleDINO+81                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0909
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameTitleDINO+89                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0A09
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameTitleDINO+97                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0B09
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameTitleDINO+105                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0C09
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameTitleDINO+113                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0D09
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameTitleDINO+121                     ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0E09
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameTitleDINO+129                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $070A
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameTitleDINO+137                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $080A
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameTitleDINO+145                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $090A
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameTitleDINO+153                     ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0A0A
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameTitleDINO+161                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0B0A
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameTitleDINO+169                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0C0A
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameTitleDINO+177                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0D0A
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameTitleDINO+185                     ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0E0A
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToUpdateList

	ret

drawGameX:
	ld hl, GameTitleX+1                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $090B
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        ld (attrByte), a
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameTitleX+9                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0A0B
        ld (charCellCoord), hl
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameTitleX+17                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0B0B
        ld (charCellCoord), hl
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameTitleX+25                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $090C
        ld (charCellCoord), hl
        call copyCharCellAndAttrByteToUpdateList
	
	ld hl, GameTitleX+33                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0A0C
        ld (charCellCoord), hl
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameTitleX+41                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0B0C
        ld (charCellCoord), hl
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameTitleX+49                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $090D
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameTitleX+57                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0A0D
        ld (charCellCoord), hl
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameTitleX+65                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0B0D
        ld (charCellCoord), hl
        call copyCharCellAndAttrByteToUpdateList

	ret

	
drawJUMPO:
	ld hl, GameJumpo+1                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0C0B
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        ld (attrByte), a
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+9                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0D0B
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+17                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0E0B
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+25                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0F0B
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList
	
	ld hl, GameJumpo+33                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $100B
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+41                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $110B
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+49                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $120B
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+57                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $130B
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+65                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $140B
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+73                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $150B
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+81                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $160B
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+89                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $170B
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+97                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0C0C
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+105                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0D0C
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+113                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0E0C
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+121                     ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0F0C
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+129                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $100C
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+137                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $110C
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+145                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $120C
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+153                     ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $130C
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+161                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $140C
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+169                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $150C
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+177                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $160C
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+185                     ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $170C
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+193                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0C0D
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+201                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0D0D
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+209                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0E0D
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+217                     ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0F0D
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+225                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $100D
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+233                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $110D
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+241                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $120D
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+249                     ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $130D
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+257                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $140D
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+265                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $150D
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+273                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $160D
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameJumpo+281                     ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $170D
        ld (charCellCoord), hl
        ld a, (GameJumpo)
        call copyCharCellAndAttrByteToUpdateList


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
promote_single: defb 22,2,2,'Press *1* to start the game'
developer: defb 22,17,2,'Developers:'
name1: defb 22,19,2,'Yuhan Dai'
name2: defb 22,20,2,'Kareem Moussa'
name3: defb 22,21,2,'Nicolas Lama-Solet'
eostr2:  equ $
