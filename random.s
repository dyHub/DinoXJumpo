
;; function ----- rand -------
;;
;; Credits to https://gist.github.com/JohnTheNerd/25c65425cf4f84954585
;;
;; Generates a random number between 0 and 255, and stores it in a
;; (trashes a, hl)
rand:
        LD A,R          ; Load the A register with the refresh register
        LD L,A          ; Copy register A into register L
        AND %00111111   ; This masking prevents the address we are forming from accessing RAM
        LD H,A          ; Copy register A into register H
        LD A,(HL)       ; Load the pseudo-random value into A
        RET


;; function ----- chance -------
;;
;; Given a probability from 0 (0%) to 255 (100%), returns whether or not the number was chosen
;;
;; in:  b - the probability, from 0 to 255
;; out: a - 1 if the element was chosen, 0 if not
chance:
        call rand 
        cp b
         
chance_on:
        ld a, 0

