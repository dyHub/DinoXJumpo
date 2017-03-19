

drawScore:

  ld a,2
  call 5633
  ld de,stringScore
  ld bc,eostr-stringScore
  call 8252

updateScore:

  ld a,2
  call 5633
  ld de,score
  ld bc,eostr-score
  call 8252

  ld hl,score+8
  ld b,1
  call  userScore

endScoreUpdate:

  ret


userScore:

    ld a,(hl)
    add a,b
    ld (hl),a
    cp 58
    ret c
    sub 10
    ld (hl),a

userScoreNextPlace:

    dec hl
    inc (hl)
    ld a,(hl)
    cp 58
    ret c
    sub 10
    ld (hl),a
    jp userScoreNextPlace


resetScore:

    ld hl, score + 3
    ld (hl), 48
    inc hl
    ld (hl), 48
    inc hl
    ld (hl), 48
    inc hl
    ld (hl), 48
    inc hl
    ld (hl), 48
    inc hl
    ld (hl), 48
    inc hl

    ret

setHighScore:

    ld hl, score + 8
    ld a, (hl)
    ld hl, highScore + 8
    ld (hl), a
    ld hl, score + 7
    ld a, (hl)
    ld hl, highScore + 7
    ld (hl), a
    ld hl, score + 6
    ld a, (hl)
    ld hl, highScore + 6
    ld (hl), a
    ld hl, score + 5
    ld a, (hl)
    ld hl, highScore + 5
    ld (hl), a
    ld hl, score + 4
    ld a, (hl)
    ld hl, highScore + 4
    ld (hl), a
    ld hl, score + 3
    ld a, (hl)
    ld hl, highScore + 3
    ld (hl), a

    ld a,2
    call 5633
    ld de,score
    ld bc,eostr-score
    call 8252

endHighScore:

    ret

    ;Theres prob a more effecient way to do this


stringScore: defb 22,1,1,'scr:'
score:  defb 22,1,5,'000000'
stringHighScr: defb 22,1,20,'pScr:'
highScore: defb 22,1,25,'000000'
eostr:  equ $
