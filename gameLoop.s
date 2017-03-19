        ;; 1. Set trex1=$000F, trex2=$010F, trex3=$0010, trex4=$0110
        ;ld hl, $030F                ; h = col, l = row
        ;ld (trex1), hl

        ;ld hl, $040F
        ;ld (trex2), hl

        ;ld hl, $0310
        ;ld (trex3), hl

        ;ld hl, $0410
        ;ld (trex4), hl

        ;; 2. Init background drawing
init_game:
        ;; sand
	
	ld a, $1f
	ld (bigCactus1_1+1), a
	ld (bigCactus2_1+1), a

	ld (bigCactus1_2+1), a
	ld (bigCactus2_2+1), a

	ld (bigCactus1_3+1), a
	ld (bigCactus2_3+1), a

	ld (bigCactus1_4+1), a
	ld (bigCactus2_4+1), a

	ld (bigCactus1_5+1), a
	ld (bigCactus2_5+1), a

        ld hl, $1100                        ; h = row l = col
init_loop_sand:

        ld bc, sand+1                       ; bc = address of sand char cell
        ld (charCellAddress), bc
        ld (charCellCoord), hl
        ld bc, sand
        ld (attrByteAddress), bc
        push hl
        call copyCharCellAndAttrByteToScreen
        pop hl

        ld a, $1f                           ; check if last col, reset if needed
        cp l
        jr nz, init_loop_sand_noresetcol
        ld l, $00
        inc h                               ; inc row if hit last col
        jr init_loop_sand_checkrow
init_loop_sand_noresetcol:
        inc l                               ; inc col if not reseting col
init_loop_sand_checkrow:

        ld a, $18                           ; check if last row, reset if needed
        cp h
        jr z, init_loop_sand_done
        jp init_loop_sand

init_loop_sand_done:

        ;; sky
        ld hl, $0000                        ; h = row l = col
init_loop_sky:

        ld bc, sky+1                       ; bc = address of sand char cell
        ld (charCellAddress), bc
        ld (charCellCoord), hl
        ld bc, sky
        ld (attrByteAddress), bc
        push hl
        call copyCharCellAndAttrByteToScreen
        pop hl

        ld a, $1f                           ; check if last col, reset if needed
        cp l
        jr nz, init_loop_sky_noresetcol
        ld l, $00
        inc h                               ; inc row if hit last col
        jr init_loop_sky_checkrow
init_loop_sky_noresetcol:
        inc l                               ; inc col if not reseting col
init_loop_sky_checkrow:

        ld a, $11                           ; check if last row, reset if needed
        cp h
        jr z, init_loop_sky_done
        jp init_loop_sky

init_loop_sky_done:


        ;; clouds
        ld hl, cloud1+3
        ld (charCellAddress), hl
        ld hl, (cloud1)
        ld (charCellCoord), hl
        ld hl, cloud1+2
        ld (attrByteAddress), hl
        call copyCharCellAndAttrByteToScreen

        ld hl, cloud2+3
        ld (charCellAddress), hl
        ld hl, (cloud2)
        ld (charCellCoord), hl
        ld hl, cloud2+2
        ld (attrByteAddress), hl
        call copyCharCellAndAttrByteToScreen

        ;; 3. draw inital trex and cactus
	call drawTrex
	;call drawCactuses
        call drawScore

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
        call updateCactuses
        ;;call checkCollision
	call TrexCollision
	cp 0
	jr z, GameOver
        call updateScore

	ei
        halt                            ; wait for interrupt to print our shit

        jp gameLoop

GameOver:

 	;; 1. Listen for keys
	ld bc, 32766			; space key
	in a, (c)			; see if space key is pressed
	rra				; outermost bit = key space
	jr c, GameOver_end
	
	ld b, 30
loophalt:
	halt
	djnz loophalt
	call init_game		; it's being pressed, then jump t-rex
	ret

GameOver_end:
	;di
	halt
	jp GameOver


include "trex.s"
include "cactus.s"
include "collision.s" ;; Remove this to enable no-clip
include "score.s"
include "random.s"
include "collisionCheck.s"
