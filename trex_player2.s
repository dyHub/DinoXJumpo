
;; ---- FUNCTION updateTrex -----
;;
;; draws the trex accordingly depending on if he is jumping, what direction he is in in the jump, etc
;;
updateTrex2:
        ;; 1. Check if he is jumping
        ld a, (trex_is_jumping2)
        cp 1                            ; check if 1 (jumping). z = 0 if jumping
        jp nz, updateTrex_nojump2        ; if not jumping, dont do anything
        
updateTrex_check_ctr2:
        ;; 2. if jumping, update the trex frame counter
        ld a, (trex_f2)
        ld b, a                         ; b = frequency to update trex if jumping
        ld a, (trex_f_ctr2)              ; a = frame counter
        cp b                            ; check if f_ctr == f
        jp nz, updateTrex_noupdate2
        ld a, 0                         ; if f_ctr == f, then reset f to 0
        ld (trex_f_ctr2), a              ; set trex_f_ctr = 0
        jr updateTrex_update2            ; yes, we need to move the trex this frame
updateTrex_noupdate2:
        inc a                           ; incremenet trex_f_ctr
        ld (trex_f_ctr2), a              ; set trex_f_ctr = a
        jp updateTrex_nojump2            ; dont need to do anything else, done

        ;; 2a. Since frame counter == update frequency, then we need to move trex
updateTrex_update2:

        ;; If jumping, check if space bar is off, then set dir to down
        ld a, (trex_space_down2)
        cp 0
        jp nz, updateTrex_checkdir2
        ld a, 0
        ld (trex_up_or_down2), a

updateTrex_checkdir2:
        ;; 2b. check which direction we should update him
        ld a, (trex_up_or_down2)
        cp 1                            ; check if trex_up_or_down is 1 (up). if so, z = 0
        jr nz, updateTrex_movedown2      ; if z != 0, then must move down

        ;; 2b-1. move up

        ;; draw sky on trex3 and trex4
        ld hl, sky+1
        ld (charCellAddress), hl
        ld hl, (sky)
        ld (attrByte), hl
        ld hl, (trex3_2)                  ; h = col, l = row
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ld hl, sky+1
        ld (charCellAddress), hl
        ld hl, (sky)
        ld (attrByte), hl
        ld hl, (trex4_2)                  ; h = col, l = row
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ;; move all the sprite coords one row less (up the screen)
        ld hl, (trex1_2)
        dec l
        ld (trex1_2), hl
        ld hl, (trex2_2)
        dec l
        ld (trex2_2), hl
        ld hl, (trex3_2)
        dec l
        ld (trex3_2), hl
        ld hl, (trex4_2)
        dec l
        ld (trex4_2), hl                      ; note: l = row for trex4

        ;; check if its at the top of the trajectory

        ld a, (trex_jump_height2)
        ld b, a                             ; b = trex_jump_height
        ld a, $15                           ; a = trex4 row start (1 row above the ground)

        sub b                               ; a = a - b  (the max height allowed)

        cp l                                ; check if trex4 row == max row allowed
        jp nz, updateTrex_endchangedir2
        ld a, $0B
        ld (trex_up_or_down2), a             ; set dir to down (0)
updateTrex_endchangedir2:
        ;; draw!!
        call drawTrex2

        jr updateTrex_checkifdone2       ; go see if we need to set is_jumping to false
updateTrex_movedown2:
        ;; 2b-2. move down

        ;; draw black on trex1 and trex2
        ld hl, sky+1
        ld (charCellAddress), hl
        ld hl, (sky)
        ld (attrByte), hl
        ld hl, (trex1_2)                  ; h = row, l = row
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ld hl, sky+1
        ld (charCellAddress), hl
        ld hl, (sky)
        ld (attrByte), hl
        ld hl, (trex2_2)                  ; h = col, l = row
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ;; move all the sprite coords one row more (down the screen)
        ld hl, (trex1_2)
        inc l
        ld (trex1_2), hl
        ld hl, (trex2_2)
        inc l
        ld (trex2_2), hl
        ld hl, (trex3_2)
        inc l
        ld (trex3_2), hl
        ld hl, (trex4_2)
        inc l
        ld (trex4_2), hl                      ; note: l = row for trex4

        ;; draw!!
        call drawTrex2

updateTrex_checkifdone2:
        ;; 2d. if his row coordinate is the same as the floor, set is_jumping to false

        ld hl, (trex4_2)                      ; h = col, l = row
        ld a, $15
        cp l                                ; check if trex4 row == ground row or trex4row > ground
        jr z, updateTrex_hitground2    
        jr c, updateTrex_hitground2
        jp updateTrex_jumpend
updateTrex_hitground2:
        
        ld hl, $0314
        ld (trex1_2), hl
        ld hl, $0414
        ld (trex2_2), hl
        ld hl, $0315
        ld (trex3_2), hl
        ld hl, $0415
        ld (trex4_2), hl 

        ;; draw sand on ground
        ld hl, sand+1
        ld (charCellAddress), hl
        ld hl, (sand)
        ld (attrByte), hl
        ld hl, $0316
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList
        ld hl, sand+1
        ld (charCellAddress), hl
        ld hl, (sand)
        ld (attrByte), hl
        ld hl, $0416
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ld a, $00
        ld (trex_is_jumping2), a             ; reset is_jumping to 0 (false)
        ld (trex_f_ctr2), a                  ; reset f_ctr to 0
updateTrex_nojump2:	
	
	ld a, (trex_run_f2)
	ld b, a
	ld a, (trex_run_f_ctr2)
	cp b				; f_ctr == f?
	jr nz, inc_run2			; if not, increment run

	;; running the left leg
	ld a, (trex3_2+8)
	xor $02
	ld (trex3_2+8), a

	ld a, (trex3_2+9)
	xor $08
	ld (trex3_2+9), a

	ld a, (trex3_2+10)
	xor $0C
	ld (trex3_2+10), a


	;; running the right leg
	ld a, (trex4_2+7)
	xor $60
	ld (trex4_2+7), a

	ld a, (trex4_2+8)
	xor $80
	ld (trex4_2+8), a

	ld a, (trex4_2+9)
	xor $80
	ld (trex4_2+9), a

	ld a, (trex4_2+10)
	xor $C0
	ld (trex4_2+10), a

	;; re-draw the trex
	call drawTrex2
	ld a, 0
	ld (trex_run_f_ctr2), a
	jr updateTrex_jumpend2

inc_run2:
	ld a, (trex_run_f_ctr2)
	inc a
	ld (trex_run_f_ctr2), a

updateTrex_jumpend2:
        ;; 3. Done
        ret


;; ---- FUNCTION updateTrex -----
;;
;; draws the trex accordingly depending on if he's jumping, what direction he's in in the jump, etc
;;
drawTrex2:


	ld hl, trex1_2+3                  ; hl = key cell's address
        ld (charCellAddress), hl        ; draw tne first cell (left uper coner)
	ld hl, (trex1_2)                  ; h = col, l = row
	ld (charCellCoord), hl
	ld hl, (trex1_2+2)
	ld (attrByte), hl
	call copyCharCellAndAttrByteToUpdateList

	ld hl, trex2_2+3                  ; hl = key cell's address
        ld (charCellAddress), hl        ; draw the second cell (right uper coner)
        ld hl, (trex2_2)		        ; at the bottom right of the screen
        ld (charCellCoord), hl	        ; load the coordinate to draw cell
	ld hl, (trex2_2+2)
	ld (attrByte), hl
	call copyCharCellAndAttrByteToUpdateList


	ld hl, trex3_2+3                  ; hl = key cell's address
        ld (charCellAddress), hl        ; draw tne third cell (left bottom coner)
        ld hl, (trex3_2)                  ; at the bottom right of the screen
        ld (charCellCoord), hl          ; load the coordinate to draw cell
	ld hl, (trex3_2+2)
	ld (attrByte), hl
	call copyCharCellAndAttrByteToUpdateList


	ld hl, trex4_2+3                  ; hl = key cell's address
        ld (charCellAddress), hl        ; draw tne forth cell (right bottom coner)
        ld hl, (trex4_2)                  ; at the bottom right of the screen
        ld (charCellCoord), hl          ; load the coordinate to draw cell
	ld hl, (trex4_2+2)
	ld (attrByte), hl
	call copyCharCellAndAttrByteToUpdateList

	ret

;; ---- FUNCTION updateTrex -----
;;
;; draws the trex accordingly depending on if he's jumping, what direction he's in in the jump, etc
;;

jumpTrex2:

        ;; 1. if already jumping, ignore request
        ld a, (trex_is_jumping2)
        cp 1                        ; if jumping, then z flag is 0
        jr z, jumpTrex_end2

	  
	;; play the sound when jump	
	ld hl,860           ; pitch.
       	ld de,15           ; duration.
       	call 949            ; ROM beeper routine.


        ;; 2. set set state to jumping. updateTrex will take care of actually jumping him
        ld a, $01
        ld (trex_is_jumping2), a     ; is_jumping = 1
        ld (trex_up_or_down2), a     ; up_or_down = up (1)

jumpTrex_end2:
        ret
