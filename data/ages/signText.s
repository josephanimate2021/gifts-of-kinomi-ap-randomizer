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
	.db $53 <ROOM_AGES_024 <TX_2e01 ; Link's house
	.db $37 <ROOM_AGES_014 <TX_2e02 ; directions,east in village
	.db $44 <ROOM_AGES_015 <TX_2e04 ; directions,back to village
	.db $26 <ROOM_AGES_012 <TX_2e0c ; directions,west to village
	.db $41 <ROOM_AGES_022 <TX_2e0d ; directions,to falls
	.db $21 <ROOM_AGES_001 <TX_2e0e ; D1 entrance (present)
	.db $46 <ROOM_AGES_043 <TX_2e0f ; to mountains (& $10 to desert)
	.db $57 <ROOM_AGES_075 <TX_2e09
	.db $13 <ROOM_AGES_036 <TX_2e0a
	.db $48 <ROOM_AGES_084 <TX_2e14 ; Summer roof
	.db $48 <ROOM_AGES_085 <TX_2e15 ; Autumn roof
	.db $48 <ROOM_AGES_086 <TX_2e16 ; Winter roof
	.db $48 <ROOM_AGES_087 <TX_2e17 ; Spring roof
	.db $00
signTextGroup1Data:
	.db $14 <ROOM_AGES_110 <TX_2e07	; Entrance1
	.db $18 <ROOM_AGES_102 <TX_2e08 ; Entrance2
	.db $51 <ROOM_AGES_112 <TX_2e09 ; Gale seed tree house
	.db $48 <ROOM_AGES_130 <TX_2e10 ; Syrup's House
	.db $31 <ROOM_AGES_172 <TX_2e0b ; right of tree, near actual entrance
	.db $51 <ROOM_AGES_111 <TX_2e12 ; fairy fountain
	.db $00
signTextGroup2Data:
	.db $00
signTextGroup3Data:
	.db $15 $78 $05
	.db $14 $49 $06
	.db $00
signTextGroup4Data:
	;.db $67 $7e $11
	.db $72 <ROOM_AGES_447 $11
	.db $00
signTextGroup5Data:
	.db $77 $2c $03
	.db $53 <ROOM_AGES_5fc $13

signTextGroup6Data:
signTextGroup7Data:
	.db $00

