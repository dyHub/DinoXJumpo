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
        call updateCactuses
        ;;call checkCollision

	ei
        halt                            ; wait for interrupt to print our shit

        jp gameLoop


include "trex.s"
include "cactus.s"
include "collision.s" ;; Remove this to enable no-clip

