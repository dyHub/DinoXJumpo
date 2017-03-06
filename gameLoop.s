
gameLoop:

	call drawTrex

	ld bc, 32766			; space key 
	in a, (c)			; see if space key is pressed
	rra				; outermost bit = key space
	push af				; remember the value
	call nc, trexJump		; it's being pressed, then jump t-rex
	pop af

	ei
        halt                            ; wait for interrupt to print our shit

        jp gameLoop


drawTrex:

	ld hl, trex1                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw tne first cell (left uper coner)
	ld hl, $000F
	ld (charCellCoord), hl		; (row = 0F, col = 00)
	call copyCharCellAndAttrByteToUpdateList	


	ld hl, trex2                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw the second cell (right uper coner)
        ld hl, $010F		      ; at the bottom right of the screen
        ld (charCellCoord), hl	      ; load the coordinate to draw cell
	call copyCharCellAndAttrByteToUpdateList	


	ld hl, trex3                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw tne third cell (left bottom coner)
        ld hl, $0010                  ; at the bottom right of the screen
        ld (charCellCoord), hl        ; load the coordinate to draw cell
	call copyCharCellAndAttrByteToUpdateList	


	ld hl, trex4                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw tne forth cell (right bottom coner)
        ld hl, $0110                  ; at the bottom right of the screen
        ld (charCellCoord), hl        ; load the coordinate to draw cell
	call copyCharCellAndAttrByteToUpdateList	
	
	ret

trexJump:
	
	; 1. Remove old trex
	ld hl, black                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw tne first cell (left uper coner)
	ld hl, $000F
	ld (charCellCoord), hl		; (row = 0F, col = 00)
	call copyCharCellAndAttrByteToUpdateList	

	ld hl, black                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw the second cell (right uper coner)
        ld hl, $010F		      ; at the bottom right of the screen
        ld (charCellCoord), hl	      ; load the coordinate to draw cell
	call copyCharCellAndAttrByteToUpdateList	

	ld hl, black                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw tne third cell (left bottom coner)
        ld hl, $0010                  ; at the bottom right of the screen
        ld (charCellCoord), hl        ; load the coordinate to draw cell
	call copyCharCellAndAttrByteToUpdateList	

	ld hl, black                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw tne forth cell (right bottom coner)
        ld hl, $0110                  ; at the bottom right of the screen
        ld (charCellCoord), hl        ; load the coordinate to draw cell
	call copyCharCellAndAttrByteToUpdateList	

	
	; 2. Halt for a bit	
	halt
	halt
	halt


	; 3. Draw new trex
	ld hl, trex1                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw tne first cell (left uper coner)
        ld hl, $000C			; at the bottom right of the screen
        ld (charCellCoord), hl		; load the coordinate to draw cell
	call copyCharCellAndAttrByteToUpdateList	


	ld hl, trex2                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw the second cell (right uper coner)
        ld hl, $010C		      ; at the bottom right of the screen
        ld (charCellCoord), hl	      ; load the coordinate to draw cell
	call copyCharCellAndAttrByteToUpdateList	


	ld hl, trex3                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw tne third cell (left bottom coner)
        ld hl, $000D                  ; at the bottom right of the screen
        ld (charCellCoord), hl        ; load the coordinate to draw cell
	call copyCharCellAndAttrByteToUpdateList	


	ld hl, trex4                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw tne forth cell (right bottom coner)
        ld hl, $010D                  ; at the bottom right of the screen
        ld (charCellCoord), hl        ; load the coordinate to draw cell
	call copyCharCellAndAttrByteToUpdateList	

	; 4. Halt for a bit
	halt
	halt
	halt
	halt
	halt
	halt
	

	; 5. Remove new trex
	ld hl, black                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw tne first cell (left uper coner)
        ld hl, $000C			; at the bottom right of the screen
        ld (charCellCoord), hl		; load the coordinate to draw cell
	call copyCharCellAndAttrByteToUpdateList	


	ld hl, black                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw the second cell (right uper coner)
        ld hl, $010C		      ; at the bottom right of the screen
        ld (charCellCoord), hl	      ; load the coordinate to draw cell
	call copyCharCellAndAttrByteToUpdateList	


	ld hl, black                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw tne third cell (left bottom coner)
        ld hl, $000D                  ; at the bottom right of the screen
        ld (charCellCoord), hl        ; load the coordinate to draw cell
	call copyCharCellAndAttrByteToUpdateList	


	ld hl, black                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw tne forth cell (right bottom coner)
        ld hl, $010D                  ; at the bottom right of the screen
        ld (charCellCoord), hl        ; load the coordinate to draw cell
	call copyCharCellAndAttrByteToUpdateList	

	ret

trex1: defb $00, $00, $00, $00, $00, $81, $83, $C7   
trex2: defb $7E, $DF, $FF, $FF, $F0, $FC, $E0, $E0 
trex3: defb $FF, $7F, $3F, $1F, $0D, $0C, $08, $0C
trex4: defb $F8, $E8, $E0, $C0, $80, $80, $80, $C0

black: defb $00, $00, $00, $00, $00, $00, $00, $00
