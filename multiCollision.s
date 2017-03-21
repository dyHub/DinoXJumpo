;; function --------- TrexCollision ------
TrexCollision2:
        ;; Loop through each cactus, checking for collision

;; CHECK THE FIRST CACTUS FOR COLLISION
checkCactus1Bottom2:

        ld a, (bigCactus2_1+11)
        cp 1                                ; if it is on then check collision
        jp nz, checkCactus2Bottom2           ; if it is not on, check collision with cactus2 

        ;; check if column collides with bottom cactus part
        ld hl, (bigCactus2_1)		    ; h <-- holds col for cactus, l <-- row for cactus

	ld a, (trex4_2+1)
        cp h                                ; is h (col) == 0?
        jr nz, checktrex3_2forCactus1Bottom2	

	;; check if row collides
	ld a, (trex4_2)
	cp l
	jr z, cactus1Collides2

	;call cactus1Collides


checktrex3_2forCactus1Bottom2:
	;; if trex left bottom row collides with cactus 1 bottom
	ld a, (trex3_2+1)
        cp h                                ; is h (col) == 0?
        jr nz, checkCactus1Top2	

	;; check if row collides
	ld a, (trex3_2)
	cp l
	jr z, cactus1Collides2

	;call cactus1Collides

	
checkCactus1Top2:

 	ld a, (bigCactus1_1+11)
        cp 1                                ; if it is on then check collision
        jp nz, checkCactus2Bottom2           ; if it is not on, check collision with cactus2 

        ;; check if column collides with top cactus part
        ld hl, (bigCactus1_1)		    ; h <-- holds row for cactus, l <-- col for cactus

	ld a, (trex4_2+1)
        cp h                                ; is h (col) == 0?
        jr nz, checktrex3_2forCactus1Top2	

	;; check if row collides
	ld a, (trex4_2)
	cp l
	jr z, cactus1Collides2

	;call cactus1Collides


checktrex3_2forCactus1Top2:
	;; if trex left bottom row collides with cactus 1 bottom
	ld a, (trex3_2+1)
        cp h                                ; is h (col) == 0?
        jr nz, checkCactus2Bottom2	

	;; check if row collides
	ld a, (trex3_2)
	cp l
	jr nz, checkCactus2Bottom2


cactus1Collides2:
	
	ld a, $1f
	ld (bigCactus1_1+1), a
	ld (bigCactus2_1+1), a
	;; it collides with the trex, return and GameOver
        ld a, 0
	ld (bigCactus1_1+11), a
	ld (bigCactus2_1+11), a

	ret

	
;; CHECK THE SECOND CACTUS FOR COLLISION
checkCactus2Bottom2:
	
        ld a, (bigCactus2_2+11)
        cp 1                                ; if it is on then check collision
        jp nz, checkCactus3Bottom2           ; if it is not on, check collision with cactus2 

        ;; check if column collides with bottom cactus part
        ld hl, (bigCactus2_2)		    ; h <-- holds col for cactus, l <-- row for cactus

	ld a, (trex4_2+1)
        cp h                                ; is h (col) == 0?
        jr nz, checktrex3_2forCactus2Bottom2	

	;; check if row collides
	ld a, (trex4_2)
	cp l
	jr z, cactus2Collides2


checktrex3_2forCactus2Bottom2:
	;; if trex left bottom row collides with cactus 2 bottom
	ld a, (trex3_2+1)
        cp h                                ; is h (col) == 0?
        jr nz, checkCactus2Top2	

	;; check if row collides
	ld a, (trex3_2)
	cp l
	jr z, cactus2Collides2

	
checkCactus2Top2:

 	ld a, (bigCactus1_2+11)
        cp 1                                ; if it is on then check collision
        jp nz, checkCactus3Bottom2           ; if it is not on, check collision with cactus2 

        ;; check if column collides with top cactus part
        ld hl, (bigCactus1_2)		    ; h <-- holds row for cactus, l <-- col for cactus

	ld a, (trex4_2+1)
        cp h                                ; is h (col) == 0?
        jr nz, checktrex3_2forCactus2Top2	

	;; check if row collides
	ld a, (trex4_2)
	cp l
	jr z, cactus2Collides2


checktrex3_2forCactus2Top2:
	;; if trex left bottom row collides with cactus 2 bottom
	ld a, (trex3_2+1)
        cp h                                ; is h (col) == 0?
        jr nz, checkCactus3Bottom2	

	;; check if row collides
	ld a, (trex3_2)
	cp l
	jr nz, checkCactus3Bottom2


cactus2Collides2:

	ld a, $1f
	ld (bigCactus1_2+1), a
	ld (bigCactus2_2+1), a

	;; it collides with the trex, return and GameOver
        ld a, 0
	ld (bigCactus1_2+11), a
	ld (bigCactus2_2+11), a
	ret


;; CHECK THE THIRD CACTUS FOR COLLISION
checkCactus3Bottom2:
	
        ld a, (bigCactus2_3+11)
        cp 1                                ; if it is on then check collision
        jp nz, checkCactus4Bottom2           ; if it is not on, check collision with cactus2 

        ;; check if column collides with bottom cactus part
        ld hl, (bigCactus2_3)		    ; h <-- holds col for cactus, l <-- row for cactus

	ld a, (trex4_2+1)
        cp h                                ; is h (col) == 0?
        jr nz, checktrex3_2forCactus3Bottom2	

	;; check if row collides
	ld a, (trex4_2)
	cp l
	jr z, cactus3Collides2


checktrex3_2forCactus3Bottom2:
	;; if trex left bottom row collides with cactus 3 bottom
	ld a, (trex3_2+1)
        cp h                                ; is h (col) == 0?
        jr nz, checkCactus3Top2	

	;; check if row collides
	ld a, (trex3_2)
	cp l
	jr z, cactus3Collides2

	
checkCactus3Top2:

 	ld a, (bigCactus1_3+11)
        cp 1                                ; if it is on then check collision
        jp nz, checkCactus4Bottom2           ; if it is not on, check collision with cactus2 

        ;; check if column collides with top cactus part
        ld hl, (bigCactus1_3)		    ; h <-- holds row for cactus, l <-- col for cactus

	ld a, (trex4_2+1)
        cp h                                ; is h (col) == 0?
        jr nz, checktrex3_2forCactus3Top2	

	;; check if row collides
	ld a, (trex4_2)
	cp l
	jr z, cactus3Collides2


checktrex3_2forCactus3Top2:
	;; if trex left bottom row collides with cactus 3 bottom
	ld a, (trex3_2+1)
        cp h                                ; is h (col) == 0?
        jr nz, checkCactus4Bottom2	

	;; check if row collides
	ld a, (trex3_2)
	cp l
	jr nz, checkCactus4Bottom2


cactus3Collides2:
	
	ld a, $1f
	ld (bigCactus1_3+1), a
	ld (bigCactus2_3+1), a

	;; it collides with the trex, return and GameOver
        ld a, 0
	ld (bigCactus1_3+11), a
	ld (bigCactus2_3+11), a
	ret


	
;; CHECK THE FOUTH CACTUS FOR COLLISION
checkCactus4Bottom2:
	
        ld a, (bigCactus2_4+11)
        cp 1                                ; if it is on then check collision
        jp nz, checkCactus5Bottom2           ; if it is not on, check collision with cactus2 

        ;; check if column collides with bottom cactus part
        ld hl, (bigCactus2_4)		    ; h <-- holds col for cactus, l <-- row for cactus

	ld a, (trex4_2+1)
        cp h                                ; is h (col) == 0?
        jr nz, checktrex3_2forCactus4Bottom2	

	;; check if row collides
	ld a, (trex4_2)
	cp l
	jr z, cactus4Collides2


checktrex3_2forCactus4Bottom2:
	;; if trex left bottom row collides with cactus 3 bottom
	ld a, (trex3_2+1)
        cp h                                ; is h (col) == 0?
        jr nz, checkCactus4Top2	

	;; check if row collides
	ld a, (trex3_2)
	cp l
	jr z, cactus4Collides2

	
checkCactus4Top2:

 	ld a, (bigCactus1_4+11)
        cp 1                                ; if it is on then check collision
        jp nz, checkCactus5Bottom2           ; if it is not on, check collision with cactus2 

        ;; check if column collides with top cactus part
        ld hl, (bigCactus1_4)		    ; h <-- holds row for cactus, l <-- col for cactus

	ld a, (trex4_2+1)
        cp h                                ; is h (col) == 0?
        jr nz, checktrex3_2forCactus4Top2	

	;; check if row collides
	ld a, (trex4_2)
	cp l
	jr z, cactus4Collides2


checktrex3_2forCactus4Top2:
	;; if trex left bottom row collides with cactus 3 bottom
	ld a, (trex3_2+1)
        cp h                                ; is h (col) == 0?
        jr nz, checkCactus5Bottom2	

	;; check if row collides
	ld a, (trex3_2)
	cp l
	jr nz, checkCactus5Bottom2


cactus4Collides2:
	
	ld a, $1f
	ld (bigCactus1_4+1), a
	ld (bigCactus2_4+1), a

	;; it collides with the trex, return and GameOver
        ld a, 0
	ld (bigCactus1_4+11), a
	ld (bigCactus2_4+11), a
	ret

;; CHECK THE FIFTH CACTUS FOR COLLISION
checkCactus5Bottom2:

        ld a, (bigCactus2_5+11)
        cp 1                                ; if it is on then check collision
        jp nz, notCollides2           ; if it is not on, check collision with cactus2 

        ;; check if column collides with bottom cactus part
        ld hl, (bigCactus2_5)		    ; h <-- holds col for cactus, l <-- row for cactus

	ld a, (trex4_2+1)
        cp h                                ; is h (col) == 0?
        jr nz, checktrex3_2forCactus5Bottom2	

	;; check if row collides
	ld a, (trex4_2)
	cp l
	jr z, cactus5Collides2


checktrex3_2forCactus5Bottom2:
	;; if trex left bottom row collides with cactus 3 bottom
	ld a, (trex3_2+1)
        cp h                                ; is h (col) == 0?
        jr nz, checkCactus5Top2	

	;; check if row collides
	ld a, (trex3_2)
	cp l
	jr z, cactus5Collides2

	
checkCactus5Top2:

 	ld a, (bigCactus1_5+11)
        cp 1                                ; if it is on then check collision
        jp nz, notCollides2           ; if it is not on, check collision with cactus2 

        ;; check if column collides with top cactus part
        ld hl, (bigCactus1_5)		    ; h <-- holds row for cactus, l <-- col for cactus

	ld a, (trex4_2+1)
        cp h                                ; is h (col) == 0?
        jr nz, checktrex3_2forCactus5Top2	

	;; check if row collides
	ld a, (trex4_2)
	cp l
	jr z, cactus5Collides2


checktrex3_2forCactus5Top2:
	;; if trex left bottom row collides with cactus 3 bottom
	ld a, (trex3_2+1)
        cp h                                ; is h (col) == 0?
        jr nz, notCollides2	

	;; check if row collides
	ld a, (trex3_2)
	cp l
	jr nz, notCollides2


cactus5Collides2:
	
	ld a, $1f
	ld (bigCactus1_5+1), a
	ld (bigCactus2_5+1), a

	;; it collides with the trex, return and GameOver
        ld a, 0
	ld (bigCactus1_5+11), a
	ld (bigCactus2_5+11), a
	ret


notCollides2:
	ld a, 1
	ret

        
