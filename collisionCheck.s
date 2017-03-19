;; function --------- TrexCollision ------
TrexCollision:
        ;; Loop through each cactus, checking for collision

;; CHECK THE FIRST CACTUS FOR COLLISION
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
	
	ld a, $1f
	ld (bigCactus1_1+1), a
	ld (bigCactus2_1+1), a
	;; it collides with the trex, return and GameOver
        ld a, 0
	ld (bigCactus1_1+11), a
	ld (bigCactus2_1+11), a

	ret

	
;; CHECK THE SECOND CACTUS FOR COLLISION
checkCactus2Bottom:
	
        ld a, (bigCactus2_2+11)
        cp 1                                ; if it is on then check collision
        jp nz, checkCactus3Bottom           ; if it is not on, check collision with cactus2 

        ;; check if column collides with bottom cactus part
        ld hl, (bigCactus2_2)		    ; h <-- holds col for cactus, l <-- row for cactus

	ld a, (trex4+1)
        cp h                                ; is h (col) == 0?
        jr nz, checkTrex3forCactus2Bottom	

	;; check if row collides
	ld a, (trex4)
	cp l
	jr z, cactus2Collides


checkTrex3forCactus2Bottom:
	;; if trex left bottom row collides with cactus 2 bottom
	ld a, (trex3+1)
        cp h                                ; is h (col) == 0?
        jr nz, checkCactus2Top	

	;; check if row collides
	ld a, (trex3)
	cp l
	jr z, cactus2Collides

	
checkCactus2Top:

 	ld a, (bigCactus1_2+11)
        cp 1                                ; if it is on then check collision
        jp nz, checkCactus3Bottom           ; if it is not on, check collision with cactus2 

        ;; check if column collides with top cactus part
        ld hl, (bigCactus1_2)		    ; h <-- holds row for cactus, l <-- col for cactus

	ld a, (trex4+1)
        cp h                                ; is h (col) == 0?
        jr nz, checkTrex3forCactus2Top	

	;; check if row collides
	ld a, (trex4)
	cp l
	jr z, cactus2Collides


checkTrex3forCactus2Top:
	;; if trex left bottom row collides with cactus 2 bottom
	ld a, (trex3+1)
        cp h                                ; is h (col) == 0?
        jr nz, checkCactus3Bottom	

	;; check if row collides
	ld a, (trex3)
	cp l
	jr nz, checkCactus3Bottom


cactus2Collides:

	ld a, $1f
	ld (bigCactus1_2+1), a
	ld (bigCactus2_2+1), a

	;; it collides with the trex, return and GameOver
        ld a, 0
	ld (bigCactus1_2+11), a
	ld (bigCactus2_2+11), a
	ret


;; CHECK THE THIRD CACTUS FOR COLLISION
checkCactus3Bottom:
	
        ld a, (bigCactus2_3+11)
        cp 1                                ; if it is on then check collision
        jp nz, checkCactus4Bottom           ; if it is not on, check collision with cactus2 

        ;; check if column collides with bottom cactus part
        ld hl, (bigCactus2_3)		    ; h <-- holds col for cactus, l <-- row for cactus

	ld a, (trex4+1)
        cp h                                ; is h (col) == 0?
        jr nz, checkTrex3forCactus3Bottom	

	;; check if row collides
	ld a, (trex4)
	cp l
	jr z, cactus3Collides


checkTrex3forCactus3Bottom:
	;; if trex left bottom row collides with cactus 3 bottom
	ld a, (trex3+1)
        cp h                                ; is h (col) == 0?
        jr nz, checkCactus3Top	

	;; check if row collides
	ld a, (trex3)
	cp l
	jr z, cactus3Collides

	
checkCactus3Top:

 	ld a, (bigCactus1_3+11)
        cp 1                                ; if it is on then check collision
        jp nz, checkCactus4Bottom           ; if it is not on, check collision with cactus2 

        ;; check if column collides with top cactus part
        ld hl, (bigCactus1_3)		    ; h <-- holds row for cactus, l <-- col for cactus

	ld a, (trex4+1)
        cp h                                ; is h (col) == 0?
        jr nz, checkTrex3forCactus3Top	

	;; check if row collides
	ld a, (trex4)
	cp l
	jr z, cactus3Collides


checkTrex3forCactus3Top:
	;; if trex left bottom row collides with cactus 3 bottom
	ld a, (trex3+1)
        cp h                                ; is h (col) == 0?
        jr nz, checkCactus4Bottom	

	;; check if row collides
	ld a, (trex3)
	cp l
	jr nz, checkCactus4Bottom


cactus3Collides:
	
	ld a, $1f
	ld (bigCactus1_3+1), a
	ld (bigCactus2_3+1), a

	;; it collides with the trex, return and GameOver
        ld a, 0
	ld (bigCactus1_3+11), a
	ld (bigCactus2_3+11), a
	ret


	
;; CHECK THE FOUTH CACTUS FOR COLLISION
checkCactus4Bottom:
	
        ld a, (bigCactus2_4+11)
        cp 1                                ; if it is on then check collision
        jp nz, checkCactus5Bottom           ; if it is not on, check collision with cactus2 

        ;; check if column collides with bottom cactus part
        ld hl, (bigCactus2_4)		    ; h <-- holds col for cactus, l <-- row for cactus

	ld a, (trex4+1)
        cp h                                ; is h (col) == 0?
        jr nz, checkTrex3forCactus4Bottom	

	;; check if row collides
	ld a, (trex4)
	cp l
	jr z, cactus4Collides


checkTrex3forCactus4Bottom:
	;; if trex left bottom row collides with cactus 3 bottom
	ld a, (trex3+1)
        cp h                                ; is h (col) == 0?
        jr nz, checkCactus4Top	

	;; check if row collides
	ld a, (trex3)
	cp l
	jr z, cactus4Collides

	
checkCactus4Top:

 	ld a, (bigCactus1_4+11)
        cp 1                                ; if it is on then check collision
        jp nz, checkCactus5Bottom           ; if it is not on, check collision with cactus2 

        ;; check if column collides with top cactus part
        ld hl, (bigCactus1_4)		    ; h <-- holds row for cactus, l <-- col for cactus

	ld a, (trex4+1)
        cp h                                ; is h (col) == 0?
        jr nz, checkTrex3forCactus4Top	

	;; check if row collides
	ld a, (trex4)
	cp l
	jr z, cactus4Collides


checkTrex3forCactus4Top:
	;; if trex left bottom row collides with cactus 3 bottom
	ld a, (trex3+1)
        cp h                                ; is h (col) == 0?
        jr nz, checkCactus5Bottom	

	;; check if row collides
	ld a, (trex3)
	cp l
	jr nz, checkCactus5Bottom


cactus4Collides:
	
	ld a, $1f
	ld (bigCactus1_4+1), a
	ld (bigCactus2_4+1), a

	;; it collides with the trex, return and GameOver
        ld a, 0
	ld (bigCactus1_4+11), a
	ld (bigCactus2_4+11), a
	ret

;; CHECK THE FIFTH CACTUS FOR COLLISION
checkCactus5Bottom:

        ld a, (bigCactus2_5+11)
        cp 1                                ; if it is on then check collision
        jp nz, notCollides           ; if it is not on, check collision with cactus2 

        ;; check if column collides with bottom cactus part
        ld hl, (bigCactus2_5)		    ; h <-- holds col for cactus, l <-- row for cactus

	ld a, (trex4+1)
        cp h                                ; is h (col) == 0?
        jr nz, checkTrex3forCactus5Bottom	

	;; check if row collides
	ld a, (trex4)
	cp l
	jr z, cactus5Collides


checkTrex3forCactus5Bottom:
	;; if trex left bottom row collides with cactus 3 bottom
	ld a, (trex3+1)
        cp h                                ; is h (col) == 0?
        jr nz, checkCactus5Top	

	;; check if row collides
	ld a, (trex3)
	cp l
	jr z, cactus5Collides

	
checkCactus5Top:

 	ld a, (bigCactus1_5+11)
        cp 1                                ; if it is on then check collision
        jp nz, notCollides           ; if it is not on, check collision with cactus2 

        ;; check if column collides with top cactus part
        ld hl, (bigCactus1_5)		    ; h <-- holds row for cactus, l <-- col for cactus

	ld a, (trex4+1)
        cp h                                ; is h (col) == 0?
        jr nz, checkTrex3forCactus5Top	

	;; check if row collides
	ld a, (trex4)
	cp l
	jr z, cactus5Collides


checkTrex3forCactus5Top:
	;; if trex left bottom row collides with cactus 3 bottom
	ld a, (trex3+1)
        cp h                                ; is h (col) == 0?
        jr nz, notCollides	

	;; check if row collides
	ld a, (trex3)
	cp l
	jr nz, notCollides


cactus5Collides:
	
	ld a, $1f
	ld (bigCactus1_5+1), a
	ld (bigCactus2_5+1), a

	;; it collides with the trex, return and GameOver
        ld a, 0
	ld (bigCactus1_5+11), a
	ld (bigCactus2_5+11), a
	ret


notCollides:
	ld a, 1
	ret

        
