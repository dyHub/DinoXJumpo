        org $8000

        ;; shacham's hack 1 for installing interrupt handlers

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
	ret	

;; A routine called by the interrupt handler
handler:
        ex af,af'                               ;Exchange af with alternate register af'
        exx                                     ;Exchange all other reg's with alternate reg's
	
	;; loop through 3 bits of border color
        ld a, (border)
	inc a	
	cp $10
	jr nz, end_if_rst
	ld a, 0
end_if_rst:
	out ($fe), a
	ld (border), a
	
        ex af,af'                               ;Exchange af with alternate register af'
        exx                                     ;Exchange all other reg's with alternate reg's
	ei
        reti
        ret

;; The actual interrupt handler - it just jumps to our routine
;; (that way, we only need to copy 3 bytes to $fdfd and won't overwrite stuff at $fe00 -> $feff)
int_copy:
        org int_addr                            ;Set instruction counter to $fdfd (interrupt handler)

int_start:
	jp handler
int_end:
	ld a,a

;; Just a counter that loops through all 8 border colors
border: defb 0
