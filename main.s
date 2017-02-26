        org $8000

;; Install interrupt handler
int_addr: equ $fdfd        

        di
        im 2

	;; 1. copy fd everywhere in interrupt handler table at $fe00

        ld hl,$fe00                             ;Source = $fe00 (Start of vector table)
        ld de,$fe01                             ;Destination = $fe01
        ld (hl),$fd                             ;Set first byte so it is copied to all of them ($fdfd)
        ld bc,257                               ;257 bytes (size of vector table)
        ldir   
        
	;; 2. copy interrupt handler to address $fdfd

        ld hl,int_copy                          ;Source = interrupt routine
        ld de,int_addr                          ;Destination = $fdfd (as specified in vector table)
        ld bc,int_end-int_start                 ;Length of custom interrupt routine
        ldir                                    ;(DE) <- (HL), BC=BC-1, Loop till B=0

        
        ld a, $fe
        ld i, a                                 ; set interrupt register
        
	ei


;; Setup videoUpdateList by null terminating the updates
setupVideoUpdateList:
        ld a, $ff
        ld (videoUpdateList), a

;; Game loop
gameLoop:

        ld hl, videoUpdateList    ; hl is the address of where to add bytes to the update list

        ld (hl), $0f
        inc hl
        ld (hl), $00                    ; copied the 2 bytes of coordinate to the list

        inc hl
        ld (hl), $06                    ; copy a yellow attribute byte over

        inc hl
        ld de, trex1
        ld (hl), e
        inc hl
        ld (hl), d                      ; copied the char cell address, deep copy (little endian copy)
        inc hl
        
        ld (hl), $ff
	
	ei
        halt                            ; wait for interrupt to print our shit

        jp gameLoop

;; This is the only thing called by the interrupt handler! We have X number of cycles to update video RAM
updateVideoRAM:
	
        ;; save regs on stack
        push af             
        push bc
        push hl
        push de
        push ix

	;; UPDATE VIDEO RAM BEFORE CRT GETS TO SCREEN
        ld hl, videoUpdateList
videoUpdateListLoop:

        ld d, (hl)                      ; e = char cell row

        ld a, d
        cp $ff
        jr z, videoUpdateListLoopEnd    ; if we found a delimiter byte, stop parsing the list

        inc hl                          
        ld e, (hl)                      ; (e,d) = (row, col) for char cell
       	
        ld (charCellCoord), de		; load the coordinate to draw cell
					; (keep in mind ZX Spectrum is little endian,
					; so this will show up in memory as (row, col) )

	inc hl				; hl now points to attribute byte 
        
        ld (attrByteAddress), hl        ; load the attribute byte address
        inc hl
	
        ld a, (hl)                      ; hl now points to char cell ptr, do a deep copy
        ld (charCellAddress), a		; (keep in mind ZX Spectrum is little endian)
        inc hl
        ld a, (hl)
        ld (charCellAddress+1), a		
	
	push hl       				;save hl cus  the call will trash it
        call copyCharCellAndAttrByteToScreen 	
	pop hl					

        inc hl                          	; point to the next entry...

        jp videoUpdateListLoop

videoUpdateListLoopEnd:
        
        ;; null delimit the videoUpdateList
        ld a, $ff
        ld (videoUpdateList), a     
        ;; restore regs from stack
        pop ix              
        pop de
        pop hl
        pop bc
        pop af

	ei
        reti
        ret



;; address of the video update table of dynamic length. each entry in this table takes  the form:
;; <char cell coord> <attr byte> <char cell ptr>>
;; so each entry is <2> <1> <2> = 5 bytes
;; the delimiter for this list is a single ff byte
videoUpdateList: equ $a000


trex1: defb $7E, $DF, $FF, $FF, $F0, $FC, $E0, $E0 
include "spriteRoutines.s"



;; The actual interrupt handler - it just jumps to our routine
;; (that way, we only need to copy 3 bytes to $fdfd and won't overwrite stuff at $fe00 -> $feff)
int_copy:
        org int_addr                            ;Set instruction counter to $fdfd (interrupt handler)

int_start:
	jp updateVideoRAM
int_end:
	ld a,a

