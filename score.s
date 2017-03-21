
numericScore: defb $00, $00
numericHighScore: defb $00, $00


drawScore:

  ld a,2
  call 5633
  ld de,stringScore
  ld bc,eostr-stringScore
  call 8252

updateScore:

  ld hl, (numericScore)
  inc hl
  ld (numericScore), hl

  ld a,2
  call 5633
  ld de,score
  ld bc,eostr-score
  call 8252

  ld hl,score+7
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

    ld hl, $0000
    ld (numericScore), hl

    ret

setHighScore:

    ld hl, numericScore
    ex de, hl
    ld hl, numericHighScore
    ld a, l
    cp e
    
    ld hl, (numericScore)
    ex de, hl                   ; de = numericScore
    ld hl, (numericHighScore)   ; hl = numericHighScore
    sbc hl, de                  ; numericHighScore - numericScore
                                ; if c flag is set, then numericScore is new high score
    jr nc, noNewHS
noUpperBit:
    ld (numericHighScore), de

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

noNewHS:

    ret

    ;Theres prob a more effecient way to do this


stringScore: defb 22,1,1,'scr:'
score:  defb 22,1,5,'00000'
stringHighScr: defb 22,1,20,'pScr:'
highScore: defb 22,1,25,'00000'
eostr:  equ $
