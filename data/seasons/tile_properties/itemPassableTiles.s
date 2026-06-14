; This lists the tiles that are passible from a single direction - usually cliffs.
;
; Data format:
;   b0: Tile index
;   b1: Specifies whether the item has to go up ($01) or down ($ff) a level of elevation in order to pass it.

itemPassableCliffTilesTable:
	.dw @collisions0
	.dw @collisions1
	.dw @collisions2
	.dw @collisions3
	.dw @collisions4
	.dw @collisions5

@collisions0:
@collisions4:
	.db @@up-CADDR
	.db @@right-CADDR
	.db @@down-CADDR
	.db @@left-CADDR
	.db @@up-CADDR
@@up:
	.db $64 $ff
	.db $05 $ff
	.db $06 $ff
	.db $07 $ff
	.db $8e $ff
	.db $8f $ff

	.db $84 $ff
	.db $85 $ff
	.db $86 $ff
	.db $00
@@down:
	.db $64 $01
	.db $05 $01
	.db $06 $01
	.db $07 $01
	.db $8e $01
	.db $8f $01

	.db $84 $01
	.db $85 $01
	.db $86 $01
	.db $00
@@right:
	.db $0b $01
	.db $0a $ff
	.db $00
@@left:
	.db $0b $ff
	.db $0a $01
	.db $00

@collisions1:
	.db @@up-CADDR
	.db @@right-CADDR
	.db @@down-CADDR
	.db @@left-CADDR
	.db @@up-CADDR

@@up:
	.db $b0 $ff
	.db $b2 $01
	.db $c7 $ff
	.db $c8 $ff
	.db $c9 $ff

	.db $c1 $ff
	.db $c3 $01
	.db $00
@@down:
	.db $b0 $01
	.db $b2 $ff
	.db $c7 $01
	.db $c8 $01
	.db $c9 $01

	.db $c1 $01
	.db $c3 $ff
	.db $00
@@right:
	.db $c4 $01
	.db $c2 $ff
	.db $b3 $01
	.db $b1 $ff
	.db $00
@@left:
	.db $c4 $ff
	.db $c2 $01
	.db $b3 $ff
	.db $b1 $01
	.db $00
@collisions2:
@collisions5:
	.db @@up-CADDR
	.db @@right-CADDR
	.db @@down-CADDR
	.db @@left-CADDR
	.db @@up-CADDR

@@up:
	.db $b0 $ff
	.db $b2 $01
	.db $c1 $ff
	.db $c3 $01
	.db $00
@@down:
	.db $b0 $01
	.db $b2 $ff
	.db $c1 $01
	.db $c3 $ff
	.db $00
@@right:
	.db $c4 $01
	.db $c2 $ff
	.db $b3 $01
	.db $b1 $ff
	.db $00
@@left:
	.db $c4 $ff
	.db $c2 $01
	.db $b3 $ff
	.db $b1 $01
	.db $00

@collisions3:
	.db @@up-CADDR
	.db @@right-CADDR
	.db @@down-CADDR
	.db @@left-CADDR
	.db @@up-CADDR
@@up:
@@right:
@@down:
@@left:
	.db $00


; This lists the tiles that can be passed through by items (such as the switch hook or
; seeds) even if their collisions prevent link from passing them.
itemPassableTilesTable:
	.dw itemPassibleTiles_collisions0
	.dw itemPassibleTiles_collisions1
	.dw itemPassibleTiles_collisions2
	.dw itemPassibleTiles_collisions3
	.dw itemPassibleTiles_collisions4
	.dw itemPassibleTiles_collisions5

itemPassibleTiles_collisions0:
itemPassibleTiles_collisions4:
	.db $fd $eb
	.db $00
itemPassibleTiles_collisions1:
itemPassibleTiles_collisions2:
itemPassibleTiles_collisions5:
	.db $90 $91 $92 $93 $94 $95 $96 $97
	.db $98 $99 $9a $9b $0a $0b $0e $0f
itemPassibleTiles_collisions3:
	.db $00
