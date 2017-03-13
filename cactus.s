drawCactus:

	ld hl, smallTree1                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw tne forth cell (right bottom coner)
        ld hl, $0810                  ; at the bottom right of the screen
        ld (charCellCoord), hl        ; load the coordinate to draw cell
	call copyCharCellAndAttrByteToUpdateList	


	ld hl, bigTree1                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw tne first cell (left uper coner)
	ld hl, $090F
	ld (charCellCoord), hl		; (row = 0F, col = 00)
	call copyCharCellAndAttrByteToUpdateList	


	ld hl, bigTree2                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw the second cell (right uper coner)
        ld hl, $0910		      ; at the bottom right of the screen
        ld (charCellCoord), hl	      ; load the coordinate to draw cell
	call copyCharCellAndAttrByteToUpdateList	


	ld hl, smallTree1                   ; hl = key cell's address
        ld (charCellAddress), hl      ; draw tne third cell (left bottom coner)
        ld hl, $1110                  ; at the bottom right of the screen
        ld (charCellCoord), hl        ; load the coordinate to draw cell
	call copyCharCellAndAttrByteToUpdateList	

		ld hl, bigTree1                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw tne first cell (left uper coner)
	ld hl, $120F
	ld (charCellCoord), hl		; (row = 0F, col = 00)
	call copyCharCellAndAttrByteToUpdateList	


	ld hl, bigTree2                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw the second cell (right uper coner)
        ld hl, $1210		      ; at the bottom right of the screen
        ld (charCellCoord), hl	      ; load the coordinate to draw cell
	call copyCharCellAndAttrByteToUpdateList	


	ld hl, smallTree2                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw tne forth cell (right bottom coner)
        ld hl, $1310                  ; at the bottom right of the screen
        ld (charCellCoord), hl        ; load the coordinate to draw cell
	call copyCharCellAndAttrByteToUpdateList	
	
	ld hl, bigTree1                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw tne first cell (left uper coner)
	ld hl, $1A0F
	ld (charCellCoord), hl		; (row = 0F, col = 00)
	call copyCharCellAndAttrByteToUpdateList	


	ld hl, bigTree2                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw the second cell (right uper coner)
        ld hl, $1A10		      ; at the bottom right of the screen
        ld (charCellCoord), hl	      ; load the coordinate to draw cell
	call copyCharCellAndAttrByteToUpdateList	

	ret
	
bigTree1: defb $18, $18, $18, $18, $18, $1B, $1B, $DB
bigTree2: defb $DF, $FF, $FF, $18, $18, $18, $18, $18
smallTree1: defb $18, $58, $58, $58, $7A, $1A, $1E, $18 
smallTree2: defb $18, $18, $5A, $5A, $7E, $18, $18, $18
