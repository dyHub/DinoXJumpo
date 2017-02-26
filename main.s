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
include "trex.s"

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
        ld d, (hl)                      ; d = char cell row

        ld a, d
        cp $ff
        jr z, videoUpdateListLoopEnd    ; if we found a delimiter byte, stop parsing the list

        inc hl                          
        ld e, (hl)                      ; e = char cell col
        
        ex de, hl                       ; hl = (row, col). de = ptr into videoUpdateList
        ld (charCellCoord), hl		; load the coordinate to draw cell
        
        inc de
        inc de                          ; de points to attribte byte now
        ex de, hl                       ; hl = attr byte address, de = free
        
        ld (attrByteAddress), hl
        inc hl
        ld (charCellAddress), hl
        
        inc hl                          ; point to the next entry...

        jp videoUpdateListLoop

videoUpdateListLoopEnd:
    
        ;; restore regs from stack
        pop ix              
        pop de
        pop hl
        pop bc
        pop af

	ei
        reti
        ret

;; The actual interrupt handler - it just jumps to our routine
;; (that way, we only need to copy 3 bytes to $fdfd and won't overwrite stuff at $fe00 -> $feff)
int_copy:
        org int_addr                            ;Set instruction counter to $fdfd (interrupt handler)

int_start:
	jp updateVideoRAM
int_end:
	ld a,a


;; address of the video update table of dynamic length. each entry in this table takes  the form:
;; <char cell coord><attr byte><8 bytes of char cell>
;; so each entry is 11 bytes
;; the delimiter for this list is a single ff byte
videoUpdateList: equ $a000


