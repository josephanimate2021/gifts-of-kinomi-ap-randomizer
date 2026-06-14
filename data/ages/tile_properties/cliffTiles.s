; Determines which tiles function as cliffs which Link can jump down.
;
; Data format:
;   b0: Tile index ($00 for end of list)
;   b1: Angle value from which the tile can be jumped off of.
;
; See also "itemPassableTiles.s" which allows projectiles to pass through cliffs.

cliffTilesTable:
	.dw @overworld
	.dw @indoors
	.dw @dungeons
	.dw @sidescrolling
	.dw @underwater
	.dw @five

@underwater:
	.db $84 $10
	.db $85 $10
	.db $86 $10
@overworld:
	.db $05, ANGLE_DOWN
	.db $06, ANGLE_DOWN
	.db $07, ANGLE_DOWN
	.db $0a, ANGLE_LEFT
	.db $0b, ANGLE_RIGHT
	.db $64, ANGLE_DOWN
	.db $ff, ANGLE_DOWN
	.db $8e $10
	.db $8f $10
	.db $00

@indoors:
	.db $c7 $10
	.db $c8 $10
	.db $c9 $10
	.db $b0 $10
	.db $b1 $18
	.db $b2 $00
	.db $b3 $08
	.db $00
@dungeons:
@five:
	.db $b0, ANGLE_DOWN
	.db $b1, ANGLE_LEFT
	.db $b2, ANGLE_UP
	.db $b3, ANGLE_RIGHT
	.db $c1, ANGLE_DOWN
	.db $c2, ANGLE_LEFT
	.db $c3, ANGLE_UP
	.db $c4, ANGLE_RIGHT
@sidescrolling:
	.db $00
