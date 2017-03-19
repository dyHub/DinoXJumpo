drawGameOver:

;; DRAW G
drawG:
	ld hl, GAMEOVER+1                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0708
        ld (charCellCoord), hl
        ld a, (GAMEOVER)
        ld (attrByte), a
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GAMEOVER+9                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0808
        ld (charCellCoord), hl
        ld a, (GAMEOVER)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GAMEOVER+17                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0709
        ld (charCellCoord), hl
        ld a, (GAMEOVER)
        ld (attrByte), a
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GAMEOVER+25                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0809
        ld (charCellCoord), hl
        ld a, (GAMEOVER)
        call copyCharCellAndAttrByteToUpdateList
	
;; DRAW A
drawA:
	ld hl, GAMEOVER+33                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0908
        ld (charCellCoord), hl
        ld a, (GAMEOVER)
        ld (attrByte), a
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GAMEOVER+41                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0A08
        ld (charCellCoord), hl
        ld a, (GAMEOVER)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GAMEOVER+49                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0909
        ld (charCellCoord), hl
        ld a, (GAMEOVER)
        ld (attrByte), a
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GAMEOVER+57                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0A09
        ld (charCellCoord), hl
        ld a, (GAMEOVER)
        call copyCharCellAndAttrByteToUpdateList

;; DRAW M
drawM:
	ld hl, GAMEOVER+65                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0B08
        ld (charCellCoord), hl
        ld a, (GAMEOVER)
        ld (attrByte), a
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GAMEOVER+73                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0C08
        ld (charCellCoord), hl
        ld a, (GAMEOVER)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GAMEOVER+81                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0B09
        ld (charCellCoord), hl
        ld a, (GAMEOVER)
        ld (attrByte), a
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GAMEOVER+89                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0C09
        ld (charCellCoord), hl
        ld a, (GAMEOVER)
        call copyCharCellAndAttrByteToUpdateList

;; DRAW E
drawE:
	ld hl, GAMEOVER+97                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0D08
        ld (charCellCoord), hl
        ld a, (GAMEOVER)
        ld (attrByte), a
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GAMEOVER+105                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0E08
        ld (charCellCoord), hl
        ld a, (GAMEOVER)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GAMEOVER+113                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0D09
        ld (charCellCoord), hl
        ld a, (GAMEOVER)
        ld (attrByte), a
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GAMEOVER+121                     ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $0E09
        ld (charCellCoord), hl
        ld a, (GAMEOVER)
        call copyCharCellAndAttrByteToUpdateList

;; DRAW O
drawO:
	ld hl, GAMEOVER+129                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $1008
        ld (charCellCoord), hl
        ld a, (GAMEOVER)
        ld (attrByte), a
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GAMEOVER+137                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $1108
        ld (charCellCoord), hl
        ld a, (GAMEOVER)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GAMEOVER+145                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $1009
        ld (charCellCoord), hl
        ld a, (GAMEOVER)
        ld (attrByte), a
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GAMEOVER+153                     ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $1109
        ld (charCellCoord), hl
        ld a, (GAMEOVER)
        call copyCharCellAndAttrByteToUpdateList

;; DRAW V
drawV:
	ld hl, GAMEOVER+161                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $1208
        ld (charCellCoord), hl
        ld a, (GAMEOVER)
        ld (attrByte), a
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GAMEOVER+169                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $1308
        ld (charCellCoord), hl
        ld a, (GAMEOVER)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GAMEOVER+177                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $1209
        ld (charCellCoord), hl
        ld a, (GAMEOVER)
        ld (attrByte), a
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GAMEOVER+185                     ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $1309
        ld (charCellCoord), hl
        ld a, (GAMEOVER)
        call copyCharCellAndAttrByteToUpdateList

;; DRAW E
drawE2:
	ld hl, GAMEOVER+97                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $1408
        ld (charCellCoord), hl
        ld a, (GAMEOVER)
        ld (attrByte), a
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GAMEOVER+105                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $1508
        ld (charCellCoord), hl
        ld a, (GAMEOVER)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GAMEOVER+113                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $1409
        ld (charCellCoord), hl
        ld a, (GAMEOVER)
        ld (attrByte), a
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GAMEOVER+121                     ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $1509
        ld (charCellCoord), hl
        ld a, (GAMEOVER)
        call copyCharCellAndAttrByteToUpdateList

;; DRAW R
drawR:
	ld hl, GAMEOVER+193                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $1608
        ld (charCellCoord), hl
        ld a, (GAMEOVER)
        ld (attrByte), a
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GAMEOVER+201                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $1708
        ld (charCellCoord), hl
        ld a, (GAMEOVER)
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GAMEOVER+209                      ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $1609
        ld (charCellCoord), hl
        ld a, (GAMEOVER)
        ld (attrByte), a
        call copyCharCellAndAttrByteToUpdateList

	ld hl, GAMEOVER+217                     ; bc = address of sand char cell
        ld (charCellAddress), hl
	ld hl, $1709
        ld (charCellCoord), hl
        ld a, (GAMEOVER)
        call copyCharCellAndAttrByteToUpdateList

	ret

