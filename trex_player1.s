
;; ---- FUNCTION updateTrex -----
;;
;; draws the trex accordingly depending on if he is jumping, what direction he is in in the jump, etc
;;
updateTrex1:
        ;; 1. Check if he is jumping
        ld a, (trex_is_jumping1)
        cp 1                            ; check if 1 (jumping). z = 0 if jumping
        jp nz, updateTrex_nojump1        ; if not jumping, dont do anything
        
updateTrex_check_ctr1:
        ;; 2. if jumping, update the trex frame counter
        ld a, (trex_f1)
        ld b, a                         ; b = frequency to update trex if jumping
        ld a, (trex_f_ctr1)              ; a = frame counter
        cp b                            ; check if f_ctr == f
        jp nz, updateTrex_noupdate1
        ld a, 0                         ; if f_ctr == f, then reset f to 0
        ld (trex_f_ctr1), a              ; set trex_f_ctr = 0
        jr updateTrex_update1            ; yes, we need to move the trex this frame
updateTrex_noupdate1:
        inc a                           ; incremenet trex_f_ctr
        ld (trex_f_ctr1), a              ; set trex_f_ctr = a
        jp updateTrex_nojump1            ; dont need to do anything else, done

        ;; 2a. Since frame counter == update frequency, then we need to move trex
updateTrex_update1:

        ;; If jumping, check if space bar is off, then set dir to down
        ld a, (trex_space_down1)
        cp 0
        jp nz, updateTrex_checkdir1
        ld a, 0
        ld (trex_up_or_down1), a

updateTrex_checkdir1:
        ;; 2b. check which direction we should update him
        ld a, (trex_up_or_down1)
        cp 1                            ; check if trex_up_or_down is 1 (up). if so, z = 0
        jr nz, updateTrex_movedown1      ; if z != 0, then must move down

        ;; 2b-1. move up

        ;; draw sky on trex3 and trex4
        ld hl, sky+1
        ld (charCellAddress), hl
        ld hl, (sky)
        ld (attrByte), hl
        ld hl, (trex3)                  ; h = col, l = row
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ld hl, sky+1
        ld (charCellAddress), hl
        ld hl, (sky)
        ld (attrByte), hl
        ld hl, (trex4)                  ; h = col, l = row
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ;; move all the sprite coords one row less (up the screen)
        ld hl, (trex1)
        dec l
        ld (trex1), hl
        ld hl, (trex2)
        dec l
        ld (trex2), hl
        ld hl, (trex3)
        dec l
        ld (trex3), hl
        ld hl, (trex4)
        dec l
        ld (trex4), hl                      ; note: l = row for trex4

        ;; check if its at the top of the trajectory

        ld a, (trex_jump_height1)
        ld b, a                             ; b = trex_jump_height
        ld a, $07                           ; a = trex4 row start (1 row above the ground)

        sub b                               ; a = a - b  (the max height allowed)

        cp l                                ; check if trex4 row == max row allowed
        jp nz, updateTrex_endchangedir1
        ld a, $00
        ld (trex_up_or_down1), a             ; set dir to down (0)
updateTrex_endchangedir1:
        ;; draw!!
        call drawTrex1

        jr updateTrex_checkifdone1       ; go see if we need to set is_jumping to false
updateTrex_movedown1:
        ;; 2b-2. move down

        ;; draw black on trex1 and trex2
        ld hl, sky+1
        ld (charCellAddress), hl
        ld hl, (sky)
        ld (attrByte), hl
        ld hl, (trex1)                  ; h = row, l = row
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ld hl, sky+1
        ld (charCellAddress), hl
        ld hl, (sky)
        ld (attrByte), hl
        ld hl, (trex2)                  ; h = col, l = row
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ;; move all the sprite coords one row more (down the screen)
        ld hl, (trex1)
        inc l
        ld (trex1), hl
        ld hl, (trex2)
        inc l
        ld (trex2), hl
        ld hl, (trex3)
        inc l
        ld (trex3), hl
        ld hl, (trex4)
        inc l
        ld (trex4), hl                      ; note: l = row for trex4

        ;; draw!!
        call drawTrex1

updateTrex_checkifdone1:
        ;; 2d. if his row coordinate is the same as the floor, set is_jumping to false

        ld hl, (trex4)                      ; h = col, l = row
        ld a, $07
        cp l                                ; check if trex4 row == ground row or trex4row > ground
        jr z, updateTrex_hitground1    
        jr c, updateTrex_hitground1
        jp updateTrex_jumpend1
updateTrex_hitground1:
        
        ld hl, $0306
        ld (trex1), hl
        ld hl, $0406
        ld (trex2), hl
        ld hl, $0307
        ld (trex3), hl
        ld hl, $0407
        ld (trex4), hl 

        ;; draw sand on ground
        ld hl, sand+1
        ld (charCellAddress), hl
        ld hl, (sand)
        ld (attrByte), hl
        ld hl, $0308
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList
        ld hl, sand+1
        ld (charCellAddress), hl
        ld hl, (sand)
        ld (attrByte), hl
        ld hl, $0408
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ld a, $00
        ld (trex_is_jumping1), a             ; reset is_jumping to 0 (false)
        ld (trex_f_ctr1), a                  ; reset f_ctr to 0
updateTrex_nojump1:	
	
	ld a, (trex_run_f1)
	ld b, a
	ld a, (trex_run_f_ctr1)
	cp b				; f_ctr == f?
	jr nz, inc_run1			; if not, increment run

	;; running the left leg
	ld a, (trex3+8)
	xor $02
	ld (trex3+8), a

	ld a, (trex3+9)
	xor $08
	ld (trex3+9), a

	ld a, (trex3+10)
	xor $0C
	ld (trex3+10), a


	;; running the right leg
	ld a, (trex4+7)
	xor $60
	ld (trex4+7), a

	ld a, (trex4+8)
	xor $80
	ld (trex4+8), a

	ld a, (trex4+9)
	xor $80
	ld (trex4+9), a

	ld a, (trex4+10)
	xor $C0
	ld (trex4+10), a

	;; re-draw the trex
	call drawTrex1
	ld a, 0
	ld (trex_run_f_ctr1), a
	jr updateTrex_jumpend1

inc_run1:
	ld a, (trex_run_f_ctr1)
	inc a
	ld (trex_run_f_ctr1), a

updateTrex_jumpend1:
        ;; 3. Done
        ret


;; ---- FUNCTION updateTrex -----
;;
;; draws the trex accordingly depending on if he's jumping, what direction he's in in the jump, etc
;;
drawTrex1:


	ld hl, trex1+3                  ; hl = key cell's address
        ld (charCellAddress), hl        ; draw tne first cell (left uper coner)
	ld hl, (trex1)                  ; h = col, l = row
	ld (charCellCoord), hl
	ld hl, (trex1+2)
	ld (attrByte), hl
	call copyCharCellAndAttrByteToUpdateList

	ld hl, trex2+3                  ; hl = key cell's address
        ld (charCellAddress), hl        ; draw the second cell (right uper coner)
        ld hl, (trex2)		        ; at the bottom right of the screen
        ld (charCellCoord), hl	        ; load the coordinate to draw cell
	ld hl, (trex2+2)
	ld (attrByte), hl
	call copyCharCellAndAttrByteToUpdateList


	ld hl, trex3+3                  ; hl = key cell's address
        ld (charCellAddress), hl        ; draw tne third cell (left bottom coner)
        ld hl, (trex3)                  ; at the bottom right of the screen
        ld (charCellCoord), hl          ; load the coordinate to draw cell
	ld hl, (trex3+2)
	ld (attrByte), hl
	call copyCharCellAndAttrByteToUpdateList


	ld hl, trex4+3                  ; hl = key cell's address
        ld (charCellAddress), hl        ; draw tne forth cell (right bottom coner)
        ld hl, (trex4)                  ; at the bottom right of the screen
        ld (charCellCoord), hl          ; load the coordinate to draw cell
	ld hl, (trex4+2)
	ld (attrByte), hl
	call copyCharCellAndAttrByteToUpdateList

	ret

;; ---- FUNCTION updateTrex -----
;;
;; draws the trex accordingly depending on if he's jumping, what direction he's in in the jump, etc
;;

jumpTrex1:

        ;; 1. if already jumping, ignore request
        ld a, (trex_is_jumping1)
        cp 1                        ; if jumping, then z flag is 0
        jr z, jumpTrex_end1

	  
	;; play the sound when jump	
	ld hl,860           ; pitch.
       	ld de,15           ; duration.
       	call 949            ; ROM beeper routine.


        ;; 2. set set state to jumping. updateTrex will take care of actually jumping him
        ld a, $01
        ld (trex_is_jumping1), a     ; is_jumping = 1
        ld (trex_up_or_down1), a     ; up_or_down = up (1)

jumpTrex_end1:
        ret
