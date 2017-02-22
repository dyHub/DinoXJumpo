	org 32768
	
	di

; an example of loading a character cell
loop:
        ld hl, trex1                  ; hl = key cell's address
        ld (charCellAddress), hl

        ld d, h
        ld e, l         ; copy pixel addr to de

        ;ld hl, graphic  ; set bc = to graphics address
        ld hl, keyAttr
        ld (attrByteAddress), hl

        ld hl, $0c10
        ld (charCellCoord), hl

        call copyCharCellAndAttrByteToScreen


	ld hl, trex2                  ; hl = key cell's address
        ld (charCellAddress), hl

        ld d, h
        ld e, l         ; copy pixel addr to de

        ;ld hl, graphic  ; set bc = to graphics address
        ld hl, keyAttr
        ld (attrByteAddress), hl

        ld hl, $0c11
        ld (charCellCoord), hl

        call copyCharCellAndAttrByteToScreen


	ld hl, trex3                  ; hl = key cell's address
        ld (charCellAddress), hl

        ld d, h
        ld e, l         ; copy pixel addr to de

        ;ld hl, graphic  ; set bc = to graphics address
        ld hl, keyAttr
        ld (attrByteAddress), hl

        ld hl, $0d10
        ld (charCellCoord), hl

        call copyCharCellAndAttrByteToScreen


	ld hl, trex4                  ; hl = key cell's address
        ld (charCellAddress), hl

        ld d, h
        ld e, l         ; copy pixel addr to de

        ;ld hl, graphic  ; set bc = to graphics address
        ld hl, keyAttr
        ld (attrByteAddress), hl

        ld hl, $0d11
        ld (charCellCoord), hl

        call copyCharCellAndAttrByteToScreen

        jp loop



keyCell: defb 24, 16, 24, 16, 24, 36, 36, 24    ; this is a key sprite
trex1: defb $00, $00, $00, $00, $00, $81, $83, $C7   
trex2: defb $7E, $DF, $FF, $FF, $F0, $FC, $E0, $E0 
trex3: defb $FF, $7F, $3F, $1F, $0D, $0C, $08, $0C
trex4: defb $F8, $E8, $E0, $C0, $80, $80, $80, $C0
keyAttr: defb 185                               ; yellow

charCellAddress:    defb 0, 0
attrByteAddress:    defb 0, 0
charCellCoord:      defb 0, 0



; ---------- function copyCharCellAndAttrByteToScreen  ------------------
; Copies 8 bytes of consecutive character cell data to its screen address
;
; in: charCellAddress = 16 bit address of your 8x8 character cell to copy to screen
; in: attrByteAddress = 16 bit address of your attribute byte to copy to screen
; in: charCellCoord = 16 bit address of 2 bytes of (row, col) to put the character cell

copyCharCellAndAttrByteToScreen:
        ld bc, (charCellCoord)
        call pixelAddr                  ; gets the address in hl

        ex de, hl                       ; de = address. hl is now open

        ld hl, (charCellAddress)
        call copyCharCellToScreen

        ld bc, (charCellCoord)
        call attrAddr                   ; gets the address in hl

        ex de, hl                       ; de = address. hl is now open
        ld hl, attrByteAddress
        ld b, (hl)                      ; b = the actual attribute byte

        ex de, hl                       ; hl = attribute address now
        ld (hl), 6                      ; attribute byte of 6. its a yellow key

        ret


; ---------- function copyCharCellToScreen  ------------------
; Copies 8 bytes of consecutive character cell data to its screen address
;
; in: HL = address of 1st of 8 consecutive src 8 bytes
; out: DE = address of 1st of 8 pixel bytes to copy to

copyCharCellToScreen:
        ld b, 8     ; how many bytes to copy
nxtr:
        ld a, (hl)
        ld (de), a
        inc hl
        inc d       ; inc by 0x100
        djnz nxtr

        ret

; ---------- function pixelAddr  ------------------
; Takes a character cell address and finds the address of the first pixel byte
;
; in: BC = (row, col) in character cell coordinates
; out: HL = pixel byte for 1st row in cell

pixelAddr:
        ld a, b     ; b is in format [000 v7->v3]
        and $18     ; now, a = [000 v7 v6 000]
col:
        add a, $40
        ld h, a     ; h = [010 v7 v6 000] (first line in character cell)
row:
        ld a, b
        and 7       ; a = [0000_0 v5 v4 v3]
        rrca
        rrca
        rrca        ; a = [v5 v4 v3 0_0000]
        add a, c
        ld l, a     ; l = [v5 v4 v3 c7->c3]

        ret

; ---------- function attrAddr  ------------------
; Given a character cell coordinate, find its attribute coordinate
;
; in: BC = (row, col) in character cell coordinates
; out: HL = addr byte for 1st row in cell
;
; trashes the d register

attrAddr:
        ld a, b     ; b is in format [000 v7->v3]
        rrca
        rrca
        rrca        ; a is now [v5 v4 v3 0_00 v7 v6]
        ld d, a     ; d is a copy of a for later
        and $03     ; a is now [0000_00 v7 v6]
        or $58      ; a is now [0101_10 v7 v6]
        ld h, a     ; store in h

        ld a, d     ; a is now [v5 v4 v3 0_00 v7 v6]
        and $e0     ; a is now [v5 v4 v3 0_0000]
        add c       ; a is now [v5 v4 v3 c7->c3]

        ld l, a

        ret

