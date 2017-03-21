
        ;; 2. Init background drawing
init_game_multi:
	
	call 3503           ; ROM routine - clears screen, opens chan 2.

init_first_trex:

        ld hl, $0306
        ld (trex1), hl
        ld hl, $0406
        ld (trex2), hl
        ld hl, $0307
        ld (trex3), hl
        ld hl, $0407
        ld (trex4), hl
	
	;; running the left leg
	ld a, $0E
	ld (trex3+8), a

	ld a, $00
	ld (trex3+9), a

	ld a, $00
	ld (trex3+10), a

init_second_trex:

	ld hl, $0314
        ld (trex1_2), hl
        ld hl, $0414
        ld (trex2_2), hl
        ld hl, $0315
        ld (trex3_2), hl
        ld hl, $0415
        ld (trex4_2), hl
	

init_all_cactus:
        ld hl, $02ff
        ld (cactus_rng), hl

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

first_player_enemy:
	ld a, $06
	ld (bigCactus1_1), a
	ld (bigCactus1_4), a
	ld (bigCactus1_5), a
	ld a, $07
	ld (bigCactus2_1), a
	ld (bigCactus2_4), a
	ld (bigCactus2_5), a

second_player_enemy:
	ld a, $14
	ld (bigCactus1_2), a
	ld (bigCactus1_3), a
	ld (bigCactus1_6), a
	ld a, $15
	ld (bigCactus2_2), a
	ld (bigCactus2_3), a
	ld (bigCactus2_6), a
	

        ld hl, $1600                        ; h = row l = col
init_loop_sand2:

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
        jr nz, init_loop_sand_noresetcol2
        ld l, $00
        inc h                               ; inc row if hit last col
        jr init_loop_sand_checkrow2
init_loop_sand_noresetcol2:
        inc l                               ; inc col if not reseting col
init_loop_sand_checkrow2:

        ld a, $18                           ; check if last row, reset if needed
        cp h
        jr z, init_loop_sand_done2
        jp init_loop_sand2

init_loop_sand_done2:

        ld hl, $0800                        ; h = row l = col
init_loop_sand3:

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
        jr nz, init_loop_sand_noresetcol3
        ld l, $00
        inc h                               ; inc row if hit last col
        jr init_loop_sand_checkrow3
init_loop_sand_noresetcol3:
        inc l                               ; inc col if not reseting col
init_loop_sand_checkrow3:

        ld a, $0A                           ; check if last row, reset if needed
        cp h
        jr z, init_loop_sand_done3
        jp init_loop_sand3

init_loop_sand_done3:

        ;; sky
        ld hl, $0000                        ; h = row l = col

        ;; 3. draw inital trex and cactus
	call drawTrex1
	call drawTrex2
	;call drawCactuses

multiGameLoop:

        ;; 1. Listen for keys
	ld bc, 64510			; q key
	in a, (c)			; see if space key is pressed
	rra				; outermost bit = key space
	
        ;; 1a. If space is down, set the space_down field and jump the trex
        jr c, gameLoop_nospace2
        ld a, 1
        ld (trex_space_down1), a
	call jumpTrex1		        ; it's being pressed, then jump t-rex
        jr gameLoop_endcheckjump2
gameLoop_nospace2:
        ld a, 0
        ld (trex_space_down1), a
	
	ld bc, 57342			; p key
	in a, (c)			; see if space key is pressed
	rra				; outermost bit = key space
	
        ;; 1a. If space is down, set the space_down field and jump the trex
        jr c, gameLoop_nospace3
        ld a, 1
        ld (trex_space_down2), a
	call jumpTrex2		        ; it's being pressed, then jump t-rex
        jr gameLoop_endcheckjump2
gameLoop_nospace3:
        ld a, 0
        ld (trex_space_down2), a

gameLoop_endcheckjump2:

        ;; 2. Loop through all your sprites, and update them (hard coded logic for trex, cactus, etc...)
        call updateTrex1
	call updateTrex2

        call updateCactuses
        ;;call checkCollision
	call TrexCollision
	cp 0
	jr z, GameOver2

	ei
        halt                            ; wait for interrupt to print our shit

        jp multiGameLoop

GameOver2:
	call deathNoise

GameOver_loop2:
	call drawGameOver
 	;; 1. Listen for keys
	ld bc, 32766			; space key
	in a, (c)			; see if space key is pressed
	rra				; outermost bit = key space
	jr c, GameOver_end2

	ld b, 30
loophalt2:
	halt
	djnz loophalt2
	call init_game_multi		; it's being pressed, then jump t-rex
	ret

GameOver_end2:
	;di
	halt
	jp GameOver_loop2

deathNoise2:
	ld e,250            ; repeat 250 times.
       	ld hl,0             ; start pointer in ROM.
noise2x:
	push de
        ld b,32             ; length of step.
noise0x:
	push bc
       	ld a,(hl)           ; next "random" number.
       	inc hl              ; pointer.
       	and 248             ; we want a black border.
       	out (254),a         ; write to speaker.
       	ld a,e              ; as e gets smaller...
       	cpl                 ; ...we increase the delay.
noise1x:
	dec a               ; decrement loop counter.
       	jr nz,noise1x        ; delay loop.
       	pop bc
       	djnz noise0x         ; next step.
       	pop de
       	ld a,e
       	sub 24              ; size of step.
       	cp 30               ; end of range.
       	ret z
       	ret c
       	ld e,a
       	cpl
noise3x:
	ld b,40             ; silent period.
noise4x:
	djnz noise4x
       	dec a
       	jr nz,noise3x
       	jr noise2x

include 'trex_player2.s'
include 'trex_player1.s'


