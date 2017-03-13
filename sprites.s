;; FORMAT OF SPRITES
;; <char cell coord> <attr byte> <8 bytes char cell>
;;
;; char cell coord is in the format (col, row)  = 2 bytes
;;
;; attr byte is a single attribute byte         = 1 byte
;;
;; char cell                                    = 8 bytes
;; 
;; ---------
;; TOTAL                                        = 11 bytes

;;---------------col row  attr  -----------sprite--------------------- 
trex1:      defb $00, $00, $06, $00, $00, $00, $00, $00, $81, $83, $C7
trex2:      defb $00, $00, $06, $7E, $DF, $FF, $FF, $F0, $FC, $E0, $E0
trex3:      defb $00, $00, $06, $FF, $7F, $3F, $1F, $0D, $0C, $08, $0C
trex4:      defb $00, $00, $06, $F8, $E8, $E0, $C0, $80, $80, $80, $C0

;; trex fields -
;; is_jumping   = if he's jumping (1) or not (0)
;; up_or_down   = if jumping, then lets us know if he's going up (1) or down (0)
;; jump_height  = how many cells to jump up
;; f            = the frame frequency to move the trex up or down
;; f_ctr        = the current frame counter. when it hits f, move trex up or down
trex_is_jumping:    defb $00
trex_up_or_down:    defb $00
trex_jump_height:   defb $04
trex_f:             defb $02
trex_f_ctr:         defb $00


;; general all 0 background sprite. does not have col row and attr
black:      defb $00, $00, $00, $00, $00, $00, $00, $00
