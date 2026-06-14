; This lists the tiles that an enemy can't spawn on (despite being non-solid).
;
; Data format:
;   b0: Tile index
;   b1: Unused? (always $01)

enemyUnspawnableTilesTable:
	.dw @collisions0
	.dw @collisions1
	.dw @collisions2
	.dw @collisions3
	.dw @collisions4
	.dw @collisions5

@collisions0:
@collisions4:
	.db TILEINDEX_HOLE $01
	.db TILEINDEX_FD $01
	.db TILEINDEX_WHIRLPOOL $01
	.db $00

@collisions1:
@collisions2:
@collisions5:
	.db TILEINDEX_HOLE $01
	.db TILEINDEX_BLANK_HOLE $01
	.db TILEINDEX_BLANK_HOLE+1 $01
	.db TILEINDEX_BLANK_HOLE+2 $01
	.db TILEINDEX_BLANK_HOLE+3 $01
	.db TILEINDEX_FD $01
	.db TILEINDEX_TRACK_TL $01
	.db TILEINDEX_TRACK_BR $01
	.db TILEINDEX_TRACK_BL $01
	.db TILEINDEX_TRACK_TR $01
	.db TILEINDEX_TRACK_HORIZONTAL $01
	.db TILEINDEX_TRACK_VERTICAL $01
	.db TILEINDEX_MINECART_PLATFORM $01
	.db TILEINDEX_INDOOR_UPSTAIRCASE $01
	.db TILEINDEX_INDOOR_DOWNSTAIRCASE $01
	.db TILEINDEX_INDOOR_WALL_UPSTAIRCASE $01
	.db TILEINDEX_INDOOR_WALL_UPSTAIRCASE+1 $01 ; wall downstaircase

	.db $3c $01
	.db $3d $01
	.db $3e $01
	.db $3f $01

@collisions3:
	.db $00
