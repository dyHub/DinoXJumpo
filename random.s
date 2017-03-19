
;; function ----- rand -------
;;
;; Credits to https://gist.github.com/JohnTheNerd/25c65425cf4f84954585
;;
;; Generates a random number based on the R register, and stores it in HL
;; (trashes a, hl, de)
rand:
        LD A,R          ; Load the A register with the refresh register
        LD L,A          ; Copy register A into register L
        AND %00111111   ; This masking prevents the address we are forming from accessing RAM
        LD H,A          ; Copy register A into register H
        LD D,(HL)      
        INC L
        LD E,(HL)
        EX DE, HL
        RET


;; function ----- chance -------
;;
;; Given a probability from 0 (0%) to 64K (100%), returns whether or not the number was chosen
;;
;; in:  bc - the probability, from 0 to 64K
;; out: a - 1 if the element was chosen, 0 if not
chance:
        call rand           ; hl = rand from 0 to 64K
        sbc hl, bc          ; do hl (rand number) - bc (probability) 
                            ; if hl < bc, we get a hit! (we know this if c flag is set)
        jr nc, chance_off
chance_on:
        ld a, 1
        jr chance_end
chance_off:
        ld a, 0
chance_end:
        ret
