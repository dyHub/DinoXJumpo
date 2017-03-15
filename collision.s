;; NOTE:
;; THIS FILE IS DEPENDENT ON SPRITEROUTINES.S
;;

;; ---- FUNCTION checkCollision -----
;;
;; checks if the dinosaur had a collision with an object and stops the game
;; if it did. Currently uses the attribute byte and only checks the bottom two cells of the dinosaur.
;; This also only works because Trex is the first thing to be updated.
;;
;; trashes: hl
;;

checkCollision:

    ld bc, (trex3)
    ld d, b
    ld b, c
    ld c, d
    call attrAddr                   ; gets the address in hl
    ld b, (hl)
    ld a, (trex_color)

    cp b

    jp z , gameOver

    ret

gameOver:

    halt

    jr gameOver