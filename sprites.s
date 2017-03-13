;; FORMAT OF SPRITES
;; <char cell coord> <attr byte> <8 bytes char cell> <dir> <velocity> <velocity counter>
;;
;; char cell coord is in the format (col, row)  = 2 bytes
;;
;; attr byte is a single attribute byte         = 1 byte
;;
;; char cell                                    = 8 bytes
;;
;; dir is which direction to move
;; (0000 = still, 0001 = left, 0010 = right     = 1 byte
;; (0100 = up, 1000 = down)
;;
;; velocity is how many frames to wait to move  = 1 byte
;; the char cell in that direction
;;
;; velocity counter is the current frame ctr    = 1 byte
;;
;; ---------
;; TOTAL                                        = 14 bytes

;;---------------row col  attr  -----------sprite---------------------  dir vel  vel ctr
trex1:      defb $0F, $00, $06, $00, $00, $00, $00, $00, $81, $83, $C7, $00, $00, $00
trex2:      defb $0F, $01, $06, $7E, $DF, $FF, $FF, $F0, $FC, $E0, $E0, $00, $00, $00
trex3:      defb $10, $00, $06, $FF, $7F, $3F, $1F, $0D, $0C, $08, $0C, $00, $00, $00
trex4:      defb $10, $01, $06, $F8, $E8, $E0, $C0, $80, $80, $80, $C0, $00, $00, $00

bigCactus1:    defb $0F, $0F, $08, $18, $18, $18, $18, $18, $1B, $1B, $DB, $01, $08, $00
bigCactus2:    defb $0F, $10, $08, $DF, $FF, $FF, $18, $18, $18, $18, $18, $01, $08, $00

smallCacVar1:   defb $12, $10, $08, $18, $58, $58, $58, $7A, $1A, $1E, $DB, $01, $08, $00
smallCacVar2:   defb $13, $10, $08, $18, $18, $5A, $5A, $7E, $18, $18, $18, $01, $08, $00

black:      defb $00, $00, $00, $00, $00, $00, $00, $00
