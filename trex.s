
; an example of loading a character cell
drawTrex:        
      	call 3503           ; ROM routine - clears screen, opens chan 2.
	halt
	halt
	halt
        ld hl, keyAttr		      ;set up attribute bytes
        ld (attrByteAddress), hl

	ld hl, trex1                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw tne first cell (left uper coner)
        ld hl, $0F00			; at the bottom right of the screen
        ld (charCellCoord), hl		; load the coordinate to draw cell
        call copyCharCellAndAttrByteToScreen


	ld hl, trex2                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw the second cell (right uper coner)
        ld hl, $0F01		      ; at the bottom right of the screen
        ld (charCellCoord), hl	      ; load the coordinate to draw cell
        call copyCharCellAndAttrByteToScreen


	ld hl, trex3                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw tne third cell (left bottom coner)
        ld hl, $1000                  ; at the bottom right of the screen
        ld (charCellCoord), hl        ; load the coordinate to draw cell
        call copyCharCellAndAttrByteToScreen


	ld hl, trex4                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw tne forth cell (right bottom coner)
        ld hl, $1001                  ; at the bottom right of the screen
        ld (charCellCoord), hl        ; load the coordinate to draw cell
        call copyCharCellAndAttrByteToScreen

mloop:  equ $

	ld bc, 32766			; space key 
	in a, (c)			; see if space key is pressed
	rra				; outermost bit = key space
	push af				; remember the value
	call nc, trexJump		; it's being pressed, then jump t-rex
	pop af

	halt

	jp mloop

trexJump:

	call 3503           ; ROM routine - clears screen, opens chan 2.
	halt
	halt
	halt
	ld hl, trex1                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw tne first cell (left uper coner)
        ld hl, $0C00			; at the bottom right of the screen
        ld (charCellCoord), hl		; load the coordinate to draw cell
        call copyCharCellAndAttrByteToScreen


	ld hl, trex2                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw the second cell (right uper coner)
        ld hl, $0C01		      ; at the bottom right of the screen
        ld (charCellCoord), hl	      ; load the coordinate to draw cell
        call copyCharCellAndAttrByteToScreen


	ld hl, trex3                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw tne third cell (left bottom coner)
        ld hl, $0D00                  ; at the bottom right of the screen
        ld (charCellCoord), hl        ; load the coordinate to draw cell
        call copyCharCellAndAttrByteToScreen


	ld hl, trex4                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw tne forth cell (right bottom coner)
        ld hl, $0D01                  ; at the bottom right of the screen
        ld (charCellCoord), hl        ; load the coordinate to draw cell
        call copyCharCellAndAttrByteToScreen

	halt
	halt
	halt

	call drawTrex
	ret

	


; Coordinates and addresses
keyCell: defb 24, 16, 24, 16, 24, 36, 36, 24    ; this is a key sprite
trex1: defb $00, $00, $00, $00, $00, $81, $83, $C7   
trex2: defb $7E, $DF, $FF, $FF, $F0, $FC, $E0, $E0 
trex3: defb $FF, $7F, $3F, $1F, $0D, $0C, $08, $0C
trex4: defb $F8, $E8, $E0, $C0, $80, $80, $80, $C0
keyAttr: defb $6D                               ; yellow

include "spriteRoutines.s"
