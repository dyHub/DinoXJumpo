       	org 32768
start:
	; print out score string
	ld a, 2         ; channel 2 = "S" for screen, 2=upper screen
  call $1601      ; Select print channel using ROM
  ld hl,line      ; Print line
        call printline

	; print out score number
	ld bc,(score)
       	call 11563          ; stack number in bc.
       	call 11747          ; display top of calc. stack.

	; set up graphic
	ld hl,udgs	; UDGs.
       	ld (23675),hl   ; set up UDG system variable.

	; initialise coordinates
       	call 5633       ; open channel.
       	ld a,21         ; row 21 = bottom of screen.
	ld (xcoord),a   ; set initial x coordinate.

	; move from the bottom of the screen to top
loop:   call setxy      ; set up our x/y coords.
	ld a,144        ; show UDG instead of asterisk.
	rst 16          ; display it.
	call delay      ; want a delay.
	call setxy      ; set up our x/y coords.
	ld a,32         ; ASCII code for space.
	rst 16          ; delete old asterisk.
	call setxy      ; set up our x/y coords.

  ld a, $FD       ; load byte 1111|1101 for keyboard read
  in a, ($F0)     ; read from keyboard row 2 specifically to read if as are pressed
  cpl             ; flips the bits in a do this because normally keyboard input is 1 if not pressed and 0 if pressed which is anti zero checks
  and $1f         ; get the first 5 bits of a the keyboard input also sets the zero flag which cpl doesn't
  jr z, skiplowerinput ; don't need to read what input is if its all zero
  bit 5 , a       ;
  jr z, noAinput  ;
  bit 3, a        ;
  jr nz, skiplowerinput; if a and d are pressed ignore input
  ld b,a          ;
  ld hl,ycoord    ; horizontal position.
  dec (hl)        ;
  ld a, (ycoord)  ;

  jr skiplowerinput;
noAinput:

skiplowerinput:

  ld hl, xcoord ;
	dec (hl)        ; move it up one line.
	ld a,(xcoord)   ; where is it now?
	cp 255          ; past top of screen yet?
	jr nz,loop      ; no, carry on.


mushlp: ld a,22         ; control code for AT character.
       	rst 16
       	call random   	; get a 'random' number.
       	and 15          ; want vertical in range 0 to 15.
       	rst 16
       	call random     ; want another pseudo-random number.
       	and 31          ; want horizontal in range 0 to 31.
       	rst 16
       	ld a,145        ; UDG 'B' is the mushroom graphic.
       	rst 16          ; put mushroom on screen.
       	djnz mushlp     ; loop back until all mushrooms displayed.


        exx
        di
        ld hl, $300
        ld c, 0
startsound:
        ld b, 68
delay1: djnz delay1
        ld a, c
        xor $10
        ld c, a
        out($f0), a
        dec hl
        ld a,l
        or h
        jr nz, startsound
        ei
        exx


	; loop back from bottom
	ld a,21         ; row 21 = bottom of screen.
	ld (xcoord),a   ; set initial x coordinate.
	jp loop		; let's loop forever :)
	ret


random:	ld hl,(seed)        ; Pointer
       	ld a,h
       	and 31              ; keep it within first 8k of ROM.
       	ld h,a
       	ld a,(hl)           ; Get "random" number from location.
       	inc hl              ; Increment pointer.
       	ld (seed),hl
       	ret
seed:   defw 0


delay:  ld b,12         ; length of delay.
	delay0: halt    ; wait for an interrupt.
	djnz delay0     ; loop.
	ret             ; return.
setxy:  ld a,22         ; ASCII control code for AT.
	rst 16          ; print it.
	ld a,(xcoord)   ; vertical position.
	rst 16          ; print it.
	ld a,(ycoord)   ; y coordinate.
	rst 16          ; print it.
	ret

printline:              ; Routine to print out a line
        ld a,(hl)       ; Get character to print
        cp '$'          ; See if it '$' terminator
        jp z,printend   ; We're done if it is
        rst 16          ; Spectrum: Print the character in 'A'
        inc hl          ; Move onto the next character
        jp printline    ; Loop round
printend:
        ret


xcoord: defb 0
ycoord: defb 15
udgs:   defb 219,189,189,255,255,24,60,102
	defb 24,126,255,255,60,60,60,60
score:	defb 0

line:   defb 'Score: ',13,'$'
