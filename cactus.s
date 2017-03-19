;; function --------- drawCactusesAndCheckWallCollision------
;;
;;
drawCactusesAndCheckWallCollision:
        ;; Loop through each cactus, and if its on bit is set, then draw it

        ld a, (bigCactus1_1+11)
        cp 1                                ;                             
        jp nz, drawCactus_2                 ; if we shouldnt draw cactus1, try cactus2

        ld hl, bigCactus1_1+ 3              ; hl = key cell's address
        ld (charCellAddress), hl            ; draw tne first cell (upper part)
        ld hl, (bigCactus1_1)
        ld (charCellCoord), hl
        ld hl, (bigCactus1_1+2)
        ld (attrByte), hl
        call copyCharCellAndAttrByteToUpdateList

        ld hl, bigCactus2_1+ 3              ; hl = key cell's address
        ld (charCellAddress), hl            ; draw tne first cell (lower part)
        ld hl, (bigCactus2_1)
        ld (charCellCoord), hl
        ld hl, (bigCactus2_1+2)
        ld (attrByte), hl
        call copyCharCellAndAttrByteToUpdateList

        ;; check if collision with left side
        ld hl, (bigCactus1_1)
        ld a, $00
        cp h                                ; is h (col) == 0?
        jr nz, drawCactus_2
        ;; 2b-1. if it hit left side, draw sky at old cactus 

        ld hl, sky+1
        ld (charCellAddress), hl
        ld hl, (sky)
        ld (attrByte), hl
        ld hl, (bigCactus1_1)                     ; h = col, l = row
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ld hl, sky+1
        ld (charCellAddress), hl
        ld hl, (sky)
        ld (attrByte), hl
        ld hl, (bigCactus2_1)                     ; h = col, l = row
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ;; then set cactus to right position, and set it off
        ld a, $1f
        ld (bigCactus1_1+1), a
        ld (bigCactus2_1+1), a

        ld a, 0
        ld (bigCactus1_1+11), a
        ld (bigCactus2_1+11), a

drawCactus_2:
        ld a, (bigCactus1_2+11)
        cp 1                                ;                             
        jp nz, drawCactus_3                 ; if we shouldnt draw cactus2, try cactus3

        ld hl, bigCactus1_2+ 3              ; hl = key cell's address
        ld (charCellAddress), hl            ; draw tne first cell (upper part)
        ld hl, (bigCactus1_2)
        ld (charCellCoord), hl
        ld hl, (bigCactus1_2+2)
        ld (attrByte), hl
        call copyCharCellAndAttrByteToUpdateList

        ld hl, bigCactus2_2+ 3              ; hl = key cell's address
        ld (charCellAddress), hl            ; draw tne first cell (lower part)
        ld hl, (bigCactus2_2)
        ld (charCellCoord), hl
        ld hl, (bigCactus2_2+2)
        ld (attrByte), hl
        call copyCharCellAndAttrByteToUpdateList

        ;; check if collision with left side
        ld hl, (bigCactus1_2)
        ld a, $00
        cp h                                ; is h (col) == 0?
        jr nz, drawCactus_3
        ;; 2b-1. if it hit left side, draw sky at old cactus 

        ld hl, sky+1
        ld (charCellAddress), hl
        ld hl, (sky)
        ld (attrByte), hl
        ld hl, (bigCactus1_2)                     ; h = col, l = row
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ld hl, sky+1
        ld (charCellAddress), hl
        ld hl, (sky)
        ld (attrByte), hl
        ld hl, (bigCactus2_2)                     ; h = col, l = row
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ;; then set cactus to right position, and set it off
        ld a, $1f
        ld (bigCactus1_2+1), a
        ld (bigCactus2_2+1), a

        ld a, 0
        ld (bigCactus1_2+11), a
        ld (bigCactus2_2+11), a

drawCactus_3:
        ld a, (bigCactus1_3+11)
        cp 1                                ;                             
        jp nz, drawCactus_4                 ; if we shouldnt draw cactus3, try cactus4

        ld hl, bigCactus1_3+ 3              ; hl = key cell's address
        ld (charCellAddress), hl            ; draw tne first cell (upper part)
        ld hl, (bigCactus1_3)
        ld (charCellCoord), hl
        ld hl, (bigCactus1_3+2)
        ld (attrByte), hl
        call copyCharCellAndAttrByteToUpdateList

        ld hl, bigCactus2_3+ 3              ; hl = key cell's address
        ld (charCellAddress), hl            ; draw tne first cell (lower part)
        ld hl, (bigCactus2_3)
        ld (charCellCoord), hl
        ld hl, (bigCactus2_3+2)
        ld (attrByte), hl
        call copyCharCellAndAttrByteToUpdateList
        
        ;; check if collision with left side
        ld hl, (bigCactus1_3)
        ld a, $00
        cp h                                ; is h (col) == 0?
        jr nz, drawCactus_4
        ;; 2b-1. if it hit left side, draw sky at old cactus 

        ld hl, sky+1
        ld (charCellAddress), hl
        ld hl, (sky)
        ld (attrByte), hl
        ld hl, (bigCactus1_3)                     ; h = col, l = row
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ld hl, sky+1
        ld (charCellAddress), hl
        ld hl, (sky)
        ld (attrByte), hl
        ld hl, (bigCactus2_3)                     ; h = col, l = row
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ;; then set cactus to right position, and set it off
        ld a, $1f
        ld (bigCactus1_3+1), a
        ld (bigCactus2_3+1), a

        ld a, 0
        ld (bigCactus1_3+11), a
        ld (bigCactus2_3+11), a
drawCactus_4:
        ld a, (bigCactus1_4+11)
        cp 1                                ;                             
        jp nz, drawCactus_5                 ; if we shouldnt draw cactus4, try cactus5

        ld hl, bigCactus1_4+ 3              ; hl = key cell's address
        ld (charCellAddress), hl            ; draw tne first cell (upper part)
        ld hl, (bigCactus1_4)
        ld (charCellCoord), hl
        ld hl, (bigCactus1_4+2)
        ld (attrByte), hl
        call copyCharCellAndAttrByteToUpdateList

        ld hl, bigCactus2_4+ 3              ; hl = key cell's address
        ld (charCellAddress), hl            ; draw tne first cell (lower part)
        ld hl, (bigCactus2_4)
        ld (charCellCoord), hl
        ld hl, (bigCactus2_4+2)
        ld (attrByte), hl
        call copyCharCellAndAttrByteToUpdateList

        ;; check if collision with left side
        ld hl, (bigCactus1_4)
        ld a, $00
        cp h                                ; is h (col) == 0?
        jr nz, drawCactus_5
        ;; 2b-1. if it hit left side, draw sky at old cactus 

        ld hl, sky+1
        ld (charCellAddress), hl
        ld hl, (sky)
        ld (attrByte), hl
        ld hl, (bigCactus1_4)                     ; h = col, l = row
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ld hl, sky+1
        ld (charCellAddress), hl
        ld hl, (sky)
        ld (attrByte), hl
        ld hl, (bigCactus2_4)                     ; h = col, l = row
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ;; then set cactus to right position, and set it off
        ld a, $1f
        ld (bigCactus1_4+1), a
        ld (bigCactus2_4+1), a

        ld a, 0
        ld (bigCactus1_4+11), a
        ld (bigCactus2_4+11), a

drawCactus_5:
        ld a, (bigCactus1_5+11)
        cp 1                                ;                             
        jp nz, drawCactus_done              ; if we shouldnt draw cactus5, stop

        ld hl, bigCactus1_5+ 3              ; hl = key cell's address
        ld (charCellAddress), hl            ; draw tne first cell (upper part)
        ld hl, (bigCactus1_5)
        ld (charCellCoord), hl
        ld hl, (bigCactus1_5+2)
        ld (attrByte), hl
        call copyCharCellAndAttrByteToUpdateList

        ld hl, bigCactus2_5+ 3              ; hl = key cell's address
        ld (charCellAddress), hl            ; draw tne first cell (lower part)
        ld hl, (bigCactus2_5)
        ld (charCellCoord), hl
        ld hl, (bigCactus2_5+2)
        ld (attrByte), hl
        call copyCharCellAndAttrByteToUpdateList

        ;; check if collision with left side
        ld hl, (bigCactus1_5)
        ld a, $00
        cp h                                ; is h (col) == 0?
        jr nz, drawCactus_done
        ;; 2b-1. if it hit left side, draw sky at old cactus 

        ld hl, sky+1
        ld (charCellAddress), hl
        ld hl, (sky)
        ld (attrByte), hl
        ld hl, (bigCactus1_5)                     ; h = col, l = row
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ld hl, sky+1
        ld (charCellAddress), hl
        ld hl, (sky)
        ld (attrByte), hl
        ld hl, (bigCactus2_5)                     ; h = col, l = row
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ;; then set cactus to right position, and set it off
        ld a, $1f
        ld (bigCactus1_5+1), a
        ld (bigCactus2_5+1), a

        ld a, 0
        ld (bigCactus1_5+11), a
        ld (bigCactus2_5+11), a

drawCactus_done:
        ret


;; function ----- drawSkyOnCactusesAndShift ------
;;
;; 
drawSkyOnCactusesAndShift:
        ;; Loop through each cactus, and if its on bit is set, then draw it

        ld a, (bigCactus1_1+11)
        cp 1                                ;                             
        jp nz, skyAndShift_2                 ; if we shouldnt do cactus1, try cactus2

        ld hl, sky+1
        ld (charCellAddress), hl
        ld hl, (sky)
        ld (attrByte), hl
        ld hl, (bigCactus1_1)                     ; h = col, l = row
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ld hl, sky+1
        ld (charCellAddress), hl
        ld hl, (sky)
        ld (attrByte), hl
        ld hl, (bigCactus2_1)                     ; h = col, l = row
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ld hl, (bigCactus1_1)
        dec h
        ld (bigCactus1_1), hl
        ld hl, (bigCactus2_1)
        dec h
        ld (bigCactus2_1), hl

skyAndShift_2:
        ld a, (bigCactus1_2+11)
        cp 1                                ;                             
        jp nz, skyAndShift_3                 ; if we shouldnt do cactus1, try cactus2

        ld hl, sky+1
        ld (charCellAddress), hl
        ld hl, (sky)
        ld (attrByte), hl
        ld hl, (bigCactus1_2)                     ; h = col, l = row
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ld hl, sky+1
        ld (charCellAddress), hl
        ld hl, (sky)
        ld (attrByte), hl
        ld hl, (bigCactus2_2)                     ; h = col, l = row
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ld hl, (bigCactus1_2)
        dec h
        ld (bigCactus1_2), hl
        ld hl, (bigCactus2_2)
        dec h
        ld (bigCactus2_2), hl
        
skyAndShift_3:
        ld a, (bigCactus1_3+11)
        cp 1                                ;                             
        jp nz, skyAndShift_4                 ; if we shouldnt do cactus1, try cactus2

        ld hl, sky+1
        ld (charCellAddress), hl
        ld hl, (sky)
        ld (attrByte), hl
        ld hl, (bigCactus1_3)                     ; h = col, l = row
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ld hl, sky+1
        ld (charCellAddress), hl
        ld hl, (sky)
        ld (attrByte), hl
        ld hl, (bigCactus2_3)                     ; h = col, l = row
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ld hl, (bigCactus1_3)
        dec h
        ld (bigCactus1_3), hl
        ld hl, (bigCactus2_3)
        dec h
        ld (bigCactus2_3), hl


skyAndShift_4:
        ld a, (bigCactus1_4+11)
        cp 1                                ;                             
        jp nz, skyAndShift_5                 ; if we shouldnt do cactus1, try cactus2

        ld hl, sky+1
        ld (charCellAddress), hl
        ld hl, (sky)
        ld (attrByte), hl
        ld hl, (bigCactus1_4)                     ; h = col, l = row
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ld hl, sky+1
        ld (charCellAddress), hl
        ld hl, (sky)
        ld (attrByte), hl
        ld hl, (bigCactus2_4)                     ; h = col, l = row
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ld hl, (bigCactus1_4)
        dec h
        ld (bigCactus1_4), hl
        ld hl, (bigCactus2_4)
        dec h
        ld (bigCactus2_4), hl


skyAndShift_5:
        ld a, (bigCactus1_5+11)
        cp 1                                ;                             
        jp nz, skyAndShift_done                 ; if we shouldnt do cactus1, try cactus2

        ld hl, sky+1
        ld (charCellAddress), hl
        ld hl, (sky)
        ld (attrByte), hl
        ld hl, (bigCactus1_5)                     ; h = col, l = row
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ld hl, sky+1
        ld (charCellAddress), hl
        ld hl, (sky)
        ld (attrByte), hl
        ld hl, (bigCactus2_5)                     ; h = col, l = row
        ld (charCellCoord), hl)
	call copyCharCellAndAttrByteToUpdateList

        ld hl, (bigCactus1_5)
        dec h
        ld (bigCactus1_5), hl
        ld hl, (bigCactus2_5)
        dec h
        ld (bigCactus2_5), hl

skyAndShift_done:
        ret


gen_ctr:    defb 0
;; function ----- generateCactusIfNeeded ----
;;
generateCactusIfNeeded:
        ;; 0. Only check every 3rd cactus update to keep min dist of 3
        ld a, (gen_ctr)
        cp 7            
        jr nz, gen_ctr_inc
        ld a, 0
        ld (gen_ctr), a
        jr gen_chance
gen_ctr_inc:
        ld a, (gen_ctr)
        inc a
        ld (gen_ctr), a
        jr gen_done
gen_chance:
        ;; 1. Should we generate a cactus this frame update?
        ld bc, (cactus_rng) ; fuck little endian lmao
        call chance         ; a = 1 if we should gen cactus, 0 if not
        cp 1
        jr nz, gen_done

        ;; 2. If so, find the first cactus that is off, and set it to on
gen_check_1:
        ld a, (bigCactus1_1+11)
        cp 0                            ; if cactus not on, set it on
        jp nz, gen_check_2                   
        
        ld a, 1
        ld (bigCactus1_1+11), a
        ld (bigCactus2_1+11), a

        jr gen_done
gen_check_2:
        ld a, (bigCactus1_2+11)
        cp 0                                                             
        jp nz, gen_check_3                   

        ld a, 1
        ld (bigCactus1_2+11), a
        ld (bigCactus2_2+11), a
        jr gen_done

gen_check_3:
        ld a, (bigCactus1_3+11)
        cp 0                                                             
        jp nz, gen_check_4                   


        ld a, 1
        ld (bigCactus1_3+11), a
        ld (bigCactus2_3+11), a

        jr gen_done
gen_check_4:
        ld a, (bigCactus1_4+11)
        cp 0                                                             
        jp nz, gen_check_5                   

        ld a, 1
        ld (bigCactus1_4+11), a
        ld (bigCactus2_4+11), a

        jr gen_done
gen_check_5:
        ld a, (bigCactus1_5+11)
        cp 0                                                             
        jp nz, gen_done                  

        ld a, 1
        ld (bigCactus1_5+11), a
        ld (bigCactus2_5+11), a


gen_done:
        ret        

;; function ----- updateCactuses ---------
;;
;;
;;
updateCactuses:
        ;; 1. Check if it is time to update the cactuses!
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
        jp updateCactuses_checkrng      ; dont need to do anything else, done

        ;; 2a. Since frame counter == update frequency, then we need to move sprite
updateCactuses_update:
        
        ;; Check if we should randomly generate a cactus now, based on the score
        call generateCactusIfNeeded
        ;; For all cactuses that are on, draw sky in old position, and shift them by one
        call drawSkyOnCactusesAndShift
        ;; draw!!
        call drawCactusesAndCheckWallCollision
        

        ; 3. Check if we need to update the cactus rng
updateCactuses_checkrng:
        ld a, (cactus_rng_u)
        ld b, a
        ld a, (cactus_rng_ctr)
        cp b        
        jr nz, updateCactuses_noupdate_rng 
updateCactuses_update_rng:
        
        ld hl, (cactus_rng)
        ; inc by 100 (.07% more chance) per update, and each rng update occurs about every 1s
        ld de, 100
        adc hl, de
        ld (cactus_rng), hl
        
        ld a, 0
        ld (cactus_rng_ctr), a
        jr updateCactuses_end

updateCactuses_noupdate_rng:
        ld a, (cactus_rng_ctr)
        inc a
        ld (cactus_rng_ctr), a

updateCactuses_end:
        ret

