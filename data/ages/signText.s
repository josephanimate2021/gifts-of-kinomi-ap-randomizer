signTextGroupTable:
	.dw signTextGroup0Data
	.dw signTextGroup1Data
	.dw signTextGroup2Data
	.dw signTextGroup3Data
	.dw signTextGroup4Data
	.dw signTextGroup5Data
	.dw signTextGroup6Data
	.dw signTextGroup7Data

;YX, Room, Text with High byte of $2e
signTextGroup0Data:
	.db $53 $24 $01 ; Link's house
	.db $37 $14 $02 ; directions,east in village
	.db $44 $15 $04 ; directions,back to village
	.db $26 $12 $0c ; directions,west to village
	.db $41 $22 $0d ; directions,to falls
	.db $21 $01 $0e ; D1 entrance (present)
	.db $46 $43 $0f ; to mountains (& $10 to desert)
	.db $57 <ROOM_AGES_075 $09
	.db $13 <ROOM_AGES_036 $0a
	.db $00
signTextGroup1Data:
	.db $14 $10 $07	; Entrance1
	.db $18 $02 $08 ; Entrance2
	.db $51 $12 $09 ; Gale seed tree house
	.db $48 $30 $0a ; Syrup's House
	.db $31 $72 $0b ; right of tree, near actual entrance
	.db $00
signTextGroup2Data:
	.db $00
signTextGroup3Data:
	.db $15 $78 $05
	.db $14 $49 $06
	.db $00
signTextGroup4Data:
	.db $67 $7e $11
	.db $00
signTextGroup5Data:
	.db $77 $2c $03

signTextGroup6Data:
signTextGroup7Data:
	.db $00

