;; FORMAT OF SPRITES
;; <char cell coord> <attr byte> <8 bytes char cell>
;;
;; char cell coord is in the format (row, col)  = 2 bytes
;;
;; attr byte is a single attribute byte         = 1 byte
;;
;; char cell                                    = 8 bytes
;;
;; ---------
;; TOTAL                                        = 11 bytes


;; TREX SPRITE
;;
;;---------------row col  attr  -----------sprite---------------------
trex1:      defb $0F, $03, 106, $00, $00, $00, $00, $00, $81, $83, $C7
trex2:      defb $0F, $04, 106, $7E, $DF, $FF, $FF, $F0, $FC, $E0, $E0
trex3:      defb $10, $03, 106, $FF, $7F, $3F, $1F, $0D, $0C, $08, $0C
trex4:      defb $10, $04, 106, $F8, $E8, $E0, $C0, $80, $80, $80, $C0

;; trex fields -
;; is_jumping   = if he's jumping (1) or not (0)
;; up_or_down   = if jumping, then lets us know if he's going up (1) or down (0)
;; jump_height  = how many cells to jump up
;; f            = the frame frequency to move the trex up or down
;; f_ctr        = the current frame counter. when it hits f, move trex up or down

trex_is_jumping:    defb $00
trex_up_or_down:    defb $00
trex_jump_height:   defb $05
trex_f:             defb $01
trex_f_ctr:         defb $00
trex_color:         defb $06


;; TREE SPRITES
;;
;; 
;;      ---------------row col  attr  -----------sprite--------------------- on/off
bigCactus1_1:     defb $0F, $1F, 108, $18, $58, $58, $58, $7A, $1A, $1E, $18, $01
bigCactus2_1:     defb $10, $1F, 108, $18, $18, $5A, $5A, $7E, $18, $18, $18, $01
bigCactus1_2:     defb $0F, $1F, 108, $18, $18, $18, $18, $18, $1B, $1B, $DB, $00
bigCactus2_2:     defb $10, $1F, 108, $DF, $FF, $FF, $18, $18, $18, $18, $18, $00
bigCactus1_3:     defb $0F, $1F, 108, $18, $18, $18, $18, $18, $1B, $1B, $DB, $00
bigCactus2_3:     defb $10, $1F, 108, $DF, $FF, $FF, $18, $18, $18, $18, $18, $00
bigCactus1_4:     defb $0F, $1F, 108, $18, $18, $18, $18, $18, $1B, $1B, $DB, $00
bigCactus2_4:     defb $10, $1F, 108, $DF, $FF, $FF, $18, $18, $18, $18, $18, $00
bigCactus1_5:     defb $0F, $1F, 108, $18, $18, $18, $18, $18, $1B, $1B, $DB, $00
bigCactus2_5:     defb $10, $1F, 108, $DF, $FF, $FF, $18, $18, $18, $18, $18, $00



;; cactus fields
;; f        = frequency to update frame
;; f_ctr    = current frame counter
;; rng      = probability to gen a new cactus / 64K. for example, if this is 700, then probability
;;            is 700/64K ~ 1% to gen a cactus on frame update
;;            (STORED IN LITTLE ENDIAN FORMAT, BEWARE OF LITTLE ENDIAN... i hate little endian...)
;; rng_u    = how many frames to wait before increasing the rng by 1. (NOTE:$ff is about once every 1s)
;; rng_ctr  = a counter of the current frame for waiting to increase rng
cactus_f:       defb $01
cactus_f_ctr:   defb $00
cactus_rng:     defb $ff, $00       ;; starts off at .4%
cactus_rng_u:   defb 25             ;; about 1s
cactus_rng_ctr: defb $00


;; CLOUD SPRITES
;;                   row col  attr  ----sprite---------------------------
cloud1:         defb $10, $02, 111, $06, $1F, $20, $40, $80, $80, $7F, $00
cloud2:         defb $11, $02, 111, $00, $C0, $20, $18, $06, $08, $FC, $00



;; GENERAL SPRITES WITH NO COORDINATES ATTACHED TO IT
;;------------------attr  ----------sprite---------------------
black:          defb $00, $00, $00, $00, $00, $00, $00, $00, $00
sand:           defb $06, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
sky:            defb $45, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
