; Return character cell address of block at (b, c).
	org 32768
start:
; We want a black screen.

       ld a,71             ; white ink (7) on black paper (0),
                           ; bright (64).
       ld (23693),a        ; set our screen colours.
       xor a               ; quick way to load accumulator with zero.
       call 8859           ; set permanent border colours.

; Set up the graphics.

       ld hl,blocks        ; address of user-defined graphics data.
       ld (23675),hl       ; make UDGs point to it.

; Okay, let's start the game.

       call 3503           ; ROM routine - clears screen, opens chan 2.

; Initialise coordinates.

       ld hl,21+15*256     ; load hl pair with starting coords.
       ld (plx),hl         ; set player coords.

       call basexy         ; set the x and y positions of the player.
       call splayr         ; show player base symbol.

; Now we want to fill the play area with mushrooms.

       ld a,68             ; green ink (4) on black paper (0),
                           ; bright (64).
       ld (23695),a        ; set our temporary colours.
       ld b,50             ; start with a few.
mushlp: ld a,22             ; control code for AT character.
       rst 16
       call random         ; get a 'random' number.
       and 15              ; want vertical in range 0 to 15.
       rst 16
       call random         ; want another pseudo-random number.
       and 31              ; want horizontal in range 0 to 31.
       rst 16
       ld a,145            ; UDG 'B' is the mushroom graphic.
       rst 16              ; put mushroom on screen.
       djnz mushlp         ; loop back until all mushrooms displayed.

; This is the main loop.

mloop:  equ $

; Delete the player.

       call basexy         ; set the x and y positions of the player.
       call wspace         ; display space over player.

; Now we've deleted the player we can move him before redisplaying him
; at his new coordinates.

       ;ld bc,63486         ; keyboard row 1-5/joystick port 2.
       ld a, $FD	   ; load for asdf keyboard row
       in a,($F0)          ; see what keys are pressed.
       rra                 ; outermost bit = key a.
       push af             ; remember the value.
       call nc,mpl         ; it's being pressed, move left.
       pop af              ; restore accumulator.
       rra                 ; next bit along (value 2) = key s.
       push af             ; remember the value.
       call nc,mpd         ; being pressed, so move right.
       pop af              ; restore accumulator.
       rra                 ; next bit (value 4) = key d.
       push af             ; remember the value.
       call nc,mpr         ; being pressed, so move down.
       pop af              ; restore accumulator.
       ld a, $FB	   ; load for qwer keyboard row
       in a, ($F0)
       rra                 ; next bit (value 2) reads key w.
       rra
       call nc,mpu         ; it's being pressed, move up.

; Now he's moved we can redisplay the player.

       call basexy         ; set the x and y positions of the player.
       call splayr         ; show player.

       halt                ; delay.

; Jump back to beginning of main loop.

       jp mloop

; Move player left.

mpl:    ld hl,ply           ; remember, y is the horizontal coord!
       ld a,(hl)           ; what's the current value?
       and a               ; is it zero?
       ret z               ; yes - we can't go any further left.

; now check that there isn't a mushroom in the way.

       ld bc,(plx)         ; current coords.
       dec b               ; look 1 square to the left.
       call atadd          ; get address of attribute at this position.
       cp 68               ; mushrooms are bright (64) + green (4).
       ret z               ; there's a mushroom - we can't move there.

       dec (hl)            ; subtract 1 from y coordinate.
       ret

; Move player right.

mpr:    ld hl,ply           ; remember, y is the horizontal coord!
       ld a,(hl)           ; what's the current value?
       cp 31               ; is it at the right edge (31)?
       ret z               ; yes - we can't go any further left.

; now check that there isn't a mushroom in the way.

       ld bc,(plx)         ; current coords.
       inc b               ; look 1 square to the right.
       call atadd          ; get address of attribute at this position.
       cp 68               ; mushrooms are bright (64) + green (4).
       ret z               ; there's a mushroom - we can't move there.

       inc (hl)            ; add 1 to y coordinate.
       ret

; Move player up.

mpu:    ld hl,plx           ; remember, x is the vertical coord!
       ld a,(hl)           ; what's the current value?
       cp 4                ; is it at upper limit (4)?
       ret z               ; yes - we can go no further then.

; now check that there isn't a mushroom in the way.

       ld bc,(plx)         ; current coords.
       dec c               ; look 1 square up.
       call atadd          ; get address of attribute at this position.
       cp 68               ; mushrooms are bright (64) + green (4).
       ret z               ; there's a mushroom - we can't move there.

       dec (hl)            ; subtract 1 from x coordinate.
       ret

; Move player down.

mpd:    ld hl,plx           ; remember, x is the vertical coord!
       ld a,(hl)           ; what's the current value?
       cp 21               ; is it already at the bottom (21)?
       ret z               ; yes - we can't go down any more.

; now check that there isn't a mushroom in the way.

       ld bc,(plx)         ; current coords.
       inc c               ; look 1 square down.
       call atadd          ; get address of attribute at this position.
       cp 68               ; mushrooms are bright (64) + green (4).
       ret z               ; there's a mushroom - we can't move there.

       inc (hl)            ; add 1 to x coordinate.
       ret

; Set up the x and y coordinates for the player's gunbase position,
; this routine is called prior to display and deletion of gunbase.

basexy: ld a,22             ; AT code.
       rst 16
       ld a,(plx)          ; player vertical coord.
       rst 16              ; set vertical position of player.
       ld a,(ply)          ; player's horizontal position.
       rst 16              ; set the horizontal coord.
       ret

; Show player at current print position.

splayr: ld a,69             ; cyan ink (5) on black paper (0),
                           ; bright (64).
       ld (23695),a        ; set our temporary screen colours.
       ld a,144            ; ASCII code for User Defined Graphic 'A'.
       rst 16              ; draw player.
       ret

wspace: ld a,71             ; white ink (7) on black paper (0),
                           ; bright (64).
       ld (23695),a        ; set our temporary screen colours.
       ld a,32             ; SPACE character.
       rst 16              ; display space.
       ret

; Simple pseudo-random number generator.
; Steps a pointer through the ROM (held in seed), returning
; the contents of the byte at that location.

random: ld hl,(seed)        ; Pointer
       ld a,h
       and 31              ; keep it within first 8k of ROM.
       ld h,a
       ld a,(hl)           ; Get "random" number from location.
       inc hl              ; Increment pointer.
       ld (seed),hl
       ret
seed:   defw 0

; Calculate address of attribute for character at (dispx, dispy).

atadd:  ld a,c              ; vertical coordinate.
       rrca                ; multiply by 32.
       rrca                ; Shifting right with carry 3 times is
       rrca                ; quicker than shifting left 5 times.
       ld e,a
       and 3
       add a,88            ; 88x256=address of attributes.
       ld d,a
       ld a,e
       and 224
       ld e,a
       ld a,b              ; horizontal position.
       add a,e
       ld e,a              ; de=address of attributes.
       ld a,(de)           ; return with attribute in accumulator.
       ret

plx:    defb 0              ; player's x coordinate.
ply:    defb 0              ; player's y coordinate.

; UDG graphics.

blocks: defb 16,16,56,56,124,124,254,254    ; player base.
       defb 24,126,255,255,60,60,60,60     ; mushroom.
