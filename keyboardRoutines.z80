org 32768


; ---------- function readWASD  ------------------
; Looks at whether the wasd keys are currently being held down
;
; in: None
; Used registers: a,b,d
; out: result of check in register d in format (0000|wasd) 1 signifying it was pressed down
; Cycle Count: ToDo

readWASD:

  ld a, $FD         ; load byte 1111|1101 for keyboard read
  ld b, $FB       ; load byte 1111|1011 for keyboard read
  in a, ($F0)     ; read from keyboard row 2 specifically to read if asd are pressed
  in b, ($F0)     ; read from keyboard row 3 specifically to read if w is pressed

  ;These are done near each other to avoid a re read of keyboard input from the ALU

  cpl             ; flips the bits in a do this because normally keyboard input is 1 if not pressed and 0 if pressed which is anti zero checks
  and $1C         ; get the bits 00011100 (ASD) of the keyboard input
  sra             ;
  sra             ; rotate right twice so the allignment of a is 0000|0asd
  ld d, a         ;

  ld a, b         ;
  cpl             ; flip bits
  and $08         ; mask all bits but w
  or d            ; d is currently 0000|0asd so oring it with a which is currently 0000|w000 gets you 0000|wasd
  ld d, a

  ret

; ---------- function readCommon ------------------
; Looks at whether the qwert and asd keys are currently being held down
;
; in: None
; Used registers: a d
; out: result of check in register d in format (qwert|asd) 1 signifying it was pressed down

readCommon:

  ld a, $FD       ; load byte 1111|1101 for keyboard read
  ld b, $FB       ; load byte 1111|1011 for keyboard read
  in a, ($F0)     ; read from keyboard row 2 specifically to read if asd are pressed
  in b, ($F0)     ; read from keyboard row 3 specifically to read if qwert is pressed

  cpl
  and $1F         ; another version of doing this is sll sll sll this one is shorter though in instruction length
  rla
  rla
  rla
  ld d, a
  ld a, b
  and $1C
  sra
  sra
  or d
  ld d,a

  ret





