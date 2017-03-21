	;; start loop 

startHere:
	call 3503           ; ROM routine - clears screen, opens chan 2.

	halt
	halt
	halt
	ld hl, videoUpdateList_local    ; hl is the address of where to add bytes to the update list
	
	call drawDINO
	call drawPromote
	;call drawScore
	
startingLoop:	
	ld bc,63486         ; keyboard row 1-5/joystick port 2.
       	in a,(c)            ; see what keys are pressed.
       	rra                 ; outermost bit = key 1.
       	;push af             ; remember the value.
       	jr c, startingLoop        ; it's being pressed, move left.

	jp init_game


;; Game loop
include "gameLoop.s"

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
        ld (attrByte), a
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
        ld (attrByte), a
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
        ld (attrByte), a
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
        ld (attrByte), a
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
        ld (attrByte), a
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
        ld (attrByte), a
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
        ld (attrByte), a
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
        ld (attrByte), a
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
        ld (attrByte), a
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
        ld (attrByte), a
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
        ld (attrByte), a
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GameTitleDINO+185                     ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0E0A
        ld (charCellCoord), hl
        ld a, (GameTitleDINO)
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

videoUpdateList_local: equ $a000  
promote_single: defb 22,2,2,'Press *1* to start the game'
eostr2:  equ $