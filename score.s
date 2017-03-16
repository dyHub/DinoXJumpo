

drawScore:

  ld a,2
  call 5633
  ld de,string
  ld bc,eostr-string
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

string: defb 22,1,1,'score:'
score:  defb 22,1,7,'000000'
eostr:  equ $