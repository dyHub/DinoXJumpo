
; ---------- function readWASD  ------------------
; Looks at whether the wasd keys are currently being held down
;
; in: None
; Used registers: a,b,c,d,e
; out: result of check in register d in format (0000|dsaw) 1 signifying it was pressed down
; Cycle Count: ToDo

readWASD:

  ld bc, 64510
  in a, (c)
  ld bc, 65022
  in b, (c)

  ;These are done near each other to avoid a re read of keyboard input from the ALU

  cpl             ; flips the bits in a do this because normally keyboard input is 1 if not pressed and 0 if pressed which is anti zero checks
  and $02         ; get the bits 00000010 (W) of the keyboard input
  rra             ; 0000|000w
  ld d, a         ; store for future use

  ld a, b         ;
  cpl             ; flip bits
  and $07         ; mask extract asd
  rla             ; 0000|dsa0
  or d            ; d is currently 0000|000w so oring it with a which is currently 0000|dsa0 gets you 0000|dsaw
  ld d, a

  ret

; ---------- function readCommon ------------------
; Looks at whether the qwert and asd keys are currently being held down
;
; in: None
; Used registers: a, b, c, d
; out: result of check in register d in format (trew|qdsa) 1 signifying it was pressed down

readCommon:

  ld bc, 64510
  in a, (c)
  ld bc, 65022
  in b, (c)

  ;a: xxxt'|r'e'w'q'

  cpl       ; xxxt|rewq
  and $1F   ; 000t|rewq
  ; another version of doing this is sll sll sll this one is shorter though in instruction length
  rla       ; 00tr|ewq0
  rla       ; 0tre|wq00
  rla       ; trew|q000
  ld d,     ; store for future use
  ld a, b   ; xxxg'|f'd's'a'
  cpl       ; xxxg|fdsa
  and $07   ; 0000|0dsa
  or        ; a: trew|qdsa
  ld d,a

  ret





