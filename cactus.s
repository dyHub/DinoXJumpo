
drawCactus:

        ld hl, bigCactus1+ 3                ; hl = key cell's address
        ld (charCellAddress), hl            ; draw tne first cell (upper part)
        ld hl, (bigCactus1)
        ld (charCellCoord), hl    
        call copyCharCellAndAttrByteToUpdateList

        ld hl, bigCactus2+ 3                ; hl = key cell's address
        ld (charCellAddress), hl            ; draw tne first cell (lower part)
        ld hl, (bigCactus2)
        ld (charCellCoord), hl              
        call copyCharCellAndAttrByteToUpdateList

        ret


updateCactuses:
        ld a, (cactus_f)
        ld b, a                         ; b = frame frequencey to update sprite
        ld a, (cactus_f_ctr)            ; a = frame counter
        cp b                            ; check if f_ctr == f
        jp nz, updateCactuses_noupdate
        ld a, 0                         ; if f_ctr == f, then reset f to 0
        ld (cactus_f_ctr), a            ; set f_ctr = 0
        jr updateCactuses_update        ; yes, we need to move the sprite this frame
updateCactuses_noupdate:
        inc a                           ; incremenet f_ctr
        ld (cactus_f_ctr), a            ; set f_ctr = a
        jp updateCactuses_end           ; dont need to do anything else, done

        ;; 2a. Since frame counter == update frequency, then we need to move sprite
updateCactuses_update:

        ;; draw black on bigCactus1 and bigCactus2
        ld hl, black
        ld (charCellAddress), hl
        ld hl, (bigCactus1)                     ; h = col, l = row
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ld hl, black
        ld (charCellAddress), hl
        ld hl, (bigCactus2)                     ; h = col, l = row
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ;; move all the sprite coords one col less (to the left of the screen)
        ld hl, (bigCactus1)
        dec h
        ld (bigCactus1), hl
        ld hl, (bigCactus2)
        dec h
        ld (bigCactus2), hl
        
        ;; draw!!
        call drawCactus
        
        ;; 2b. check if it hits col $0
        ld hl, (bigCactus1)
        ld a, $00
        cp h                                ; is h (col) == 0?
        jr nz, updateCactuses_end
        ;; 2b-1. if it hit left side
        ld a, $20
        ld (bigCactus1+1), a
        ld (bigCactus2+1), a
        
updateCactuses_end:
        ret




drawCactus_temp:

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
	
