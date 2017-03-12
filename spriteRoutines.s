charCellAddress:    defb 0, 0
attrByte:    	    defb 0
attrByteAddress:    defb 0, 0
charCellCoord:      defb 0, 0

;; address of the video update table of dynamic length. each entry in this table takes  the form:
;; <char cell coord> <attr byte> <char cell ptr>>
;; so each entry is <2> <1> <2> = 5 bytes
;; the delimiter for this list is a single ff byte
videoUpdateList: equ $a000

;; a pointer to the end of the list, right after the last element
videoUpdateListCurr: defb 0, 0


; ---------- function copyCharCellAndAttrByteToUpdateList ---------------
; Adds an update to the video memory update list
;
; in: charCellAddress = 16 bit address of your 8x8 character cell to copy to screen
; in: attrByte = 16 bit address of your attribute byte to copy to screen
; in: charCellCoord = 16 bit address of 2 bytes of (row, col) to put the character cell
;
; trashes: a, bc, de, hl 

copyCharCellAndAttrByteToUpdateList:
	
        ld hl, (videoUpdateListCurr)   	; hl is the address of where to add bytes to the update list
	
	ld de, charCellCoord	
	ld a, (de)			; a = row
	ld (hl), a	
        inc hl
	
	inc de
	ld a, (de)			; a = col
        ld (hl), a 	                ; copied the 2 bytes of coordinate to the list

        inc hl
	ld a, (attrByte)		; a = attribute byte
        ld (hl), a                      ; copy an attribute byte over
	
        inc hl				; make hl point to char cell pointer
	
	ld a, (charCellAddress)		; a = low byte of address
	ld (hl), a	
        inc hl

	ld a, (charCellAddress+1)	; a = high byte of address 
        ld (hl), a                      ; copied the char cell address, deep copy (little endian copy)
        inc hl
        
        ld (hl), $ff

	ld (videoUpdateListCurr), hl	; update the curr pointer to the end of the list (points to the ff byte)
	
	ret

; ---------- function shiftCellRight ---------------
; Shifts a cell one to the right. this makes no assumptions of attribute bytes in the cells - 
; it simply shifts the pixel bytes
;
; in: HL = pixel address of cell to shift  (this gets trashed)
;
; trashes: HL and C
;
; example
;             v         v
; before: <abcdefgh><ijklmnop>
;              v         v
; after:  <xabcdefg><hijklmno>
;
; we set x in the first byte to the opposite of what it was before


shiftCellRight:
        
        ld b, 8             ; loop for 8 pixel bytes
scr_loop:
                            ; 1. Shift the left pixel byte to the right
        ld a, (hl)          ; get pixel byte into a
        
        ld c, a             ; save a into c - we will need to replicate bit 0 in the pixel cell to the right
        srl a               ; shift a right
        ld (hl), a          ; store shifted pixel byte back
        
                            ; 2. Shift the right pixel byte
        inc l               ; get address of pixel byte one to the right
        
        ld a, (hl)          ; get pixel byte into a
        srl a               ; shift it right

        bit 0, c            ; bit 7 of a should be bit 0 of c (pixel cell to the left of current pixel cell)
        set 7, a            ; a[7] = 1 (default)
        jr nz, scr_setZeroEnd   ; if c[0] == 0
        res 7, a                ;   a[7] = 0
scr_setZeroEnd:
        ld (hl), a          ; store shifted pixel byte back
        
        dec l               ; l--, now hl points to left pixel byte
        inc h               ; h += 0x100 (makes hl point to the pixel byte one row down)
        djnz scr_loop       

        ret

; ---------- function copyCharCellAndAttrByteToScreen  ------------------
; Copies 8 bytes of consecutive character cell data to its screen address
;
; in: charCellAddress = 16 bit address of your 8x8 character cell to copy to screen
; in: attrByteAddress = 16 bit address of your attribute byte to copy to screen
; in: charCellCoord = 16 bit address of 2 bytes of (row, col) to put the character cell
;
; trashes: a, bc, de, hl 

copyCharCellAndAttrByteToScreen:
        ld bc, (charCellCoord)
        call pixelAddr                  ; gets the address in hl

        ex de, hl                       ; de = address. hl is now open

        ld hl, (charCellAddress)
        call copyCharCellToScreen

        ld bc, (charCellCoord)
        call attrAddr                   ; gets the address in hl

        ex de, hl                       ; de = address. hl is now open
        ld hl, (attrByteAddress)
        ld b, (hl)                      ; b = the actual attribute byte

        ex de, hl                       ; hl = attribute address now
        ld (hl), 6                      ; attribute byte of 6. its a yellow key

        ret


; ---------- function copyCharCellToScreen  ------------------
; Copies 8 bytes of consecutive character cell data to its screen address
;
; in: HL = address of 1st of 8 consecutive src 8 bytes
; in: DE = address of 1st of 8 pixel bytes to copy to
;
; trashes: b, a, hl, d

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
;
; trashes: a

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
; trashes: d, a

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

