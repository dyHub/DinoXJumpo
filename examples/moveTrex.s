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

       ld hl,$0101     ; load hl pair with starting coords.
       ld (plx),hl         ; set player coords.

       call basexy         ; set the x and y positions of the player.
       call splayr         ; show player base symbol.


; This is the main loop.

mloop:  equ $

; Delete the player.

       call basexy         ; set the x and y positions of the player.
       call wspace         ; display space over player.

; Now we've deleted the player we can move him before redisplaying him
; at his new coordinates.

	ld bc, 32766			; space key 
	in a, (c)			; see if space key is pressed
	rra				; outermost bit = key space
	push af				; remember the value
	call nc, mpu		; it's being pressed, then jump t-rex
	pop af

; Now he's moved we can redisplay the player.

       call basexy         ; set the x and y positions of the player.
       call splayr         ; show player.

	call delay5

; Jump back to beginning of main loop.
       call basexy         ; set the x and y positions of the player.
       call wspace         ; display space over player.
	
       call mpd
       call basexy         ; set the x and y positions of the player.
       call splayr         ; show player.

       call delay5

       jp mloop


; Move player up.

mpu:    ld hl,plx           ; remember, x is the vertical coord!
       ld a,(hl)           ; what's the current value?
       cp 4                ; is it at upper limit (4)?
       ret z               ; yes - we can go no further then.

       dec (hl)            ; subtract 1 from x coordinate.
       dec (hl)            ; subtract 1 from x coordinate.
       ret

; Move player down.

mpd:    ld hl,plx           ; remember, x is the vertical coord!
       ld a,(hl)           ; what's the current value?
       cp 21               ; is it already at the bottom (21)?
       ret z               ; yes - we can't go down any more.

       inc (hl)            ; add 1 to x coordinate.
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

delay5:
       ld b, 7
delay:
	halt
	djnz delay
	ret

plx:    defb 0              ; player's x coordinate.
ply:    defb 0              ; player's y coordinate.

; UDG graphics.

blocks: defb 16,16,56,56,124,124,254,254    ; player base.
       defb 24,126,255,255,60,60,60,60     ; mushroom.

