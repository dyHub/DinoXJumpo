;; function --------- TrexCollision ------
TrexCollision:
        ;; Loop through each cactus, checking for collision

checkCactus1Bottom:

        ld a, (bigCactus2_1+11)
        cp 1                                ; if it is on then check collision
        jp nz, checkCactus2Bottom           ; if it is not on, check collision with cactus2 

        ;; check if column collides with bottom cactus part
        ld hl, (bigCactus2_1)		    ; h <-- holds col for cactus, l <-- row for cactus

	ld a, (trex4+1)
        cp h                                ; is h (col) == 0?
        jr nz, checkTrex3forCactus1Bottom	

	;; check if row collides
	ld a, (trex4)
	cp l
	jr z, cactus1Collides

	;call cactus1Collides


checkTrex3forCactus1Bottom:
	;; if trex left bottom row collides with cactus 1 bottom
	ld a, (trex3+1)
        cp h                                ; is h (col) == 0?
        jr nz, checkCactus1Top	

	;; check if row collides
	ld a, (trex3)
	cp l
	jr z, cactus1Collides

	;call cactus1Collides

	
checkCactus1Top:

 	ld a, (bigCactus1_1+11)
        cp 1                                ; if it is on then check collision
        jp nz, checkCactus2Bottom           ; if it is not on, check collision with cactus2 

        ;; check if column collides with top cactus part
        ld hl, (bigCactus1_1)		    ; h <-- holds row for cactus, l <-- col for cactus

	ld a, (trex4+1)
        cp h                                ; is h (col) == 0?
        jr nz, checkTrex3forCactus1Top	

	;; check if row collides
	ld a, (trex4)
	cp l
	jr z, cactus1Collides

	;call cactus1Collides


checkTrex3forCactus1Top:
	;; if trex left bottom row collides with cactus 1 bottom
	ld a, (trex3+1)
        cp h                                ; is h (col) == 0?
        jr nz, checkCactus2Bottom	

	;; check if row collides
	ld a, (trex3)
	cp l
	jr nz, checkCactus2Bottom


cactus1Collides:
	
	;; it collides with the trex, return and GameOver
        ld a, 0
	ld (bigCactus1_1+11), a
	ld (bigCactus2_1+11), a
	ret

	
checkCactus2Bottom:
	
	call notCollides
		

notCollides:
	ld a, 1
	ret

        
