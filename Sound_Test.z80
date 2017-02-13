        org 32768
        di
        ld hl, $50
        ld c, 0
startsound:
        ld b, 108
delay: djnz delay
        ld a, c
        xor $10
        ld c, a
        out($f0), a
        dec hl
        ld a,l
        or h
        jr nz, startsound

        ld hl, $70
        ld c, 0
sound2:
        ld b, 208
delay1: djnz delay1
        ld a, c
        xor $10
        ld c, a
        out($f0), a
        dec hl
        ld a,l
        or h
        jr nz, sound2

        ld hl, $50
        ld c, 0
sound3:
        ld b, 108
delay3: djnz delay3
        ld a, c
        xor $10
        ld c, a
        out($f0), a
        dec hl
        ld a,l
        or h
        jr nz, sound3


        ei
        ret