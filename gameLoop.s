        ;; 1. Set trex1=$000F, trex2=$010F, trex3=$0010, trex4=$0110
        ld hl, $000F                ; h = col, l = row
        ld (trex1), hl

        ld hl, $010F
        ld (trex2), hl

        ld hl, $0010
        ld (trex3), hl

        ld hl, $0110
        ld (trex4), hl

	call drawTrex
	call drawCactus

gameLoop:

        ;; 1. Listen for keys

	ld bc, 32766			; space key
	in a, (c)			; see if space key is pressed
	rra				; outermost bit = key space
	push af				; remember the value
	call nc, jumpTrex		; it's being pressed, then jump t-rex
	pop af

        ;; 2. Loop through all your sprites, and update them (hard coded logic for trex, cactus, etc...)
        call updateTrex

	ei
        halt                            ; wait for interrupt to print our shit

        jp gameLoop


;; ---- FUNCTION updateTrex -----
;;
;; draws the trex accordingly depending on if he's jumping, what direction he's in in the jump, etc
;;
updateTrex:
        ;; 1. Check if he's jumping
        ld a, (trex_is_jumping)
        cp 1                            ; check if 1 (jumping). z = 0 if jumping
        jp nz, updateTrex_nojump        ; if not jumping, dont do anything

        ;; 2. if jumping, update the trex frame counter
        ld a, (trex_f)
        ld b, a                         ; b = frequency to update trex if jumping
        ld a, (trex_f_ctr)              ; a = frame counter
        cp b                            ; check if f_ctr == f
        jp nz, updateTrex_noupdate
        ld a, 0                         ; if f_ctr == f, then reset f to 0
        ld (trex_f_ctr), a              ; set trex_f_ctr = 0
        jr updateTrex_update            ; yes, we need to move the trex this frame
updateTrex_noupdate:
        inc a                           ; incremenet trex_f_ctr
        ld (trex_f_ctr), a              ; set trex_f_ctr = a
        jp updateTrex_nojump            ; dont need to do anything else, done

        ;; 2a. Since frame counter == update frequency, then we need to move trex
updateTrex_update:
        ;; 2b. check which direction we should update him
        ld a, (trex_up_or_down)
        cp 1                            ; check if trex_up_or_down is 1 (up). if so, z = 0
        jr nz, updateTrex_movedown      ; if z != 0, then must move down

        ;; 2b-1. move up

        ;; draw black on trex3 and trex4
        ld hl, black
        ld (charCellAddress), hl
        ld hl, (trex3)                  ; h = col, l = row
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ld hl, black
        ld (charCellAddress), hl
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

        ld a, (trex_jump_height)
        ld b, a                             ; b = trex_jump_height
        ld a, $10                           ; a = trex4 row start (1 row above the ground)

        sub b                               ; a = a - b  (the max height allowed)

        cp l                                ; check if trex4 row == max row allowed
        jp nz, updateTrex_endchangedir
        ld a, $00
        ld (trex_up_or_down), a             ; set dir to down (0)
updateTrex_endchangedir:
        ;; draw!!
        call drawTrex

        jr updateTrex_checkifdone       ; go see if we need to set is_jumping to false
updateTrex_movedown:
        ;; 2b-2. move down

        ;; draw black on trex1 and trex2
        ld hl, black
        ld (charCellAddress), hl
        ld hl, (trex1)                  ; h = row, l = row
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ld hl, black
        ld (charCellAddress), hl
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
        call drawTrex

updateTrex_checkifdone:
        ;; 2d. if his row coordinate is the same as the floor, set is_jumping to false

        ld hl, (trex4)                      ; h = col, l = row
        ld a, $10
        cp l                                ; check if trex4 row == ground row
        jr nz, updateTrex_nojump
        ld a, $00
        ld (trex_is_jumping), a             ; reset is_jumping to 0 (false)
        ld (trex_f_ctr), a                  ; reset f_ctr to 0
updateTrex_nojump:
        ;; 3. Done
        ret



;; ---- FUNCTION updateTrex -----
;;
;; draws the trex accordingly depending on if he's jumping, what direction he's in in the jump, etc
;;
drawTrex:


	ld hl, trex1+3                  ; hl = key cell's address
  ld (charCellAddress), hl      ; draw tne first cell (left uper coner)
	ld hl, (trex1)                  ; h = row, l = col

	ld (charCellCoord), hl		; (row = 0F, col = 00)
	call copyCharCellAndAttrByteToUpdateList

	ld hl, trex2+3                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw the second cell (right uper coner)
        ld hl, (trex2)		      ; at the bottom right of the screen
        ld (charCellCoord), hl	      ; load the coordinate to draw cell
	call copyCharCellAndAttrByteToUpdateList


	ld hl, trex3+3                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw tne third cell (left bottom coner)
        ld hl, (trex3)                  ; at the bottom right of the screen
        ld (charCellCoord), hl        ; load the coordinate to draw cell
	call copyCharCellAndAttrByteToUpdateList


	ld hl, trex4+3                  ; hl = key cell's address
        ld (charCellAddress), hl      ; draw tne forth cell (right bottom coner)
        ld hl, (trex4)                  ; at the bottom right of the screen
        ld (charCellCoord), hl        ; load the coordinate to draw cell
	call copyCharCellAndAttrByteToUpdateList

	ret

;; ---- FUNCTION updateTrex -----
;;
;; draws the trex accordingly depending on if he's jumping, what direction he's in in the jump, etc
;;

jumpTrex:
        ;; 1. if already jumping, ignore request
        ld a, (trex_is_jumping)
        cp 1                        ; if jumping, then z flag is 0
        jr z, jumpTrex_end

        ;; 2. set set state to jumping. updateTrex will take care of actually jumping him
        ld a, $01
        ld (trex_is_jumping), a     ; is_jumping = 1
        ld (trex_up_or_down), a     ; up_or_down = up (1)

jumpTrex_end:
        ret

drawCactus:
  ld hl, bigCactus1+ 3               ; hl = key cell's address
  ld (charCellAddress), hl      ; draw tne first cell (upper part)
  ld hl, (bigCactus1)
  ld (charCellCoord), hl    ;
  call copyCharCellAndAttrByteToUpdateList

  ld hl, bigCactus2+ 3                ; hl = key cell's address
  ld (charCellAddress), hl      ; draw tne first cell (lower part)
  ld hl, (bigCactus2)
  ld (charCellCoord), hl    ; (row = 0F, col = 10)
  call copyCharCellAndAttrByteToUpdateList

  ret

